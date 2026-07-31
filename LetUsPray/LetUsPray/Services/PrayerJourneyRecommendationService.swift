import Foundation

struct PrayerJourneyRecommendationSections {
    let continueJourney: [PrayerJourney]
    let recommended: [PrayerJourney]
    let featured: [PrayerJourney]
    let seasonal: [PrayerJourney]
    let recentlyCompleted: [PrayerJourney]
    let newToYou: [PrayerJourney]

    var ordered: [(String, [PrayerJourney])] {
        [
            ("Continue Journey", continueJourney),
            ("Recommended for You", recommended),
            ("Featured Journeys", featured),
            ("Seasonal Journeys", seasonal),
            ("Recently Completed", recentlyCompleted),
            ("New to You", newToYou)
        ]
    }
}

/// A deterministic recommendation layer. A future AI provider can replace this service's inputs without changing views.
enum PrayerJourneyRecommendationService {
    static func sections(
        journeys: [PrayerJourney],
        completedDaysByPlan: [String: Int],
        activePlanID: String,
        now: Date = Date(),
        calendar: Calendar = .current
    ) -> PrayerJourneyRecommendationSections {
        var journeyByID: [String: PrayerJourney] = [:]
        for journey in journeys where journeyByID[journey.id] == nil {
            journeyByID[journey.id] = journey
        }
        let uniqueJourneys: [PrayerJourney] = journeyByID.values.sorted {
            if $0.sortOrder != $1.sortOrder { return $0.sortOrder < $1.sortOrder }
            return $0.title < $1.title
        }

        func progress(for journey: PrayerJourney) -> PrayerPlanProgress {
            PrayerPlanProgress(
                completedDays: completedDaysByPlan[journey.plan.id] ?? 0,
                totalDays: journey.sessionCount
            )
        }

        let unfinished = uniqueJourneys.filter { progress(for: $0).status != .completed }
        let completed = uniqueJourneys.filter { progress(for: $0).status == .completed }
        let opened = unfinished.sorted { openedDate(for: $0) > openedDate(for: $1) }
        let completedRecently = completed.sorted { completedDate(for: $0) > completedDate(for: $1) }
        let isNewUser = uniqueJourneys.allSatisfy { progress(for: $0).status == .notStarted }

        let continueJourney = opened.filter {
            $0.plan.id == activePlanID || PrayerJourneyProgressStore.record(for: $0.plan.id)?.lastOpenedDate != nil
        }.prefix(3).map { $0 }

        let recommendedCandidates: [PrayerJourney]
        if isNewUser {
            recommendedCandidates = unfinished.filter { $0.isFeatured }
        } else {
            let recentCollection = collectionOfMostRecentCompletion(from: completedRecently)
            recommendedCandidates = unfinished.filter { $0.isRecommended || $0.collection == recentCollection }
        }
        let recommended = recommendedCandidates
            .filter { !continueJourney.contains($0) }
            .prefix(4)
            .map { $0 }

        let featured = unfinished.filter { $0.isFeatured }
            .filter { !continueJourney.contains($0) && !recommended.contains($0) }
            .prefix(4)
            .map { $0 }

        let seasonal = unfinished.filter { $0.isSeasonal && isActiveSeason(for: $0, date: now, calendar: calendar) }
            .filter { !continueJourney.contains($0) && !recommended.contains($0) && !featured.contains($0) }
            .prefix(4)
            .map { $0 }

        let recentlyCompleted = completedRecently
            .filter { !continueJourney.contains($0) && !recommended.contains($0) && !featured.contains($0) && !seasonal.contains($0) }
            .prefix(3)
            .map { $0 }

        let newToYou = unfinished.filter {
            progress(for: $0).status == .notStarted && PrayerJourneyProgressStore.record(for: $0.plan.id) == nil
        }
        .filter { journey in
            !continueJourney.contains(journey) && !recommended.contains(journey) && !featured.contains(journey) && !seasonal.contains(journey)
        }
        .prefix(4)
        .map { $0 }

        return PrayerJourneyRecommendationSections(
            continueJourney: continueJourney,
            recommended: recommended,
            featured: featured,
            seasonal: seasonal,
            recentlyCompleted: recentlyCompleted,
            newToYou: newToYou
        )
    }

    static func suggestedNext(
        after journey: PrayerJourney,
        journeys: [PrayerJourney],
        completedDaysByPlan: [String: Int],
        now: Date = Date()
    ) -> PrayerJourney? {
        let sections = sections(
            journeys: journeys,
            completedDaysByPlan: completedDaysByPlan,
            activePlanID: journey.plan.id,
            now: now
        )
        return sections.recommended.first { $0.id != journey.id }
            ?? journeys.first { $0.collection == journey.collection && $0.id != journey.id && !isCompleted($0, completedDaysByPlan: completedDaysByPlan) }
            ?? sections.newToYou.first { $0.id != journey.id }
    }

    static func related(
        to journey: PrayerJourney,
        journeys: [PrayerJourney],
        completedDaysByPlan: [String: Int]
    ) -> [PrayerJourney] {
        journeys.filter {
            $0.id != journey.id && $0.collection == journey.collection && !isCompleted($0, completedDaysByPlan: completedDaysByPlan)
        }
        .sorted { $0.sortOrder == $1.sortOrder ? $0.title < $1.title : $0.sortOrder < $1.sortOrder }
        .prefix(3)
        .map { $0 }
    }

    private static func isCompleted(_ journey: PrayerJourney, completedDaysByPlan: [String: Int]) -> Bool {
        PrayerPlanProgress(completedDays: completedDaysByPlan[journey.plan.id] ?? 0, totalDays: journey.sessionCount).status == .completed
    }

    private static func openedDate(for journey: PrayerJourney) -> Date {
        PrayerJourneyProgressStore.record(for: journey.plan.id)?.lastOpenedDate ?? .distantPast
    }

    private static func completedDate(for journey: PrayerJourney) -> Date {
        PrayerJourneyProgressStore.record(for: journey.plan.id)?.lastCompletedDate ?? .distantPast
    }

    private static func collectionOfMostRecentCompletion(from journeys: [PrayerJourney]) -> PrayerCollectionID? {
        journeys.first?.collection
    }

    private static func isActiveSeason(for journey: PrayerJourney, date: Date, calendar: Calendar) -> Bool {
        let month = calendar.component(.month, from: date)
        switch journey.id {
        case "advent": return month == 11 || month == 12
        case "christmas": return month == 12 || month == 1
        case "lent": return month == 2 || month == 3 || month == 4
        case "easter": return month == 3 || month == 4 || month == 5
        default: return true
        }
    }
}

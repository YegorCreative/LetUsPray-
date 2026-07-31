import Foundation

struct PrayerCollectionInsight: Identifiable, Hashable {
    let id: PrayerCollectionID
    let title: String
    let completed: Int
    let started: Int
    let total: Int

    var progress: Double {
        guard total > 0 else { return 0 }
        return Double(completed) / Double(total)
    }
}

struct PrayerInsightActivity: Identifiable, Hashable {
    let id: String
    let title: String
    let detail: String
    let date: Date
    let systemImage: String
}

struct PrayerInsights {
    let journeysStarted: Int
    let journeysCompleted: Int
    let overallCompletionPercentage: Int
    let currentStreak: Int
    let longestStreak: Int
    let totalPrayerSessions: Int
    let estimatedPrayerMinutes: Int
    let averageCompletionDays: Int?
    let lastPrayerDate: Date?
    let collections: [PrayerCollectionInsight]
    let mostPrayedJourney: PrayerJourney?
    let recentlyCompleted: [PrayerJourney]
    let recentlyStarted: [PrayerJourney]
    let savedJourneyCount: Int
    let favoriteJourneyCount: Int
    let activities: [PrayerInsightActivity]

    var mostCompletedCollection: PrayerCollectionInsight? {
        collections.filter { $0.completed > 0 }.max { $0.completed < $1.completed }
    }

    var leastExploredCollection: PrayerCollectionInsight? {
        collections.min { $0.started < $1.started }
    }

    var activeCollection: PrayerCollectionInsight? {
        collections.first { $0.started > $0.completed && $0.started > 0 }
    }
}

enum PrayerInsightsService {
    static func make(
        journeys: [PrayerJourney],
        completedDaysByPlan: [String: Int],
        streak: PrayerStreak,
        completedPrayerCount: Int,
        savedJourneyIDs: Set<String>,
        favoriteJourneyIDs: Set<String>,
        prayerCompletionDates: [Date],
        latestCompletedPrayer: HomePrayerActivity?,
        latestStartedJourney: HomeJourneyActivity?
    ) -> PrayerInsights {
        let uniqueJourneys = Dictionary(journeys.map { ($0.id, $0) }, uniquingKeysWith: { first, _ in first }).values.sorted { $0.title < $1.title }
        func progress(_ journey: PrayerJourney) -> PrayerPlanProgress {
            PrayerPlanProgress(completedDays: completedDaysByPlan[journey.plan.id] ?? 0, totalDays: journey.sessionCount)
        }

        let started = uniqueJourneys.filter { progress($0).completedDays > 0 || PrayerJourneyProgressStore.record(for: $0.plan.id)?.lastOpenedDate != nil }
        let completed = uniqueJourneys.filter { progress($0).status == .completed }
        let totalSessions = uniqueJourneys.reduce(0) { $0 + (completedDaysByPlan[$1.plan.id] ?? 0) }
        let totalPossible = uniqueJourneys.reduce(0) { $0 + $1.sessionCount }
        let percentage = totalPossible == 0 ? 0 : Int((Double(totalSessions) / Double(totalPossible) * 100).rounded())

        let collectionInsights = PrayerJourneyCatalog.collections.map { collection in
            let items = uniqueJourneys.filter { $0.collection == collection.id }
            let completedCount = items.filter { progress($0).status == .completed }.count
            let startedCount = items.filter { progress($0).completedDays > 0 || PrayerJourneyProgressStore.record(for: $0.plan.id)?.lastOpenedDate != nil }.count
            return PrayerCollectionInsight(id: collection.id, title: collection.title, completed: completedCount, started: startedCount, total: items.count)
        }

        let recentCompleted = completed.sorted { date(for: $0, keyPath: \.lastCompletedDate) > date(for: $1, keyPath: \.lastCompletedDate) }.prefix(3).map { $0 }
        let recentStarted = started.sorted { date(for: $0, keyPath: \.lastOpenedDate) > date(for: $1, keyPath: \.lastOpenedDate) }.prefix(3).map { $0 }
        let mostPrayed = uniqueJourneys.max { (completedDaysByPlan[$0.plan.id] ?? 0) < (completedDaysByPlan[$1.plan.id] ?? 0) }
        let durations = started.compactMap { journey -> Int? in
            guard let record = PrayerJourneyProgressStore.record(for: journey.plan.id), let opened = record.lastOpenedDate, let completedDate = record.lastCompletedDate else { return nil }
            return max(1, Calendar.current.dateComponents([.day], from: opened, to: completedDate).day ?? 1)
        }

        var activities: [PrayerInsightActivity] = []
        if let latestCompletedPrayer {
            activities.append(.init(id: "completed-prayer", title: "Prayer completed", detail: latestCompletedPrayer.journeyName, date: latestCompletedPrayer.date, systemImage: "checkmark.circle.fill"))
        }
        if let latestStartedJourney {
            activities.append(.init(id: "started-journey", title: "Journey opened", detail: latestStartedJourney.journeyName, date: latestStartedJourney.date, systemImage: "book.pages.fill"))
        }
        activities.append(contentsOf: recentCompleted.enumerated().map { index, journey in
            PrayerInsightActivity(id: "completed-\(journey.id)-\(index)", title: "Journey completed", detail: journey.title, date: date(for: journey, keyPath: \.lastCompletedDate), systemImage: "checkmark.seal.fill")
        })

        return PrayerInsights(
            journeysStarted: started.count,
            journeysCompleted: completed.count,
            overallCompletionPercentage: percentage,
            currentStreak: streak.currentStreak,
            longestStreak: streak.longestStreak,
            totalPrayerSessions: max(totalSessions, completedPrayerCount),
            estimatedPrayerMinutes: uniqueJourneys.reduce(0) { $0 + (completedDaysByPlan[$1.plan.id] ?? 0) * $1.estimatedPrayerMinutes },
            averageCompletionDays: durations.isEmpty ? nil : durations.reduce(0, +) / durations.count,
            lastPrayerDate: prayerCompletionDates.max(),
            collections: collectionInsights,
            mostPrayedJourney: mostPrayed,
            recentlyCompleted: recentCompleted,
            recentlyStarted: recentStarted,
            savedJourneyCount: savedJourneyIDs.count,
            favoriteJourneyCount: favoriteJourneyIDs.count,
            activities: activities.sorted { $0.date > $1.date }
        )
    }

    private static func date(for journey: PrayerJourney, keyPath: KeyPath<PrayerJourneyProgressRecord, Date?>) -> Date {
        PrayerJourneyProgressStore.record(for: journey.plan.id).flatMap { $0[keyPath: keyPath] } ?? .distantPast
    }
}

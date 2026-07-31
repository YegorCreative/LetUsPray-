import Foundation

enum JourneyDurationFilter: String, CaseIterable, Identifiable {
    case any = "Any length"
    case short = "Up to 14 days"
    case medium = "15–30 days"
    case long = "31+ days"

    var id: Self { self }
}

enum JourneyPrayerTimeFilter: String, CaseIterable, Identifiable {
    case any = "Any prayer time"
    case brief = "Up to 7 minutes"
    case standard = "8–10 minutes"
    case extended = "11+ minutes"

    var id: Self { self }
}

enum JourneyProgressFilter: String, CaseIterable, Identifiable {
    case any = "Any progress"
    case notStarted = "Not Started"
    case inProgress = "In Progress"
    case completed = "Completed"

    var id: Self { self }
}

enum JourneySortOption: String, CaseIterable, Identifiable {
    case recommended = "Recommended"
    case alphabetical = "Alphabetical"
    case recentlyOpened = "Recently Opened"
    case recentlyCompleted = "Recently Completed"
    case duration = "Duration"
    case difficulty = "Difficulty"
    case progress = "Progress"
    case featured = "Featured"
    case catalogOrder = "Newest Catalog Order"

    var id: Self { self }
}

struct JourneySearchFilters: Equatable {
    var collection: PrayerCollectionID?
    var difficulty: PrayerJourneyDifficulty?
    var duration: JourneyDurationFilter = .any
    var prayerTime: JourneyPrayerTimeFilter = .any
    var progress: JourneyProgressFilter = .any
    var featuredOnly = false
    var recommendedOnly = false
    var seasonalOnly = false
    var savedOnly = false
    var favoriteOnly = false

    static let empty = JourneySearchFilters(collection: nil, difficulty: nil)

    var isEmpty: Bool {
        collection == nil && difficulty == nil && duration == .any && prayerTime == .any && progress == .any
            && !featuredOnly && !recommendedOnly && !seasonalOnly
            && !savedOnly && !favoriteOnly
    }
}

enum PrayerJourneySearchService {
    static func search(
        journeys: [PrayerJourney],
        query: String,
        filters: JourneySearchFilters,
        sort: JourneySortOption,
        completedDaysByPlan: [String: Int],
        activePlanID: String,
        savedJourneyIDs: Set<String> = PrayerJourneyLibraryService.savedIDs(),
        favoriteJourneyIDs: Set<String> = PrayerJourneyLibraryService.favoriteIDs()
    ) -> [PrayerJourney] {
        let normalizedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let filtered = journeys.filter { journey in
            matchesQuery(journey, query: normalizedQuery)
                && matchesFilters(journey, filters: filters, completedDaysByPlan: completedDaysByPlan, savedJourneyIDs: savedJourneyIDs, favoriteJourneyIDs: favoriteJourneyIDs)
        }

        return filtered.sorted {
            compare($0, $1, sort: sort, completedDaysByPlan: completedDaysByPlan, activePlanID: activePlanID)
        }
    }

    private static func matchesQuery(_ journey: PrayerJourney, query: String) -> Bool {
        guard !query.isEmpty else { return true }
        let searchableText = [journey.title, journey.subtitle, journey.description, journey.collection.title, journey.categoryName]
            .joined(separator: " ")
            .lowercased()
        return searchableText.localizedStandardRange(of: query) != nil
    }

    private static func matchesFilters(_ journey: PrayerJourney, filters: JourneySearchFilters, completedDaysByPlan: [String: Int], savedJourneyIDs: Set<String>, favoriteJourneyIDs: Set<String>) -> Bool {
        if let collection = filters.collection, journey.collection != collection { return false }
        if let difficulty = filters.difficulty, journey.difficulty != difficulty { return false }
        if filters.featuredOnly && !journey.isFeatured { return false }
        if filters.recommendedOnly && !journey.isRecommended { return false }
        if filters.seasonalOnly && !journey.isSeasonal { return false }
        if filters.savedOnly && !savedJourneyIDs.contains(journey.id) { return false }
        if filters.favoriteOnly && !favoriteJourneyIDs.contains(journey.id) { return false }

        switch filters.duration {
        case .any: break
        case .short where journey.estimatedDurationDays > 14: return false
        case .medium where journey.estimatedDurationDays < 15 || journey.estimatedDurationDays > 30: return false
        case .long where journey.estimatedDurationDays < 31: return false
        default: break
        }

        switch filters.prayerTime {
        case .any: break
        case .brief where journey.estimatedPrayerMinutes > 7: return false
        case .standard where journey.estimatedPrayerMinutes < 8 || journey.estimatedPrayerMinutes > 10: return false
        case .extended where journey.estimatedPrayerMinutes < 11: return false
        default: break
        }

        let progress = PrayerPlanProgress(completedDays: completedDaysByPlan[journey.plan.id] ?? 0, totalDays: journey.sessionCount)
        switch filters.progress {
        case .any: return true
        case .notStarted: return progress.status == .notStarted
        case .inProgress: return progress.status == .inProgress
        case .completed: return progress.status == .completed
        }
    }

    private static func compare(_ lhs: PrayerJourney, _ rhs: PrayerJourney, sort: JourneySortOption, completedDaysByPlan: [String: Int], activePlanID: String) -> Bool {
        switch sort {
        case .alphabetical:
            return lhs.title.localizedCaseInsensitiveCompare(rhs.title) == .orderedAscending
        case .duration:
            return lhs.estimatedDurationDays == rhs.estimatedDurationDays ? lhs.title < rhs.title : lhs.estimatedDurationDays < rhs.estimatedDurationDays
        case .difficulty:
            return lhs.difficulty.rawValue == rhs.difficulty.rawValue ? lhs.title < rhs.title : lhs.difficulty.rawValue < rhs.difficulty.rawValue
        case .progress:
            let left = progressValue(lhs, completedDaysByPlan: completedDaysByPlan)
            let right = progressValue(rhs, completedDaysByPlan: completedDaysByPlan)
            return left == right ? lhs.title < rhs.title : left > right
        case .featured:
            return lhs.isFeatured == rhs.isFeatured ? lhs.title < rhs.title : lhs.isFeatured
        case .recentlyOpened:
            return date(for: lhs, keyPath: \.lastOpenedDate) > date(for: rhs, keyPath: \.lastOpenedDate)
        case .recentlyCompleted:
            return date(for: lhs, keyPath: \.lastCompletedDate) > date(for: rhs, keyPath: \.lastCompletedDate)
        case .catalogOrder:
            return lhs.sortOrder == rhs.sortOrder ? lhs.title < rhs.title : lhs.sortOrder < rhs.sortOrder
        case .recommended:
            let left = recommendationRank(lhs, completedDaysByPlan: completedDaysByPlan, activePlanID: activePlanID)
            let right = recommendationRank(rhs, completedDaysByPlan: completedDaysByPlan, activePlanID: activePlanID)
            return left == right ? lhs.title < rhs.title : left < right
        }
    }

    private static func progressValue(_ journey: PrayerJourney, completedDaysByPlan: [String: Int]) -> Double {
        let total = max(journey.sessionCount, 1)
        return Double(completedDaysByPlan[journey.plan.id] ?? 0) / Double(total)
    }

    private static func recommendationRank(_ journey: PrayerJourney, completedDaysByPlan: [String: Int], activePlanID: String) -> Int {
        let status = PrayerPlanProgress(completedDays: completedDaysByPlan[journey.plan.id] ?? 0, totalDays: journey.sessionCount).status
        if journey.plan.id == activePlanID && status != .completed { return 0 }
        if PrayerJourneyProgressStore.record(for: journey.plan.id)?.lastOpenedDate != nil && status != .completed { return 1 }
        if journey.isRecommended { return 2 }
        if journey.isFeatured { return 3 }
        if status == .notStarted { return 4 }
        return 5
    }

    private static func date(for journey: PrayerJourney, keyPath: KeyPath<PrayerJourneyProgressRecord, Date?>) -> Date {
        PrayerJourneyProgressStore.record(for: journey.plan.id).flatMap { $0[keyPath: keyPath] } ?? .distantPast
    }
}

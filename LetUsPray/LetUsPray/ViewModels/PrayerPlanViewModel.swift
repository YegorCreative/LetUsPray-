import Combine
import Foundation

@MainActor
final class PrayerPlanViewModel: ObservableObject {
    @Published private(set) var activePlan: PrayerPlan
    private let repositoryPlans: [PrayerPlan]
    private let repositoryFeaturedPlans: [PrayerPlan]

    init(activePlanID: String? = nil, plans: [PrayerPlan]? = nil, featuredPlans: [PrayerPlan]? = nil) {
        let resolvedPlans = plans ?? PrayerPlansRepository.allPlans
        self.repositoryPlans = resolvedPlans
        self.repositoryFeaturedPlans = featuredPlans ?? PrayerPlansRepository.featuredPlans

        if let activePlanID,
           let selected = resolvedPlans.first(where: { $0.id == activePlanID }) {
            self.activePlan = selected
        } else {
            self.activePlan = repositoryFeaturedPlans.first ?? resolvedPlans[0]
        }
    }

    var allPlans: [PrayerPlan] {
        repositoryPlans
    }

    var featuredPlans: [PrayerPlan] {
        repositoryFeaturedPlans
    }

    var availableJourneyPlans: [PrayerPlan] {
        PrayerPlansRepository.availableJourneyPlans
    }

    var plan: PrayerPlan {
        activePlan
    }

    var todaySubtitle: String {
        activePlan.subtitle
    }

    func setActivePlan(id: String) {
        guard let plan = planByID(id) else { return }
        activePlan = plan
    }

    func planByID(_ id: String) -> PrayerPlan? {
        repositoryPlans.first(where: { $0.id == id }) ?? PrayerPlansRepository.planByID(id)
    }

    func recommendedPlan(completedDaysByPlan: [String: Int]) -> PrayerPlan? {
        let candidates = availableJourneyPlans.filter { $0.id != activePlan.id }

        return candidates.min { first, second in
            let firstProgress = completedDaysByPlan[first.id] ?? 0
            let secondProgress = completedDaysByPlan[second.id] ?? 0

            if (firstProgress == 0) != (secondProgress == 0) {
                return firstProgress == 0
            }

            if firstProgress != secondProgress {
                return firstProgress < secondProgress
            }

            return first.title.localizedCaseInsensitiveCompare(second.title) == .orderedAscending
        }
    }

    func greeting(for date: Date = Date(), calendar: Calendar = .current) -> String {
        let hour = calendar.component(.hour, from: date)

        switch hour {
        case 5..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        default:
            return "Good Evening"
        }
    }

    func day(for dayNumber: Int, in plan: PrayerPlan? = nil) -> PrayerDay? {
        let plan = plan ?? activePlan
        return plan.days.first(where: { $0.dayNumber == dayNumber })
    }

    func nextUnprayedDay(completedDayNumbers: Set<Int>, in plan: PrayerPlan? = nil) -> PrayerDay {
        let plan = plan ?? activePlan
        return plan.days.first(where: { !completedDayNumbers.contains($0.dayNumber) }) ?? plan.days.last ?? plan.days[0]
    }

    func progressLabel(completedDayNumbers: Set<Int>, in plan: PrayerPlan? = nil) -> String {
        let plan = plan ?? activePlan
        let completedCount = completedDayNumbers.intersection(Set(plan.days.map(\.dayNumber))).count
        return "\(completedCount) of \(plan.durationDays) days prayed"
    }

    func completedCount(completedDayNumbers: Set<Int>, in plan: PrayerPlan? = nil) -> Int {
        let plan = plan ?? activePlan
        return completedDayNumbers.intersection(Set(plan.days.map(\.dayNumber))).count
    }

    func progressValue(completedDayNumbers: Set<Int>, in plan: PrayerPlan? = nil) -> Double {
        let plan = plan ?? activePlan
        guard plan.durationDays > 0 else { return 0 }
        return Double(completedCount(completedDayNumbers: completedDayNumbers, in: plan)) / Double(plan.durationDays)
    }

    func analyticsSnapshot(completedPrayersByPlan: [String: Set<Int>], savedVerseIDs: Set<String>, activePlanID: String) -> PrayerAnalyticsSnapshot {
        PrayerAnalytics.snapshot(
            completedDaysByPlan: completedPrayersByPlan,
            savedVerses: savedVerseIDs,
            activePlanID: activePlanID
        )
    }

    func savedVerses(for savedVerseIDs: Set<String>) -> [SavedPrayerVerse] {
        availableJourneyPlans.flatMap { plan in
            plan.days.flatMap { day in
                day.verses.compactMap { verse in
                    guard savedVerseIDs.contains(verse.id) else { return nil }
                    return SavedPrayerVerse(plan: plan, day: day, verse: verse)
                }
            }
        }
    }

    func savedPrayers(for records: [SavedPrayerRecord]) -> [SavedPrayerItem] {
        let recordByVerseID = Dictionary(
            records.map { ($0.verseID, $0) },
            uniquingKeysWith: { existing, _ in existing }
        )

        return availableJourneyPlans
            .flatMap { plan in
                plan.days.flatMap { day in
                    day.verses.compactMap { verse in
                        guard let record = recordByVerseID[verse.id] else { return nil }
                        return SavedPrayerItem(plan: plan, day: day, verse: verse, record: record)
                    }
                }
            }
            .sorted {
                if $0.record.savedDate != $1.record.savedDate {
                    return $0.record.savedDate > $1.record.savedDate
                }
                return $0.verse.id < $1.verse.id
            }
    }
}

struct SavedPrayerVerse: Identifiable, Hashable {
    let plan: PrayerPlan
    let day: PrayerDay
    let verse: PrayerVerse

    var id: String { verse.id }
}

struct SavedPrayerRecord: Identifiable, Hashable, Codable {
    let verseID: String
    let savedDate: Date

    var id: String { verseID }
}

struct SavedPrayerItem: Identifiable, Hashable {
    let plan: PrayerPlan
    let day: PrayerDay
    let verse: PrayerVerse
    let record: SavedPrayerRecord

    var id: String { verse.id }
}

struct HomePrayerActivity: Hashable, Codable {
    let scriptureReference: String
    let journeyName: String
    let date: Date
}

struct HomeJourneyActivity: Hashable, Codable {
    let journeyName: String
    let date: Date
}

struct PrayerJournalEntry: Hashable, Codable {
    var prayerText: String
    var reflectionText: String

    static let empty = PrayerJournalEntry(prayerText: "", reflectionText: "")
}

enum PrayerStorageKeys {
    static let completedDayNumbers = "completedPrayerDayNumbers"
    static let savedVerseIDs = "savedPrayerVerseIDs"
    static let savedPrayerRecords = "savedPrayerRecords"
    static let savedPrayerRecordsMigrationCompleted = "savedPrayerRecordsMigrationCompleted"
    static let currentStreak = "currentPrayerStreak"
    static let longestStreak = "longestPrayerStreak"
    static let lastCompletedDate = "lastCompletedPrayerDate"
    static let completedPrayersCount = "completedPrayersCount"
    static let savedPrayersCount = "savedPrayersCount"
    static let activePlanID = "activePrayerPlanID"
    static let completedDaysByPlan = "completedPrayerDaysByPlan"
    static let analyticsActivePlanID = "analyticsActivePlanID"
    static let onboardingCompleted = "hasCompletedOnboarding"
    static let latestCompletedPrayerActivity = "latestCompletedPrayerActivity"
    static let latestSavedPrayerActivity = "latestSavedPrayerActivity"
    static let latestStartedJourneyActivity = "latestStartedJourneyActivity"
    static let prayerCompletionDates = "prayerCompletionDates"
    static let prayerJournalEntries = "prayerJournalEntries"
    static let achievementUnlockDates = "achievementUnlockDates"
}

enum PrayerStorageCodec {
    static func decodeIntSet(_ rawValue: String) -> Set<Int> {
        Set(
            rawValue
                .split(separator: ",")
                .compactMap { Int($0) }
        )
    }

    static func encodeIntSet(_ values: Set<Int>) -> String {
        values
            .sorted()
            .map(String.init)
            .joined(separator: ",")
    }

    static func decodeStringSet(_ rawValue: String) -> Set<String> {
        Set(
            rawValue
                .split(separator: ",")
                .map(String.init)
        )
    }

    static func encodeStringSet(_ values: Set<String>) -> String {
        values
            .sorted()
            .joined(separator: ",")
    }

    static func decodeCompletedDaysByPlan(_ rawValue: String) -> [String: Set<Int>] {
        guard let data = rawValue.data(using: .utf8),
              let decoded = try? JSONDecoder().decode([String: [Int]].self, from: data) else {
            return [:]
        }

        return decoded.mapValues(Set.init)
    }

    static func encodeCompletedDaysByPlan(_ values: [String: Set<Int>]) -> String {
        let serializable = values.mapValues { Array($0).sorted() }
        guard let data = try? JSONEncoder().encode(serializable),
              let string = String(data: data, encoding: .utf8) else {
            return "{}"
        }
        return string
    }

    static func decodeValue<Value: Decodable>(_ type: Value.Type, from rawValue: String) -> Value? {
        guard let data = rawValue.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }

    static func encodeValue<Value: Encodable>(_ value: Value) -> String {
        guard let data = try? JSONEncoder().encode(value),
              let string = String(data: data, encoding: .utf8) else {
            return ""
        }
        return string
    }
}

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
        repositoryPlans.first(where: { $0.id == id })
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
        repositoryPlans.flatMap { plan in
            plan.days.flatMap { day in
                day.verses.compactMap { verse in
                    guard savedVerseIDs.contains(verse.id) else { return nil }
                    return SavedPrayerVerse(plan: plan, day: day, verse: verse)
                }
            }
        }
    }
}

struct SavedPrayerVerse: Identifiable, Hashable {
    let plan: PrayerPlan
    let day: PrayerDay
    let verse: PrayerVerse

    var id: String { verse.id }
}

enum PrayerStorageKeys {
    static let completedDayNumbers = "completedPrayerDayNumbers"
    static let savedVerseIDs = "savedPrayerVerseIDs"
    static let currentStreak = "currentPrayerStreak"
    static let longestStreak = "longestPrayerStreak"
    static let lastCompletedDate = "lastCompletedPrayerDate"
    static let completedPrayersCount = "completedPrayersCount"
    static let savedPrayersCount = "savedPrayersCount"
    static let activePlanID = "activePrayerPlanID"
    static let completedDaysByPlan = "completedPrayerDaysByPlan"
    static let analyticsActivePlanID = "analyticsActivePlanID"
    static let onboardingCompleted = "hasCompletedOnboarding"
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
}

import Combine
import Foundation

@MainActor
final class PrayerPlanViewModel: ObservableObject {
    @Published private(set) var plan: PrayerPlan

    init(plan: PrayerPlan? = nil) {
        self.plan = plan ?? ProverbsPrayerData.plan
    }

    var todaySubtitle: String {
        plan.subtitle
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

    func day(for dayNumber: Int) -> PrayerDay? {
        plan.days.first(where: { $0.dayNumber == dayNumber })
    }

    func nextUnprayedDay(completedDayNumbers: Set<Int>) -> PrayerDay {
        plan.days.first(where: { !completedDayNumbers.contains($0.dayNumber) }) ?? plan.days.last ?? plan.days[0]
    }

    func progressLabel(completedDayNumbers: Set<Int>) -> String {
        let completedCount = completedDayNumbers.intersection(Set(plan.days.map(\.dayNumber))).count
        return "\(completedCount) of \(plan.duration) days prayed"
    }

    func completedCount(completedDayNumbers: Set<Int>) -> Int {
        completedDayNumbers.intersection(Set(plan.days.map(\.dayNumber))).count
    }

    func progressValue(completedDayNumbers: Set<Int>) -> Double {
        guard plan.duration > 0 else { return 0 }
        return Double(completedCount(completedDayNumbers: completedDayNumbers)) / Double(plan.duration)
    }

    func analyticsSnapshot(completedDayNumbers: Set<Int>, savedVerseIDs: Set<String>) -> PrayerAnalyticsSnapshot {
        PrayerAnalytics.snapshot(completedDays: completedDayNumbers, savedVerses: savedVerseIDs)
    }

    func savedVerses(for savedVerseIDs: Set<String>) -> [SavedPrayerVerse] {
        plan.days.flatMap { day in
            day.verses.compactMap { verse in
                guard savedVerseIDs.contains(verse.id) else { return nil }
                return SavedPrayerVerse(day: day, verse: verse)
            }
        }
    }
}

struct SavedPrayerVerse: Identifiable, Hashable {
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
}

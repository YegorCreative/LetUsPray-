import Foundation

struct PrayerAnalyticsSnapshot: Hashable, Codable {
    let completedPrayersCount: Int
    let savedPrayersCount: Int
}

enum PrayerAnalytics {
    static func snapshot(completedDays: Set<Int>, savedVerses: Set<String>) -> PrayerAnalyticsSnapshot {
        PrayerAnalyticsSnapshot(
            completedPrayersCount: completedDays.count,
            savedPrayersCount: savedVerses.count
        )
    }
}

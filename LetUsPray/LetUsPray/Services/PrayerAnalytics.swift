import Foundation

struct PrayerAnalyticsSnapshot: Hashable, Codable {
    let completedPrayersCount: Int
    let savedPrayersCount: Int
    let activePlanID: String
    let completedDaysByPlan: [String: Int]
}

enum PrayerAnalytics {
    static func snapshot(completedDaysByPlan: [String: Set<Int>], savedVerses: Set<String>, activePlanID: String) -> PrayerAnalyticsSnapshot {
        PrayerAnalyticsSnapshot(
            completedPrayersCount: completedDaysByPlan.values.reduce(0) { $0 + $1.count },
            savedPrayersCount: savedVerses.count,
            activePlanID: activePlanID,
            completedDaysByPlan: completedDaysByPlan.mapValues(\.count)
        )
    }
}

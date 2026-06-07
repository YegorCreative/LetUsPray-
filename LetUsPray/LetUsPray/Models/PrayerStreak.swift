import Foundation

struct PrayerStreak: Hashable, Codable {
    let currentStreak: Int
    let longestStreak: Int
    let lastCompletedDate: Date?

    static let empty = PrayerStreak(currentStreak: 0, longestStreak: 0, lastCompletedDate: nil)

    var badgeText: String {
        "🔥 \(max(currentStreak, 0)) Day Streak"
    }
}

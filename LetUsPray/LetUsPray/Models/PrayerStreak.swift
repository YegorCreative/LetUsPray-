import Foundation

struct PrayerStreak: Hashable, Codable {
    let currentStreak: Int
    let longestStreak: Int
    let lastCompletedDate: Date?

    static let empty = PrayerStreak(currentStreak: 0, longestStreak: 0, lastCompletedDate: nil)

    var badgeText: String {
        let count = max(currentStreak, 0)
        return "\(count) Day\(count == 1 ? "" : "s") of Prayer"
    }

    var encouragementText: String {
        let count = max(currentStreak, 0)

        if count > 0 {
            return "You're on a \(count)-day prayer journey."
        }
        if lastCompletedDate != nil {
            return "Welcome back—today is a great day to pray."
        }
        return "Today is a beautiful day to begin."
    }
}

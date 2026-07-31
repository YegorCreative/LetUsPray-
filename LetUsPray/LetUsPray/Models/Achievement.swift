import Foundation

enum AchievementID: String, CaseIterable, Codable, Hashable {
    case firstPrayer
    case threeDayStreak
    case sevenDayStreak
    case fourteenDayStreak
    case thirtyDayStreak
    case firstCompletedJourney
    case fiveCompletedJourneys
    case firstSavedPrayer
    case tenSavedPrayers
}

struct Achievement: Identifiable, Hashable {
    let id: AchievementID
    let title: String
    let description: String
    let systemImage: String
    let unlockDate: Date?

    var isUnlocked: Bool {
        unlockDate != nil
    }
}

struct AchievementProgress: Hashable {
    let completedPrayerCount: Int
    let longestStreak: Int
    let completedJourneyCount: Int
    let savedPrayerCount: Int
}

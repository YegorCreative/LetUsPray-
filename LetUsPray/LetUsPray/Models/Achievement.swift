import Foundation

enum AchievementID: String, CaseIterable, Codable, Hashable {
    // Active Faith Milestones.
    case firstPrayer
    case sevenDayStreak
    case thirtyDayStreak
    case firstCompletedJourney
    case read100Scriptures
    case firstSavedPrayer
    case firstTestimonyShared
    case firstPrayerAnswered

    // Legacy — retired from the active Faith Milestone set, but kept so any already-persisted
    // unlock dates under these raw values remain valid identifiers. Not defined in
    // AchievementService.definitions; do not resurrect as active milestones or reuse these
    // raw values for a new, different milestone.
    case threeDayStreak
    case fourteenDayStreak
    case fiveCompletedJourneys
    case tenSavedPrayers
}

/// Faith Milestone categories. "Community" and "Testimonies" milestones exist as definitions
/// today but stay locked at zero progress until the Community platform ships — see
/// Docs/CommunityPlatform-Architecture.md.
enum FaithMilestoneCategory: String, CaseIterable, Codable, Hashable {
    case prayer
    case scripture
    case journeys
    case consistency
    case community
    case testimonies

    var displayTitle: String {
        switch self {
        case .prayer: "Prayer"
        case .scripture: "Scripture"
        case .journeys: "Journeys"
        case .consistency: "Consistency"
        case .community: "Community"
        case .testimonies: "Testimonies"
        }
    }
}

struct Achievement: Identifiable, Hashable {
    let id: AchievementID
    let title: String
    let description: String
    let systemImage: String
    let category: FaithMilestoneCategory
    let scriptureReference: String?
    let progress: Int
    let target: Int
    let unlockDate: Date?

    var isUnlocked: Bool {
        unlockDate != nil
    }

    var isInProgress: Bool {
        !isUnlocked && progress > 0
    }

    var fractionComplete: Double {
        guard target > 0 else { return 0 }
        return min(Double(progress) / Double(target), 1)
    }
}

struct AchievementProgress: Hashable {
    let completedPrayerCount: Int
    let longestStreak: Int
    let completedJourneyCount: Int
    let savedPrayerCount: Int
}

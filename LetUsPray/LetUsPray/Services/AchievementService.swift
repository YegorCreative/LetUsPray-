import Foundation

struct AchievementService {
    private struct Definition {
        let id: AchievementID
        let title: String
        let description: String
        let systemImage: String
        let isSatisfied: (AchievementProgress) -> Bool
    }

    private let definitions: [Definition] = [
        Definition(
            id: .firstPrayer,
            title: "First Prayer",
            description: "You began a meaningful rhythm of prayer.",
            systemImage: "hands.sparkles.fill",
            isSatisfied: { $0.completedPrayerCount >= 1 }
        ),
        Definition(
            id: .threeDayStreak,
            title: "3-Day Prayer Streak",
            description: "You returned to prayer for three days.",
            systemImage: "flame.fill",
            isSatisfied: { $0.longestStreak >= 3 }
        ),
        Definition(
            id: .sevenDayStreak,
            title: "7-Day Prayer Streak",
            description: "A full week of prayer has shaped your journey.",
            systemImage: "calendar.badge.checkmark",
            isSatisfied: { $0.longestStreak >= 7 }
        ),
        Definition(
            id: .fourteenDayStreak,
            title: "14-Day Prayer Streak",
            description: "You made space for prayer across two weeks.",
            systemImage: "calendar",
            isSatisfied: { $0.longestStreak >= 14 }
        ),
        Definition(
            id: .thirtyDayStreak,
            title: "30-Day Prayer Streak",
            description: "A month of faithful prayer marks this moment.",
            systemImage: "sun.max.fill",
            isSatisfied: { $0.longestStreak >= 30 }
        ),
        Definition(
            id: .firstCompletedJourney,
            title: "First Completed Journey",
            description: "You prayerfully completed your first journey.",
            systemImage: "map.fill",
            isSatisfied: { $0.completedJourneyCount >= 1 }
        ),
        Definition(
            id: .fiveCompletedJourneys,
            title: "Five Completed Journeys",
            description: "Five journeys now reflect your time in prayer.",
            systemImage: "books.vertical.fill",
            isSatisfied: { $0.completedJourneyCount >= 5 }
        ),
        Definition(
            id: .firstSavedPrayer,
            title: "First Saved Prayer",
            description: "You saved a prayer to return to again.",
            systemImage: "bookmark.fill",
            isSatisfied: { $0.savedPrayerCount >= 1 }
        ),
        Definition(
            id: .tenSavedPrayers,
            title: "Ten Saved Prayers",
            description: "Your saved prayers have become a place of reflection.",
            systemImage: "bookmark.square.fill",
            isSatisfied: { $0.savedPrayerCount >= 10 }
        )
    ]

    func updatedUnlockDates(
        from existing: [String: Date],
        progress: AchievementProgress,
        unlockDate: Date = Date()
    ) -> [String: Date] {
        var updated = existing

        for definition in definitions
        where updated[definition.id.rawValue] == nil && definition.isSatisfied(progress) {
            updated[definition.id.rawValue] = unlockDate
        }

        return updated
    }

    func achievements(unlockDates: [String: Date]) -> [Achievement] {
        definitions.map { definition in
            Achievement(
                id: definition.id,
                title: definition.title,
                description: definition.description,
                systemImage: definition.systemImage,
                unlockDate: unlockDates[definition.id.rawValue]
            )
        }
    }
}

import Foundation

struct AchievementService {
    private struct Definition {
        let id: AchievementID
        let title: String
        let description: String
        let systemImage: String
        let category: FaithMilestoneCategory
        let scriptureReference: String?
        let target: Int
        let currentValue: (AchievementProgress) -> Int
    }

    private let definitions: [Definition] = [
        Definition(
            id: .firstPrayer,
            title: "First Prayer",
            description: "You began a meaningful rhythm of prayer.",
            systemImage: "leaf.fill",
            category: .prayer,
            scriptureReference: "1 Thessalonians 5:17",
            target: 1,
            currentValue: { $0.completedPrayerCount }
        ),
        Definition(
            id: .sevenDayStreak,
            title: "7-Day Prayer Streak",
            description: "A full week of prayer has shaped your journey.",
            systemImage: "hands.sparkles.fill",
            category: .consistency,
            scriptureReference: "Lamentations 3:22-23",
            target: 7,
            currentValue: { $0.longestStreak }
        ),
        Definition(
            id: .thirtyDayStreak,
            title: "30-Day Prayer Streak",
            description: "A month of faithful prayer marks this moment.",
            systemImage: "flame.fill",
            category: .consistency,
            scriptureReference: "Galatians 6:9",
            target: 30,
            currentValue: { $0.longestStreak }
        ),
        Definition(
            id: .firstCompletedJourney,
            title: "First Journey Completed",
            description: "You prayerfully completed your first journey.",
            systemImage: "book.closed.fill",
            category: .journeys,
            scriptureReference: "2 Timothy 4:7",
            target: 1,
            currentValue: { $0.completedJourneyCount }
        ),
        Definition(
            id: .read100Scriptures,
            title: "Read 100 Scriptures",
            description: "God's Word has met you a hundred times over.",
            systemImage: "book.fill",
            category: .scripture,
            scriptureReference: "Psalm 119:105",
            target: 100,
            currentValue: { $0.completedPrayerCount }
        ),
        Definition(
            id: .firstSavedPrayer,
            title: "First Saved Prayer",
            description: "You saved a prayer to return to again.",
            systemImage: "bookmark.fill",
            category: .scripture,
            scriptureReference: nil,
            target: 1,
            currentValue: { $0.savedPrayerCount }
        ),
        // The following two await the Community platform (see
        // Docs/CommunityPlatform-Architecture.md) — no tracking infrastructure exists yet for
        // testimonies or answered prayers, so these stay honestly locked at zero, not faked.
        Definition(
            id: .firstTestimonyShared,
            title: "First Testimony Shared",
            description: "Awaits the Community platform — you'll be able to share how God has been faithful.",
            systemImage: "cross.fill",
            category: .testimonies,
            scriptureReference: "Psalm 107:2",
            target: 1,
            currentValue: { _ in 0 }
        ),
        Definition(
            id: .firstPrayerAnswered,
            title: "First Prayer Answered",
            description: "Awaits the Community platform — you'll be able to mark a prayer as answered.",
            systemImage: "hands.and.sparkles.fill",
            category: .community,
            scriptureReference: "1 John 5:14-15",
            target: 1,
            currentValue: { _ in 0 }
        )
    ]

    func updatedUnlockDates(
        from existing: [String: Date],
        progress: AchievementProgress,
        unlockDate: Date = Date()
    ) -> [String: Date] {
        var updated = existing

        for definition in definitions
        where updated[definition.id.rawValue] == nil && definition.currentValue(progress) >= definition.target {
            updated[definition.id.rawValue] = unlockDate
        }

        return updated
    }

    func achievements(unlockDates: [String: Date], progress: AchievementProgress) -> [Achievement] {
        definitions.map { definition in
            Achievement(
                id: definition.id,
                title: definition.title,
                description: definition.description,
                systemImage: definition.systemImage,
                category: definition.category,
                scriptureReference: definition.scriptureReference,
                progress: min(definition.currentValue(progress), definition.target),
                target: definition.target,
                unlockDate: unlockDates[definition.id.rawValue]
            )
        }
    }

    func earnedCount(unlockDates: [String: Date]) -> Int {
        definitions.filter { unlockDates[$0.id.rawValue] != nil }.count
    }

    var totalCount: Int { definitions.count }
}

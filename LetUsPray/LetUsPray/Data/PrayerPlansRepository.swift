import Foundation

enum PrayerPlansRepository {
    // Main Psalms Journey entry point (just for display in Plans list)
    private static let psalmsJourneyEntry = PrayerPlan(
        id: "psalms-journey-overview",
        title: "Psalms Journey",
        subtitle: "Explore 10 collections of worship and prayer",
        description: "A complete journey through all 150 Psalms, organized into 10 collections of 15 psalms each. Choose any collection to begin.",
        category: .psalms,
        durationDays: 150,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: []
    )
    
    static let allPlans: [PrayerPlan] = [
        ProverbsPrayerData.plan,
        psalmsJourneyEntry,
        PrayerPlan(
            id: "gospel-of-john",
            title: "Gospel of John",
            subtitle: "Walk with Jesus through signs, truth, and light",
            description: "A future guided plan centered on the Gospel of John, helping users pray through the identity and words of Christ.",
            category: .gospel,
            durationDays: 30,
            accentColorName: "gospel",
            coverIcon: "sparkles.tv",
            days: []
        ),
        PrayerPlan(
            id: "anxiety-and-peace",
            title: "Anxiety & Peace",
            subtitle: "Scripture prayers for rest, trust, and calm",
            description: "A coming-soon plan designed to help users pray through anxiety, fear, and peace using carefully selected Scripture.",
            category: .encouragement,
            durationDays: 14,
            accentColorName: "encouragement",
            coverIcon: "leaf.fill",
            days: []
        ),
        PrayerPlan(
            id: "gratitude-challenge",
            title: "Gratitude Challenge",
            subtitle: "Practice daily thanksgiving through short guided prayers",
            description: "A future gratitude-focused journey inviting users into worship, remembrance, and daily thanksgiving through Scripture.",
            category: .gratitude,
            durationDays: 10,
            accentColorName: "gratitude",
            coverIcon: "hands.sparkles.fill",
            days: []
        )
    ]

    static let featuredPlans: [PrayerPlan] = [
        ProverbsPrayerData.plan,
        psalmsJourneyEntry
    ]

    static func planByID(_ id: String) -> PrayerPlan? {
        // First check the main plans list
        if let plan = allPlans.first(where: { $0.id == id }) {
            return plan
        }
        
        // If not found, check Psalm collections
        if id.starts(with: "psalms-") {
            return PsalmsPrayerData.allCollections.first(where: { $0.id == id })
        }
        
        return nil
    }
}

import Foundation

enum PrayerPlansRepository {
    static let allPlans: [PrayerPlan] = [
        ProverbsPrayerData.plan,
        PrayerPlan(
            id: "psalms-journey",
            title: "Psalms Journey",
            subtitle: "Pray the language of worship, lament, and trust",
            description: "A reflective journey through selected Psalms, shaping prayer through praise, honesty, and deep dependence on God.",
            category: .psalms,
            durationDays: 21,
            accentColorName: "psalms",
            coverIcon: "music.note.list",
            days: []
        ),
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
        allPlans[1]
    ]

    static func planByID(_ id: String) -> PrayerPlan? {
        allPlans.first(where: { $0.id == id })
    }
}

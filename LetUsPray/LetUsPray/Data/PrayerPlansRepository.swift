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
        LordsPrayerData.plan,
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
            days: [
                PrayerDay(
                    dayNumber: 1,
                    title: "Bring Every Worry to God",
                    chapterReference: "Philippians 4:6",
                    summary: "Bring every anxious thought and concern to God through prayer, trusting His care with a thankful heart.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-1-1",
                            reference: "Philippians 4:6",
                            text: "Be anxious for nothing, but in everything by prayer and supplication with thanksgiving let your requests be made known unto God.",
                            prayer: "Heavenly Father, You know every burden that weighs on my heart and every anxious thought that tries to overwhelm me. Your Word reminds me that I do not have to carry these worries alone. Instead of holding on to fear, help me bring every concern to You through prayer. Teach me to trust that You hear every request, no matter how big or small. Fill my heart with gratitude even before I see the answer, knowing that You are faithful, loving, and always working for my good. Help me release control into Your hands and rest in the confidence that You are near and You care deeply for me. Today, I choose to bring my anxieties to You and trust You with every part of my life."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-1-closing",
                            reference: "Closing",
                            text: "In Jesus’ name, Amen. 🙏🏻",
                            prayer: "In Jesus’ name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 2,
                    title: "Receive God's Peace",
                    chapterReference: "Philippians 4:7",
                    summary: "God's peace guards the hearts and minds of those who place their trust in Christ Jesus.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-2-1",
                            reference: "Philippians 4:7",
                            text: "And the peace of God, which passeth all understanding, shall keep your hearts and minds through Christ Jesus.",
                            prayer: "Heavenly Father, Thank You for promising a peace that is greater than anything I can understand. When my thoughts become restless and my heart is troubled, remind me that Your peace is not dependent on my circumstances but on Your faithful presence. Guard my heart from fear and protect my mind from anxious thoughts that pull me away from trusting You. Help me to rest in the confidence that You are in control, even when I cannot see the outcome. Let the peace of Christ fill every part of my life today, replacing worry with confidence, fear with faith, and uncertainty with hope. May Your peace guide my decisions, shape my thoughts, and strengthen my heart as I continue to trust in You. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-2-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 3,
                    title: "Keep Your Mind on God",
                    chapterReference: "Isaiah 26:3",
                    summary: "God gives perfect peace to those whose minds remain fixed on Him and who choose to trust Him.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-3-1",
                            reference: "Isaiah 26:3",
                            text: "Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.",
                            prayer: "Heavenly Father, Thank You for the promise of perfect peace that comes from keeping my mind fixed on You. When anxious thoughts compete for my attention, help me turn my eyes back to Your faithfulness instead of my fears. Teach me to trust You more deeply each day, believing that Your plans are good and Your presence is constant. Guard my mind from distractions, fear, and uncertainty. Fill my thoughts with Your truth, Your promises, and the confidence that You are working even when I cannot see it. May my trust in You grow stronger than my anxiety, and may Your perfect peace guide my heart, my decisions, and every step I take today. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-3-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                )
            ]
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

    static var availableJourneyPlans: [PrayerPlan] {
        [ProverbsPrayerData.plan] + PsalmsPrayerData.allCollections
    }

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

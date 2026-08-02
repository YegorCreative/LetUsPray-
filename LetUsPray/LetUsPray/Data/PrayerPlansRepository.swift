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
                ),
                PrayerDay(
                    dayNumber: 4,
                    title: "Receive the Peace of Christ",
                    chapterReference: "John 14:27",
                    summary: "Jesus offers a lasting peace that is different from anything the world can give.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-4-1",
                            reference: "John 14:27",
                            text: "Peace I leave with you; my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be fearful.",
                            prayer: "Heavenly Father, Thank You for the gift of peace that comes through Your Son, Jesus Christ. The world offers temporary comfort that quickly fades, but the peace You give remains steady even in the middle of uncertainty. Help me to receive that peace today instead of allowing fear to control my heart. When circumstances tempt me to worry, remind me that Jesus has already promised His peace to those who trust Him. Strengthen my faith so that I do not live in fear but walk with confidence, knowing that You are always with me. Let Your peace calm every anxious thought and fill my heart with hope, courage, and quiet confidence in Your unfailing love. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-4-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 5,
                    title: "Find Comfort in God's Presence",
                    chapterReference: "Psalm 94:19",
                    summary: "When anxious thoughts increase, God comforts and refreshes the soul with His presence.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-5-1",
                            reference: "Psalm 94:19",
                            text: "When my anxious thoughts multiply within me, Thy consolations delight my soul.",
                            prayer: "Heavenly Father, There are moments when anxious thoughts seem to multiply faster than I can quiet them, yet Your Word reminds me that Your comfort is greater than every fear. Thank You for never leaving me alone in my struggles. Even when my mind feels overwhelmed, Your presence brings peace, strength, and hope that no circumstance can take away. Comfort my heart today with the assurance that You are near. Replace every anxious thought with the truth of Your promises, and remind me that You are my refuge, my helper, and my faithful Shepherd. May Your loving presence refresh my soul and fill me with joy that rises above every worry. I choose to rest in Your comforting arms, knowing that You are always with me. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-5-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 6,
                    title: "Cast Every Care on Him",
                    chapterReference: "1 Peter 5:7",
                    summary: "God lovingly invites you to place every anxiety into His capable hands because He deeply cares for you.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-6-1",
                            reference: "1 Peter 5:7",
                            text: "Casting all your anxiety upon Him, because He careth for you.",
                            prayer: "Heavenly Father, Thank You for caring about every detail of my life. Nothing I carry is too small or too heavy for You. Today I choose to lay every worry, fear, and burden into Your loving hands. Help me not to hold tightly to the things that weigh me down, but to trust that You are able to carry what I cannot. When anxious thoughts return, remind me that I do not have to face them alone. Teach me to surrender them to You again and again, believing that Your care for me never changes. Fill my heart with confidence in Your love and strengthen my faith to rest in the knowledge that I am safe in Your hands. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-6-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 7,
                    title: "Trust God With Today",
                    chapterReference: "Matthew 6:34",
                    summary: "Jesus calls us to live one day at a time, trusting our Heavenly Father with tomorrow.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-7-1",
                            reference: "Matthew 6:34",
                            text: "Therefore do not be anxious for tomorrow; for tomorrow will care for itself. Each day has enough trouble of its own.",
                            prayer: "Heavenly Father, So often I find myself worrying about tomorrow instead of trusting You today. My mind races ahead to situations that have not happened, and I carry burdens You never asked me to bear. Forgive me for trying to control what belongs in Your hands. Help me to live one day at a time, receiving each moment as a gift from You. Give me the grace I need for today, the strength I need for today's challenges, and the faith to believe that when tomorrow comes, You will already be there. Keep my heart anchored in Your goodness instead of my fears, and teach me to rest in the confidence that Your mercies are new every morning. Today I choose to trust You with what I cannot see, knowing that You faithfully hold my future. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-7-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 8,
                    title: "Let Christ's Peace Rule Your Heart",
                    chapterReference: "Colossians 3:15",
                    summary: "When Christ's peace governs your heart, it shapes your thoughts, decisions, and relationships.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-8-1",
                            reference: "Colossians 3:15",
                            text: "And let the peace of Christ rule in your hearts, to which indeed you were called in one body; and be thankful.",
                            prayer: "Heavenly Father, Thank You for calling me to live under the peace of Christ instead of being ruled by fear. There are many voices competing for my attention each day, but I want Your voice to be the one that leads my heart. Teach me to pause before reacting, to seek Your wisdom before making decisions, and to allow Your peace to guide me even when life feels uncertain. Help me to choose gratitude over complaint, trust over fear, and faith over anxiety. Let the peace of Christ become the foundation of my thoughts, my relationships, and the choices I make today. As I walk with You, may others see Your peace reflected in my life and be drawn closer to You. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-8-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 9,
                    title: "Lift Up the Weary Heart",
                    chapterReference: "Proverbs 12:25",
                    summary: "God uses encouraging words and His truth to lift hearts weighed down by anxiety.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-9-1",
                            reference: "Proverbs 12:25",
                            text: "Anxiety in the heart of a man weighs it down, But a good word makes it glad.",
                            prayer: "Heavenly Father, You know how heavy my heart can become when anxiety settles deep within me. Thank You for reminding me that Your Word brings hope, strength, and joy to the discouraged soul. Speak Your truth into my heart today, and replace every lie of fear with the certainty of Your promises. Help me not only to receive encouragement from You but also to become someone who encourages others. Let my words reflect Your kindness, my actions reflect Your compassion, and my life point people toward the hope found in Christ. When my heart feels burdened, remind me that Your voice is always stronger than my fears, and Your promises are always faithful. May Your good Word lift my heart today and fill me with renewed joy and confidence. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-9-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 10,
                    title: "Give Your Burdens to the Lord",
                    chapterReference: "Psalm 55:22",
                    summary: "God faithfully sustains those who choose to place every burden into His hands.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-10-1",
                            reference: "Psalm 55:22",
                            text: "Cast thy burden upon the LORD, and He will sustain thee; He will never suffer the righteous to be moved.",
                            prayer: "Heavenly Father, Thank You for inviting me to place every burden into Your hands. You never intended for me to carry life's weight alone. Today I choose to release my fears, my unanswered questions, and every concern that has been stealing my peace. I trust that You are strong enough to carry what I cannot. Sustain me when I feel weak, remind me of Your faithfulness when I grow discouraged, and help me stand firm even when life feels uncertain. Teach me to depend on Your strength instead of my own and to remember that Your promises never fail. As I walk through this day, let my heart rest in the confidence that You are holding me securely. Thank You for being my refuge, my strength, and my constant help in every season. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-10-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 11,
                    title: "Be Strong and Courageous",
                    chapterReference: "Joshua 1:9",
                    summary: "God's constant presence gives us courage to move forward without fear.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-11-1",
                            reference: "Joshua 1:9",
                            text: "Have I not commanded thee? Be strong and courageous! Do not tremble or be dismayed, for the LORD thy God is with thee wherever thou goest.",
                            prayer: "Heavenly Father, Thank You for reminding me that I never walk through life alone. No matter where this day leads or what challenges I face, You have promised to be with me. When fear whispers that I am not strong enough, remind me that my courage comes from Your presence, not my own ability. Help me to step forward in faith instead of shrinking back in fear. Strengthen my heart when uncertainty surrounds me, and fill me with confidence that You are guiding every step I take. Teach me to trust that wherever You lead, Your grace will sustain me and Your presence will never leave me. Today I choose courage, not because I know what tomorrow holds, but because I know the One who holds tomorrow. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-11-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 12,
                    title: "Do Not Fear, I Am With You",
                    chapterReference: "Isaiah 41:10",
                    summary: "God's presence, strength, and help are greater than every fear we face.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-12-1",
                            reference: "Isaiah 41:10",
                            text: "Do not fear, for I am with you; Do not anxiously look about you, for I am your God. I will strengthen you, surely I will help you, Surely I will uphold you with My righteous right hand.",
                            prayer: "Heavenly Father, Thank You for Your promise that I never have to face life alone. When fear tries to overwhelm me or uncertainty causes my heart to tremble, remind me that You are my God, always present, always faithful, and always near. Your strength is greater than my weakness, and Your power is greater than every obstacle before me. Strengthen me when I feel weary, help me when I feel overwhelmed, and uphold me when I feel like I cannot take another step. Teach me to look to You instead of my circumstances and to place my confidence in Your unchanging character. Today I choose to let go of fear because I know You are holding me securely in Your righteous hand. Thank You for being my refuge, my strength, and my faithful Defender. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-12-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 13,
                    title: "Trust Him With All Your Heart",
                    chapterReference: "Proverbs 3:5–6",
                    summary: "Wholehearted trust in the Lord leads to His faithful guidance through every season of life.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-13-1",
                            reference: "Proverbs 3:5–6",
                            text: "Trust in the LORD with all thine heart, And lean not unto thine own understanding. In all thy ways acknowledge Him, And He shall direct thy paths.",
                            prayer: "Heavenly Father, There are times when I want to understand every detail of the road ahead, yet You lovingly call me to trust You instead. Help me to stop leaning on my own understanding and to place my confidence in Your perfect wisdom. Even when I cannot see what lies ahead, I know that You already do. Guide my thoughts, my decisions, and every step I take. Teach me to acknowledge You in every part of my life, not only when I feel uncertain, but also when things are going well. Give me a heart that willingly follows wherever You lead, trusting that Your plans are always good, Your timing is always perfect, and Your love never fails. Today I choose to trust You completely, knowing that You will faithfully direct my path. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-13-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 14,
                    title: "Rest in the Shepherd's Care",
                    chapterReference: "Psalm 23:1–4",
                    summary: "The Lord, our faithful Shepherd, lovingly leads, provides, and remains with us through every season of life.",
                    verses: [
                        PrayerVerse(
                            id: "anxiety-peace-14-1",
                            reference: "Psalm 23:1–4",
                            text: "The LORD is my shepherd, I shall not want. He maketh me lie down in green pastures; He leadeth me beside quiet waters. He restoreth my soul; He guideth me in the paths of righteousness For His name's sake. Even though I walk through the valley of the shadow of death, I fear no evil; for Thou art with me; Thy rod and Thy staff, they comfort me.",
                            prayer: "Heavenly Father, Thank You for being my faithful Shepherd. Throughout this journey, You have reminded me that I do not have to carry my fears alone because You are always leading me with love, wisdom, and compassion. When my heart grows weary, You restore my soul. When I feel uncertain, You guide my steps. When I walk through difficult valleys, Your presence gives me courage and peace. Help me to continue trusting You long after this prayer plan is complete. Teach me to rest in Your care each day, knowing that You will provide what I need, lead me where I should go, and never leave me on my own. Let Your peace remain in my heart, Your truth shape my thoughts, and Your presence be my constant source of hope and confidence. Today I choose to follow You with confidence, knowing that the Good Shepherd is always with me. In Jesus' name, Amen."
                        ),
                        PrayerVerse(
                            id: "anxiety-peace-14-closing",
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

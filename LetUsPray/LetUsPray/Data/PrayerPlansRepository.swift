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
            days: [
                PrayerDay(
                    dayNumber: 1,
                    title: "Giving Thanks in Every Circumstance",
                    chapterReference: "1 Thessalonians 5:18",
                    summary: "True gratitude is not based on perfect circumstances but on God's unchanging goodness and faithfulness.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-1-1",
                            reference: "1 Thessalonians 5:18",
                            text: "In every thing give thanks: for this is God's will for you in Christ Jesus.",
                            prayer: "Heavenly Father, teach me to give thanks in every circumstance, trusting that You are working even when I cannot see it."
                        ),
                        PrayerVerse(
                            id: "gratitude-1-2",
                            reference: "Psalm 107:1",
                            text: "Oh give thanks unto the LORD, for He is good; For His lovingkindness is everlasting.",
                            prayer: "Lord, thank You for Your goodness and Your everlasting lovingkindness. Help me remember Your faithfulness today."
                        ),
                        PrayerVerse(
                            id: "gratitude-1-3",
                            reference: "Colossians 3:17",
                            text: "Whatever you do in word or deed, do all in the name of the Lord Jesus, giving thanks through Him to God the Father.",
                            prayer: "Father, may everything I say and do today reflect a thankful heart that honors You."
                        ),
                        PrayerVerse(
                            id: "gratitude-1-4",
                            reference: "Psalm 100:4",
                            text: "Enter His gates with thanksgiving, And His courts with praise. Give thanks to Him, bless His name.",
                            prayer: "Lord, I enter Your presence with thanksgiving and praise. Fill my heart with joy as I worship You today."
                        ),
                        PrayerVerse(
                            id: "gratitude-1-5",
                            reference: "James 1:17",
                            text: "Every good thing bestowed and every perfect gift is from above, coming down from the Father of lights, with whom there is no variation, or shifting shadow.",
                            prayer: "Father, thank You for every good and perfect gift. Open my eyes to recognize Your blessings each day."
                        ),
                        PrayerVerse(
                            id: "gratitude-1-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Gracious Father, thank You for reminding me today that every good gift comes from You. Help me to cultivate a heart of gratitude that does not depend on my circumstances but rests in Your goodness and faithfulness. May thanksgiving shape my thoughts, my words, and my actions, and may my life bring glory to You in every season. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 2,
                    title: "Every Good Gift Comes From God",
                    chapterReference: "James 1:17",
                    summary: "Recognizing every blessing as a gift from God helps us cultivate a thankful heart and trust His faithful provision.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-2-1",
                            reference: "James 1:17",
                            text: "Every good thing bestowed and every perfect gift is from above, coming down from the Father of lights, with whom there is no variation, or shifting shadow.",
                            prayer: "Father, thank You for every good gift You have placed in my life. Help me never take Your blessings for granted."
                        ),
                        PrayerVerse(
                            id: "gratitude-2-2",
                            reference: "Psalm 103:2",
                            text: "Bless the LORD, O my soul, And forget none of His benefits;",
                            prayer: "Lord, remind me to remember Your faithfulness and the countless ways You have cared for me."
                        ),
                        PrayerVerse(
                            id: "gratitude-2-3",
                            reference: "Deuteronomy 8:18",
                            text: "But thou shalt remember the LORD thy God, for it is He who is giving thee power to make wealth...",
                            prayer: "Father, help me remember that every ability, opportunity, and blessing comes from Your gracious hand."
                        ),
                        PrayerVerse(
                            id: "gratitude-2-4",
                            reference: "Philippians 4:19",
                            text: "And my God shall supply all your needs according to His riches in glory in Christ Jesus.",
                            prayer: "Lord, thank You for faithfully providing everything I truly need according to Your perfect wisdom."
                        ),
                        PrayerVerse(
                            id: "gratitude-2-5",
                            reference: "Psalm 136:1",
                            text: "Give thanks unto the LORD; for He is good; For His lovingkindness is everlasting.",
                            prayer: "Thank You, Lord, because Your goodness and Your everlasting love never fail."
                        ),
                        PrayerVerse(
                            id: "gratitude-2-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Gracious Father, thank You for every blessing You have poured into my life. Teach me to recognize Your hand in both the ordinary and extraordinary moments of each day. May I never forget that every good gift comes from You, and may my gratitude deepen my trust, strengthen my faith, and draw me closer to Your heart. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 3,
                    title: "A Thankful Heart Changes Everything",
                    chapterReference: "Colossians 3:15",
                    summary: "Gratitude transforms the heart by replacing worry, pride, and discouragement with peace, joy, and trust in God.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-3-1",
                            reference: "Colossians 3:15",
                            text: "And let the peace of Christ rule in your hearts, to which indeed you were called in one body; and be thankful.",
                            prayer: "Father, let the peace of Christ rule my heart today and shape my thoughts with gratitude instead of worry."
                        ),
                        PrayerVerse(
                            id: "gratitude-3-2",
                            reference: "Psalm 28:7",
                            text: "The LORD is my strength and my shield; My heart trusts in Him, and I am helped; Therefore my heart exults, And with my song I shall thank Him.",
                            prayer: "Lord, remind me that Your strength is enough for every challenge, and let gratitude overflow from my trust in You."
                        ),
                        PrayerVerse(
                            id: "gratitude-3-3",
                            reference: "Ephesians 5:20",
                            text: "Always giving thanks for all things in the name of our Lord Jesus Christ to God, even the Father;",
                            prayer: "Teach me to cultivate a thankful heart in every season, recognizing Your faithfulness in both joyful and difficult moments."
                        ),
                        PrayerVerse(
                            id: "gratitude-3-4",
                            reference: "Hebrews 12:28",
                            text: "Therefore, since we receive a kingdom which cannot be shaken, let us show gratitude, by which we may offer to God an acceptable service with reverence and awe;",
                            prayer: "Gracious God, help my gratitude become an act of worship that honors You with reverence and joy."
                        ),
                        PrayerVerse(
                            id: "gratitude-3-5",
                            reference: "Psalm 9:1",
                            text: "I will give thanks to the LORD with all my heart; I will tell of all Thy wonders.",
                            prayer: "Open my heart to remember Your wonderful works so that thanksgiving becomes my natural response each day."
                        ),
                        PrayerVerse(
                            id: "gratitude-3-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, thank You for showing me that gratitude is more than words—it is the posture of a heart that trusts You. Let thankfulness shape the way I think, speak, worship, and serve. As I remember Your faithfulness, may my heart be filled with peace, my life reflect Your goodness, and my words encourage others to glorify You. Keep my eyes fixed on Your unchanging love so that gratitude becomes a daily way of life. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 4,
                    title: "Remember God's Faithfulness",
                    chapterReference: "Lamentations 3:22–23",
                    summary: "Looking back on God's faithfulness reminds us that His mercy is new every morning and gives us confidence for today.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-4-1",
                            reference: "Lamentations 3:22–23",
                            text: "The LORD'S lovingkindnesses indeed never cease, For His compassions never fail. They are new every morning; Great is Thy faithfulness.",
                            prayer: "Faithful Father, thank You that Your mercy meets me every new morning with fresh hope and grace."
                        ),
                        PrayerVerse(
                            id: "gratitude-4-2",
                            reference: "Deuteronomy 7:9",
                            text: "Know therefore that the LORD thy God, He is God, the faithful God, who keepeth His covenant and His lovingkindness to a thousandth generation with those who love Him and keep His commandments;",
                            prayer: "Lord, help me remember that Your promises never fail and that Your faithfulness extends through every generation."
                        ),
                        PrayerVerse(
                            id: "gratitude-4-3",
                            reference: "Psalm 77:11",
                            text: "I shall remember the deeds of the LORD; Surely I will remember Thy wonders of old.",
                            prayer: "Bring to my mind the many ways You have worked in my life so that remembrance leads me to grateful worship."
                        ),
                        PrayerVerse(
                            id: "gratitude-4-4",
                            reference: "1 Chronicles 16:34",
                            text: "O give thanks to the LORD, for He is good; For His lovingkindness is everlasting.",
                            prayer: "Father, let my gratitude be rooted in Your unchanging goodness and everlasting love."
                        ),
                        PrayerVerse(
                            id: "gratitude-4-5",
                            reference: "Hebrews 10:23",
                            text: "Let us hold fast the confession of our hope without wavering, for He who promised is faithful;",
                            prayer: "Strengthen my confidence to trust You completely because You are always faithful to every promise You have made."
                        ),
                        PrayerVerse(
                            id: "gratitude-4-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, thank You for Your unfailing faithfulness throughout every season of my life. When I remember how You have provided, guided, forgiven, and sustained me, my heart cannot help but give thanks. Help me never forget Your goodness or doubt Your promises. May the memory of Your faithfulness strengthen my trust today and give me hope for tomorrow. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 5,
                    title: "Praise Before the Answer",
                    chapterReference: "Habakkuk 3:17–18",
                    summary: "Faith-filled gratitude chooses to praise God for who He is, even before circumstances change.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-5-1",
                            reference: "Habakkuk 3:17–18",
                            text: "Though the fig tree should not blossom, And there be no fruit on the vines... Yet I will exult in the LORD, I will rejoice in the God of my salvation.",
                            prayer: "Father, help me choose worship even when I cannot yet see the answer to my prayers."
                        ),
                        PrayerVerse(
                            id: "gratitude-5-2",
                            reference: "Romans 8:28",
                            text: "And we know that God causes all things to work together for good to those who love God, to those who are called according to His purpose.",
                            prayer: "Teach me to trust that You are working for my good, even when I cannot understand what You are doing."
                        ),
                        PrayerVerse(
                            id: "gratitude-5-3",
                            reference: "Psalm 34:1",
                            text: "I will bless the LORD at all times; His praise shall continually be in my mouth.",
                            prayer: "May praise become my daily response, no matter what circumstances I face."
                        ),
                        PrayerVerse(
                            id: "gratitude-5-4",
                            reference: "Hebrews 13:15",
                            text: "Through Him then, let us continually offer up a sacrifice of praise to God, that is, the fruit of lips that give thanks to His name.",
                            prayer: "Lord, receive my praise as an offering of love and gratitude from a trusting heart."
                        ),
                        PrayerVerse(
                            id: "gratitude-5-5",
                            reference: "Isaiah 12:2",
                            text: "Behold, God is my salvation, I will trust and not be afraid; For the LORD GOD is my strength and song, And He has become my salvation.",
                            prayer: "Strengthen my faith so that trust becomes greater than fear and gratitude becomes stronger than doubt."
                        ),
                        PrayerVerse(
                            id: "gratitude-5-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, today I choose to praise You not only for what You have done but for who You are. Even when I cannot see the outcome, I know You remain faithful, loving, and worthy of my trust. Fill my heart with confident gratitude that rests in Your character rather than my circumstances. May my worship declare that You are good in every season, and may my faith continue to grow as I wait upon You. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 6,
                    title: "Gratitude Instead of Worry",
                    chapterReference: "Philippians 4:6–7",
                    summary: "Thanksgiving shifts our focus from our worries to God's faithful care, allowing His peace to guard our hearts.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-6-1",
                            reference: "Philippians 4:6–7",
                            text: "Be anxious for nothing, but in everything by prayer and supplication with thanksgiving let your requests be made known to God. And the peace of God, which surpasses all comprehension, shall guard your hearts and your minds in Christ Jesus.",
                            prayer: "Father, replace my anxious thoughts with thankful prayers that rest confidently in Your faithful care."
                        ),
                        PrayerVerse(
                            id: "gratitude-6-2",
                            reference: "Psalm 56:3–4",
                            text: "When I am afraid, I will put my trust in Thee. In God, whose word I praise, In God I have put my trust; I shall not be afraid.",
                            prayer: "Lord, when fear rises within me, help me choose trust and praise instead of worry."
                        ),
                        PrayerVerse(
                            id: "gratitude-6-3",
                            reference: "Colossians 4:2",
                            text: "Devote yourselves to prayer, keeping alert in it with an attitude of thanksgiving;",
                            prayer: "Teach me to make gratitude a regular part of my prayers and my daily walk with You."
                        ),
                        PrayerVerse(
                            id: "gratitude-6-4",
                            reference: "Isaiah 26:3",
                            text: "The steadfast of mind Thou wilt keep in perfect peace, Because he trusts in Thee.",
                            prayer: "Keep my mind fixed on You so that Your perfect peace fills my heart each day."
                        ),
                        PrayerVerse(
                            id: "gratitude-6-5",
                            reference: "Psalm 118:24",
                            text: "This is the day which the LORD has made; Let us rejoice and be glad in it.",
                            prayer: "Help me rejoice in the gift of today and receive it with gratitude, no matter what it brings."
                        ),
                        PrayerVerse(
                            id: "gratitude-6-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, thank You for inviting me to bring every care to You with a thankful heart. Instead of allowing worry to control my thoughts, teach me to trust in Your promises and rest in Your peace. Fill my heart with gratitude that overcomes fear, and help me recognize Your faithfulness in every circumstance. May thanksgiving become my response because I know You are always with me and always working for my good. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 7,
                    title: "Rejoice Always",
                    chapterReference: "Philippians 4:4",
                    summary: "Joy grows in a heart that continually rejoices in the Lord, regardless of changing circumstances.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-7-1",
                            reference: "Philippians 4:4",
                            text: "Rejoice in the Lord always; again I will say, rejoice!",
                            prayer: "Father, teach me to find my joy in You, no matter what today brings."
                        ),
                        PrayerVerse(
                            id: "gratitude-7-2",
                            reference: "Nehemiah 8:10",
                            text: "Do not be grieved, for the joy of the LORD is your strength.",
                            prayer: "Lord, let Your joy become my strength when I feel weak or discouraged."
                        ),
                        PrayerVerse(
                            id: "gratitude-7-3",
                            reference: "Psalm 16:11",
                            text: "In Thy presence is fullness of joy; In Thy right hand there are pleasures forever.",
                            prayer: "Draw me close to You, where true joy is found in Your presence."
                        ),
                        PrayerVerse(
                            id: "gratitude-7-4",
                            reference: "Romans 15:13",
                            text: "Now may the God of hope fill you with all joy and peace in believing...",
                            prayer: "Fill my heart with lasting joy and confident hope as I continue trusting in You."
                        ),
                        PrayerVerse(
                            id: "gratitude-7-5",
                            reference: "Psalm 126:3",
                            text: "The LORD has done great things for us; We are glad.",
                            prayer: "Open my eyes to remember the great things You have done so my heart overflows with joyful gratitude."
                        ),
                        PrayerVerse(
                            id: "gratitude-7-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, thank You for the joy that comes from knowing You. Let my gratitude become more than an occasional response—make it the attitude of my heart each day. When circumstances change, remind me that my joy is rooted in Your unchanging character and Your faithful promises. Fill my life with hope, peace, and gladness as I continue walking closely with You. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 8,
                    title: "Worship With Thanksgiving",
                    chapterReference: "Psalm 95:2",
                    summary: "Gratitude naturally overflows into worship as we remember God's greatness, goodness, and faithfulness.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-8-1",
                            reference: "Psalm 95:2",
                            text: "Let us come before His presence with thanksgiving, Let us shout joyfully to Him with psalms.",
                            prayer: "Father, let my gratitude lead me into joyful worship as I come into Your presence today."
                        ),
                        PrayerVerse(
                            id: "gratitude-8-2",
                            reference: "Psalm 96:1–2",
                            text: "Sing to the LORD a new song; Sing to the LORD, all the earth. Sing to the LORD, bless His name; Proclaim good tidings of His salvation from day to day.",
                            prayer: "Place a song of praise in my heart so that my life continually declares Your goodness."
                        ),
                        PrayerVerse(
                            id: "gratitude-8-3",
                            reference: "Hebrews 13:15",
                            text: "Through Him then, let us continually offer up a sacrifice of praise to God, that is, the fruit of lips that give thanks to His name.",
                            prayer: "Receive my praise today as an offering of gratitude flowing from a sincere heart."
                        ),
                        PrayerVerse(
                            id: "gratitude-8-4",
                            reference: "Psalm 150:6",
                            text: "Let everything that has breath praise the LORD. Praise the LORD!",
                            prayer: "May every part of my life reflect praise to You, for You alone are worthy of worship."
                        ),
                        PrayerVerse(
                            id: "gratitude-8-5",
                            reference: "Revelation 7:12",
                            text: "Amen, blessing and glory and wisdom and thanksgiving and honor and power and might, be to our God forever and ever. Amen.",
                            prayer: "Lift my eyes beyond today and remind me that all glory and thanksgiving belong to You forever."
                        ),
                        PrayerVerse(
                            id: "gratitude-8-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, thank You for inviting me into Your presence with thanksgiving and praise. As I remember who You are and all that You have done, may worship become the natural response of my heart. Let my gratitude be expressed not only through my words but also through the way I live, serve, and love others. May my life bring honor and glory to Your holy name. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 9,
                    title: "Grateful for God's Mercy",
                    chapterReference: "Psalm 103:8",
                    summary: "God's mercy reminds us that we receive far more grace than we deserve, leading us to a life of humble gratitude.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-9-1",
                            reference: "Psalm 103:8",
                            text: "The LORD is compassionate and gracious, Slow to anger and abounding in lovingkindness.",
                            prayer: "Father, thank You for meeting me with compassion and mercy each day instead of giving me what I deserve."
                        ),
                        PrayerVerse(
                            id: "gratitude-9-2",
                            reference: "Lamentations 3:22–23",
                            text: "The LORD'S lovingkindnesses indeed never cease, For His compassions never fail. They are new every morning; Great is Thy faithfulness.",
                            prayer: "Thank You for renewing Your mercy every morning and faithfully walking with me each day."
                        ),
                        PrayerVerse(
                            id: "gratitude-9-3",
                            reference: "Ephesians 2:4–5",
                            text: "But God, being rich in mercy, because of His great love with which He loved us, even when we were dead in our transgressions, made us alive together with Christ...",
                            prayer: "Lord, I am grateful that Your mercy has given me new life through Jesus Christ."
                        ),
                        PrayerVerse(
                            id: "gratitude-9-4",
                            reference: "Micah 7:18",
                            text: "Who is a God like Thee, who pardons iniquity... He does not retain His anger forever, Because He delights in unchanging love.",
                            prayer: "Thank You for delighting in forgiveness and extending Your steadfast love to me."
                        ),
                        PrayerVerse(
                            id: "gratitude-9-5",
                            reference: "Hebrews 4:16",
                            text: "Let us therefore draw near with confidence to the throne of grace, that we may receive mercy and may find grace to help in time of need.",
                            prayer: "Help me come confidently into Your presence, knowing that You freely offer mercy and grace."
                        ),
                        PrayerVerse(
                            id: "gratitude-9-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Merciful Father, thank You for loving me with a compassion that never fails. Your mercy has forgiven my sins, restored my hope, and welcomed me into Your family through Jesus Christ. Keep me humble as I remember the grace I have received, and help me extend that same mercy to others. May gratitude for Your compassion shape the way I live each day. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                ),
                PrayerDay(
                    dayNumber: 10,
                    title: "Thankful for Salvation",
                    chapterReference: "Ephesians 2:8–9",
                    summary: "Our greatest reason for gratitude is the gift of salvation, freely given through God's grace in Jesus Christ.",
                    verses: [
                        PrayerVerse(
                            id: "gratitude-10-1",
                            reference: "Ephesians 2:8–9",
                            text: "For by grace you have been saved through faith; and that not of yourselves, it is the gift of God; not as a result of works, that no one should boast.",
                            prayer: "Father, thank You that salvation is Your gracious gift and not something I could ever earn."
                        ),
                        PrayerVerse(
                            id: "gratitude-10-2",
                            reference: "John 3:16",
                            text: "For God so loved the world, that He gave His only begotten Son, that whoever believes in Him should not perish, but have eternal life.",
                            prayer: "Thank You for loving me so deeply that You gave Your Son so I could have eternal life."
                        ),
                        PrayerVerse(
                            id: "gratitude-10-3",
                            reference: "Romans 5:8",
                            text: "But God demonstrates His own love toward us, in that while we were yet sinners, Christ died for us.",
                            prayer: "Lord Jesus, thank You for laying down Your life for me while I was still a sinner."
                        ),
                        PrayerVerse(
                            id: "gratitude-10-4",
                            reference: "Colossians 1:13–14",
                            text: "For He delivered us from the domain of darkness, and transferred us to the kingdom of His beloved Son, in whom we have redemption, the forgiveness of sins.",
                            prayer: "Thank You for rescuing me from darkness and giving me redemption and forgiveness through Christ."
                        ),
                        PrayerVerse(
                            id: "gratitude-10-5",
                            reference: "Titus 3:5",
                            text: "He saved us, not on the basis of deeds which we have done in righteousness, but according to His mercy...",
                            prayer: "Keep me humble and grateful, remembering that Your mercy alone has brought me new life."
                        ),
                        PrayerVerse(
                            id: "gratitude-10-closing",
                            reference: "Closing",
                            text: "In Jesus' name, Amen. 🙏🏻",
                            prayer: "Heavenly Father, thank You for the greatest gift I have ever received—salvation through Jesus Christ. Thank You for Your grace, Your mercy, and Your unfailing love that reached me when I could not save myself. Help me never lose the wonder of the cross or take Your forgiveness for granted. Let gratitude for my salvation shape every part of my life, filling me with humility, joy, and a desire to share Your love with others. In Jesus' name, Amen. 🙏🏻"
                        )
                    ]
                )
            ]
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

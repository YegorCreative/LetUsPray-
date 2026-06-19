import Foundation

enum PsalmsPrayerData {
    // Collection 1: Psalms 1-15
    static let collection1 = PrayerPlan(
        id: "psalms-1-15",
        title: "Psalms 1-15",
        subtitle: "Foundation of blessing, trust, and refuge",
        description: "Begin your Psalms journey with prayers for wisdom, protection, and trust in God's sovereignty.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms1to15
    )
    
    // Collection 2: Psalms 16-30
    static let collection2 = PrayerPlan(
        id: "psalms-16-30",
        title: "Psalms 16-30",
        subtitle: "Songs of deliverance and praise",
        description: "Pray through psalms of joy, thanksgiving, and God's mighty deliverance.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms16to30
    )
    
    // Collection 3: Psalms 31-45
    static let collection3 = PrayerPlan(
        id: "psalms-31-45",
        title: "Psalms 31-45",
        subtitle: "Refuge in times of distress",
        description: "Find comfort and strength through prayers of trust, confession, and longing for God.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms31to45
    )
    
    // Collection 4: Psalms 46-60
    static let collection4 = PrayerPlan(
        id: "psalms-46-60",
        title: "Psalms 46-60",
        subtitle: "God our fortress and strength",
        description: "Pray with confidence in God's power, mercy, and steadfast presence.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms46to60
    )
    
    // Collection 5: Psalms 61-75
    static let collection5 = PrayerPlan(
        id: "psalms-61-75",
        title: "Psalms 61-75",
        subtitle: "Rest and worship in God alone",
        description: "Encounter prayers of rest, gratitude, and awe of God's majesty.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms61to75
    )
    
    // Collection 6: Psalms 76-90
    static let collection6 = PrayerPlan(
        id: "psalms-76-90",
        title: "Psalms 76-90",
        subtitle: "God's faithfulness through generations",
        description: "Pray through remembrance of God's deeds and trust in His eternal nature.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms76to90
    )
    
    // Collection 7: Psalms 91-105
    static let collection7 = PrayerPlan(
        id: "psalms-91-105",
        title: "Psalms 91-105",
        subtitle: "The Lord reigns in majesty",
        description: "Worship God's sovereign rule with prayers of praise and thanksgiving.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms91to105
    )
    
    // Collection 8: Psalms 106-120
    static let collection8 = PrayerPlan(
        id: "psalms-106-120",
        title: "Psalms 106-120",
        subtitle: "Songs of confession and ascent",
        description: "Pray through repentance and pilgrimage prayers ascending to God's presence.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms106to120
    )
    
    // Collection 9: Psalms 121-135
    static let collection9 = PrayerPlan(
        id: "psalms-121-135",
        title: "Psalms 121-135",
        subtitle: "Trust, unity, and God's enduring love",
        description: "Encounter prayers of protection, blessing, and celebration of God's faithfulness.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms121to135
    )
    
    // Collection 10: Psalms 136-150
    static let collection10 = PrayerPlan(
        id: "psalms-136-150",
        title: "Psalms 136-150",
        subtitle: "Climax of praise and worship",
        description: "Conclude your Psalms journey with resounding praise to the Creator.",
        category: .psalms,
        durationDays: 15,
        accentColorName: "psalms",
        coverIcon: "music.note.list",
        days: psalms136to150
    )
    
    static let allCollections: [PrayerPlan] = [
        collection1, collection2, collection3, collection4, collection5,
        collection6, collection7, collection8, collection9, collection10
    ]
    
    // Legacy single plan (for backward compatibility)
    static let plan = collection1
    
    // MARK: - Psalms 1-15
    private static let psalms1to15: [PrayerDay] = [
        // Book I: Psalms 1-15
        PrayerDay(
            dayNumber: 1,
            title: "Blessed is the One",
            chapterReference: "Psalm 1",
            summary: "Pray for delight in God's Word and fruitfulness in life.",
            verses: [
                PrayerVerse(
                    id: "psalm-1-1",
                    reference: "Psalm 1:1",
                    text: "How blessed is the man who does not walk in the counsel of the wicked,\n  Nor stand in the path of sinners,\n  Nor sit in the seat of scoffers!",
                    prayer: "Lord, keep me from walking in the counsel of the wicked. Guard my heart from voices, habits, and influences that pull me away from You. Teach me to choose Your path with wisdom and courage."
                ),
                PrayerVerse(
                    id: "psalm-1-2",
                    reference: "Psalm 1:2",
                    text: "But his delight is in the law of the Lord,\n  And in His law he meditates day and night.",
                    prayer: "Father, give me delight in Your Word. Let Scripture become the place where my soul finds direction, comfort, correction, and joy. Help me meditate on Your truth day and night."
                ),
                PrayerVerse(
                    id: "psalm-1-3",
                    reference: "Psalm 1:3",
                    text: "He will be like a tree firmly planted by streams of water,\n  Which yields its fruit in its season\n  And its leaf does not wither;\n  And in whatever he does, he prospers.",
                    prayer: "Lord, make my life like a tree planted by streams of water. Let my roots grow deep in You, and let my life bear fruit in the right season. Strengthen me so I do not wither when life feels dry or difficult."
                ),
                PrayerVerse(
                    id: "psalm-1-4",
                    reference: "Psalm 1:4",
                    text: "The wicked are not so,\n  But they are like chaff which the wind drives away.",
                    prayer: "Father, do not let my life become empty or unstable like chaff blown by the wind. Anchor me in righteousness, humility, and obedience so I am not carried away by temptation or pride."
                ),
                PrayerVerse(
                    id: "psalm-1-5",
                    reference: "Psalm 1:5",
                    text: "Therefore the wicked will not stand in the judgment,\n  Nor sinners in the assembly of the righteous.",
                    prayer: "Lord, prepare me to stand before You with a clean heart. Lead me away from sin and into the gathering of the righteous. Let my life reflect that I belong to You."
                ),
                PrayerVerse(
                    id: "psalm-1-6",
                    reference: "Psalm 1:6",
                    text: "For the Lord knows the way of the righteous,\n  But the way of the wicked will perish.",
                    prayer: "Father, thank You that You know the way of the righteous. Guide my steps, protect my path, and keep me close to You. Let my life follow the way that leads to blessing, peace, and eternal life."
                ),
                PrayerVerse(
                    id: "psalm-1-closing",
                    reference: "Closing",
                    text: "Lord, let Psalm 1 become the foundation of my walk with You. Teach me to reject what leads me away from You and delight in what brings me closer to You. Plant me deeply in Your Word, make my life fruitful, and keep my path steady in Your presence.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 2,
            title: "The Lord's Anointed",
            chapterReference: "Psalm 2",
            summary: "Pray for submission to God's sovereignty and trust in His Son.",
            verses: [
                PrayerVerse(
                    id: "psalm-2-1",
                    reference: "Psalm 2:1",
                    text: "Why are the nations in an uproar\n  And the peoples devising a vain thing?",
                    prayer: "Lord, when the world rebels against You and follows its own ways, help me remain faithful. Keep my heart focused on Your truth rather than the confusion and pride around me."
                ),
                PrayerVerse(
                    id: "psalm-2-2",
                    reference: "Psalm 2:2",
                    text: "The kings of the earth take their stand\n  And the rulers take counsel together\n  Against the Lord and against His Anointed, saying,",
                    prayer: "Father, even when leaders and people oppose Your will, remind me that Your authority stands forever. Help me trust Your kingdom above every earthly power."
                ),
                PrayerVerse(
                    id: "psalm-2-3",
                    reference: "Psalm 2:3",
                    text: "\"Let us tear their fetters apart\n  And cast away their cords from us!\"",
                    prayer: "Lord, protect me from the temptation to resist Your guidance. Teach me to see Your commands not as burdens, but as loving direction that leads to freedom and life."
                ),
                PrayerVerse(
                    id: "psalm-2-4",
                    reference: "Psalm 2:4",
                    text: "He who sits in the heavens laughs,\n  The Lord scoffs at them.",
                    prayer: "Father, thank You that nothing surprises You. When circumstances seem out of control, help me remember that You remain seated on the throne, sovereign over all things."
                ),
                PrayerVerse(
                    id: "psalm-2-5",
                    reference: "Psalm 2:5",
                    text: "Then He will speak to them in His anger\n  And terrify them in His fury, saying,",
                    prayer: "Lord, give me a healthy reverence for Your holiness. Help me take Your Word seriously and live in a way that honors and pleases You."
                ),
                PrayerVerse(
                    id: "psalm-2-6",
                    reference: "Psalm 2:6",
                    text: "\"But as for Me, I have installed My King\n  Upon Zion, My holy mountain.\"",
                    prayer: "Father, thank You for establishing Your King. Help me willingly submit my life to Your rule and trust the plans You have ordained from the beginning."
                ),
                PrayerVerse(
                    id: "psalm-2-7",
                    reference: "Psalm 2:7",
                    text: "\"I will surely tell of the decree of the Lord:\n  He said to Me, 'You are My Son,\n  Today I have begotten You.\"",
                    prayer: "Lord Jesus, thank You for being the Son of God. Strengthen my faith in You and help me live as Your disciple, following You with love, obedience, and devotion."
                ),
                PrayerVerse(
                    id: "psalm-2-8",
                    reference: "Psalm 2:8",
                    text: "Ask of Me, and I will surely give the nations as Your inheritance,\n  And the very ends of the earth as Your possession.",
                    prayer: "Father, thank You that all nations belong to You. Let Your kingdom grow throughout the earth, and help me be a faithful witness wherever You place me."
                ),
                PrayerVerse(
                    id: "psalm-2-9",
                    reference: "Psalm 2:9",
                    text: "You shall break them with a rod of iron,\n  You shall shatter them like earthenware.'",
                    prayer: "Lord, remind me of Your power and justice. Help me walk humbly before You, knowing that You alone are the righteous Judge over all creation."
                ),
                PrayerVerse(
                    id: "psalm-2-10",
                    reference: "Psalm 2:10",
                    text: "Now therefore, O kings, show discernment;\n  Take warning, O judges of the earth.",
                    prayer: "Father, grant me wisdom. Help me make decisions that honor You and reflect the truth of Your Word in every area of my life."
                ),
                PrayerVerse(
                    id: "psalm-2-11",
                    reference: "Psalm 2:11",
                    text: "Worship the Lord with reverence\n  And rejoice with trembling.",
                    prayer: "Lord, teach me to serve You with reverence and joy. Let my worship be sincere, my obedience wholehearted, and my heart filled with gratitude."
                ),
                PrayerVerse(
                    id: "psalm-2-12",
                    reference: "Psalm 2:12",
                    text: "Do homage to the Son, that He not become angry, and you perish in the way,\n  For His wrath may soon be kindled.\n  How blessed are all who take refuge in Him!",
                    prayer: "Father, I place my trust in Your Son. Thank You for the refuge, mercy, and salvation found in Jesus Christ. Keep me close to Him and strengthen my confidence in His unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-2-closing",
                    reference: "Closing",
                    text: "Lord, thank You for reminding me that You reign over every nation, every ruler, and every circumstance. Help me walk in wisdom, humility, and obedience before You. May I trust fully in Jesus, serve You with joy, and find my refuge in Your eternal kingdom.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Shield Around Me",
            chapterReference: "Psalm 3",
            summary: "Pray for peace and protection in times of trouble.",
            verses: [
                PrayerVerse(
                    id: "psalm-3-1",
                    reference: "Psalm 3:1",
                    text: "O Lord, how my adversaries have increased!\n  Many are rising up against me.",
                    prayer: "Lord, when troubles increase around me and opposition rises against me, help me remember that You are greater than every challenge I face."
                ),
                PrayerVerse(
                    id: "psalm-3-2",
                    reference: "Psalm 3:2",
                    text: "Many are saying of my soul,\n  \"There is no deliverance for him in God.\" Selah.",
                    prayer: "Father, when others doubt, criticize, or question Your work in my life, help me place my confidence in You rather than the opinions of people."
                ),
                PrayerVerse(
                    id: "psalm-3-3",
                    reference: "Psalm 3:3",
                    text: "But You, O Lord, are a shield about me,\n  My glory, and the One who lifts my head.",
                    prayer: "Lord, thank You for being my shield and protector. You are my glory and the One who lifts my head when I feel discouraged, defeated, or weary."
                ),
                PrayerVerse(
                    id: "psalm-3-4",
                    reference: "Psalm 3:4",
                    text: "I was crying to the Lord with my voice,\n  And He answered me from His holy mountain. Selah.",
                    prayer: "Father, thank You for hearing my prayers. Give me confidence that when I call upon You, You listen and respond according to Your perfect will."
                ),
                PrayerVerse(
                    id: "psalm-3-5",
                    reference: "Psalm 3:5",
                    text: "I lay down and slept;\n  I awoke, for the Lord sustains me.",
                    prayer: "Lord, thank You for the peace that comes from trusting You. Help me rest without fear, knowing that You watch over me day and night."
                ),
                PrayerVerse(
                    id: "psalm-3-6",
                    reference: "Psalm 3:6",
                    text: "I will not be afraid of ten thousands of people\n  Who have set themselves against me round about.",
                    prayer: "Father, remove fear from my heart. Even when difficulties surround me on every side, help me stand firm in faith and trust Your protection."
                ),
                PrayerVerse(
                    id: "psalm-3-7",
                    reference: "Psalm 3:7",
                    text: "Arise, O Lord; save me, O my God!\n  For You have smitten all my enemies on the cheek;\n  You have shattered the teeth of the wicked.",
                    prayer: "Lord, arise and deliver me from every battle I cannot fight alone. Be my defender, my strength, and my source of victory in every season."
                ),
                PrayerVerse(
                    id: "psalm-3-8",
                    reference: "Psalm 3:8",
                    text: "Salvation belongs to the Lord;\n  Your blessing be upon Your people! Selah.",
                    prayer: "Father, salvation belongs to You alone. Thank You for Your blessing, mercy, and faithfulness. Let Your favor rest upon my life and help me walk confidently in Your care."
                ),
                PrayerVerse(
                    id: "psalm-3-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my shield, my protector, and my source of peace. When challenges come, help me trust in Your power rather than my fears. Remind me that You hear my prayers, sustain me through every trial, and provide the victory that only You can give.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Answer When I Call",
            chapterReference: "Psalm 4",
            summary: "Pray for confidence in God's faithfulness.",
            verses: [
                PrayerVerse(
                    id: "psalm-4-1",
                    reference: "Psalm 4:1",
                    text: "Answer me when I call, O God of my righteousness!\n  You have relieved me in my distress;\n  Be gracious to me and hear my prayer.",
                    prayer: "Lord, when I call to You, hear my prayer. In times of trouble and distress, remind me that You are my righteousness and my source of mercy."
                ),
                PrayerVerse(
                    id: "psalm-4-2",
                    reference: "Psalm 4:2",
                    text: "O sons of men, how long will my honor become a reproach?\n  How long will you love what is worthless and aim at deception? Selah.",
                    prayer: "Father, keep me from pursuing empty things that have no eternal value. Help me seek truth, purpose, and a life that honors You."
                ),
                PrayerVerse(
                    id: "psalm-4-3",
                    reference: "Psalm 4:3",
                    text: "But know that the Lord has set apart the godly man for Himself;\n  The Lord hears when I call to Him.",
                    prayer: "Lord, thank You for setting apart those who belong to You. Help me live as Your child and trust that You hear me whenever I call upon You."
                ),
                PrayerVerse(
                    id: "psalm-4-4",
                    reference: "Psalm 4:4",
                    text: "Tremble, and do not sin;\n  Meditate in your heart upon your bed, and be still. Selah.",
                    prayer: "Father, teach me to respond to challenges without sin. Search my heart, quiet my thoughts, and help me rest in Your wisdom."
                ),
                PrayerVerse(
                    id: "psalm-4-5",
                    reference: "Psalm 4:5",
                    text: "Offer the sacrifices of righteousness,\n  And trust in the Lord.",
                    prayer: "Lord, let my worship be sincere and pleasing to You. Help me place my trust fully in You and offer my life as a living sacrifice of praise."
                ),
                PrayerVerse(
                    id: "psalm-4-6",
                    reference: "Psalm 4:6",
                    text: "Many are saying, \"Who will show us any good?\"\n  Lift up the light of Your countenance upon us, O Lord!",
                    prayer: "Father, when I am tempted to seek happiness in worldly things, remind me that true blessing comes from Your presence and favor."
                ),
                PrayerVerse(
                    id: "psalm-4-7",
                    reference: "Psalm 4:7",
                    text: "You have put gladness in my heart,\n  More than when their grain and new wine abound.",
                    prayer: "Lord, fill my heart with joy that surpasses every earthly success or possession. Let Your peace and gladness overflow within me."
                ),
                PrayerVerse(
                    id: "psalm-4-8",
                    reference: "Psalm 4:8",
                    text: "In peace I will both lie down and sleep,\n  For You alone, O Lord, make me to dwell in safety.",
                    prayer: "Father, thank You for the security found in You alone. Help me lie down and sleep in peace, knowing that You watch over me and keep me safe."
                ),
                PrayerVerse(
                    id: "psalm-4-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing my prayers and surrounding me with Your peace. Help me trust You more deeply, seek Your presence above all else, and rest securely in Your care. Fill my heart with lasting joy and teach me to walk faithfully with You each day.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Morning Prayer",
            chapterReference: "Psalm 5",
            summary: "Pray for guidance and protection at the start of each day.",
            verses: [
                PrayerVerse(
                    id: "psalm-5-1",
                    reference: "Psalm 5:1",
                    text: "Give ear to my words, O Lord,\n  Consider my groaning.",
                    prayer: "Lord, hear my words and understand the cries of my heart. Even when I struggle to express myself, You know every thought and concern I bring before You."
                ),
                PrayerVerse(
                    id: "psalm-5-2",
                    reference: "Psalm 5:2",
                    text: "Heed the sound of my cry for help, my King and my God,\n  For to You I pray.",
                    prayer: "Father, I lift my voice to You, my King and my God. Thank You that I can come boldly into Your presence with every prayer and request."
                ),
                PrayerVerse(
                    id: "psalm-5-3",
                    reference: "Psalm 5:3",
                    text: "In the morning, O Lord, You will hear my voice;\n  In the morning I will order my prayer to You and eagerly watch.",
                    prayer: "Lord, help me begin each day seeking You first. Let my morning be filled with prayer, expectation, and confidence that You are at work in my life."
                ),
                PrayerVerse(
                    id: "psalm-5-4",
                    reference: "Psalm 5:4",
                    text: "For You are not a God who takes pleasure in wickedness;\n  No evil dwells with You.",
                    prayer: "Father, You are holy and righteous. Keep me from sin and help me live in a way that reflects Your goodness and purity."
                ),
                PrayerVerse(
                    id: "psalm-5-5",
                    reference: "Psalm 5:5",
                    text: "The boastful shall not stand before Your eyes;\n  You hate all who do iniquity.",
                    prayer: "Lord, protect me from pride and arrogance. Teach me humility and a heart that seeks to honor You above all else."
                ),
                PrayerVerse(
                    id: "psalm-5-6",
                    reference: "Psalm 5:6",
                    text: "You destroy those who speak falsehood;\n  The Lord abhors the man of bloodshed and deceit.",
                    prayer: "Father, help me walk in truth and integrity. Let my words and actions reflect honesty, faithfulness, and love."
                ),
                PrayerVerse(
                    id: "psalm-5-7",
                    reference: "Psalm 5:7",
                    text: "But as for me, by Your abundant lovingkindness I will enter Your house,\n  At Your holy temple I will bow in reverence for You.",
                    prayer: "Lord, thank You for Your abundant lovingkindness. Because of Your mercy, I can come into Your presence with reverence, gratitude, and worship."
                ),
                PrayerVerse(
                    id: "psalm-5-8",
                    reference: "Psalm 5:8",
                    text: "O Lord, lead me in Your righteousness because of my foes;\n  Make Your way straight before me.",
                    prayer: "Father, lead me in Your righteousness. Make Your path clear before me and guide my decisions according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-5-9",
                    reference: "Psalm 5:9",
                    text: "There is nothing reliable in what they say;\n  Their inward part is destruction itself.\n  Their throat is an open grave;\n  They flatter with their tongue.",
                    prayer: "Lord, guard my mouth and my heart. Help me speak words that bring life, encouragement, truth, and grace to those around me."
                ),
                PrayerVerse(
                    id: "psalm-5-10",
                    reference: "Psalm 5:10",
                    text: "Hold them guilty, O God;\n  By their own devices let them fall!\n  In the multitude of their transgressions thrust them out,\n  For they are rebellious against You.",
                    prayer: "Father, establish Your justice and righteousness. Keep me from rebellion and help me remain faithful to Your ways."
                ),
                PrayerVerse(
                    id: "psalm-5-11",
                    reference: "Psalm 5:11",
                    text: "But let all who take refuge in You be glad,\n  Let them ever sing for joy;\n  And may You shelter them,\n  That those who love Your name may exult in You.",
                    prayer: "Lord, let all who trust in You rejoice. Fill my heart with gladness and confidence as I rest under Your protection."
                ),
                PrayerVerse(
                    id: "psalm-5-12",
                    reference: "Psalm 5:12",
                    text: "For it is You who blesses the righteous man, O Lord,\n  You surround him with favor as with a shield.",
                    prayer: "Father, thank You for Your favor. Surround me with Your blessing and protection like a shield, and help me walk confidently in Your care."
                ),
                PrayerVerse(
                    id: "psalm-5-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing my prayers and welcoming me into Your presence through Your mercy. Lead me in righteousness, guard my heart and words, and help me trust in Your protection every day. May my life bring honor to You and may Your favor surround me wherever I go.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Have Mercy",
            chapterReference: "Psalm 6",
            summary: "Pray for healing and God's compassion in distress.",
            verses: [
                PrayerVerse(
                    id: "psalm-6-1",
                    reference: "Psalm 6:1",
                    text: "O Lord, do not rebuke me in Your anger,\n  Nor chasten me in Your wrath.",
                    prayer: "Lord, when I fall short and need correction, discipline me with mercy and love. Help me receive Your guidance with a humble and willing heart."
                ),
                PrayerVerse(
                    id: "psalm-6-2",
                    reference: "Psalm 6:2",
                    text: "Be gracious to me, O Lord, for I am pining away;\n  Heal me, O Lord, for my bones are dismayed.",
                    prayer: "Father, have compassion on me in my weakness. Strengthen me physically, emotionally, and spiritually when I feel worn down and discouraged."
                ),
                PrayerVerse(
                    id: "psalm-6-3",
                    reference: "Psalm 6:3",
                    text: "And my soul is greatly dismayed;\n  But You, O Lord—how long?",
                    prayer: "Lord, when my soul is troubled and overwhelmed, remind me that You are near. Fill me with Your peace and help me trust in Your timing."
                ),
                PrayerVerse(
                    id: "psalm-6-4",
                    reference: "Psalm 6:4",
                    text: "Return, O Lord, rescue my soul;\n  Save me because of Your lovingkindness.",
                    prayer: "Father, turn toward me in Your lovingkindness. Rescue me from despair and draw me closer to Your presence and comfort."
                ),
                PrayerVerse(
                    id: "psalm-6-5",
                    reference: "Psalm 6:5",
                    text: "For there is no mention of You in death;\n  In Sheol who will give You thanks?",
                    prayer: "Lord, let my life be a testimony of Your faithfulness. Help me use every day You give me to praise You and glorify Your name."
                ),
                PrayerVerse(
                    id: "psalm-6-6",
                    reference: "Psalm 6:6",
                    text: "I am weary with my sighing;\n  Every night I make my bed swim,\n  I dissolve my couch with my tears.",
                    prayer: "Father, You see every tear and every burden I carry. Thank You for understanding my pain even when no one else does."
                ),
                PrayerVerse(
                    id: "psalm-6-7",
                    reference: "Psalm 6:7",
                    text: "My eye has wasted away with grief;\n  It has become old because of all my adversaries.",
                    prayer: "Lord, when grief, disappointment, or hardship weigh heavily on me, renew my strength and restore my hope in You."
                ),
                PrayerVerse(
                    id: "psalm-6-8",
                    reference: "Psalm 6:8",
                    text: "Depart from me, all you who do iniquity,\n  For the Lord has heard the voice of my weeping.",
                    prayer: "Father, help me separate myself from anything that pulls me away from You. Strengthen my resolve to walk in righteousness and truth."
                ),
                PrayerVerse(
                    id: "psalm-6-9",
                    reference: "Psalm 6:9",
                    text: "The Lord has heard my supplication,\n  The Lord receives my prayer.",
                    prayer: "Lord, thank You for hearing my prayers. Give me confidence that You listen to every cry of my heart and answer according to Your perfect will."
                ),
                PrayerVerse(
                    id: "psalm-6-10",
                    reference: "Psalm 6:10",
                    text: "All my enemies will be ashamed and greatly dismayed;\n  They shall turn back, they will suddenly be ashamed.",
                    prayer: "Father, bring victory over every fear, struggle, and attack against my faith. Let Your power be seen in my life and remind me that You are my defender."
                ),
                PrayerVerse(
                    id: "psalm-6-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your mercy when I am weak and Your comfort when I am troubled. You see every tear, hear every prayer, and remain faithful through every season. Strengthen my heart, renew my hope, and help me trust completely in Your unfailing love and care.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Refuge in You",
            chapterReference: "Psalm 7",
            summary: "Pray for vindication and trust in God's justice.",
            verses: [
                PrayerVerse(
                    id: "psalm-7-1",
                    reference: "Psalm 7:1",
                    text: "O Lord my God, in You I have taken refuge;\n  Save me from all those who pursue me, and deliver me,",
                    prayer: "Lord, I take refuge in You. When I face trouble, fear, or opposition, help me run to You first and trust in Your protection."
                ),
                PrayerVerse(
                    id: "psalm-7-2",
                    reference: "Psalm 7:2",
                    text: "Or he will tear my soul like a lion,\n  Dragging me away, while there is none to deliver.",
                    prayer: "Father, deliver me from every danger that seeks to harm my faith, my peace, or my relationship with You. Keep me secure in Your care."
                ),
                PrayerVerse(
                    id: "psalm-7-3",
                    reference: "Psalm 7:3",
                    text: "O Lord my God, if I have done this,\n  If there is injustice in my hands,",
                    prayer: "Lord, search my heart and reveal anything within me that is not pleasing to You. Help me walk in honesty and integrity before You."
                ),
                PrayerVerse(
                    id: "psalm-7-4",
                    reference: "Psalm 7:4",
                    text: "If I have rewarded evil to my friend,\n  Or have plundered him who without cause was my adversary,",
                    prayer: "Father, if I have wronged others, give me humility to seek forgiveness and make things right. Teach me to live with a clear conscience."
                ),
                PrayerVerse(
                    id: "psalm-7-5",
                    reference: "Psalm 7:5",
                    text: "Let the enemy pursue my soul and overtake it;\n  And let him trample my life down to the ground\n  And lay my glory in the dust. Selah.",
                    prayer: "Lord, help me take responsibility for my actions and remain accountable before You. Shape my character according to Your truth."
                ),
                PrayerVerse(
                    id: "psalm-7-6",
                    reference: "Psalm 7:6",
                    text: "Arise, O Lord, in Your anger;\n  Lift up Yourself against the rage of my adversaries,\n  And arouse Yourself for me; You have appointed judgment.",
                    prayer: "Father, arise in Your righteousness and bring justice where it is needed. Help me trust You instead of seeking revenge or taking matters into my own hands."
                ),
                PrayerVerse(
                    id: "psalm-7-7",
                    reference: "Psalm 7:7",
                    text: "Let the assembly of the peoples encompass You,\n  And over them return on high.",
                    prayer: "Lord, You reign over all people and nations. Help me remember that You are sovereign and worthy of all honor and worship."
                ),
                PrayerVerse(
                    id: "psalm-7-8",
                    reference: "Psalm 7:8",
                    text: "The Lord judges the peoples;\n  Vindicate me, O Lord, according to my righteousness and my integrity that is in me.",
                    prayer: "Father, You know my heart completely. Lead me to walk in integrity and dependence upon Your grace every day."
                ),
                PrayerVerse(
                    id: "psalm-7-9",
                    reference: "Psalm 7:9",
                    text: "O let the evil of the wicked come to an end, but establish the righteous;\n  For the righteous God tries the hearts and minds.",
                    prayer: "Lord, bring an end to wickedness and establish righteousness. Purify my heart and strengthen me to live according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-7-10",
                    reference: "Psalm 7:10",
                    text: "My shield is with God,\n  Who saves the upright in heart.",
                    prayer: "Father, thank You for being my shield and defender. Protect me from harm and strengthen me when I feel weak or vulnerable."
                ),
                PrayerVerse(
                    id: "psalm-7-11",
                    reference: "Psalm 7:11",
                    text: "God is a righteous judge,\n  And a God who has indignation every day.",
                    prayer: "Lord, thank You for Your perfect justice. Help me trust that You always judge rightly and act according to truth."
                ),
                PrayerVerse(
                    id: "psalm-7-12",
                    reference: "Psalm 7:12",
                    text: "If a man does not repent, He will sharpen His sword;\n  He has bent His bow and made it ready.",
                    prayer: "Father, keep me quick to repent when I stray from Your path. Help me respond to Your correction with humility and obedience."
                ),
                PrayerVerse(
                    id: "psalm-7-13",
                    reference: "Psalm 7:13",
                    text: "He has also prepared for Himself deadly weapons;\n  He makes His arrows fiery shafts.",
                    prayer: "Lord, remind me that You are holy and just. Let my life reflect reverence for You and a desire to honor You in all things."
                ),
                PrayerVerse(
                    id: "psalm-7-14",
                    reference: "Psalm 7:14",
                    text: "Behold, he travails with wickedness,\n  And he conceives mischief and brings forth falsehood.",
                    prayer: "Father, protect me from deceit and sinful desires. Help me choose truth and righteousness instead of temptation."
                ),
                PrayerVerse(
                    id: "psalm-7-15",
                    reference: "Psalm 7:15",
                    text: "He has dug a pit and hollowed it out,\n  And has fallen into the hole which he made.",
                    prayer: "Lord, keep me from creating problems through careless actions or selfish decisions. Give me wisdom to walk faithfully before You."
                ),
                PrayerVerse(
                    id: "psalm-7-16",
                    reference: "Psalm 7:16",
                    text: "His mischief will return upon his own head,\n  And his violence will descend upon his own pate.",
                    prayer: "Father, remind me that every choice has consequences. Help me sow righteousness, kindness, and faithfulness in my daily life."
                ),
                PrayerVerse(
                    id: "psalm-7-17",
                    reference: "Psalm 7:17",
                    text: "I will give thanks to the Lord according to His righteousness\n  And will sing praise to the name of the Lord Most High.",
                    prayer: "Lord, I praise You for Your righteousness and goodness. May my heart continually worship You and give thanks for Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-7-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, my defender, and my righteous Judge. Search my heart, guide my steps, and help me walk in integrity before You. Teach me to trust Your justice, rely on Your protection, and continually praise You for Your faithfulness and love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 8,
            title: "How Majestic",
            chapterReference: "Psalm 8",
            summary: "Pray in awe of God's majesty and care for humanity.",
            verses: [
                PrayerVerse(
                    id: "psalm-8-1",
                    reference: "Psalm 8:1",
                    text: "O Lord, our Lord,\n  How majestic is Your name in all the earth,\n  Who have displayed Your splendor above the heavens!",
                    prayer: "Lord, our Lord, how majestic is Your name in all the earth. Help me recognize Your greatness and worship You with awe and gratitude each day."
                ),
                PrayerVerse(
                    id: "psalm-8-2",
                    reference: "Psalm 8:2",
                    text: "From the mouth of infants and nursing babes You have established strength\n  Because of Your adversaries,\n  To make the enemy and the revengeful cease.",
                    prayer: "Father, thank You for displaying Your strength through the humble and the weak. Help me trust that Your power is made perfect even when I feel inadequate."
                ),
                PrayerVerse(
                    id: "psalm-8-3",
                    reference: "Psalm 8:3",
                    text: "When I consider Your heavens, the work of Your fingers,\n  The moon and the stars, which You have ordained;",
                    prayer: "Lord, when I look at the heavens and the wonders of creation, remind me of Your wisdom, creativity, and power that sustain all things."
                ),
                PrayerVerse(
                    id: "psalm-8-4",
                    reference: "Psalm 8:4",
                    text: "What is man that You take thought of him,\n  And the son of man that You care for him?",
                    prayer: "Father, thank You for caring about me even though I am small compared to the vastness of Your creation. Help me never forget how deeply You love and value me."
                ),
                PrayerVerse(
                    id: "psalm-8-5",
                    reference: "Psalm 8:5",
                    text: "Yet You have made him a little lower than God,\n  And You crown him with glory and majesty!",
                    prayer: "Lord, thank You for creating humanity with dignity and purpose. Help me live in a way that reflects the honor You have given me as Your creation."
                ),
                PrayerVerse(
                    id: "psalm-8-6",
                    reference: "Psalm 8:6",
                    text: "You make him to rule over the works of Your hands;\n  You have put all things under his feet,",
                    prayer: "Father, teach me to be a faithful steward of the responsibilities You have entrusted to me. Give me wisdom to manage them according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-8-7",
                    reference: "Psalm 8:7",
                    text: "All sheep and oxen,\n  And also the beasts of the field,",
                    prayer: "Lord, thank You for the abundance of Your creation and the blessings You provide. Help me use every gift responsibly and with gratitude."
                ),
                PrayerVerse(
                    id: "psalm-8-8",
                    reference: "Psalm 8:8",
                    text: "The birds of the heavens and the fish of the sea,\n  Whatever passes through the paths of the seas.",
                    prayer: "Father, remind me that all creation belongs to You. Help me care for what You have made and recognize Your hand in every part of life."
                ),
                PrayerVerse(
                    id: "psalm-8-9",
                    reference: "Psalm 8:9",
                    text: "O Lord, our Lord,\n  How majestic is Your name in all the earth!",
                    prayer: "Lord, our Lord, how majestic is Your name in all the earth. May my life continually bring glory, honor, and praise to You."
                ),
                PrayerVerse(
                    id: "psalm-8-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the beauty of Your creation and the wonder of Your love. Though You are the Creator of the universe, You care deeply for me and call me by name. Help me live with gratitude, humility, and purpose, honoring You in all that I do and praising Your majestic name forever.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 9,
            title: "I Will Give Thanks",
            chapterReference: "Psalm 9",
            summary: "Pray with thanksgiving for God's righteous judgment.",
            verses: [
                PrayerVerse(
                    id: "psalm-9-1",
                    reference: "Psalm 9:1",
                    text: "I will give thanks to the Lord with all my heart;\n  I will tell of all Your wonders.",
                    prayer: "Lord, I will give thanks to You with all my heart. Help me remember Your goodness and continually praise You for all that You have done in my life."
                ),
                PrayerVerse(
                    id: "psalm-9-2",
                    reference: "Psalm 9:2",
                    text: "I will be glad and exult in You;\n  I will sing praise to Your name, O Most High.",
                    prayer: "Father, fill my heart with joy in Your presence. Let my life be a song of praise that honors Your holy name."
                ),
                PrayerVerse(
                    id: "psalm-9-3",
                    reference: "Psalm 9:3",
                    text: "When my enemies turn back,\n  They stumble and perish before You.",
                    prayer: "Lord, thank You for being my defender. When challenges arise, remind me that Your power is greater than every obstacle before me."
                ),
                PrayerVerse(
                    id: "psalm-9-4",
                    reference: "Psalm 9:4",
                    text: "For You have maintained my just cause;\n  You have sat on the throne judging righteously.",
                    prayer: "Father, thank You for upholding justice and righteousness. Help me trust that You see every situation clearly and judge perfectly."
                ),
                PrayerVerse(
                    id: "psalm-9-5",
                    reference: "Psalm 9:5",
                    text: "You have rebuked the nations, You have destroyed the wicked;\n  You have blotted out their name forever and ever.",
                    prayer: "Lord, remind me that evil will not prevail forever. Strengthen my faith when I see injustice and help me trust in Your timing."
                ),
                PrayerVerse(
                    id: "psalm-9-6",
                    reference: "Psalm 9:6",
                    text: "The enemy has come to an end in perpetual ruins,\n  And You have uprooted the cities;\n  The very memory of them has perished.",
                    prayer: "Father, earthly powers rise and fall, but Your kingdom remains forever. Help me build my life upon what is eternal rather than temporary."
                ),
                PrayerVerse(
                    id: "psalm-9-7",
                    reference: "Psalm 9:7",
                    text: "But the Lord abides forever;\n  He has established His throne for judgment,",
                    prayer: "Lord, thank You that You reign forever. When life feels uncertain, remind me that Your throne is established and Your rule never changes."
                ),
                PrayerVerse(
                    id: "psalm-9-8",
                    reference: "Psalm 9:8",
                    text: "And He will judge the world in righteousness;\n  He will execute judgment for the peoples with equity.",
                    prayer: "Father, You judge the world with righteousness and truth. Help me walk uprightly and trust Your wisdom in all things."
                ),
                PrayerVerse(
                    id: "psalm-9-9",
                    reference: "Psalm 9:9",
                    text: "The Lord also will be a stronghold for the oppressed,\n  A stronghold in times of trouble;",
                    prayer: "Lord, be my refuge in times of trouble. When I feel overwhelmed, help me find safety, strength, and comfort in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-9-10",
                    reference: "Psalm 9:10",
                    text: "And those who know Your name will put their trust in You,\n  For You, O Lord, have not forsaken those who seek You.",
                    prayer: "Father, help me know You more deeply. Strengthen my trust in You and remind me that You never forsake those who seek You."
                ),
                PrayerVerse(
                    id: "psalm-9-11",
                    reference: "Psalm 9:11",
                    text: "Sing praises to the Lord, who dwells in Zion;\n  Declare among the peoples His deeds.",
                    prayer: "Lord, let my life proclaim Your greatness. Help me share Your goodness with others and speak of the wonderful things You have done."
                ),
                PrayerVerse(
                    id: "psalm-9-12",
                    reference: "Psalm 9:12",
                    text: "For He who requires blood remembers them;\n  He does not forget the cry of the afflicted.",
                    prayer: "Father, thank You that You remember those who call upon You. Comfort those who suffer and help me trust that You hear every prayer."
                ),
                PrayerVerse(
                    id: "psalm-9-13",
                    reference: "Psalm 9:13",
                    text: "Be gracious to me, O Lord;\n  See my affliction from those who hate me,\n  You who lift me up from the gates of death,",
                    prayer: "Lord, be gracious to me in my struggles. Lift me up when I feel weak and give me strength to persevere through difficult seasons."
                ),
                PrayerVerse(
                    id: "psalm-9-14",
                    reference: "Psalm 9:14",
                    text: "That I may tell of all Your praises,\n  That in the gates of the daughter of Zion\n  I may rejoice in Your salvation.",
                    prayer: "Father, let my life overflow with praise. Help me rejoice in the salvation and grace You have freely given."
                ),
                PrayerVerse(
                    id: "psalm-9-15",
                    reference: "Psalm 9:15",
                    text: "The nations have sunk down in the pit which they have made;\n  In the net which they hid, their own foot has been caught.",
                    prayer: "Lord, remind me that human plans cannot overcome Your purposes. Help me place my confidence in You rather than worldly power."
                ),
                PrayerVerse(
                    id: "psalm-9-16",
                    reference: "Psalm 9:16",
                    text: "The Lord has made Himself known;\n  He has executed judgment.\n  In the work of his own hands the wicked is snared. Higgaion Selah.",
                    prayer: "Father, You reveal Your righteousness through all You do. Help me recognize Your hand at work and honor You in every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-9-17",
                    reference: "Psalm 9:17",
                    text: "The wicked will return to Sheol,\n  Even all the nations who forget God.",
                    prayer: "Lord, keep my heart close to You. Protect me from drifting away and help me walk faithfully in Your truth."
                ),
                PrayerVerse(
                    id: "psalm-9-18",
                    reference: "Psalm 9:18",
                    text: "For the needy will not always be forgotten,\n  Nor the hope of the afflicted perish forever.",
                    prayer: "Father, thank You that You do not forget those who place their hope in You. Strengthen my faith when I am waiting for Your answer."
                ),
                PrayerVerse(
                    id: "psalm-9-19",
                    reference: "Psalm 9:19",
                    text: "Arise, O Lord, do not let man prevail;\n  Let the nations be judged before You.",
                    prayer: "Lord, arise and display Your power. Let Your will be accomplished in the earth and in my life."
                ),
                PrayerVerse(
                    id: "psalm-9-20",
                    reference: "Psalm 9:20",
                    text: "Put them in fear, O Lord;\n  Let the nations know that they are but men. Selah.",
                    prayer: "Father, remind all people of their need for You. Keep me humble before You and teach me to depend on Your grace every day."
                ),
                PrayerVerse(
                    id: "psalm-9-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, my righteous Judge, and my faithful King. Help me trust You in every circumstance, praise You with all my heart, and remember Your goodness throughout my life. Strengthen my faith, deepen my trust, and keep my eyes fixed upon Your eternal kingdom.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Why Stand Far Off?",
            chapterReference: "Psalm 10",
            summary: "Pray for God's intervention against injustice.",
            verses: [
                PrayerVerse(
                    id: "psalm-10-1",
                    reference: "Psalm 10:1",
                    text: "Why do You stand afar off, O Lord?\n  Why do You hide Yourself in times of trouble?",
                    prayer: "Lord, when You seem distant and I do not understand what You are doing, help me trust that You are still near and faithfully working in my life."
                ),
                PrayerVerse(
                    id: "psalm-10-2",
                    reference: "Psalm 10:2",
                    text: "In pride the wicked hotly pursue the afflicted;\n  Let them be caught in the plots which they have devised.",
                    prayer: "Father, when I see pride, injustice, and wrongdoing around me, keep my heart from discouragement and remind me that You see everything."
                ),
                PrayerVerse(
                    id: "psalm-10-3",
                    reference: "Psalm 10:3",
                    text: "For the wicked boasts of his heart's desire,\n  And the greedy man curses and spurns the Lord.",
                    prayer: "Lord, protect me from selfish ambition and pride. Help me find my satisfaction in You rather than in worldly success or personal gain."
                ),
                PrayerVerse(
                    id: "psalm-10-4",
                    reference: "Psalm 10:4",
                    text: "The wicked, in the haughtiness of his countenance, does not seek Him.\n  All his thoughts are, \"There is no God.\"",
                    prayer: "Father, keep me from living as though I do not need You. Teach me to seek You daily with humility and dependence."
                ),
                PrayerVerse(
                    id: "psalm-10-5",
                    reference: "Psalm 10:5",
                    text: "His ways prosper at all times;\n  Your judgments are on high, out of his sight;\n  As for all his adversaries, he snorts at them.",
                    prayer: "Lord, when the wicked appear to prosper, help me remember that Your justice is perfect and Your timing is never late."
                ),
                PrayerVerse(
                    id: "psalm-10-6",
                    reference: "Psalm 10:6",
                    text: "He says to himself, \"I will not be moved;\n  Throughout all generations I will not be in adversity.\"",
                    prayer: "Father, guard me against false confidence and self-reliance. Let my security always be found in You alone."
                ),
                PrayerVerse(
                    id: "psalm-10-7",
                    reference: "Psalm 10:7",
                    text: "His mouth is full of curses and deceit and oppression;\n  Under his tongue is mischief and wickedness.",
                    prayer: "Lord, help my words reflect Your love and truth. Keep my mouth from deceit, bitterness, and harmful speech."
                ),
                PrayerVerse(
                    id: "psalm-10-8",
                    reference: "Psalm 10:8",
                    text: "He sits in the lurking places of the villages;\n  In the hiding places he kills the innocent;\n  His eyes stealthily watch for the unfortunate.",
                    prayer: "Father, protect the vulnerable, the hurting, and those who feel forgotten. Help me be a source of compassion and encouragement to others."
                ),
                PrayerVerse(
                    id: "psalm-10-9",
                    reference: "Psalm 10:9",
                    text: "He lurks in a hiding place as a lion in his lair;\n  He lurks to catch the afflicted;\n  He catches the afflicted when he draws him into his net.",
                    prayer: "Lord, deliver people from those who seek to exploit or harm them. Let Your protection and justice prevail."
                ),
                PrayerVerse(
                    id: "psalm-10-10",
                    reference: "Psalm 10:10",
                    text: "He crouches, he bows down,\n  And the unfortunate fall by his mighty ones.",
                    prayer: "Father, strengthen those who have been oppressed or broken by life's hardships. Lift them up and surround them with Your care."
                ),
                PrayerVerse(
                    id: "psalm-10-11",
                    reference: "Psalm 10:11",
                    text: "He says to himself, \"God has forgotten;\n  He has hidden His face; He will never see it.\"",
                    prayer: "Lord, remind me that nothing escapes Your attention. You see every struggle, every injustice, and every cry for help."
                ),
                PrayerVerse(
                    id: "psalm-10-12",
                    reference: "Psalm 10:12",
                    text: "Arise, O Lord; O God, lift up Your hand.\n  Do not forget the afflicted.",
                    prayer: "Father, arise and demonstrate Your power. Bring hope to those who are suffering and comfort to those who are weary."
                ),
                PrayerVerse(
                    id: "psalm-10-13",
                    reference: "Psalm 10:13",
                    text: "Why has the wicked spurned God?\n  He has said to himself, \"You will not require it.\"",
                    prayer: "Lord, help me never doubt Your justice or Your authority. Keep my faith anchored in Your character and promises."
                ),
                PrayerVerse(
                    id: "psalm-10-14",
                    reference: "Psalm 10:14",
                    text: "You have seen it, for You have beheld mischief and vexation to take it into Your hand.\n  The unfortunate commits himself to You;\n  You have been the helper of the orphan.",
                    prayer: "Father, thank You for seeing the troubles and grief of Your people. Help me trust that You are actively working even when I cannot see it."
                ),
                PrayerVerse(
                    id: "psalm-10-15",
                    reference: "Psalm 10:15",
                    text: "Break the arm of the wicked and the evildoer,\n  Seek out his wickedness until You find none.",
                    prayer: "Lord, break the power of evil and strengthen what is good and righteous. Let Your kingdom continue to grow in my heart and in the world."
                ),
                PrayerVerse(
                    id: "psalm-10-16",
                    reference: "Psalm 10:16",
                    text: "The Lord is King forever and ever;\n  Nations have perished from His land.",
                    prayer: "Father, thank You that You reign forever. No earthly power can overcome Your eternal kingdom."
                ),
                PrayerVerse(
                    id: "psalm-10-17",
                    reference: "Psalm 10:17",
                    text: "O Lord, You have heard the desire of the humble;\n  You will strengthen their heart, You will incline Your ear",
                    prayer: "Lord, hear the desires and prayers of those who seek You. Strengthen our hearts and help us remain faithful in every season."
                ),
                PrayerVerse(
                    id: "psalm-10-18",
                    reference: "Psalm 10:18",
                    text: "To vindicate the orphan and the oppressed,\n  So that man who is of the earth will no longer cause terror.",
                    prayer: "Father, defend the fatherless, the vulnerable, and those who have no one to help them. Use me to reflect Your compassion and care."
                ),
                PrayerVerse(
                    id: "psalm-10-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being the righteous King who sees every injustice and hears every prayer. When I am discouraged by what I see around me, help me trust in Your perfect justice and unfailing love. Strengthen my faith, guard my heart from pride, and help me walk humbly with You, knowing that Your kingdom reigns forever.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 11,
            title: "In the Lord I Take Refuge",
            chapterReference: "Psalm 11",
            summary: "Pray for courage and trust when foundations are shaken.",
            verses: [
                PrayerVerse(
                    id: "psalm-11-1",
                    reference: "Psalm 11:1",
                    text: "In the Lord I take refuge;\n  How can you say to my soul, \"Flee as a bird to your mountain;",
                    prayer: "Lord, You are my refuge and my strength. When fear tries to overwhelm me, help me place my confidence in You rather than running from the challenges before me."
                ),
                PrayerVerse(
                    id: "psalm-11-2",
                    reference: "Psalm 11:2",
                    text: "For, behold, the wicked bend the bow,\n  They make ready their arrow upon the string\n  To shoot in darkness at the upright in heart.",
                    prayer: "Father, when I face hidden dangers, opposition, or attacks against my faith, remind me that You see what I cannot see and are watching over me."
                ),
                PrayerVerse(
                    id: "psalm-11-3",
                    reference: "Psalm 11:3",
                    text: "If the foundations are destroyed,\n  What can the righteous do?\"",
                    prayer: "Lord, when foundations around me seem shaken, help me remain firmly grounded in Your truth, knowing that You never change."
                ),
                PrayerVerse(
                    id: "psalm-11-4",
                    reference: "Psalm 11:4",
                    text: "The Lord is in His holy temple; the Lord's throne is in heaven;\n  His eyes behold, His eyelids test the sons of men.",
                    prayer: "Father, thank You that You are on Your holy throne. Nothing escapes Your notice, and You remain sovereign over every situation in my life."
                ),
                PrayerVerse(
                    id: "psalm-11-5",
                    reference: "Psalm 11:5",
                    text: "The Lord tests the righteous and the wicked,\n  And the one who loves violence His soul hates.",
                    prayer: "Lord, examine my heart and reveal areas where I need to grow. Help me pursue righteousness and walk faithfully before You."
                ),
                PrayerVerse(
                    id: "psalm-11-6",
                    reference: "Psalm 11:6",
                    text: "Upon the wicked He will rain snares;\n  Fire and brimstone and burning wind will be the portion of their cup.",
                    prayer: "Father, remind me that You are just and holy. Help me live with reverence for You and trust that You will deal rightly with all things."
                ),
                PrayerVerse(
                    id: "psalm-11-7",
                    reference: "Psalm 11:7",
                    text: "For the Lord is righteous, He loves righteousness;\n  The upright will behold His face.",
                    prayer: "Lord, because You are righteous, help me love what is right and pleasing in Your sight. Let my life reflect Your character and goodness each day."
                ),
                PrayerVerse(
                    id: "psalm-11-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge when life feels uncertain. Help me trust in Your sovereignty, remain grounded in Your truth, and walk faithfully before You. When fear or doubt arise, remind me that You are on the throne, watching over me with perfect wisdom, righteousness, and love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Help, Lord",
            chapterReference: "Psalm 12",
            summary: "Pray for truth and protection from deceit.",
            verses: [
                PrayerVerse(
                    id: "psalm-12-1",
                    reference: "Psalm 12:1",
                    text: "Help, Lord, for the godly man ceases to be,\n  For the faithful disappear from among the sons of men.",
                    prayer: "Lord, when faithfulness seems rare and truth is difficult to find, help me remain devoted to You and steadfast in my walk with You."
                ),
                PrayerVerse(
                    id: "psalm-12-2",
                    reference: "Psalm 12:2",
                    text: "They speak falsehood to one another;\n  With flattering lips and with a double heart they speak.",
                    prayer: "Father, guard my heart from deception and dishonesty. Help me speak truthfully and sincerely in all my relationships."
                ),
                PrayerVerse(
                    id: "psalm-12-3",
                    reference: "Psalm 12:3",
                    text: "May the Lord cut off all flattering lips,\n  The tongue that speaks great things;",
                    prayer: "Lord, protect me from prideful speech and selfish words. Teach me to use my tongue to encourage, uplift, and honor You."
                ),
                PrayerVerse(
                    id: "psalm-12-4",
                    reference: "Psalm 12:4",
                    text: "Who have said, \"With our tongue we will prevail;\n  Our lips are our own; who is lord over us?\"",
                    prayer: "Father, keep me from relying on my own strength or abilities. Remind me that every good thing I have comes from You."
                ),
                PrayerVerse(
                    id: "psalm-12-5",
                    reference: "Psalm 12:5",
                    text: "\"Because of the devastation of the afflicted, because of the groaning of the needy,\n  Now I will arise,\" says the Lord; \"I will set him in the safety for which he longs.\"",
                    prayer: "Lord, thank You for seeing the struggles of the vulnerable and the oppressed. Help me reflect Your compassion and care toward those who are hurting."
                ),
                PrayerVerse(
                    id: "psalm-12-6",
                    reference: "Psalm 12:6",
                    text: "The words of the Lord are pure words;\n  As silver tried in a furnace on the earth, refined seven times.",
                    prayer: "Father, thank You that Your words are pure, trustworthy, and true. Help me build my life upon the foundation of Your Word."
                ),
                PrayerVerse(
                    id: "psalm-12-7",
                    reference: "Psalm 12:7",
                    text: "You, O Lord, will keep them;\n  You will preserve him from this generation forever.",
                    prayer: "Lord, thank You for Your protection and faithfulness. Keep me secure in Your care and help me trust You through every season of life."
                ),
                PrayerVerse(
                    id: "psalm-12-8",
                    reference: "Psalm 12:8",
                    text: "The wicked strut about on every side\n  When vileness is exalted among the sons of men.",
                    prayer: "Father, even when the world celebrates what is wrong, help me stand firmly for truth, righteousness, and obedience to Your will."
                ),
                PrayerVerse(
                    id: "psalm-12-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the truth and reliability of Your Word. In a world where faithfulness can be difficult to find, help me remain faithful to You. Guard my speech, strengthen my character, and help me walk in truth and integrity. Let my life reflect Your goodness and bring honor to Your name.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 13,
            title: "How Long?",
            chapterReference: "Psalm 13",
            summary: "Pray through seasons of waiting and darkness.",
            verses: [
                PrayerVerse(
                    id: "psalm-13-1",
                    reference: "Psalm 13:1",
                    text: "How long, O Lord? Will You forget me forever?\n  How long will You hide Your face from me?",
                    prayer: "Lord, when I feel forgotten or distant from Your presence, help me remember that You have never abandoned me and that Your love remains constant."
                ),
                PrayerVerse(
                    id: "psalm-13-2",
                    reference: "Psalm 13:2",
                    text: "How long shall I take counsel in my soul,\n  Having sorrow in my heart all the day?\n  How long will my enemy be exalted over me?",
                    prayer: "Father, when anxiety, confusion, or sorrow fill my heart, give me peace that surpasses understanding and help me trust Your plan."
                ),
                PrayerVerse(
                    id: "psalm-13-3",
                    reference: "Psalm 13:3",
                    text: "Consider and answer me, O Lord my God;\n  Enlighten my eyes, or I will sleep the sleep of death,",
                    prayer: "Lord, hear my prayer and open my eyes to Your faithfulness. Strengthen me when I feel weak and renew my hope in You."
                ),
                PrayerVerse(
                    id: "psalm-13-4",
                    reference: "Psalm 13:4",
                    text: "And my enemy will say, \"I have overcome him,\"\n  And my adversaries will rejoice when I am shaken.",
                    prayer: "Father, do not let fear or discouragement gain victory over my heart. Help me stand firm in faith and confidence in Your promises."
                ),
                PrayerVerse(
                    id: "psalm-13-5",
                    reference: "Psalm 13:5",
                    text: "But I have trusted in Your lovingkindness;\n  My heart shall rejoice in Your salvation.",
                    prayer: "Lord, I trust in Your lovingkindness. Even when I cannot see the outcome, help me rest in Your unfailing mercy and grace."
                ),
                PrayerVerse(
                    id: "psalm-13-6",
                    reference: "Psalm 13:6",
                    text: "I will sing to the Lord,\n  Because He has dealt bountifully with me.",
                    prayer: "Father, I will sing and rejoice because of Your goodness. Fill my heart with gratitude and help me remember all the ways You have blessed me."
                ),
                PrayerVerse(
                    id: "psalm-13-closing",
                    reference: "Closing",
                    text: "Lord, thank You that even when I struggle with doubt, fear, or waiting, Your love never fails. Help me trust in Your mercy, rejoice in Your salvation, and remember Your faithfulness through every season of life. Strengthen my heart, renew my hope, and teach me to praise You even while I wait for Your answers.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 14,
            title: "The Fool Says",
            chapterReference: "Psalm 14",
            summary: "Pray for wisdom and righteous living.",
            verses: [
                PrayerVerse(
                    id: "psalm-14-1",
                    reference: "Psalm 14:1",
                    text: "The fool has said in his heart, \"There is no God.\"\n  They are corrupt, they have committed abominable deeds;\n  There is no one who does good.",
                    prayer: "Lord, help me never live as though You do not exist. Keep my heart anchored in faith, wisdom, and reverence for You in all that I do."
                ),
                PrayerVerse(
                    id: "psalm-14-2",
                    reference: "Psalm 14:2",
                    text: "The Lord has looked down from heaven upon the sons of men\n  To see if there are any who understand,\n  Who seek after God.",
                    prayer: "Father, search my heart and help me seek You sincerely. Give me a desire to know You more deeply and walk closely with You each day."
                ),
                PrayerVerse(
                    id: "psalm-14-3",
                    reference: "Psalm 14:3",
                    text: "They have all turned aside, together they have become corrupt;\n  There is no one who does good, not even one.",
                    prayer: "Lord, I recognize that without Your grace I fall short. Thank You for Your mercy and forgiveness that restore me when I fail."
                ),
                PrayerVerse(
                    id: "psalm-14-4",
                    reference: "Psalm 14:4",
                    text: "Do all the workers of wickedness not know,\n  Who eat up my people as they eat bread,\n  And do not call upon the Lord?",
                    prayer: "Father, protect me from hardness of heart and spiritual blindness. Help me treat others with compassion, kindness, and love."
                ),
                PrayerVerse(
                    id: "psalm-14-5",
                    reference: "Psalm 14:5",
                    text: "There they are in great dread,\n  For God is with the righteous generation.",
                    prayer: "Lord, thank You for being present with those who seek You. Strengthen my faith and remind me that You are near in every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-14-6",
                    reference: "Psalm 14:6",
                    text: "You would put to shame the counsel of the afflicted,\n  But the Lord is his refuge.",
                    prayer: "Father, be a refuge for those who are struggling, discouraged, and burdened. Help me trust in Your protection and care."
                ),
                PrayerVerse(
                    id: "psalm-14-7",
                    reference: "Psalm 14:7",
                    text: "Oh, that the salvation of Israel would come out of Zion!\n  When the Lord restores His captive people,\n  Jacob will rejoice, Israel will be glad.",
                    prayer: "Lord, thank You for the salvation and hope You provide. Fill my heart with joy as I look forward to the fulfillment of Your promises and the restoration You bring."
                ),
                PrayerVerse(
                    id: "psalm-14-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your grace, mercy, and salvation. Help me seek You with my whole heart and walk in wisdom rather than relying on my own understanding. Keep me close to You, strengthen my faith, and remind me daily that true hope, security, and joy are found in Your presence alone.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 15,
            title: "Who May Dwell?",
            chapterReference: "Psalm 15",
            summary: "Pray for integrity and blameless living.",
            verses: [
                PrayerVerse(
                    id: "psalm-15-1",
                    reference: "Psalm 15:1",
                    text: "O Lord, who may abide in Your tent?\n  Who may dwell on Your holy hill?",
                    prayer: "Lord, I desire to dwell in Your presence and walk closely with You. Help me live a life that honors You and reflects Your holiness."
                ),
                PrayerVerse(
                    id: "psalm-15-2",
                    reference: "Psalm 15:2",
                    text: "He who walks with integrity, and works righteousness,\n  And speaks truth in his heart.",
                    prayer: "Father, help me walk with integrity, do what is right, and speak truth from my heart. Let my character reflect Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-15-3",
                    reference: "Psalm 15:3",
                    text: "He does not slander with his tongue,\n  Nor does evil to his neighbor,\n  Nor takes up a reproach against his friend;",
                    prayer: "Lord, guard my tongue from gossip, slander, and harmful words. Help me use my speech to encourage, uplift, and bless others."
                ),
                PrayerVerse(
                    id: "psalm-15-4",
                    reference: "Psalm 15:4",
                    text: "In whose eyes a reprobate is despised,\n  But who honors those who fear the Lord;\n  He swears to his own hurt and does not change;",
                    prayer: "Father, teach me to value what You value and honor those who faithfully follow You. Help me remain faithful to my commitments and promises."
                ),
                PrayerVerse(
                    id: "psalm-15-5",
                    reference: "Psalm 15:5",
                    text: "He does not put out his money at interest,\n  Nor does he take a bribe against the innocent.\n  He who does these things will never be shaken.",
                    prayer: "Lord, help me act with generosity, fairness, and compassion. Let my life be marked by honesty and righteousness in every relationship and decision."
                ),
                PrayerVerse(
                    id: "psalm-15-closing",
                    reference: "Closing",
                    text: "Lord, thank You for showing me what it means to walk in integrity and righteousness. Help me live truthfully, speak wisely, keep my commitments, and treat others with love and fairness. May my life honor You and reflect the character of someone who delights in Your presence and seeks to follow You faithfully each day.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        )
    ]
    
    // MARK: - Psalms 16-30
    private static let psalms16to30: [PrayerDay] = [
        PrayerDay(
            dayNumber: 16,
            title: "You Are My Lord",
            chapterReference: "Psalm 16",
            summary: "Pray for joy and security in God alone.",
            verses: [
                PrayerVerse(
                    id: "psalm-16-1",
                    reference: "Psalm 16:1",
                    text: "Preserve me, O God, for I take refuge in You.",
                    prayer: "Lord, preserve and protect me, for I take refuge in You. Help me trust Your care and guidance in every season of life."
                ),
                PrayerVerse(
                    id: "psalm-16-2",
                    reference: "Psalm 16:2",
                    text: "I said to the Lord, \"You are my Lord;\n  I have no good besides You.\"",
                    prayer: "Father, You are my Lord, and apart from You I have no true good. Help me find my satisfaction and purpose in You alone."
                ),
                PrayerVerse(
                    id: "psalm-16-3",
                    reference: "Psalm 16:3",
                    text: "As for the saints who are in the earth,\n  They are the majestic ones in whom is all my delight.",
                    prayer: "Lord, thank You for the fellowship of Your people. Help me encourage, support, and walk alongside those who seek to follow You faithfully."
                ),
                PrayerVerse(
                    id: "psalm-16-4",
                    reference: "Psalm 16:4",
                    text: "The sorrows of those who have bartered for another god will be multiplied;\n  I shall not pour out their drink offerings of blood,\n  Nor will I take their names upon my lips.",
                    prayer: "Father, keep my heart from idols and anything that would take Your place in my life. Help me worship You with undivided devotion."
                ),
                PrayerVerse(
                    id: "psalm-16-5",
                    reference: "Psalm 16:5",
                    text: "The Lord is the portion of my inheritance and my cup;\n  You support my lot.",
                    prayer: "Lord, thank You for being my portion and my inheritance. Remind me that my greatest treasure is found in a relationship with You."
                ),
                PrayerVerse(
                    id: "psalm-16-6",
                    reference: "Psalm 16:6",
                    text: "The lines have fallen to me in pleasant places;\n  Indeed, my heritage is beautiful to me.",
                    prayer: "Father, thank You for the blessings You have given me. Help me recognize Your goodness and remain grateful for Your provision."
                ),
                PrayerVerse(
                    id: "psalm-16-7",
                    reference: "Psalm 16:7",
                    text: "I will bless the Lord who has counseled me;\n  Indeed, my mind instructs me in the night.",
                    prayer: "Lord, I praise You for Your counsel and wisdom. Guide my decisions and teach me to follow Your direction in all things."
                ),
                PrayerVerse(
                    id: "psalm-16-8",
                    reference: "Psalm 16:8",
                    text: "I have set the Lord continually before me;\n  Because He is at my right hand, I will not be shaken.",
                    prayer: "Father, help me keep my eyes fixed on You. When challenges arise, remind me that You are near and that I can stand firm in Your strength."
                ),
                PrayerVerse(
                    id: "psalm-16-9",
                    reference: "Psalm 16:9",
                    text: "Therefore my heart is glad and my glory rejoices;\n  My flesh also will dwell securely.",
                    prayer: "Lord, fill my heart with joy and confidence in Your promises. Let me rest securely in the hope that comes from knowing You."
                ),
                PrayerVerse(
                    id: "psalm-16-10",
                    reference: "Psalm 16:10",
                    text: "For You will not abandon my soul to Sheol;\n  Nor will You allow Your Holy One to undergo decay.",
                    prayer: "Father, thank You for the hope of salvation and eternal life. Thank You for the victory that is found through Jesus Christ."
                ),
                PrayerVerse(
                    id: "psalm-16-11",
                    reference: "Psalm 16:11",
                    text: "You will make known to me the path of life;\n  In Your presence is fullness of joy;\n  In Your right hand there are pleasures forever.",
                    prayer: "Lord, show me the path of life. Fill me with the joy of Your presence and help me walk daily in the fullness of Your love and grace."
                ),
                PrayerVerse(
                    id: "psalm-16-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, my inheritance, and my source of joy. Help me keep my eyes fixed on You, trust Your guidance, and walk faithfully in Your ways. Fill my heart with gratitude for Your blessings and confidence in the eternal hope found through Jesus Christ. May I find lasting joy in Your presence every day of my life.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 17,
            title: "Hear a Just Cause",
            chapterReference: "Psalm 17",
            summary: "Pray for vindication and protection.",
            verses: [
                PrayerVerse(
                    id: "psalm-17-1",
                    reference: "Psalm 17:1",
                    text: "Hear a just cause, O Lord, give heed to my cry;\n  Give ear to my prayer, which is not from deceitful lips.",
                    prayer: "Lord, hear my prayer and listen to the cries of my heart. Help me approach You with sincerity, honesty, and faith."
                ),
                PrayerVerse(
                    id: "psalm-17-2",
                    reference: "Psalm 17:2",
                    text: "Let my judgment come forth from Your presence;\n  Let Your eyes look with equity.",
                    prayer: "Father, I place my life before You. Let Your wisdom guide me and Your righteousness direct my steps."
                ),
                PrayerVerse(
                    id: "psalm-17-3",
                    reference: "Psalm 17:3",
                    text: "You have tried my heart;\n  You have visited me by night;\n  You have tested me and You find nothing;\n  I have purposed that my mouth will not transgress.",
                    prayer: "Lord, search my heart and examine my thoughts. Reveal anything within me that needs to change and help me grow in holiness."
                ),
                PrayerVerse(
                    id: "psalm-17-4",
                    reference: "Psalm 17:4",
                    text: "As for the deeds of men, by the word of Your lips\n  I have kept from the paths of the violent.",
                    prayer: "Father, protect me from paths that lead to sin and destruction. Strengthen me to walk according to Your Word and Your truth."
                ),
                PrayerVerse(
                    id: "psalm-17-5",
                    reference: "Psalm 17:5",
                    text: "My steps have held fast to Your paths.\n  My feet have not slipped.",
                    prayer: "Lord, establish my steps and keep me from stumbling. Help me remain faithful and steady in my walk with You."
                ),
                PrayerVerse(
                    id: "psalm-17-6",
                    reference: "Psalm 17:6",
                    text: "I have called upon You, for You will answer me, O God;\n  Incline Your ear to me, hear my speech.",
                    prayer: "Father, thank You that I can call upon You and know that You hear me. Increase my confidence in Your faithfulness and care."
                ),
                PrayerVerse(
                    id: "psalm-17-7",
                    reference: "Psalm 17:7",
                    text: "Wondrously show Your lovingkindness,\n  O Savior of those who take refuge at Your right hand\n  From those who rise up against them.",
                    prayer: "Lord, display the wonders of Your lovingkindness in my life. Let Your mercy and grace be evident in every circumstance I face."
                ),
                PrayerVerse(
                    id: "psalm-17-8",
                    reference: "Psalm 17:8",
                    text: "Keep me as the apple of the eye;\n  Hide me in the shadow of Your wings",
                    prayer: "Father, keep me as the apple of Your eye and hide me under the shadow of Your wings. Help me rest securely in Your protection."
                ),
                PrayerVerse(
                    id: "psalm-17-9",
                    reference: "Psalm 17:9",
                    text: "From the wicked who despoil me,\n  My deadly enemies who surround me.",
                    prayer: "Lord, defend me from spiritual attacks, temptation, and anything that seeks to draw me away from You."
                ),
                PrayerVerse(
                    id: "psalm-17-10",
                    reference: "Psalm 17:10",
                    text: "They have closed their unfeeling heart,\n  With their mouth they speak proudly.",
                    prayer: "Father, guard my heart from pride and selfishness. Teach me humility and dependence upon Your grace."
                ),
                PrayerVerse(
                    id: "psalm-17-11",
                    reference: "Psalm 17:11",
                    text: "They have now surrounded us in our steps;\n  They set their eyes to cast us down to the ground.",
                    prayer: "Lord, when I feel surrounded by difficulties, remind me that You are near and that nothing can separate me from Your love."
                ),
                PrayerVerse(
                    id: "psalm-17-12",
                    reference: "Psalm 17:12",
                    text: "He is like a lion that is eager to tear,\n  And as a young lion lurking in hiding places.",
                    prayer: "Father, strengthen me when I face opposition or fear. Help me trust that You are greater than every challenge before me."
                ),
                PrayerVerse(
                    id: "psalm-17-13",
                    reference: "Psalm 17:13",
                    text: "Arise, O Lord, confront him, bring him low;\n  Deliver my soul from the wicked with Your sword,",
                    prayer: "Lord, arise and be my defender. Fight the battles I cannot fight on my own and give me victory according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-17-14",
                    reference: "Psalm 17:14",
                    text: "From men with Your hand, O Lord,\n  From men of the world, whose portion is in this life,\n  And whose belly You fill with Your treasure;\n  They are satisfied with children,\n  And leave their abundance to their babes.",
                    prayer: "Father, help me value eternal treasures above earthly possessions. Let my heart be focused on Your kingdom rather than temporary things."
                ),
                PrayerVerse(
                    id: "psalm-17-15",
                    reference: "Psalm 17:15",
                    text: "As for me, I shall behold Your face in righteousness;\n  I will be satisfied with Your likeness when I awake.",
                    prayer: "Lord, my greatest desire is to be in Your presence. Continue transforming me into Your likeness and satisfy my soul with Your love."
                ),
                PrayerVerse(
                    id: "psalm-17-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing my prayers, protecting me, and guiding my steps. Search my heart, keep me close to You, and help me walk faithfully in Your ways. When challenges arise, remind me that I am secure in Your care and that my greatest joy is found in Your presence. Transform me daily into the person You have called me to be.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 18,
            title: "I Love You, Lord",
            chapterReference: "Psalm 18",
            summary: "Pray in gratitude for God's deliverance and strength.",
            verses: [
                PrayerVerse(
                    id: "psalm-18-1",
                    reference: "Psalm 18:1",
                    text: "“I love You, O Lord, my strength.”",
                    prayer: "Lord, I love You because You are my strength. Thank You for sustaining me through every season and giving me power when I feel weak."
                ),
                PrayerVerse(
                    id: "psalm-18-2",
                    reference: "Psalm 18:2",
                    text: "The Lord is my rock and my fortress and my deliverer,\n  My God, my rock, in whom I take refuge;\n  My shield and the horn of my salvation, my stronghold.",
                    prayer: "Father, You are my rock, my fortress, and my deliverer. Help me place my trust completely in Your protection and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-18-3",
                    reference: "Psalm 18:3",
                    text: "I call upon the Lord, who is worthy to be praised,\n  And I am saved from my enemies.",
                    prayer: "Lord, I call upon You because You are worthy of praise. Thank You for hearing my prayers and rescuing me from fear and trouble."
                ),
                PrayerVerse(
                    id: "psalm-18-4",
                    reference: "Psalm 18:4",
                    text: "The cords of death encompassed me,\n  And the torrents of ungodliness terrified me.",
                    prayer: "Father, when difficulties surround me and I feel overwhelmed, remind me that You are greater than every trial I face."
                ),
                PrayerVerse(
                    id: "psalm-18-5",
                    reference: "Psalm 18:5",
                    text: "The cords of Sheol surrounded me;\n  The snares of death confronted me.",
                    prayer: "Lord, when I feel trapped by fear, anxiety, or discouragement, deliver me and lead me into Your peace."
                ),
                PrayerVerse(
                    id: "psalm-18-6",
                    reference: "Psalm 18:6",
                    text: "In my distress I called upon the Lord,\n  And cried to my God for help;\n  He heard my voice out of His temple,\n  And my cry for help before Him came into His ears.",
                    prayer: "Father, thank You that I can call upon You in my distress and know that You hear my voice."
                ),
                PrayerVerse(
                    id: "psalm-18-7",
                    reference: "Psalm 18:7",
                    text: "Then the earth shook and quaked;\n  And the foundations of the mountains were trembling\n  And were shaken, because He was angry.",
                    prayer: "Lord, display Your power in my life. Help me remember that nothing is impossible for You."
                ),
                PrayerVerse(
                    id: "psalm-18-8",
                    reference: "Psalm 18:8",
                    text: "Smoke went up out of His nostrils,\n  And fire from His mouth devoured;\n  Coals were kindled by it.",
                    prayer: "Father, You are holy and mighty. Fill me with reverence and awe for Your greatness."
                ),
                PrayerVerse(
                    id: "psalm-18-9",
                    reference: "Psalm 18:9",
                    text: "He bowed the heavens also, and came down\n  With thick darkness under His feet.",
                    prayer: "Lord, thank You that You draw near to Your people. Help me recognize Your presence even in difficult moments."
                ),
                PrayerVerse(
                    id: "psalm-18-10",
                    reference: "Psalm 18:10",
                    text: "He rode upon a cherub and flew;\n  And He sped upon the wings of the wind.",
                    prayer: "Father, You move with power and authority. Strengthen my faith in Your ability to accomplish Your purposes."
                ),
                PrayerVerse(
                    id: "psalm-18-11",
                    reference: "Psalm 18:11",
                    text: "He made darkness His hiding place, His canopy around Him,\n  Darkness of waters, thick clouds of the skies.",
                    prayer: "Lord, even when I cannot clearly see what You are doing, help me trust Your wisdom and guidance."
                ),
                PrayerVerse(
                    id: "psalm-18-12",
                    reference: "Psalm 18:12",
                    text: "From the brightness before Him passed His thick clouds,\n  Hailstones and coals of fire.",
                    prayer: "Father, let Your light shine into every dark place of my life and reveal Your truth."
                ),
                PrayerVerse(
                    id: "psalm-18-13",
                    reference: "Psalm 18:13",
                    text: "The Lord also thundered in the heavens,\n  And the Most High uttered His voice,\n  Hailstones and coals of fire.",
                    prayer: "Lord, Your voice is powerful and majestic. Help me listen carefully and obey when You speak through Your Word."
                ),
                PrayerVerse(
                    id: "psalm-18-14",
                    reference: "Psalm 18:14",
                    text: "He sent out His arrows, and scattered them,\n  And lightning flashes in abundance, and routed them.",
                    prayer: "Father, fight the battles I cannot fight alone. Defend me against every spiritual attack and temptation."
                ),
                PrayerVerse(
                    id: "psalm-18-15",
                    reference: "Psalm 18:15",
                    text: "Then the channels of water appeared,\n  And the foundations of the world were laid bare\n  At Your rebuke, O Lord,\n  At the blast of the breath of Your nostrils.",
                    prayer: "Lord, thank You for revealing Your power and faithfulness throughout history and in my own life."
                ),
                PrayerVerse(
                    id: "psalm-18-16",
                    reference: "Psalm 18:16",
                    text: "He sent from on high, He took me;\n  He drew me out of many waters.",
                    prayer: "Father, reach down and lift me up when I feel overwhelmed. Rescue me from despair and strengthen my heart."
                ),
                PrayerVerse(
                    id: "psalm-18-17",
                    reference: "Psalm 18:17",
                    text: "He delivered me from my strong enemy,\n  And from those who hated me, for they were too mighty for me.",
                    prayer: "Lord, deliver me from challenges that are too great for me to overcome on my own. Be my source of victory and hope."
                ),
                PrayerVerse(
                    id: "psalm-18-18",
                    reference: "Psalm 18:18",
                    text: "They confronted me in the day of my calamity,\n  But the Lord was my stay.",
                    prayer: "Father, when trouble comes unexpectedly, help me lean upon You and trust Your support."
                ),
                PrayerVerse(
                    id: "psalm-18-19",
                    reference: "Psalm 18:19",
                    text: "He brought me forth also into a broad place;\n  He rescued me, because He delighted in me.",
                    prayer: "Lord, thank You for bringing me into a place of freedom. Help me walk confidently in the liberty You provide."
                ),
                PrayerVerse(
                    id: "psalm-18-20",
                    reference: "Psalm 18:20",
                    text: "The Lord has rewarded me according to my righteousness;\n  According to the cleanness of my hands He has recompensed me.",
                    prayer: "Father, help me pursue righteousness and integrity in every area of my life."
                ),
                PrayerVerse(
                    id: "psalm-18-21",
                    reference: "Psalm 18:21",
                    text: "For I have kept the ways of the Lord,\n  And have not wickedly departed from my God.",
                    prayer: "Lord, strengthen me to remain faithful to Your ways and not turn away from Your truth."
                ),
                PrayerVerse(
                    id: "psalm-18-22",
                    reference: "Psalm 18:22",
                    text: "For all His ordinances were before me,\n  And I did not put away His statutes from me.",
                    prayer: "Father, help me keep Your Word before me and apply it daily to my life."
                ),
                PrayerVerse(
                    id: "psalm-18-23",
                    reference: "Psalm 18:23",
                    text: "I was also blameless with Him,\n  And I kept myself from my iniquity.",
                    prayer: "Lord, guard me from sin and help me walk with a sincere and wholehearted devotion to You."
                ),
                PrayerVerse(
                    id: "psalm-18-24",
                    reference: "Psalm 18:24",
                    text: "Therefore the Lord has recompensed me according to my righteousness,\n  According to the cleanness of my hands in His eyes.",
                    prayer: "Father, thank You for seeing every act of faithfulness and every step of obedience."
                ),
                PrayerVerse(
                    id: "psalm-18-25",
                    reference: "Psalm 18:25",
                    text: "With the kind You show Yourself kind;\n  With the blameless You show Yourself blameless;",
                    prayer: "Lord, help me reflect Your mercy by showing grace and compassion to others."
                ),
                PrayerVerse(
                    id: "psalm-18-26",
                    reference: "Psalm 18:26",
                    text: "With the pure You show Yourself pure,\n  And with the crooked You show Yourself astute.",
                    prayer: "Father, purify my heart and help me walk in humility and truth before You."
                ),
                PrayerVerse(
                    id: "psalm-18-27",
                    reference: "Psalm 18:27",
                    text: "For You save an afflicted people,\n  But haughty eyes You abase.",
                    prayer: "Lord, thank You for lifting up the humble and helping those who place their trust in You."
                ),
                PrayerVerse(
                    id: "psalm-18-28",
                    reference: "Psalm 18:28",
                    text: "For You light my lamp;\n  The Lord my God illumines my darkness.",
                    prayer: "Father, be the light that guides my path and illuminates every decision I make."
                ),
                PrayerVerse(
                    id: "psalm-18-29",
                    reference: "Psalm 18:29",
                    text: "For by You I can run upon a troop;\n  And by my God I can leap over a wall.",
                    prayer: "Lord, with Your strength I can overcome obstacles that seem impossible. Increase my faith and courage."
                ),
                PrayerVerse(
                    id: "psalm-18-30",
                    reference: "Psalm 18:30",
                    text: "As for God, His way is blameless;\n  The word of the Lord is tried;\n  He is a shield to all who take refuge in Him.",
                    prayer: "Father, Your way is perfect and Your Word is proven true. Help me trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-18-31",
                    reference: "Psalm 18:31",
                    text: "For who is God, but the Lord?\n  And who is a rock, except our God,",
                    prayer: "Lord, there is no rock like You. Keep my foundation secure in Your unchanging character."
                ),
                PrayerVerse(
                    id: "psalm-18-32",
                    reference: "Psalm 18:32",
                    text: "The God who girds me with strength\n  And makes my way blameless?",
                    prayer: "Father, equip me with strength and help me walk confidently in the path You have prepared for me."
                ),
                PrayerVerse(
                    id: "psalm-18-33",
                    reference: "Psalm 18:33",
                    text: "He makes my feet like hinds’ feet,\n  And sets me upon my high places.",
                    prayer: "Lord, give me stability and confidence when life feels uncertain."
                ),
                PrayerVerse(
                    id: "psalm-18-34",
                    reference: "Psalm 18:34",
                    text: "He trains my hands for battle,\n  So that my arms can bend a bow of bronze.",
                    prayer: "Father, prepare me for every challenge and help me stand firm in faith."
                ),
                PrayerVerse(
                    id: "psalm-18-35",
                    reference: "Psalm 18:35",
                    text: "You have also given me the shield of Your salvation,\n  And Your right hand upholds me;\n  And Your gentleness makes me great.",
                    prayer: "Lord, thank You for Your salvation and Your gentle care. Your kindness has sustained me throughout my life."
                ),
                PrayerVerse(
                    id: "psalm-18-36",
                    reference: "Psalm 18:36",
                    text: "You enlarge my steps under me,\n  And my feet have not slipped.",
                    prayer: "Father, direct my steps and keep me from stumbling as I follow You."
                ),
                PrayerVerse(
                    id: "psalm-18-37",
                    reference: "Psalm 18:37",
                    text: "I pursued my enemies and overtook them,\n  And I did not turn back until they were consumed.",
                    prayer: "Lord, help me persevere through every challenge and remain faithful until the end."
                ),
                PrayerVerse(
                    id: "psalm-18-38",
                    reference: "Psalm 18:38",
                    text: "I shattered them, so that they were not able to rise;\n  They fell under my feet.",
                    prayer: "Father, give me victory over the sins, fears, and obstacles that seek to hinder my walk with You."
                ),
                PrayerVerse(
                    id: "psalm-18-39",
                    reference: "Psalm 18:39",
                    text: "For You have girded me with strength for battle;\n  You have subdued under me those who rose up against me.",
                    prayer: "Lord, strengthen me for every battle and remind me that true victory comes from You."
                ),
                PrayerVerse(
                    id: "psalm-18-40",
                    reference: "Psalm 18:40",
                    text: "You have also made my enemies turn their backs to me,\n  And I destroyed those who hated me.",
                    prayer: "Father, protect me from those things that seek to pull me away from Your will."
                ),
                PrayerVerse(
                    id: "psalm-18-41",
                    reference: "Psalm 18:41",
                    text: "They cried for help, but there was none to save,\n  Even to the Lord, but He did not answer them.",
                    prayer: "Lord, help me seek You first in every circumstance and trust You above all else."
                ),
                PrayerVerse(
                    id: "psalm-18-42",
                    reference: "Psalm 18:42",
                    text: "Then I beat them fine as the dust before the wind;\n  I emptied them out as the mire of the streets.",
                    prayer: "Father, remove pride, selfishness, and anything that prevents me from growing closer to You."
                ),
                PrayerVerse(
                    id: "psalm-18-43",
                    reference: "Psalm 18:43",
                    text: "You have delivered me from the contentions of the people;\n  You have placed me as head of the nations;\n  A people whom I have not known serve me.",
                    prayer: "Lord, thank You for Your deliverance and faithfulness throughout every season of life."
                ),
                PrayerVerse(
                    id: "psalm-18-44",
                    reference: "Psalm 18:44",
                    text: "As soon as they hear, they obey me;\n  Foreigners submit to me.",
                    prayer: "Father, may my life be a testimony that points others toward Your goodness and grace."
                ),
                PrayerVerse(
                    id: "psalm-18-45",
                    reference: "Psalm 18:45",
                    text: "Foreigners fade away,\n  And come trembling out of their fortresses.",
                    prayer: "Lord, help me remain steadfast and faithful regardless of changing circumstances."
                ),
                PrayerVerse(
                    id: "psalm-18-46",
                    reference: "Psalm 18:46",
                    text: "The Lord lives, and blessed be my rock;\n  And exalted be the God of my salvation,",
                    prayer: "Father, You live and reign forever. May my heart continually praise and exalt Your holy name."
                ),
                PrayerVerse(
                    id: "psalm-18-47",
                    reference: "Psalm 18:47",
                    text: "The God who executes vengeance for me,\n  And subdues peoples under me.",
                    prayer: "Lord, thank You for bringing justice and establishing Your purposes in my life."
                ),
                PrayerVerse(
                    id: "psalm-18-48",
                    reference: "Psalm 18:48",
                    text: "He delivers me from my enemies;\n  Surely You lift me above those who rise up against me;\n  You rescue me from the violent man.",
                    prayer: "Father, rescue me from every form of evil and help me walk securely in Your protection."
                ),
                PrayerVerse(
                    id: "psalm-18-49",
                    reference: "Psalm 18:49",
                    text: "Therefore I will give thanks to You among the nations, O Lord,\n  And I will sing praises to Your name.",
                    prayer: "Lord, I will give thanks to You among all people and praise Your name for Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-18-50",
                    reference: "Psalm 18:50",
                    text: "He gives great deliverance to His king,\n  And shows lovingkindness to His anointed,\n  To David and his descendants forever.",
                    prayer: "Father, thank You for Your steadfast love, Your salvation, and Your covenant faithfulness that endures forever."
                ),
                PrayerVerse(
                    id: "psalm-18-closing",
                    reference: "Closing",
                    text: "Lord, You are my rock, my fortress, and my deliverer. Thank You for Your strength, protection, and unfailing love. Through every trial, victory, and season of life, help me trust in Your perfect ways and rely on Your power rather than my own. Guide my steps, strengthen my faith, and fill my heart with gratitude as I walk closely with You each day.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 19,
            title: "The Heavens Declare",
            chapterReference: "Psalm 19",
            summary: "Pray in awe of God's creation and Word.",
            verses: [
                PrayerVerse(
                    id: "psalm-19-1",
                    reference: "Psalm 19:1",
                    text: "The heavens are telling of the glory of God;\n  And their expanse is declaring the work of His hands.",
                    prayer: "Lord, the heavens declare Your glory and creation displays Your handiwork. Help me recognize Your greatness wherever I look and worship You with wonder and gratitude."
                ),
                PrayerVerse(
                    id: "psalm-19-2",
                    reference: "Psalm 19:2",
                    text: "Day to day pours forth speech,\n  And night to night reveals knowledge.",
                    prayer: "Father, thank You that creation continually testifies to Your wisdom and power. Open my eyes to see Your presence in the world around me."
                ),
                PrayerVerse(
                    id: "psalm-19-3",
                    reference: "Psalm 19:3",
                    text: "There is no speech, nor are there words;\n  Their voice is not heard.",
                    prayer: "Lord, even when words are not spoken, Your creation proclaims Your majesty. Help me listen carefully to the ways You reveal Yourself."
                ),
                PrayerVerse(
                    id: "psalm-19-4",
                    reference: "Psalm 19:4",
                    text: "Their line has gone out through all the earth,\n  And their utterances to the end of the world.\n  In them He has placed a tent for the sun,",
                    prayer: "Father, Your witness extends throughout the earth. Let my life also be a testimony that points others toward Your goodness and truth."
                ),
                PrayerVerse(
                    id: "psalm-19-5",
                    reference: "Psalm 19:5",
                    text: "Which is as a bridegroom coming out of his chamber;\n  It rejoices as a strong man to run his course.",
                    prayer: "Lord, thank You for the beauty, order, and purpose found in Your creation. Remind me that You are faithful and consistent in all Your ways."
                ),
                PrayerVerse(
                    id: "psalm-19-6",
                    reference: "Psalm 19:6",
                    text: "Its rising is from one end of the heavens,\n  And its circuit to the other end of them;\n  And there is nothing hidden from its heat.",
                    prayer: "Father, just as the sun reaches every part of the earth, let Your light shine into every area of my life and transform my heart."
                ),
                PrayerVerse(
                    id: "psalm-19-7",
                    reference: "Psalm 19:7",
                    text: "The law of the Lord is perfect, restoring the soul;\n  The testimony of the Lord is sure, making wise the simple.",
                    prayer: "Lord, thank You for Your perfect Word that restores the soul. Help me delight in Scripture and allow it to guide my thoughts and actions."
                ),
                PrayerVerse(
                    id: "psalm-19-8",
                    reference: "Psalm 19:8",
                    text: "The precepts of the Lord are right, rejoicing the heart;\n  The commandment of the Lord is pure, enlightening the eyes.",
                    prayer: "Father, Your commandments are right and bring joy to the heart. Teach me to obey You with gladness and trust."
                ),
                PrayerVerse(
                    id: "psalm-19-9",
                    reference: "Psalm 19:9",
                    text: "The fear of the Lord is clean, enduring forever;\n  The judgments of the Lord are true; they are righteous altogether.",
                    prayer: "Lord, Your truth is pure and enduring. Help me build my life upon what is eternal rather than what is temporary."
                ),
                PrayerVerse(
                    id: "psalm-19-10",
                    reference: "Psalm 19:10",
                    text: "They are more desirable than gold, yes, than much fine gold;\n  Sweeter also than honey and the drippings of the honeycomb.",
                    prayer: "Father, let me treasure Your Word above worldly riches and pleasures. Help me value Your wisdom above all else."
                ),
                PrayerVerse(
                    id: "psalm-19-11",
                    reference: "Psalm 19:11",
                    text: "Moreover, by them Your servant is warned;\n  In keeping them there is great reward.",
                    prayer: "Lord, thank You for warning, teaching, and guiding me through Your Word. Keep me attentive to Your instruction each day."
                ),
                PrayerVerse(
                    id: "psalm-19-12",
                    reference: "Psalm 19:12",
                    text: "Who can discern his errors? Acquit me of hidden faults.",
                    prayer: "Father, reveal hidden sins and blind spots within my heart. Help me repent quickly and walk in humility before You."
                ),
                PrayerVerse(
                    id: "psalm-19-13",
                    reference: "Psalm 19:13",
                    text: "Also keep back Your servant from presumptuous sins;\n  Let them not rule over me;\n  Then I will be blameless,\n  And I shall be acquitted of great transgression.",
                    prayer: "Lord, keep me from willful sin and protect me from anything that seeks to control my life apart from You."
                ),
                PrayerVerse(
                    id: "psalm-19-14",
                    reference: "Psalm 19:14",
                    text: "Let the words of my mouth and the meditation of my heart\n  Be acceptable in Your sight,\n  O Lord, my rock and my Redeemer.",
                    prayer: "Father, let the words of my mouth and the meditation of my heart be pleasing in Your sight. You are my Rock and my Redeemer."
                ),
                PrayerVerse(
                    id: "psalm-19-closing",
                    reference: "Closing",
                    text: "Lord, thank You for revealing Yourself through creation and through Your Word. Open my eyes to Your glory, teach me Your truth, and transform my heart through Your presence. Help me treasure Your wisdom, walk in obedience, and honor You with my thoughts, words, and actions. May my life reflect Your goodness and bring glory to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 20,
            title: "May the Lord Answer",
            chapterReference: "Psalm 20",
            summary: "Pray for trust in God's name and strength.",
            verses: [
                PrayerVerse(
                    id: "psalm-20-1",
                    reference: "Psalm 20:1",
                    text: "May the Lord answer you in the day of trouble!\n  May the name of the God of Jacob set you securely on high!",
                    prayer: "Lord, in times of trouble, thank You for hearing my prayers. Be my refuge, my strength, and my help when I need You most."
                ),
                PrayerVerse(
                    id: "psalm-20-2",
                    reference: "Psalm 20:2",
                    text: "May He send you help from the sanctuary\n  And support you from Zion!",
                    prayer: "Father, send Your help from Your holy presence. Strengthen me and provide exactly what I need for every challenge before me."
                ),
                PrayerVerse(
                    id: "psalm-20-3",
                    reference: "Psalm 20:3",
                    text: "May He remember all your meal offerings\n  And find your burnt offering acceptable! Selah.",
                    prayer: "Lord, receive my worship and devotion. Help me honor You with a sincere heart and a life that brings glory to Your name."
                ),
                PrayerVerse(
                    id: "psalm-20-4",
                    reference: "Psalm 20:4",
                    text: "May He grant you your heart’s desire\n  And fulfill all your counsel!",
                    prayer: "Father, align my desires with Your will. Fulfill the plans and purposes You have prepared for my life according to Your wisdom."
                ),
                PrayerVerse(
                    id: "psalm-20-5",
                    reference: "Psalm 20:5",
                    text: "We will sing for joy over your victory,\n  And in the name of our God we will set up our banners.\n  May the Lord fulfill all your petitions.",
                    prayer: "Lord, let my life be marked by joy in Your salvation. May every victory point back to Your faithfulness and goodness."
                ),
                PrayerVerse(
                    id: "psalm-20-6",
                    reference: "Psalm 20:6",
                    text: "Now I know that the Lord saves His anointed;\n  He will answer him from His holy heaven\n  With the saving strength of His right hand.",
                    prayer: "Father, thank You for hearing the prayers of Your people. Help me trust that You are working even when I cannot yet see the answer."
                ),
                PrayerVerse(
                    id: "psalm-20-7",
                    reference: "Psalm 20:7",
                    text: "Some boast in chariots and some in horses,\n  But we will boast in the name of the Lord, our God.",
                    prayer: "Lord, teach me to trust in Your name above all earthly power, resources, abilities, or possessions. You alone are my confidence."
                ),
                PrayerVerse(
                    id: "psalm-20-8",
                    reference: "Psalm 20:8",
                    text: "They have bowed down and fallen,\n  But we have risen and stood upright.",
                    prayer: "Father, when others stumble because they rely on temporary things, help me stand firm because my hope is rooted in You."
                ),
                PrayerVerse(
                    id: "psalm-20-9",
                    reference: "Psalm 20:9",
                    text: "Save, O Lord;\n  May the King answer us in the day we call.",
                    prayer: "Lord, You are King over all. Hear my prayers and guide my life according to Your perfect will and purpose."
                ),
                PrayerVerse(
                    id: "psalm-20-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing my prayers and being my source of strength and salvation. Help me trust in You above all else and place my confidence in Your power rather than my own abilities. Align my heart with Your will, establish my steps, and remind me that every victory comes from Your hand. May my life bring honor and glory to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 21,
            title: "The King Rejoices",
            chapterReference: "Psalm 21",
            summary: "Pray with gratitude for God's blessings and faithfulness.",
            verses: [
                PrayerVerse(
                    id: "psalm-21-1",
                    reference: "Psalm 21:1",
                    text: "O Lord, in Your strength the king will be glad,\n  And in Your salvation how greatly he will rejoice!",
                    prayer: "Lord, I rejoice in Your strength and power. Thank You for sustaining me and giving me victory through Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-21-2",
                    reference: "Psalm 21:2",
                    text: "You have given him his heart’s desire,\n  And You have not withheld the request of his lips. Selah.",
                    prayer: "Father, thank You for hearing the desires of my heart when they align with Your will. Help me trust Your timing and Your answers."
                ),
                PrayerVerse(
                    id: "psalm-21-3",
                    reference: "Psalm 21:3",
                    text: "For You meet him with the blessings of good things;\n  You set a crown of fine gold on his head.",
                    prayer: "Lord, thank You for the blessings You pour into my life. Help me recognize Your goodness and respond with gratitude."
                ),
                PrayerVerse(
                    id: "psalm-21-4",
                    reference: "Psalm 21:4",
                    text: "He asked life of You,\n  You gave it to him,\n  Length of days forever and ever.",
                    prayer: "Father, thank You for the gift of life and the hope of eternity through Jesus Christ. Help me live each day with purpose and faith."
                ),
                PrayerVerse(
                    id: "psalm-21-5",
                    reference: "Psalm 21:5",
                    text: "His glory is great through Your salvation,\n  Splendor and majesty You place upon him.",
                    prayer: "Lord, all honor and glory belong to You. Keep me humble and remind me that every good thing comes from Your hand."
                ),
                PrayerVerse(
                    id: "psalm-21-6",
                    reference: "Psalm 21:6",
                    text: "For You make him most blessed forever;\n  You make him joyful with gladness in Your presence.",
                    prayer: "Father, thank You for the joy found in Your presence. Let my heart remain anchored in the peace and gladness You provide."
                ),
                PrayerVerse(
                    id: "psalm-21-7",
                    reference: "Psalm 21:7",
                    text: "For the king trusts in the Lord,\n  And through the lovingkindness of the Most High he will not be shaken.",
                    prayer: "Lord, help me trust in Your unfailing love. When challenges arise, strengthen my faith and keep me steady in You."
                ),
                PrayerVerse(
                    id: "psalm-21-8",
                    reference: "Psalm 21:8",
                    text: "Your hand will find out all your enemies;\n  Your right hand will find out those who hate you.",
                    prayer: "Father, nothing escapes Your notice. Thank You that You see every situation and that Your justice is perfect."
                ),
                PrayerVerse(
                    id: "psalm-21-9",
                    reference: "Psalm 21:9",
                    text: "You will make them as a fiery oven in the time of your anger;\n  The Lord will swallow them up in His wrath,\n  And fire will devour them.",
                    prayer: "Lord, remind me that You are holy and righteous. Help me live with reverence for You and confidence in Your authority."
                ),
                PrayerVerse(
                    id: "psalm-21-10",
                    reference: "Psalm 21:10",
                    text: "Their offspring You will destroy from the earth,\n  And their descendants from among the sons of men.",
                    prayer: "Father, establish Your purposes from generation to generation. Let my life be part of the legacy of faith that points others to You."
                ),
                PrayerVerse(
                    id: "psalm-21-11",
                    reference: "Psalm 21:11",
                    text: "Though they intended evil against You\n  And devised a plot,\n  They will not succeed.",
                    prayer: "Lord, protect me from evil plans and harmful influences. Give me wisdom to recognize temptation and strength to resist it."
                ),
                PrayerVerse(
                    id: "psalm-21-12",
                    reference: "Psalm 21:12",
                    text: "For You will make them turn their back;\n  You will aim with Your bowstrings at their faces.",
                    prayer: "Father, thank You that no power can overcome Your will. Help me trust in Your sovereignty over every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-21-13",
                    reference: "Psalm 21:13",
                    text: "Be exalted, O Lord, in Your strength;\n  We will sing and praise Your power.",
                    prayer: "Lord, be exalted in all the earth. May my life continually praise You and proclaim Your greatness."
                ),
                PrayerVerse(
                    id: "psalm-21-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your strength, Your blessings, and Your unfailing love. Help me trust You in every season, rejoice in Your faithfulness, and remain humble before You. Fill my heart with gratitude, strengthen my faith, and let my life bring honor and glory to Your name. May I find lasting joy in Your presence and confidence in Your power.",
                    prayer: "In Jesus’name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 22,
            title: "My God, My God",
            chapterReference: "Psalm 22",
            summary: "Pray through suffering with hope in God's deliverance.",
            verses: [
                PrayerVerse(
                    id: "psalm-22-1",
                    reference: "Psalm 22:1",
                    text: "My God, my God, why have You forsaken me?\n  Far from my deliverance are the words of my groaning.",
                    prayer: "Lord, when I feel alone, forgotten, or distant from Your presence, help me trust that You are still with me and that Your love never fails."
                ),
                PrayerVerse(
                    id: "psalm-22-2",
                    reference: "Psalm 22:2",
                    text: "O my God, I cry by day, but You do not answer;\n  And by night, but I have no rest.",
                    prayer: "Father, when my prayers seem unanswered, give me perseverance to continue seeking You and confidence that You hear every cry of my heart."
                ),
                PrayerVerse(
                    id: "psalm-22-3",
                    reference: "Psalm 22:3",
                    text: "Yet You are holy,\n  O You who are enthroned upon the praises of Israel.",
                    prayer: "Lord, You are holy and worthy of all praise. Help me worship You even in difficult seasons and trust in Your perfect character."
                ),
                PrayerVerse(
                    id: "psalm-22-4",
                    reference: "Psalm 22:4",
                    text: "In You our fathers trusted;\n  They trusted and You delivered them.",
                    prayer: "Father, thank You for Your faithfulness throughout generations. Strengthen my faith as I remember how You have cared for Your people."
                ),
                PrayerVerse(
                    id: "psalm-22-5",
                    reference: "Psalm 22:5",
                    text: "To You they cried out and were delivered;\n  In You they trusted and were not disappointed.",
                    prayer: "Lord, help me trust in You completely. Remind me that those who place their hope in You are never ultimately disappointed."
                ),
                PrayerVerse(
                    id: "psalm-22-6",
                    reference: "Psalm 22:6",
                    text: "But I am a worm and not a man,\n  A reproach of men and despised by the people.",
                    prayer: "Father, when I feel rejected, insignificant, or misunderstood, remind me of my value in Your eyes and Your unfailing love for me."
                ),
                PrayerVerse(
                    id: "psalm-22-7",
                    reference: "Psalm 22:7",
                    text: "All who see me sneer at me;\n  They separate with the lip, they wag the head, saying,",
                    prayer: "Lord, help me endure criticism, rejection, and mockery with grace, keeping my focus on You rather than the opinions of others."
                ),
                PrayerVerse(
                    id: "psalm-22-8",
                    reference: "Psalm 22:8",
                    text: "“Commit yourself to the Lord; let Him deliver him;\n  Let Him rescue him, because He delights in him.”",
                    prayer: "Father, teach me to trust You deeply, knowing that You are faithful even when circumstances are difficult to understand."
                ),
                PrayerVerse(
                    id: "psalm-22-9",
                    reference: "Psalm 22:9",
                    text: "Yet You are He who brought me forth from the womb;\n  You made me trust when upon my mother’s breasts.",
                    prayer: "Lord, thank You for watching over me from the very beginning of my life. Help me rest in Your care and provision."
                ),
                PrayerVerse(
                    id: "psalm-22-10",
                    reference: "Psalm 22:10",
                    text: "Upon You I was cast from birth;\n  You have been my God from my mother’s womb.",
                    prayer: "Father, You have been faithful through every season. Strengthen my confidence in Your continued presence and guidance."
                ),
                PrayerVerse(
                    id: "psalm-22-11",
                    reference: "Psalm 22:11",
                    text: "Be not far from me, for trouble is near;\n  For there is none to help.",
                    prayer: "Lord, stay near to me in times of trouble. Help me remember that I never face challenges alone because You are with me."
                ),
                PrayerVerse(
                    id: "psalm-22-12",
                    reference: "Psalm 22:12",
                    text: "Many bulls have surrounded me;\n  Strong bulls of Bashan have encircled me.",
                    prayer: "Father, when I feel surrounded by difficulties and pressures, remind me that You are greater than every obstacle before me."
                ),
                PrayerVerse(
                    id: "psalm-22-13",
                    reference: "Psalm 22:13",
                    text: "They open wide their mouth at me,\n  As a ravening and a roaring lion.",
                    prayer: "Lord, protect me from fear and discouragement. Help me stand firm in faith when life feels overwhelming."
                ),
                PrayerVerse(
                    id: "psalm-22-14",
                    reference: "Psalm 22:14",
                    text: "I am poured out like water,\n  And all my bones are out of joint;\n  My heart is like wax;\n  It is melted within me.",
                    prayer: "Father, when I feel weak and exhausted, renew my strength and sustain me with Your power."
                ),
                PrayerVerse(
                    id: "psalm-22-15",
                    reference: "Psalm 22:15",
                    text: "My strength is dried up like a potsherd,\n  And my tongue cleaves to my jaws;\n  And You lay me in the dust of death.",
                    prayer: "Lord, satisfy my thirsty soul with Your presence. Refresh me spiritually and draw me closer to You."
                ),
                PrayerVerse(
                    id: "psalm-22-16",
                    reference: "Psalm 22:16",
                    text: "For dogs have surrounded me;\n  A band of evildoers has encompassed me;\n  They pierced my hands and my feet.",
                    prayer: "Father, protect me from harm and from those things that seek to pull me away from Your will."
                ),
                PrayerVerse(
                    id: "psalm-22-17",
                    reference: "Psalm 22:17",
                    text: "I can count all my bones.\n  They look, they stare at me;",
                    prayer: "Lord, You know every detail of my life and every struggle I face. Help me trust Your care even when I feel vulnerable."
                ),
                PrayerVerse(
                    id: "psalm-22-18",
                    reference: "Psalm 22:18",
                    text: "They divide my garments among them,\n  And for my clothing they cast lots.",
                    prayer: "Father, when circumstances seem unfair, remind me that You remain sovereign and that Your purposes will prevail."
                ),
                PrayerVerse(
                    id: "psalm-22-19",
                    reference: "Psalm 22:19",
                    text: "But You, O Lord, be not far off;\n  O You my help, hasten to my assistance.",
                    prayer: "Lord, do not be far from me. Be my strength and help when I need You most."
                ),
                PrayerVerse(
                    id: "psalm-22-20",
                    reference: "Psalm 22:20",
                    text: "Deliver my soul from the sword,\n  My only life from the power of the dog.",
                    prayer: "Father, rescue me from spiritual danger and guard my heart against temptation and fear."
                ),
                PrayerVerse(
                    id: "psalm-22-21",
                    reference: "Psalm 22:21",
                    text: "Save me from the lion’s mouth;\n  From the horns of the wild oxen You answer me.",
                    prayer: "Lord, thank You for hearing my prayers and delivering me according to Your perfect will."
                ),
                PrayerVerse(
                    id: "psalm-22-22",
                    reference: "Psalm 22:22",
                    text: "I will tell of Your name to my brethren;\n  In the midst of the assembly I will praise You.",
                    prayer: "Father, help me share Your goodness with others and openly declare Your faithfulness in my life."
                ),
                PrayerVerse(
                    id: "psalm-22-23",
                    reference: "Psalm 22:23",
                    text: "You who fear the Lord, praise Him;\n  All you descendants of Jacob, glorify Him,\n  And stand in awe of Him, all you descendants of Israel.",
                    prayer: "Lord, teach me to honor and reverence You with my whole heart. Let my worship be sincere and pleasing to You."
                ),
                PrayerVerse(
                    id: "psalm-22-24",
                    reference: "Psalm 22:24",
                    text: "For He has not despised nor abhorred the affliction of the afflicted;\n  Nor has He hidden His face from him;\n  But when he cried to Him for help, He heard.",
                    prayer: "Father, thank You that You do not ignore those who cry out to You. Help me trust Your compassion and care."
                ),
                PrayerVerse(
                    id: "psalm-22-25",
                    reference: "Psalm 22:25",
                    text: "From You comes my praise in the great assembly;\n  I shall pay my vows before those who fear Him.",
                    prayer: "Lord, let my life continually be filled with praise and gratitude for all You have done."
                ),
                PrayerVerse(
                    id: "psalm-22-26",
                    reference: "Psalm 22:26",
                    text: "The afflicted will eat and be satisfied;\n  Those who seek Him will praise the Lord.\n  Let your heart live forever!",
                    prayer: "Father, satisfy the hungry, encourage the weary, and help me reflect Your generosity toward others."
                ),
                PrayerVerse(
                    id: "psalm-22-27",
                    reference: "Psalm 22:27",
                    text: "All the ends of the earth will remember and turn to the Lord,\n  And all the families of the nations will worship before You.",
                    prayer: "Lord, may people throughout the world come to know and worship You. Use my life to point others toward Your truth."
                ),
                PrayerVerse(
                    id: "psalm-22-28",
                    reference: "Psalm 22:28",
                    text: "For the kingdom is the Lord’s\n  And He rules over the nations.",
                    prayer: "Father, You are King over all nations. Help me trust in Your authority and sovereign rule."
                ),
                PrayerVerse(
                    id: "psalm-22-29",
                    reference: "Psalm 22:29",
                    text: "All the prosperous of the earth will eat and worship,\n  All those who go down to the dust will bow before Him,\n  Even he who cannot keep his soul alive.",
                    prayer: "Lord, remind me that every person ultimately depends upon You. Keep my heart humble before You."
                ),
                PrayerVerse(
                    id: "psalm-22-30",
                    reference: "Psalm 22:30",
                    text: "Posterity will serve Him;\n  It will be told of the Lord to the coming generation.",
                    prayer: "Father, let future generations know Your faithfulness. Help me leave a legacy that honors You."
                ),
                PrayerVerse(
                    id: "psalm-22-31",
                    reference: "Psalm 22:31",
                    text: "They will come and will declare His righteousness\n  To a people who will be born, that He has performed it.",
                    prayer: "Lord, may Your righteousness and salvation be proclaimed to all people. Use my life as a testimony of Your grace and goodness."
                ),
                PrayerVerse(
                    id: "psalm-22-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being near even when I feel alone and for remaining faithful through every trial. Help me trust You in seasons of suffering, weakness, and uncertainty. Strengthen my faith, renew my hope, and fill my heart with praise. May my life testify to Your goodness, and may I always remember that You are my Savior, my King, and my faithful Deliverer.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 23,
            title: "The Lord is My Shepherd",
            chapterReference: "Psalm 23",
            summary: "Pray for peace and trust in God's provision.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 24,
            title: "Lift Up Your Heads",
            chapterReference: "Psalm 24",
            summary: "Pray in worship of the King of glory.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 25,
            title: "To You, O Lord",
            chapterReference: "Psalm 25",
            summary: "Pray for guidance and forgiveness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 26,
            title: "Vindicate Me",
            chapterReference: "Psalm 26",
            summary: "Pray for integrity and faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 27,
            title: "The Lord is My Light",
            chapterReference: "Psalm 27",
            summary: "Pray for courage and confidence in God's presence.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 28,
            title: "To You I Call",
            chapterReference: "Psalm 28",
            summary: "Pray for God to hear and deliver.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 29,
            title: "Ascribe to the Lord",
            chapterReference: "Psalm 29",
            summary: "Pray in worship of God's powerful voice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 30,
            title: "You Lifted Me Up",
            chapterReference: "Psalm 30",
            summary: "Pray in thanksgiving for God's healing and restoration.",
            verses: []
        )
    ]

    // MARK: - Psalms 31-45
    private static let psalms31to45: [PrayerDay] = [
        PrayerDay(
            dayNumber: 31,
            title: "Into Your Hands",
            chapterReference: "Psalm 31",
            summary: "Pray for trust and refuge in times of distress.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 32,
            title: "Blessed is the Forgiven",
            chapterReference: "Psalm 32",
            summary: "Pray for confession and forgiveness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 33,
            title: "Sing Joyfully",
            chapterReference: "Psalm 33",
            summary: "Pray in praise of God's faithfulness and creation.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 34,
            title: "Taste and See",
            chapterReference: "Psalm 34",
            summary: "Pray for trust in God's goodness and deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 35,
            title: "Contend for Me",
            chapterReference: "Psalm 35",
            summary: "Pray for God's defense and vindication.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 36,
            title: "Your Love Reaches",
            chapterReference: "Psalm 36",
            summary: "Pray in awe of God's unfailing love.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 37,
            title: "Do Not Fret",
            chapterReference: "Psalm 37",
            summary: "Pray for patience and trust in God's timing.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 38,
            title: "Do Not Forsake Me",
            chapterReference: "Psalm 38",
            summary: "Pray for healing and God's presence in suffering.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 39,
            title: "Show Me My End",
            chapterReference: "Psalm 39",
            summary: "Pray for perspective and hope.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 40,
            title: "I Waited Patiently",
            chapterReference: "Psalm 40",
            summary: "Pray with gratitude for answered prayer.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 41,
            title: "Blessed is He Who Cares",
            chapterReference: "Psalm 41",
            summary: "Pray for compassion and healing.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 42,
            title: "As the Deer Pants",
            chapterReference: "Psalm 42",
            summary: "Pray for deep longing and hope in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 43,
            title: "Send Your Light",
            chapterReference: "Psalm 43",
            summary: "Pray for guidance and vindication.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 44,
            title: "In God We Make Our Boast",
            chapterReference: "Psalm 44",
            summary: "Pray for trust in God despite difficulties.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 45,
            title: "My Heart Overflows",
            chapterReference: "Psalm 45",
            summary: "Pray in worship of the King.",
            verses: []
        )
    ]

    // MARK: - Psalms 46-60
    private static let psalms46to60: [PrayerDay] = [
        PrayerDay(
            dayNumber: 46,
            title: "God is Our Refuge",
            chapterReference: "Psalm 46",
            summary: "Pray for strength and peace in chaos.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 47,
            title: "Clap Your Hands",
            chapterReference: "Psalm 47",
            summary: "Pray in joyful worship of God's kingship.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 48,
            title: "Great is the Lord",
            chapterReference: "Psalm 48",
            summary: "Pray in praise of God's greatness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 49,
            title: "Why Should I Fear?",
            chapterReference: "Psalm 49",
            summary: "Pray for wisdom about wealth and eternity.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 50,
            title: "The Mighty One Speaks",
            chapterReference: "Psalm 50",
            summary: "Pray for true worship and gratitude.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 51,
            title: "Create in Me a Clean Heart",
            chapterReference: "Psalm 51",
            summary: "Pray for repentance and restoration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 52,
            title: "God Will Bring You Down",
            chapterReference: "Psalm 52",
            summary: "Pray for trust in God's justice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 53,
            title: "Who Will Bring Salvation?",
            chapterReference: "Psalm 53",
            summary: "Pray for God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 54,
            title: "Save Me by Your Name",
            chapterReference: "Psalm 54",
            summary: "Pray for God's powerful help.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 55,
            title: "Cast Your Cares",
            chapterReference: "Psalm 55",
            summary: "Pray for peace in betrayal and pain.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 56,
            title: "When I Am Afraid",
            chapterReference: "Psalm 56",
            summary: "Pray for trust over fear.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 57,
            title: "My Heart is Steadfast",
            chapterReference: "Psalm 57",
            summary: "Pray for confidence in God's mercy.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 58,
            title: "Do You Judge Uprightly?",
            chapterReference: "Psalm 58",
            summary: "Pray for God's righteous judgment.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 59,
            title: "Deliver Me from Enemies",
            chapterReference: "Psalm 59",
            summary: "Pray for protection and deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 60,
            title: "You Have Rejected Us",
            chapterReference: "Psalm 60",
            summary: "Pray for restoration and victory.",
            verses: []
        )
    ]

    // MARK: - Psalms 61-75
    private static let psalms61to75: [PrayerDay] = [
        PrayerDay(
            dayNumber: 61,
            title: "Hear My Cry",
            chapterReference: "Psalm 61",
            summary: "Pray for refuge and security in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 62,
            title: "My Soul Finds Rest",
            chapterReference: "Psalm 62",
            summary: "Pray for quiet trust in God alone.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 63,
            title: "You Are My God",
            chapterReference: "Psalm 63",
            summary: "Pray for earnest seeking after God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 64,
            title: "Protect Me from the Wicked",
            chapterReference: "Psalm 64",
            summary: "Pray for God's shield against evil.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 65,
            title: "Praise Awaits You",
            chapterReference: "Psalm 65",
            summary: "Pray in gratitude for God's provision.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 66,
            title: "Shout for Joy",
            chapterReference: "Psalm 66",
            summary: "Pray in celebration of God's awesome deeds.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 67,
            title: "May God Be Gracious",
            chapterReference: "Psalm 67",
            summary: "Pray for God's blessing and salvation for all.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 68,
            title: "Let God Arise",
            chapterReference: "Psalm 68",
            summary: "Pray in worship of God's mighty power.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 69,
            title: "Save Me, O God",
            chapterReference: "Psalm 69",
            summary: "Pray for deliverance in overwhelming distress.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 70,
            title: "Hasten to Help Me",
            chapterReference: "Psalm 70",
            summary: "Pray for urgent help from God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 71,
            title: "You Are My Hope",
            chapterReference: "Psalm 71",
            summary: "Pray for lifelong trust in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 72,
            title: "Endow the King",
            chapterReference: "Psalm 72",
            summary: "Pray for righteous leadership and justice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 73,
            title: "Who Have I But You?",
            chapterReference: "Psalm 73",
            summary: "Pray for perspective when the wicked prosper.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 74,
            title: "Remember Your Congregation",
            chapterReference: "Psalm 74",
            summary: "Pray for God's intervention and restoration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 75,
            title: "We Give Thanks",
            chapterReference: "Psalm 75",
            summary: "Pray in gratitude for God's judgment.",
            verses: []
        )
    ]

    // MARK: - Psalms 76-90
    private static let psalms76to90: [PrayerDay] = [
        PrayerDay(
            dayNumber: 76,
            title: "You Are Resplendent",
            chapterReference: "Psalm 76",
            summary: "Pray in awe of God's majesty.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 77,
            title: "I Cried to God",
            chapterReference: "Psalm 77",
            summary: "Pray for remembrance of God's faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 78,
            title: "Tell the Next Generation",
            chapterReference: "Psalm 78",
            summary: "Pray for faithfulness in teaching God's ways.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 79,
            title: "Help Us, O God",
            chapterReference: "Psalm 79",
            summary: "Pray for mercy and deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 80,
            title: "Restore Us",
            chapterReference: "Psalm 80",
            summary: "Pray for renewal and God's favor.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 81,
            title: "Sing for Joy",
            chapterReference: "Psalm 81",
            summary: "Pray for obedience and celebration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 82,
            title: "Defend the Weak",
            chapterReference: "Psalm 82",
            summary: "Pray for justice and righteousness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 83,
            title: "Do Not Keep Silent",
            chapterReference: "Psalm 83",
            summary: "Pray for God to act against enemies.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 84,
            title: "How Lovely is Your Dwelling",
            chapterReference: "Psalm 84",
            summary: "Pray for love of God's presence.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 85,
            title: "Show Us Your Mercy",
            chapterReference: "Psalm 85",
            summary: "Pray for revival and God's favor.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 86,
            title: "Teach Me Your Way",
            chapterReference: "Psalm 86",
            summary: "Pray for guidance and a undivided heart.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 87,
            title: "Glorious Things",
            chapterReference: "Psalm 87",
            summary: "Pray in celebration of God's city.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 88,
            title: "Darkness is My Friend",
            chapterReference: "Psalm 88",
            summary: "Pray honestly through deep despair.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 89,
            title: "I Will Sing of Your Love",
            chapterReference: "Psalm 89",
            summary: "Pray for trust in God's covenant faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 90,
            title: "Teach Us to Number Our Days",
            chapterReference: "Psalm 90",
            summary: "Pray for wisdom about the brevity of life.",
            verses: []
        )
    ]

    // MARK: - Psalms 91-105
    private static let psalms91to105: [PrayerDay] = [
        PrayerDay(
            dayNumber: 91,
            title: "Under His Wings",
            chapterReference: "Psalm 91",
            summary: "Pray for protection and refuge.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 92,
            title: "It is Good to Praise",
            chapterReference: "Psalm 92",
            summary: "Pray in thanksgiving for God's works.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 93,
            title: "The Lord Reigns",
            chapterReference: "Psalm 93",
            summary: "Pray in worship of God's sovereign rule.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 94,
            title: "God of Vengeance",
            chapterReference: "Psalm 94",
            summary: "Pray for God's justice and discipline.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 95,
            title: "Come, Let Us Worship",
            chapterReference: "Psalm 95",
            summary: "Pray with a heart of worship and obedience.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 96,
            title: "Sing to the Lord",
            chapterReference: "Psalm 96",
            summary: "Pray in joyful praise of God's glory.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 97,
            title: "The Lord Reigns, Let the Earth Rejoice",
            chapterReference: "Psalm 97",
            summary: "Pray in celebration of God's righteous reign.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 98,
            title: "A New Song",
            chapterReference: "Psalm 98",
            summary: "Pray with joy for God's salvation.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 99,
            title: "Holy is He",
            chapterReference: "Psalm 99",
            summary: "Pray in reverence of God's holiness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 100,
            title: "Shout for Joy",
            chapterReference: "Psalm 100",
            summary: "Pray with thanksgiving and gladness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 101,
            title: "I Will Walk in Integrity",
            chapterReference: "Psalm 101",
            summary: "Pray for blameless living.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 102,
            title: "Hear My Prayer",
            chapterReference: "Psalm 102",
            summary: "Pray for comfort in affliction.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 103,
            title: "Praise the Lord, O My Soul",
            chapterReference: "Psalm 103",
            summary: "Pray in gratitude for God's benefits and compassion.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 104,
            title: "How Many Are Your Works",
            chapterReference: "Psalm 104",
            summary: "Pray in awe of God's creation.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 105,
            title: "Give Thanks to the Lord",
            chapterReference: "Psalm 105",
            summary: "Pray with remembrance of God's faithfulness.",
            verses: []
        )
    ]

    // MARK: - Psalms 106-120
    private static let psalms106to120: [PrayerDay] = [
        PrayerDay(
            dayNumber: 106,
            title: "We Have Sinned",
            chapterReference: "Psalm 106",
            summary: "Pray in confession and repentance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 107,
            title: "Give Thanks for His Unfailing Love",
            chapterReference: "Psalm 107",
            summary: "Pray in gratitude for God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 108,
            title: "My Heart is Steadfast",
            chapterReference: "Psalm 108",
            summary: "Pray with confidence in God's help.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 109,
            title: "God of My Praise",
            chapterReference: "Psalm 109",
            summary: "Pray for God's vindication.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 110,
            title: "Sit at My Right Hand",
            chapterReference: "Psalm 110",
            summary: "Pray in worship of the Messianic King.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 111,
            title: "Great Are His Works",
            chapterReference: "Psalm 111",
            summary: "Pray in praise of God's deeds.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 112,
            title: "Blessed is the One Who Fears",
            chapterReference: "Psalm 112",
            summary: "Pray for righteousness and generosity.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 113,
            title: "Who is Like the Lord?",
            chapterReference: "Psalm 113",
            summary: "Pray in worship of God's incomparable nature.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 114,
            title: "When Israel Came Out",
            chapterReference: "Psalm 114",
            summary: "Pray in remembrance of God's mighty deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 115,
            title: "Not to Us",
            chapterReference: "Psalm 115",
            summary: "Pray for God's glory alone.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 116,
            title: "I Love the Lord",
            chapterReference: "Psalm 116",
            summary: "Pray in gratitude for answered prayer.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 117,
            title: "Praise the Lord, All Nations",
            chapterReference: "Psalm 117",
            summary: "Pray for universal praise of God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 118,
            title: "His Love Endures Forever",
            chapterReference: "Psalm 118",
            summary: "Pray in thanksgiving for God's steadfast love.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 119,
            title: "Your Word is a Lamp",
            chapterReference: "Psalm 119",
            summary: "Pray for love of God's Word and obedience.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 120,
            title: "I Call on the Lord",
            chapterReference: "Psalm 120",
            summary: "Pray for deliverance from deceit.",
            verses: []
        )
    ]

    // MARK: - Psalms 121-135
    private static let psalms121to135: [PrayerDay] = [
        PrayerDay(
            dayNumber: 121,
            title: "I Lift Up My Eyes",
            chapterReference: "Psalm 121",
            summary: "Pray for God's watchful protection.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 122,
            title: "I Rejoiced",
            chapterReference: "Psalm 122",
            summary: "Pray for love of God's house and peace.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 123,
            title: "To You I Lift My Eyes",
            chapterReference: "Psalm 123",
            summary: "Pray for mercy and relief from contempt.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 124,
            title: "If the Lord Had Not Been",
            chapterReference: "Psalm 124",
            summary: "Pray in gratitude for God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 125,
            title: "Those Who Trust",
            chapterReference: "Psalm 125",
            summary: "Pray for steadfast trust in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 126,
            title: "Restore Our Fortunes",
            chapterReference: "Psalm 126",
            summary: "Pray for restoration and joy.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 127,
            title: "Unless the Lord Builds",
            chapterReference: "Psalm 127",
            summary: "Pray for dependence on God in all endeavors.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 128,
            title: "Blessed Are All Who Fear",
            chapterReference: "Psalm 128",
            summary: "Pray for blessing in family and work.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 129,
            title: "Often They Have Afflicted Me",
            chapterReference: "Psalm 129",
            summary: "Pray for endurance through persecution.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 130,
            title: "Out of the Depths",
            chapterReference: "Psalm 130",
            summary: "Pray for forgiveness and hope.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 131,
            title: "My Heart is Not Proud",
            chapterReference: "Psalm 131",
            summary: "Pray for humility and quiet trust.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 132,
            title: "Remember David",
            chapterReference: "Psalm 132",
            summary: "Pray for God's presence and promises.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 133,
            title: "How Good and Pleasant",
            chapterReference: "Psalm 133",
            summary: "Pray for unity among believers.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 134,
            title: "Praise the Lord at Night",
            chapterReference: "Psalm 134",
            summary: "Pray with nighttime worship and blessing.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 135,
            title: "Praise the Name of the Lord",
            chapterReference: "Psalm 135",
            summary: "Pray in praise of God's greatness.",
            verses: []
        )
    ]

    // MARK: - Psalms 136-150
    private static let psalms136to150: [PrayerDay] = [
        PrayerDay(
            dayNumber: 136,
            title: "His Love Endures Forever",
            chapterReference: "Psalm 136",
            summary: "Pray in thanksgiving for God's enduring love.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 137,
            title: "By the Rivers of Babylon",
            chapterReference: "Psalm 137",
            summary: "Pray with longing for home and restoration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 138,
            title: "I Will Praise You",
            chapterReference: "Psalm 138",
            summary: "Pray with wholehearted thanksgiving.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 139,
            title: "You Have Searched Me",
            chapterReference: "Psalm 139",
            summary: "Pray in awe of God's intimate knowledge.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 140,
            title: "Rescue Me from Evil",
            chapterReference: "Psalm 140",
            summary: "Pray for protection from the wicked.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 141,
            title: "Set a Guard",
            chapterReference: "Psalm 141",
            summary: "Pray for control over words and actions.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 142,
            title: "I Cry Aloud",
            chapterReference: "Psalm 142",
            summary: "Pray for refuge when overwhelmed.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 143,
            title: "Do Not Bring to Judgment",
            chapterReference: "Psalm 143",
            summary: "Pray for mercy and guidance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 144,
            title: "Praise to the Rock",
            chapterReference: "Psalm 144",
            summary: "Pray for God's strength in battle.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 145,
            title: "Great is the Lord",
            chapterReference: "Psalm 145",
            summary: "Pray in exaltation of God's greatness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 146,
            title: "Praise the Lord, My Soul",
            chapterReference: "Psalm 146",
            summary: "Pray with trust in God's help.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 147,
            title: "He Heals the Brokenhearted",
            chapterReference: "Psalm 147",
            summary: "Pray in praise of God's care and power.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 148,
            title: "Praise from Heaven and Earth",
            chapterReference: "Psalm 148",
            summary: "Pray in cosmic worship of the Creator.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 149,
            title: "Sing a New Song",
            chapterReference: "Psalm 149",
            summary: "Pray with joyful praise and celebration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 150,
            title: "Let Everything That Has Breath",
            chapterReference: "Psalm 150",
            summary: "Pray in final, resounding praise of God.",
            verses: []
        )
    ]
}

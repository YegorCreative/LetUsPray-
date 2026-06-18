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
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "How Majestic",
            chapterReference: "Psalm 8",
            summary: "Pray in awe of God's majesty and care for humanity.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "I Will Give Thanks",
            chapterReference: "Psalm 9",
            summary: "Pray with thanksgiving for God's righteous judgment.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Why Stand Far Off?",
            chapterReference: "Psalm 10",
            summary: "Pray for God's intervention against injustice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "In the Lord I Take Refuge",
            chapterReference: "Psalm 11",
            summary: "Pray for courage and trust when foundations are shaken.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Help, Lord",
            chapterReference: "Psalm 12",
            summary: "Pray for truth and protection from deceit.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "How Long?",
            chapterReference: "Psalm 13",
            summary: "Pray through seasons of waiting and darkness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "The Fool Says",
            chapterReference: "Psalm 14",
            summary: "Pray for wisdom and righteous living.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "Who May Dwell?",
            chapterReference: "Psalm 15",
            summary: "Pray for integrity and blameless living.",
            verses: []
        )
    ]
    
    // MARK: - Psalms 16-30
    private static let psalms16to30: [PrayerDay] = [
        PrayerDay(
            dayNumber: 16,
            title: "You Are My Lord",
            chapterReference: "Psalm 16",
            summary: "Pray for joy and security in God alone.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 17,
            title: "Hear a Just Cause",
            chapterReference: "Psalm 17",
            summary: "Pray for vindication and protection.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 18,
            title: "I Love You, Lord",
            chapterReference: "Psalm 18",
            summary: "Pray in gratitude for God's deliverance and strength.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 19,
            title: "The Heavens Declare",
            chapterReference: "Psalm 19",
            summary: "Pray in awe of God's creation and Word.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 20,
            title: "May the Lord Answer",
            chapterReference: "Psalm 20",
            summary: "Pray for trust in God's name and strength.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 21,
            title: "The King Rejoices",
            chapterReference: "Psalm 21",
            summary: "Pray with gratitude for God's blessings and faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 22,
            title: "My God, My God",
            chapterReference: "Psalm 22",
            summary: "Pray through suffering with hope in God's deliverance.",
            verses: []
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

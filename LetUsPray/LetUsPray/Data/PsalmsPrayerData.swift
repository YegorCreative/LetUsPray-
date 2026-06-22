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
        subtitle: "God is our refuge and strength",
        description: "Pray through psalms of trust, deliverance, and confidence in God's power.",
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
        subtitle: "Longing for God's presence",
        description: "Pray through psalms of earnest seeking, thanksgiving, and trust in God's faithfulness.",
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
            verses: [
                PrayerVerse(
                    id: "psalm-23-1",
                    reference: "Psalm 23:1",
                    text: "The Lord is my shepherd,\n  I shall not want.",
                    prayer: "Lord, You are my Shepherd, and I lack nothing when I follow You. Thank You for providing for my needs and caring for me with perfect love."
                ),
                PrayerVerse(
                    id: "psalm-23-2",
                    reference: "Psalm 23:2",
                    text: "He makes me lie down in green pastures;\n  He leads me beside quiet waters.",
                    prayer: "Father, lead me beside quiet waters and into places of rest. Teach me to slow down, trust You, and find peace in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-23-3",
                    reference: "Psalm 23:3",
                    text: "He restores my soul;\n  He guides me in the paths of righteousness\n  For His name’s sake.",
                    prayer: "Lord, restore my soul when I am weary and burdened. Guide me in paths of righteousness so that my life brings honor to Your name."
                ),
                PrayerVerse(
                    id: "psalm-23-4",
                    reference: "Psalm 23:4",
                    text: "Even though I walk through the valley of the shadow of death,\n  I fear no evil, for You are with me;\n  Your rod and Your staff, they comfort me.",
                    prayer: "Father, even when I walk through dark valleys and difficult seasons, help me fear no evil because You are with me. Let Your presence comfort and strengthen me."
                ),
                PrayerVerse(
                    id: "psalm-23-5",
                    reference: "Psalm 23:5",
                    text: "You prepare a table before me in the presence of my enemies;\n  You have anointed my head with oil;\n  My cup overflows.",
                    prayer: "Lord, thank You for blessing me even in the presence of challenges and opposition. Fill my life with Your favor, grace, and abundant provision."
                ),
                PrayerVerse(
                    id: "psalm-23-6",
                    reference: "Psalm 23:6",
                    text: "Surely goodness and lovingkindness will follow me all the days of my life,\n  And I will dwell in the house of the Lord forever.",
                    prayer: "Father, thank You that Your goodness and lovingkindness follow me all the days of my life. Help me dwell in Your presence and remain close to You forever."
                ),
                PrayerVerse(
                    id: "psalm-23-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my Shepherd, my Provider, and my Protector. Lead me in paths of righteousness, restore my soul when I am weary, and give me peace in every season. Help me trust You through both the green pastures and the dark valleys, knowing that You are always with me. May Your goodness and mercy surround me throughout my life, and may my heart always find rest in Your presence.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 24,
            title: "Lift Up Your Heads",
            chapterReference: "Psalm 24",
            summary: "Pray in worship of the King of glory.",
            verses: [
                PrayerVerse(
                    id: "psalm-24-1",
                    reference: "Psalm 24:1",
                    text: "The earth is the Lord’s, and all it contains,\n  The world, and those who dwell in it.",
                    prayer: "Lord, the earth and everything in it belong to You. Help me remember that all I have comes from Your hand and should be used for Your glory."
                ),
                PrayerVerse(
                    id: "psalm-24-2",
                    reference: "Psalm 24:2",
                    text: "For He has founded it upon the seas\n  And established it upon the rivers.",
                    prayer: "Father, thank You for creating and sustaining all things. Remind me daily of Your power, wisdom, and authority over creation."
                ),
                PrayerVerse(
                    id: "psalm-24-3",
                    reference: "Psalm 24:3",
                    text: "Who may ascend into the hill of the Lord?\n  And who may stand in His holy place?",
                    prayer: "Lord, I desire to draw near to You and stand in Your presence. Help me pursue a life that honors You and reflects Your holiness."
                ),
                PrayerVerse(
                    id: "psalm-24-4",
                    reference: "Psalm 24:4",
                    text: "He who has clean hands and a pure heart,\n  Who has not lifted up his soul to falsehood\n  And has not sworn deceitfully.",
                    prayer: "Father, give me clean hands and a pure heart. Help me live with integrity, sincerity, and faithfulness in all that I do."
                ),
                PrayerVerse(
                    id: "psalm-24-5",
                    reference: "Psalm 24:5",
                    text: "He shall receive a blessing from the Lord\n  And righteousness from the God of his salvation.",
                    prayer: "Lord, thank You for Your blessing and righteousness. Help me walk humbly before You and receive Your grace with gratitude."
                ),
                PrayerVerse(
                    id: "psalm-24-6",
                    reference: "Psalm 24:6",
                    text: "This is the generation of those who seek Him,\n  Who seek Your face—even Jacob. Selah.",
                    prayer: "Father, let me be among those who seek Your face. Create within me a deeper desire to know You and follow You wholeheartedly."
                ),
                PrayerVerse(
                    id: "psalm-24-7",
                    reference: "Psalm 24:7",
                    text: "Lift up your heads, O gates,\n  And be lifted up, O ancient doors,\n  That the King of glory may come in!",
                    prayer: "Lord, open the doors of my heart and let the King of Glory reign fully in my life. Remove anything that stands in the way of Your rule."
                ),
                PrayerVerse(
                    id: "psalm-24-8",
                    reference: "Psalm 24:8",
                    text: "Who is the King of glory?\n  The Lord strong and mighty,\n  The Lord mighty in battle.",
                    prayer: "Father, You are strong and mighty. Help me trust in Your power when I face challenges that seem greater than my own strength."
                ),
                PrayerVerse(
                    id: "psalm-24-9",
                    reference: "Psalm 24:9",
                    text: "Lift up your heads, O gates,\n  And lift them up, O ancient doors,\n  That the King of glory may come in!",
                    prayer: "Lord, once again I open my heart to You. May every area of my life be surrendered to Your leadership and guidance."
                ),
                PrayerVerse(
                    id: "psalm-24-10",
                    reference: "Psalm 24:10",
                    text: "Who is this King of glory?\n  The Lord of hosts,\n  He is the King of glory. Selah.",
                    prayer: "Father, You are the King of Glory. May my life bring honor, praise, and worship to Your holy name forever."
                ),
                PrayerVerse(
                    id: "psalm-24-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being the Creator of all things and the King of Glory. Help me live with clean hands and a pure heart, seeking Your presence above all else. Reign over every area of my life and teach me to trust in Your power, walk in Your righteousness, and worship You with my whole heart. May my life continually bring glory and honor to You.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 25,
            title: "To You, O Lord",
            chapterReference: "Psalm 25",
            summary: "Pray for guidance and forgiveness.",
            verses: [
                PrayerVerse(
                    id: "psalm-25-1",
                    reference: "Psalm 25:1",
                    text: "To You, O Lord, I lift up my soul.",
                    prayer: "Lord, I lift up my soul to You. Help me place my trust fully in Your hands and seek You above all else."
                ),
                PrayerVerse(
                    id: "psalm-25-2",
                    reference: "Psalm 25:2",
                    text: "O my God, in You I trust,\n  Do not let me be ashamed;\n  Do not let my enemies exult over me.",
                    prayer: "Father, I trust in You. Keep me from fear, shame, and discouragement, and strengthen my confidence in Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-25-3",
                    reference: "Psalm 25:3",
                    text: "Indeed, none of those who wait for You will be ashamed;\n  Those who deal treacherously without cause will be ashamed.",
                    prayer: "Lord, thank You that those who hope in You will not be disappointed. Help me patiently wait for Your timing and Your promises."
                ),
                PrayerVerse(
                    id: "psalm-25-4",
                    reference: "Psalm 25:4",
                    text: "Make me know Your ways, O Lord;\n  Teach me Your paths.",
                    prayer: "Father, show me Your ways and teach me Your paths. Guide my decisions and direct my steps according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-25-5",
                    reference: "Psalm 25:5",
                    text: "Lead me in Your truth and teach me,\n  For You are the God of my salvation;\n  For You I wait all the day.",
                    prayer: "Lord, lead me in Your truth and teach me. Help me remain humble and willing to follow wherever You lead."
                ),
                PrayerVerse(
                    id: "psalm-25-6",
                    reference: "Psalm 25:6",
                    text: "Remember, O Lord, Your compassion and Your lovingkindnesses,\n  For they have been from of old.",
                    prayer: "Father, thank You for Your compassion and lovingkindness that have been present throughout every season of my life."
                ),
                PrayerVerse(
                    id: "psalm-25-7",
                    reference: "Psalm 25:7",
                    text: "Do not remember the sins of my youth or my transgressions;\n  According to Your lovingkindness remember me,\n  For Your goodness’ sake, O Lord.",
                    prayer: "Lord, forgive my sins and shortcomings. Help me walk in the freedom of Your mercy and grace."
                ),
                PrayerVerse(
                    id: "psalm-25-8",
                    reference: "Psalm 25:8",
                    text: "Good and upright is the Lord;\n  Therefore He instructs sinners in the way.",
                    prayer: "Father, thank You that You are good and upright. Thank You for patiently teaching those who seek You."
                ),
                PrayerVerse(
                    id: "psalm-25-9",
                    reference: "Psalm 25:9",
                    text: "He leads the humble in justice,\n  And He teaches the humble His way.",
                    prayer: "Lord, give me a humble heart that is willing to learn from You and follow Your instruction."
                ),
                PrayerVerse(
                    id: "psalm-25-10",
                    reference: "Psalm 25:10",
                    text: "All the paths of the Lord are lovingkindness and truth\n  To those who keep His covenant and His testimonies.",
                    prayer: "Father, all Your ways are loving and faithful. Help me trust Your guidance even when I do not fully understand it."
                ),
                PrayerVerse(
                    id: "psalm-25-11",
                    reference: "Psalm 25:11",
                    text: "For Your name’s sake, O Lord,\n  Pardon my iniquity, for it is great.",
                    prayer: "Lord, for the sake of Your name, forgive my sins and continue Your work of transformation in my life."
                ),
                PrayerVerse(
                    id: "psalm-25-12",
                    reference: "Psalm 25:12",
                    text: "Who is the man who fears the Lord?\n  He will instruct him in the way he should choose.",
                    prayer: "Father, help me fear You with reverence and awe. Teach me the way I should go and establish my path."
                ),
                PrayerVerse(
                    id: "psalm-25-13",
                    reference: "Psalm 25:13",
                    text: "His soul will abide in prosperity,\n  And his descendants will inherit the land.",
                    prayer: "Lord, thank You for the blessings that come from walking with You. Help me live faithfully and enjoy the peace You provide."
                ),
                PrayerVerse(
                    id: "psalm-25-14",
                    reference: "Psalm 25:14",
                    text: "The secret of the Lord is for those who fear Him,\n  And He will make them know His covenant.",
                    prayer: "Father, thank You for revealing Yourself to those who seek You. Draw me into a deeper relationship with You each day."
                ),
                PrayerVerse(
                    id: "psalm-25-15",
                    reference: "Psalm 25:15",
                    text: "My eyes are continually toward the Lord,\n  For He will pluck my feet out of the net.",
                    prayer: "Lord, keep my eyes fixed on You. Deliver me from distractions and help me focus on Your truth."
                ),
                PrayerVerse(
                    id: "psalm-25-16",
                    reference: "Psalm 25:16",
                    text: "Turn to me and be gracious to me,\n  For I am lonely and afflicted.",
                    prayer: "Father, turn toward me with Your mercy and compassion when I feel lonely, burdened, or overwhelmed."
                ),
                PrayerVerse(
                    id: "psalm-25-17",
                    reference: "Psalm 25:17",
                    text: "The troubles of my heart are enlarged;\n  Bring me out of my distresses.",
                    prayer: "Lord, bring relief to my troubles and grant me peace in the midst of every challenge."
                ),
                PrayerVerse(
                    id: "psalm-25-18",
                    reference: "Psalm 25:18",
                    text: "Look upon my affliction and my trouble,\n  And forgive all my sins.",
                    prayer: "Father, see my struggles and forgive my sins. Thank You for Your grace that continually restores me."
                ),
                PrayerVerse(
                    id: "psalm-25-19",
                    reference: "Psalm 25:19",
                    text: "Look upon my enemies, for they are many,\n  And they hate me with violent hatred.",
                    prayer: "Lord, protect me from those things that seek to harm my faith and draw me away from You."
                ),
                PrayerVerse(
                    id: "psalm-25-20",
                    reference: "Psalm 25:20",
                    text: "Guard my soul and deliver me;\n  Do not let me be ashamed, for I take refuge in You.",
                    prayer: "Father, guard my soul and keep me secure in Your care. Help me continue trusting in You."
                ),
                PrayerVerse(
                    id: "psalm-25-21",
                    reference: "Psalm 25:21",
                    text: "Let integrity and uprightness preserve me,\n  For I wait for You.",
                    prayer: "Lord, let integrity and uprightness guide my life as I wait upon You and depend on Your wisdom."
                ),
                PrayerVerse(
                    id: "psalm-25-22",
                    reference: "Psalm 25:22",
                    text: "Redeem Israel, O God,\n  Out of all his troubles.",
                    prayer: "Father, bring deliverance and restoration to Your people. May Your grace and mercy be known throughout the world."
                ),
                PrayerVerse(
                    id: "psalm-25-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your guidance, mercy, and faithfulness. Teach me Your ways, lead me in Your truth, and help me trust You in every circumstance. Forgive my sins, strengthen my faith, and keep my eyes fixed upon You. May I walk humbly before You, experience the peace of Your presence, and follow You faithfully all the days of my life.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 26,
            title: "Vindicate Me",
            chapterReference: "Psalm 26",
            summary: "Pray for integrity and faithfulness.",
            verses: [
                PrayerVerse(
                    id: "psalm-26-1",
                    reference: "Psalm 26:1",
                    text: "Vindicate me, O Lord, for I have walked in my integrity,\n  And I have trusted in the Lord without wavering.",
                    prayer: "Lord, examine my life and help me walk in integrity. Strengthen my faith so that I may trust You without wavering."
                ),
                PrayerVerse(
                    id: "psalm-26-2",
                    reference: "Psalm 26:2",
                    text: "Examine me, O Lord, and try me;\n  Test my mind and my heart.",
                    prayer: "Father, search my heart and test my motives. Reveal anything within me that does not honor You and transform me by Your grace."
                ),
                PrayerVerse(
                    id: "psalm-26-3",
                    reference: "Psalm 26:3",
                    text: "For Your lovingkindness is before my eyes,\n  And I have walked in Your truth.",
                    prayer: "Lord, thank You for Your lovingkindness that is always before me. Help me walk daily in Your truth and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-26-4",
                    reference: "Psalm 26:4",
                    text: "I do not sit with deceitful men,\n  Nor will I go with pretenders.",
                    prayer: "Father, protect me from deceptive influences and from relationships that would draw me away from Your will."
                ),
                PrayerVerse(
                    id: "psalm-26-5",
                    reference: "Psalm 26:5",
                    text: "I hate the assembly of evildoers,\n  And I will not sit with the wicked.",
                    prayer: "Lord, give me wisdom to avoid paths that lead to sin. Help me choose companions and influences that encourage me toward righteousness."
                ),
                PrayerVerse(
                    id: "psalm-26-6",
                    reference: "Psalm 26:6",
                    text: "I shall wash my hands in innocence,\n  And I will go about Your altar, O Lord,",
                    prayer: "Father, cleanse my heart and renew my spirit. Help me come before You with humility, gratitude, and a desire to worship."
                ),
                PrayerVerse(
                    id: "psalm-26-7",
                    reference: "Psalm 26:7",
                    text: "That I may proclaim with the voice of thanksgiving\n  And declare all Your wonders.",
                    prayer: "Lord, let my life be filled with thanksgiving. Help me continually proclaim Your goodness and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-26-8",
                    reference: "Psalm 26:8",
                    text: "O Lord, I love the habitation of Your house\n  And the place where Your glory dwells.",
                    prayer: "Father, I love Your presence. Draw me closer to You and help me delight in spending time with You each day."
                ),
                PrayerVerse(
                    id: "psalm-26-9",
                    reference: "Psalm 26:9",
                    text: "Do not take my soul away along with sinners,\n  Nor my life with men of bloodshed,",
                    prayer: "Lord, keep me separate from sin and guide me in paths that bring honor to Your name."
                ),
                PrayerVerse(
                    id: "psalm-26-10",
                    reference: "Psalm 26:10",
                    text: "In whose hands is a wicked scheme,\n  And whose right hand is full of bribes.",
                    prayer: "Father, protect me from corruption, dishonesty, and selfish ambition. Help me pursue integrity in every area of life."
                ),
                PrayerVerse(
                    id: "psalm-26-11",
                    reference: "Psalm 26:11",
                    text: "But as for me, I shall walk in my integrity;\n  Redeem me, and be gracious to me.",
                    prayer: "Lord, help me walk blamelessly before You. Thank You for Your mercy that restores and strengthens me."
                ),
                PrayerVerse(
                    id: "psalm-26-12",
                    reference: "Psalm 26:12",
                    text: "My foot stands on a level place;\n  In the congregations I shall bless the Lord.",
                    prayer: "Father, place my feet on steady ground. Let my life be a testimony of worship, gratitude, and faithfulness to You."
                ),
                PrayerVerse(
                    id: "psalm-26-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your truth, mercy, and lovingkindness. Search my heart, purify my motives, and help me walk with integrity before You. Draw me closer to Your presence and teach me to live a life of worship, gratitude, and obedience. May my steps remain firm in Your ways, and may my life bring glory to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 27,
            title: "The Lord is My Light",
            chapterReference: "Psalm 27",
            summary: "Pray for courage and confidence in God's presence.",
            verses: [
                PrayerVerse(
                    id: "psalm-27-1",
                    reference: "Psalm 27:1",
                    text: "The Lord is my light and my salvation;\n  Whom shall I fear?\n  The Lord is the defense of my life;\n  Whom shall I dread?",
                    prayer: "Lord, You are my light and my salvation. When fear tries to overwhelm me, help me remember that You are my strength and my refuge."
                ),
                PrayerVerse(
                    id: "psalm-27-2",
                    reference: "Psalm 27:2",
                    text: "When evildoers came upon me to devour my flesh,\n  My adversaries and my enemies, they stumbled and fell.",
                    prayer: "Father, when opposition rises against me, remind me that You are my defender and that I can trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-27-3",
                    reference: "Psalm 27:3",
                    text: "Though a host encamp against me,\n  My heart will not fear;\n  Though war arise against me,\n  In spite of this I shall be confident.",
                    prayer: "Lord, even when challenges surround me, help my heart remain confident and secure in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-27-4",
                    reference: "Psalm 27:4",
                    text: "One thing I have asked from the Lord, that I shall seek:\n  That I may dwell in the house of the Lord all the days of my life,\n  To behold the beauty of the Lord\n  And to meditate in His temple.",
                    prayer: "Father, my greatest desire is to be near You. Help me seek Your presence above all else and delight in Your beauty and goodness."
                ),
                PrayerVerse(
                    id: "psalm-27-5",
                    reference: "Psalm 27:5",
                    text: "For in the day of trouble He will conceal me in His tabernacle;\n  In the secret place of His tent He will hide me;\n  He will lift me up on a rock.",
                    prayer: "Lord, in times of trouble, hide me in the shelter of Your care. Keep me secure and strengthen my faith."
                ),
                PrayerVerse(
                    id: "psalm-27-6",
                    reference: "Psalm 27:6",
                    text: "And now my head will be lifted up above my enemies around me,\n  And I will offer in His tent sacrifices with shouts of joy;\n  I will sing, yes, I will sing praises to the Lord.",
                    prayer: "Father, let my response to Your faithfulness be praise and worship. Fill my heart with gratitude for all You have done."
                ),
                PrayerVerse(
                    id: "psalm-27-7",
                    reference: "Psalm 27:7",
                    text: "Hear, O Lord, when I cry with my voice,\n  And be gracious to me and answer me.",
                    prayer: "Lord, hear my voice when I call to You. Thank You for listening to my prayers and responding with mercy and love."
                ),
                PrayerVerse(
                    id: "psalm-27-8",
                    reference: "Psalm 27:8",
                    text: "When You said, “Seek My face,” my heart said to You,\n  “Your face, O Lord, I shall seek.”",
                    prayer: "Father, when You call me to seek You, help me respond with a willing and eager heart."
                ),
                PrayerVerse(
                    id: "psalm-27-9",
                    reference: "Psalm 27:9",
                    text: "Do not hide Your face from me,\n  Do not turn Your servant away in anger;\n  You have been my help;\n  Do not abandon me nor forsake me,\n  O God of my salvation!",
                    prayer: "Lord, do not let me drift from Your presence. Guide me, teach me, and help me remain close to You."
                ),
                PrayerVerse(
                    id: "psalm-27-10",
                    reference: "Psalm 27:10",
                    text: "For my father and my mother have forsaken me,\n  But the Lord will take me up.",
                    prayer: "Father, even if others fail me, thank You that Your love never fails. Help me rest securely in Your care."
                ),
                PrayerVerse(
                    id: "psalm-27-11",
                    reference: "Psalm 27:11",
                    text: "Teach me Your way, O Lord,\n  And lead me in a level path\n  Because of my foes.",
                    prayer: "Lord, teach me Your way and lead me on a straight path. Give me wisdom to follow Your direction faithfully."
                ),
                PrayerVerse(
                    id: "psalm-27-12",
                    reference: "Psalm 27:12",
                    text: "Do not deliver me over to the desire of my adversaries,\n  For false witnesses have risen against me,\n  And such as breathe out violence.",
                    prayer: "Father, protect me from false accusations, harmful influences, and anything that seeks to pull me away from You."
                ),
                PrayerVerse(
                    id: "psalm-27-13",
                    reference: "Psalm 27:13",
                    text: "I would have despaired unless I had believed that I would see the goodness of the Lord\n  In the land of the living.",
                    prayer: "Lord, help me believe that I will see Your goodness even in difficult seasons. Strengthen my faith and hope in You."
                ),
                PrayerVerse(
                    id: "psalm-27-14",
                    reference: "Psalm 27:14",
                    text: "Wait for the Lord;\n  Be strong and let your heart take courage;\n  Yes, wait for the Lord.",
                    prayer: "Father, teach me to wait patiently for You. Give me courage, perseverance, and confidence in Your perfect timing."
                ),
                PrayerVerse(
                    id: "psalm-27-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my light, my salvation, and my strength. Help me seek Your presence above all else and trust You in every circumstance. When fear arises, remind me that You are with me. Teach me to wait upon You with patience and confidence, knowing that Your goodness and faithfulness never fail. May my life be filled with worship, trust, and devotion to You.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 28,
            title: "To You I Call",
            chapterReference: "Psalm 28",
            summary: "Pray for God to hear and deliver.",
            verses: [
                PrayerVerse(
                    id: "psalm-28-1",
                    reference: "Psalm 28:1",
                    text: "To You, O Lord, I call;\n  My rock, do not be deaf to me,\n  For if You are silent to me,\n  I will become like those who go down to the pit.",
                    prayer: "Lord, You are my rock and my refuge. When I call to You, hear my prayer and help me trust that You are listening."
                ),
                PrayerVerse(
                    id: "psalm-28-2",
                    reference: "Psalm 28:2",
                    text: "Hear the voice of my supplications when I cry to You for help,\n  When I lift up my hands toward Your holy sanctuary.",
                    prayer: "Father, I lift my hands and my heart toward You. Thank You for inviting me into Your presence and hearing my cries for mercy."
                ),
                PrayerVerse(
                    id: "psalm-28-3",
                    reference: "Psalm 28:3",
                    text: "Do not drag me away with the wicked\n  And with those who work iniquity,\n  Who speak peace with their neighbors,\n  While evil is in their hearts.",
                    prayer: "Lord, keep me from being influenced by evil or hypocrisy. Help me walk in sincerity, truth, and integrity before You."
                ),
                PrayerVerse(
                    id: "psalm-28-4",
                    reference: "Psalm 28:4",
                    text: "Requite them according to their work and according to the evil of their practices;\n  Requite them according to the deeds of their hands;\n  Repay them their recompense.",
                    prayer: "Father, You are perfectly just. Help me trust Your judgment and leave every matter in Your hands rather than seeking my own revenge."
                ),
                PrayerVerse(
                    id: "psalm-28-5",
                    reference: "Psalm 28:5",
                    text: "Because they do not regard the works of the Lord\n  Nor the deeds of His hands,\n  He will tear them down and not build them up.",
                    prayer: "Lord, open my eyes to recognize Your works and Your hand in my life. Help me appreciate Your wisdom, power, and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-28-6",
                    reference: "Psalm 28:6",
                    text: "Blessed be the Lord,\n  Because He has heard the voice of my supplication.",
                    prayer: "Father, thank You for hearing my prayers. Fill my heart with gratitude as I remember how You have answered and sustained me."
                ),
                PrayerVerse(
                    id: "psalm-28-7",
                    reference: "Psalm 28:7",
                    text: "The Lord is my strength and my shield;\n  My heart trusts in Him, and I am helped;\n  Therefore my heart exults,\n  And with my song I shall thank Him.",
                    prayer: "Lord, You are my strength and my shield. Help me trust You completely and rejoice in the protection and peace You provide."
                ),
                PrayerVerse(
                    id: "psalm-28-8",
                    reference: "Psalm 28:8",
                    text: "The Lord is their strength,\n  And He is a saving defense to His anointed.",
                    prayer: "Father, thank You for being the strength of Your people. Encourage and sustain all who place their hope in You."
                ),
                PrayerVerse(
                    id: "psalm-28-9",
                    reference: "Psalm 28:9",
                    text: "Save Your people and bless Your inheritance;\n  Be their shepherd also, and carry them forever.",
                    prayer: "Lord, bless and shepherd Your people. Guide us with Your wisdom, carry us through every season, and keep us close to You."
                ),
                PrayerVerse(
                    id: "psalm-28-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my rock, my strength, and my shield. Thank You for hearing my prayers and surrounding me with Your protection. Help me trust You completely, walk in integrity, and rest in Your faithfulness. Shepherd my life according to Your will, strengthen my faith, and fill my heart with praise for all You have done and all You will do.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 29,
            title: "Ascribe to the Lord",
            chapterReference: "Psalm 29",
            summary: "Pray in worship of God's powerful voice.",
            verses: [
                PrayerVerse(
                    id: "psalm-29-1",
                    reference: "Psalm 29:1",
                    text: "Ascribe to the Lord, O sons of the mighty,\n  Ascribe to the Lord glory and strength.",
                    prayer: "Lord, I give You glory and honor because You alone are worthy of all praise. Help me recognize Your greatness and worship You wholeheartedly."
                ),
                PrayerVerse(
                    id: "psalm-29-2",
                    reference: "Psalm 29:2",
                    text: "Ascribe to the Lord the glory due to His name;\n  Worship the Lord in holy array.",
                    prayer: "Father, let my worship reflect the beauty of Your holiness. Teach me to honor Your name with reverence, gratitude, and obedience."
                ),
                PrayerVerse(
                    id: "psalm-29-3",
                    reference: "Psalm 29:3",
                    text: "The voice of the Lord is upon the waters;\n  The God of glory thunders,\n  The Lord is over many waters.",
                    prayer: "Lord, Your voice is powerful over all creation. Help me listen carefully when You speak through Your Word and Your Spirit."
                ),
                PrayerVerse(
                    id: "psalm-29-4",
                    reference: "Psalm 29:4",
                    text: "The voice of the Lord is powerful,\n  The voice of the Lord is majestic.",
                    prayer: "Father, thank You for the strength and authority of Your voice. Strengthen my faith so I may trust Your promises completely."
                ),
                PrayerVerse(
                    id: "psalm-29-5",
                    reference: "Psalm 29:5",
                    text: "The voice of the Lord breaks the cedars;\n  Yes, the Lord breaks in pieces the cedars of Lebanon.",
                    prayer: "Lord, nothing can withstand Your power. Remind me that no obstacle, challenge, or fear is greater than You."
                ),
                PrayerVerse(
                    id: "psalm-29-6",
                    reference: "Psalm 29:6",
                    text: "He makes Lebanon skip like a calf,\n  And Sirion like a young wild ox.",
                    prayer: "Father, You rule over all creation with wisdom and authority. Help me trust Your sovereignty in every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-29-7",
                    reference: "Psalm 29:7",
                    text: "The voice of the Lord hews out flames of fire.",
                    prayer: "Lord, Your power is unmatched. Let Your presence break through the fears and doubts that seek to discourage me."
                ),
                PrayerVerse(
                    id: "psalm-29-8",
                    reference: "Psalm 29:8",
                    text: "The voice of the Lord shakes the wilderness;\n  The Lord shakes the wilderness of Kadesh.",
                    prayer: "Father, when life feels uncertain and unstable, help me remember that You remain in control and that Your purposes stand forever."
                ),
                PrayerVerse(
                    id: "psalm-29-9",
                    reference: "Psalm 29:9",
                    text: "The voice of the Lord makes the deer to calve\n  And strips the forests bare;\n  And in His temple everything says, “Glory!”",
                    prayer: "Lord, let my response to Your majesty be worship. Fill my heart with awe and gratitude for who You are."
                ),
                PrayerVerse(
                    id: "psalm-29-10",
                    reference: "Psalm 29:10",
                    text: "The Lord sat as King at the flood;\n  Yes, the Lord sits as King forever.",
                    prayer: "Father, You sit enthroned forever. Thank You that no event, circumstance, or earthly power can threaten Your reign."
                ),
                PrayerVerse(
                    id: "psalm-29-11",
                    reference: "Psalm 29:11",
                    text: "The Lord will give strength to His people;\n  The Lord will bless His people with peace.",
                    prayer: "Lord, thank You for giving strength to Your people and blessing us with peace. Help me rest securely in Your care and provision."
                ),
                PrayerVerse(
                    id: "psalm-29-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your majesty, power, and authority over all creation. Help me listen to Your voice, trust in Your sovereignty, and worship You with my whole heart. When life feels uncertain, remind me that You reign forever and that Your peace is available to all who trust in You. Strengthen my faith and fill my heart with awe, gratitude, and confidence in Your unfailing love.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 30,
            title: "You Lifted Me Up",
            chapterReference: "Psalm 30",
            summary: "Pray in thanksgiving for God's healing and restoration.",
            verses: [
                PrayerVerse(
                    id: "psalm-30-1",
                    reference: "Psalm 30:1",
                    text: "I will extol You, O Lord, for You have lifted me up,\n  And have not let my enemies rejoice over me.",
                    prayer: "Lord, I exalt You because You have lifted me up and carried me through difficult seasons. Thank You for Your faithfulness and deliverance."
                ),
                PrayerVerse(
                    id: "psalm-30-2",
                    reference: "Psalm 30:2",
                    text: "O Lord my God,\n  I cried to You for help, and You healed me.",
                    prayer: "Father, when I cried out to You, You heard me. Thank You for listening to my prayers and bringing healing to my heart and soul."
                ),
                PrayerVerse(
                    id: "psalm-30-3",
                    reference: "Psalm 30:3",
                    text: "O Lord, You have brought up my soul from Sheol;\n  You have kept me alive, that I would not go down to the pit.",
                    prayer: "Lord, thank You for rescuing me from despair and giving me new life, hope, and purpose through Your grace."
                ),
                PrayerVerse(
                    id: "psalm-30-4",
                    reference: "Psalm 30:4",
                    text: "Sing praise to the Lord, you His godly ones,\n  And give thanks to His holy name.",
                    prayer: "Father, help me join with Your people in giving thanks and praising Your holy name for all You have done."
                ),
                PrayerVerse(
                    id: "psalm-30-5",
                    reference: "Psalm 30:5",
                    text: "For His anger is but for a moment,\n  His favor is for a lifetime;\n  Weeping may last for the night,\n  But a shout of joy comes in the morning.",
                    prayer: "Lord, thank You that Your anger is temporary but Your favor lasts a lifetime. Remind me that seasons of sorrow will not last forever."
                ),
                PrayerVerse(
                    id: "psalm-30-6",
                    reference: "Psalm 30:6",
                    text: "Now as for me, I said in my prosperity,\n  “I will never be moved.”",
                    prayer: "Father, protect me from pride and self-reliance. Help me remember that every blessing comes from Your hand."
                ),
                PrayerVerse(
                    id: "psalm-30-7",
                    reference: "Psalm 30:7",
                    text: "O Lord, by Your favor You have made my mountain to stand strong;\n  You hid Your face, I was dismayed.",
                    prayer: "Lord, when I feel secure, help me continue depending upon You. When difficulties come, remind me that You are my strength."
                ),
                PrayerVerse(
                    id: "psalm-30-8",
                    reference: "Psalm 30:8",
                    text: "To You, O Lord, I called,\n  And to the Lord I made supplication:",
                    prayer: "Father, I call upon You in every circumstance. Thank You that I can always come before You in prayer."
                ),
                PrayerVerse(
                    id: "psalm-30-9",
                    reference: "Psalm 30:9",
                    text: "“What profit is there in my blood, if I go down to the pit?\n  Will the dust praise You? Will it declare Your faithfulness?",
                    prayer: "Lord, help me use my life to glorify You. Let every day be an opportunity to honor and worship You."
                ),
                PrayerVerse(
                    id: "psalm-30-10",
                    reference: "Psalm 30:10",
                    text: "“Hear, O Lord, and be gracious to me;\n  O Lord, be my helper.”",
                    prayer: "Father, hear my prayer and have mercy upon me. Be my helper and guide through every challenge I face."
                ),
                PrayerVerse(
                    id: "psalm-30-11",
                    reference: "Psalm 30:11",
                    text: "You have turned for me my mourning into dancing;\n  You have loosed my sackcloth and girded me with gladness,",
                    prayer: "Lord, thank You for turning mourning into joy. Restore hope where there is discouragement and bring peace where there is pain."
                ),
                PrayerVerse(
                    id: "psalm-30-12",
                    reference: "Psalm 30:12",
                    text: "That my soul may sing praise to You and not be silent.\n  O Lord my God, I will give thanks to You forever.",
                    prayer: "Father, let my heart continually praise You. May gratitude, worship, and thanksgiving fill my life every day."
                ),
                PrayerVerse(
                    id: "psalm-30-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your healing, restoration, and faithfulness. When I walk through difficult seasons, remind me that joy comes through Your presence and that Your favor endures forever. Turn my sorrow into praise, strengthen my faith, and help me live a life filled with gratitude and worship. May my heart continually honor You for all You have done and all You continue to do.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        )
    ]

    // MARK: - Psalms 31-45
    private static let psalms31to45: [PrayerDay] = [
        PrayerDay(
            dayNumber: 31,
            title: "Into Your Hands",
            chapterReference: "Psalm 31",
            summary: "Pray for trust and refuge in times of distress.",
            verses: [
                PrayerVerse(
                    id: "psalm-31-1",
                    reference: "Psalm 31:1",
                    text: "In You, O Lord, I have taken refuge;\n  Let me never be ashamed;\n  In Your righteousness deliver me.",
                    prayer: "Lord, I take refuge in You. Help me trust in Your righteousness and deliverance when challenges arise."
                ),
                PrayerVerse(
                    id: "psalm-31-2",
                    reference: "Psalm 31:2",
                    text: "Incline Your ear to me, rescue me quickly;\n  Be to me a rock of strength,\n  A stronghold to save me.",
                    prayer: "Father, incline Your ear to my prayers. Be my rock of strength and my safe place in times of need."
                ),
                PrayerVerse(
                    id: "psalm-31-3",
                    reference: "Psalm 31:3",
                    text: "For You are my rock and my fortress;\n  For Your name’s sake You will lead me and guide me.",
                    prayer: "Lord, You are my fortress and my guide. Lead me according to Your wisdom and help me follow Your direction faithfully."
                ),
                PrayerVerse(
                    id: "psalm-31-4",
                    reference: "Psalm 31:4",
                    text: "You will pull me out of the net which they have secretly laid for me,\n  For You are my strength.",
                    prayer: "Father, rescue me from traps, temptations, and anything that seeks to draw me away from Your will."
                ),
                PrayerVerse(
                    id: "psalm-31-5",
                    reference: "Psalm 31:5",
                    text: "Into Your hand I commit my spirit;\n  You have ransomed me, O Lord, God of truth.",
                    prayer: "Lord, I place my life into Your hands. Thank You for Your faithfulness and for redeeming me through Your love."
                ),
                PrayerVerse(
                    id: "psalm-31-6",
                    reference: "Psalm 31:6",
                    text: "I hate those who regard vain idols,\n  But I trust in the Lord.",
                    prayer: "Father, keep my heart devoted to You alone. Help me reject anything that competes with my trust in You."
                ),
                PrayerVerse(
                    id: "psalm-31-7",
                    reference: "Psalm 31:7",
                    text: "I will rejoice and be glad in Your lovingkindness,\n  Because You have seen my affliction;\n  You have known the troubles of my soul,",
                    prayer: "Lord, thank You for Your lovingkindness and mercy. You see my struggles and care deeply about every concern I bring to You."
                ),
                PrayerVerse(
                    id: "psalm-31-8",
                    reference: "Psalm 31:8",
                    text: "And You have not given me over into the hand of the enemy;\n  You have set my feet in a large place.",
                    prayer: "Father, thank You for setting me in a place of freedom. Help me walk confidently in the liberty You provide."
                ),
                PrayerVerse(
                    id: "psalm-31-9",
                    reference: "Psalm 31:9",
                    text: "Be gracious to me, O Lord, for I am in distress;\n  My eye is wasted away from grief, my soul and my body also.",
                    prayer: "Lord, have mercy on me when I am distressed. Strengthen me when I feel weary and overwhelmed."
                ),
                PrayerVerse(
                    id: "psalm-31-10",
                    reference: "Psalm 31:10",
                    text: "For my life is spent with sorrow\n  And my years with sighing;\n  My strength has failed because of my iniquity,\n  And my body has wasted away.",
                    prayer: "Father, when sorrow or difficulty weighs upon me, renew my strength and remind me of Your sustaining grace."
                ),
                PrayerVerse(
                    id: "psalm-31-11",
                    reference: "Psalm 31:11",
                    text: "Because of all my adversaries, I have become a reproach,\n  Especially to my neighbors,\n  And an object of dread to my acquaintances;\n  Those who see me in the street flee from me.",
                    prayer: "Lord, when I feel rejected or misunderstood, help me remember that my identity is secure in You."
                ),
                PrayerVerse(
                    id: "psalm-31-12",
                    reference: "Psalm 31:12",
                    text: "I am forgotten as a dead man, out of mind;\n  I am like a broken vessel.",
                    prayer: "Father, even when I feel forgotten by others, remind me that I am never forgotten by You."
                ),
                PrayerVerse(
                    id: "psalm-31-13",
                    reference: "Psalm 31:13",
                    text: "For I have heard the slander of many,\n  Terror is on every side;\n  While they took counsel together against me,\n  They schemed to take away my life.",
                    prayer: "Lord, protect me from fear and anxiety. Help me trust You when circumstances seem threatening or uncertain."
                ),
                PrayerVerse(
                    id: "psalm-31-14",
                    reference: "Psalm 31:14",
                    text: "But as for me, I trust in You, O Lord,\n  I say, “You are my God.”",
                    prayer: "Father, I place my trust in You. Strengthen my faith and help me depend on Your promises."
                ),
                PrayerVerse(
                    id: "psalm-31-15",
                    reference: "Psalm 31:15",
                    text: "My times are in Your hand;\n  Deliver me from the hand of my enemies and from those who persecute me.",
                    prayer: "Lord, my times are in Your hands. Help me trust Your timing, Your plans, and Your purposes for my life."
                ),
                PrayerVerse(
                    id: "psalm-31-16",
                    reference: "Psalm 31:16",
                    text: "Make Your face to shine upon Your servant;\n  Save me in Your lovingkindness.",
                    prayer: "Father, let Your face shine upon me and fill me with the assurance of Your love and favor."
                ),
                PrayerVerse(
                    id: "psalm-31-17",
                    reference: "Psalm 31:17",
                    text: "Let me not be put to shame, O Lord, for I call upon You;\n  Let the wicked be put to shame, let them be silent in Sheol.",
                    prayer: "Lord, help me call upon You with confidence, knowing that You hear and answer according to Your perfect will."
                ),
                PrayerVerse(
                    id: "psalm-31-18",
                    reference: "Psalm 31:18",
                    text: "Let the lying lips be mute,\n  Which speak arrogantly against the righteous\n  With pride and contempt.",
                    prayer: "Father, establish truth and righteousness. Guard me from deception and help me speak with integrity."
                ),
                PrayerVerse(
                    id: "psalm-31-19",
                    reference: "Psalm 31:19",
                    text: "How great is Your goodness,\n  Which You have stored up for those who fear You,\n  Which You have wrought for those who take refuge in You,\n  Before the sons of men!",
                    prayer: "Lord, thank You for the abundance of Your goodness stored up for those who trust in You."
                ),
                PrayerVerse(
                    id: "psalm-31-20",
                    reference: "Psalm 31:20",
                    text: "You hide them in the secret place of Your presence from the conspiracies of man;\n  You keep them secretly in a shelter from the strife of tongues.",
                    prayer: "Father, hide me in the shelter of Your presence. Protect me from discouragement, fear, and harmful influences."
                ),
                PrayerVerse(
                    id: "psalm-31-21",
                    reference: "Psalm 31:21",
                    text: "Blessed be the Lord,\n  For He has made marvelous His lovingkindness to me in a besieged city.",
                    prayer: "Lord, thank You for Your wonderful lovingkindness and for showing Your faithfulness throughout my life."
                ),
                PrayerVerse(
                    id: "psalm-31-22",
                    reference: "Psalm 31:22",
                    text: "As for me, I said in my alarm,\n  “I am cut off from before Your eyes”;\n  Nevertheless You heard the voice of my supplications\n  When I cried to You.",
                    prayer: "Father, when I feel abandoned or afraid, remind me that You hear every prayer and never leave me alone."
                ),
                PrayerVerse(
                    id: "psalm-31-23",
                    reference: "Psalm 31:23",
                    text: "O love the Lord, all you His godly ones!\n  The Lord preserves the faithful\n  And fully recompenses the proud doer.",
                    prayer: "Lord, help me love You wholeheartedly and remain faithful to You in every season of life."
                ),
                PrayerVerse(
                    id: "psalm-31-24",
                    reference: "Psalm 31:24",
                    text: "Be strong and let your heart take courage,\n  All you who hope in the Lord.",
                    prayer: "Father, strengthen my heart as I wait for You. Fill me with courage, hope, and confidence in Your promises."
                ),
                PrayerVerse(
                    id: "psalm-31-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, my fortress, and my faithful protector. When fear, sorrow, or uncertainty come, help me place my trust fully in You. Strengthen my heart, guide my steps, and remind me that my life is safely in Your hands. Fill me with courage, peace, and hope as I continue to follow You. May I rest securely in Your love and faithfulness every day.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 32,
            title: "Blessed is the Forgiven",
            chapterReference: "Psalm 32",
            summary: "Pray for confession and forgiveness.",
            verses: [
                PrayerVerse(
                    id: "psalm-32-1",
                    reference: "Psalm 32:1",
                    text: "How blessed is he whose transgression is forgiven,\n  Whose sin is covered!",
                    prayer: "Lord, thank You for the blessing of forgiveness. Thank You for covering my sins and extending Your mercy to me through Your grace."
                ),
                PrayerVerse(
                    id: "psalm-32-2",
                    reference: "Psalm 32:2",
                    text: "How blessed is the man to whom the Lord does not impute iniquity,\n  And in whose spirit there is no deceit!",
                    prayer: "Father, thank You for not counting my sins against me when I come before You with a sincere and repentant heart. Help me walk in honesty and integrity."
                ),
                PrayerVerse(
                    id: "psalm-32-3",
                    reference: "Psalm 32:3",
                    text: "When I kept silent about my sin, my body wasted away\n  Through my groaning all day long.",
                    prayer: "Lord, when I am tempted to hide my failures, remind me that true freedom comes through confession and repentance before You."
                ),
                PrayerVerse(
                    id: "psalm-32-4",
                    reference: "Psalm 32:4",
                    text: "For day and night Your hand was heavy upon me;\n  My vitality was drained away as with the fever heat of summer. Selah.",
                    prayer: "Father, help me recognize Your loving discipline in my life and respond with humility rather than resistance."
                ),
                PrayerVerse(
                    id: "psalm-32-5",
                    reference: "Psalm 32:5",
                    text: "I acknowledged my sin to You,\n  And my iniquity I did not hide;\n  I said, “I will confess my transgressions to the Lord”;\n  And You forgave the guilt of my sin. Selah.",
                    prayer: "Lord, thank You that when I confess my sins, You forgive me completely. Help me live in the freedom and peace of Your forgiveness."
                ),
                PrayerVerse(
                    id: "psalm-32-6",
                    reference: "Psalm 32:6",
                    text: "Therefore, let everyone who is godly pray to You in a time when You may be found;\n  Surely in a flood of great waters they will not reach him.",
                    prayer: "Father, teach me to seek You while You may be found. Help me make prayer and fellowship with You a daily priority."
                ),
                PrayerVerse(
                    id: "psalm-32-7",
                    reference: "Psalm 32:7",
                    text: "You are my hiding place; You preserve me from trouble;\n  You surround me with songs of deliverance. Selah.",
                    prayer: "Lord, You are my hiding place and my protection. Surround me with Your presence and deliver me from fear and trouble."
                ),
                PrayerVerse(
                    id: "psalm-32-8",
                    reference: "Psalm 32:8",
                    text: "I will instruct you and teach you in the way which you should go;\n  I will counsel you with My eye upon you.",
                    prayer: "Father, thank You for Your guidance. Teach me the way I should go and help me follow Your direction faithfully."
                ),
                PrayerVerse(
                    id: "psalm-32-9",
                    reference: "Psalm 32:9",
                    text: "Do not be as the horse or as the mule which have no understanding,\n  Whose trappings include bit and bridle to hold them in check,\n  Otherwise they will not come near to you.",
                    prayer: "Lord, help me be willing and obedient rather than stubborn or resistant to Your leading. Give me a teachable spirit."
                ),
                PrayerVerse(
                    id: "psalm-32-10",
                    reference: "Psalm 32:10",
                    text: "Many are the sorrows of the wicked,\n  But he who trusts in the Lord, lovingkindness shall surround him.",
                    prayer: "Father, thank You for surrounding those who trust in You with lovingkindness. Help me rest securely in Your care."
                ),
                PrayerVerse(
                    id: "psalm-32-11",
                    reference: "Psalm 32:11",
                    text: "Be glad in the Lord and rejoice, you righteous ones;\n  And shout for joy, all you who are upright in heart.",
                    prayer: "Lord, fill my heart with joy and gladness because of Your forgiveness, grace, and faithfulness. Let my life be marked by worship and gratitude."
                ),
                PrayerVerse(
                    id: "psalm-32-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the gift of forgiveness and the freedom that comes through Your mercy. Help me walk honestly before You, quickly confess my sins, and trust fully in Your grace. Guide my steps, teach me Your ways, and surround me with Your lovingkindness. May my heart be filled with joy as I live each day in the assurance of Your forgiveness and love.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 33,
            title: "Sing Joyfully",
            chapterReference: "Psalm 33",
            summary: "Pray in praise of God's faithfulness and creation.",
            verses: [
                PrayerVerse(
                    id: "psalm-33-1",
                    reference: "Psalm 33:1",
                    text: "Sing for joy in the Lord, O you righteous ones;\n  Praise is becoming to the upright.",
                    prayer: "Lord, I rejoice in You and praise Your holy name. Fill my heart with joy as I worship You for Your goodness and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-33-2",
                    reference: "Psalm 33:2",
                    text: "Give thanks to the Lord with the lyre;\n  Sing praises to Him with a harp of ten strings.",
                    prayer: "Father, help me worship You with gratitude and sincerity. Let my praise be an expression of my love and devotion to You."
                ),
                PrayerVerse(
                    id: "psalm-33-3",
                    reference: "Psalm 33:3",
                    text: "Sing to Him a new song;\n  Play skillfully with a shout of joy.",
                    prayer: "Lord, place a new song in my heart. Help me continually celebrate Your faithfulness with joy and thanksgiving."
                ),
                PrayerVerse(
                    id: "psalm-33-4",
                    reference: "Psalm 33:4",
                    text: "For the word of the Lord is upright,\n  And all His work is done in faithfulness.",
                    prayer: "Father, Your Word is upright and true. Help me trust Your promises and build my life upon Your truth."
                ),
                PrayerVerse(
                    id: "psalm-33-5",
                    reference: "Psalm 33:5",
                    text: "He loves righteousness and justice;\n  The earth is full of the lovingkindness of the Lord.",
                    prayer: "Lord, thank You for loving righteousness and justice. Help me reflect Your character by treating others with fairness, compassion, and integrity."
                ),
                PrayerVerse(
                    id: "psalm-33-6",
                    reference: "Psalm 33:6",
                    text: "By the word of the Lord the heavens were made,\n  And by the breath of His mouth all their host.",
                    prayer: "Father, thank You for creating the heavens by Your Word. Remind me of Your limitless power and authority over all creation."
                ),
                PrayerVerse(
                    id: "psalm-33-7",
                    reference: "Psalm 33:7",
                    text: "He gathers the waters of the sea together as a heap;\n  He lays up the deeps in storehouses.",
                    prayer: "Lord, You hold all things together according to Your wisdom. Help me trust Your control over every circumstance in my life."
                ),
                PrayerVerse(
                    id: "psalm-33-8",
                    reference: "Psalm 33:8",
                    text: "Let all the earth fear the Lord;\n  Let all the inhabitants of the world stand in awe of Him.",
                    prayer: "Father, teach me to live with reverence and awe before You. May my heart honor and respect Your greatness."
                ),
                PrayerVerse(
                    id: "psalm-33-9",
                    reference: "Psalm 33:9",
                    text: "For He spoke, and it was done;\n  He commanded, and it stood fast.",
                    prayer: "Lord, You speak and creation obeys. Strengthen my faith in Your power and Your ability to accomplish all Your purposes."
                ),
                PrayerVerse(
                    id: "psalm-33-10",
                    reference: "Psalm 33:10",
                    text: "The Lord nullifies the counsel of the nations;\n  He frustrates the plans of the peoples.",
                    prayer: "Father, thank You that no human plan can overcome Your will. Help me trust Your purposes even when I do not understand them."
                ),
                PrayerVerse(
                    id: "psalm-33-11",
                    reference: "Psalm 33:11",
                    text: "The counsel of the Lord stands forever,\n  The plans of His heart from generation to generation.",
                    prayer: "Lord, Your plans stand forever. Align my heart with Your will and help me follow the path You have prepared for me."
                ),
                PrayerVerse(
                    id: "psalm-33-12",
                    reference: "Psalm 33:12",
                    text: "Blessed is the nation whose God is the Lord,\n  The people whom He has chosen for His own inheritance.",
                    prayer: "Father, thank You for the blessing of belonging to You. Help me live as part of Your people with gratitude and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-33-13",
                    reference: "Psalm 33:13",
                    text: "The Lord looks from heaven;\n  He sees all the sons of men;",
                    prayer: "Lord, thank You that You see every person and every situation. Nothing escapes Your loving attention."
                ),
                PrayerVerse(
                    id: "psalm-33-14",
                    reference: "Psalm 33:14",
                    text: "From His dwelling place He looks out\n  On all the inhabitants of the earth,",
                    prayer: "Father, remind me that You are present everywhere and fully aware of everything happening in my life."
                ),
                PrayerVerse(
                    id: "psalm-33-15",
                    reference: "Psalm 33:15",
                    text: "He who fashions the hearts of them all,\n  He who understands all their works.",
                    prayer: "Lord, You formed my heart and understand me completely. Help me trust You with every concern, fear, and desire."
                ),
                PrayerVerse(
                    id: "psalm-33-16",
                    reference: "Psalm 33:16",
                    text: "The king is not saved by a mighty army;\n  A warrior is not delivered by great strength.",
                    prayer: "Father, keep me from placing my confidence in worldly power or human strength. Teach me to trust in You alone."
                ),
                PrayerVerse(
                    id: "psalm-33-17",
                    reference: "Psalm 33:17",
                    text: "A horse is a false hope for victory;\n  Nor does it deliver anyone by its great strength.",
                    prayer: "Lord, earthly resources cannot save me, but You are my true source of security and hope."
                ),
                PrayerVerse(
                    id: "psalm-33-18",
                    reference: "Psalm 33:18",
                    text: "Behold, the eye of the Lord is on those who fear Him,\n  On those who hope for His lovingkindness,",
                    prayer: "Father, thank You for watching over those who fear You and place their hope in Your lovingkindness."
                ),
                PrayerVerse(
                    id: "psalm-33-19",
                    reference: "Psalm 33:19",
                    text: "To deliver their soul from death\n  And to keep them alive in famine.",
                    prayer: "Lord, preserve and sustain me through every season of life. Thank You for Your faithful provision and care."
                ),
                PrayerVerse(
                    id: "psalm-33-20",
                    reference: "Psalm 33:20",
                    text: "Our soul waits for the Lord;\n  He is our help and our shield.",
                    prayer: "Father, I wait for You with expectation and trust. You are my help and my shield."
                ),
                PrayerVerse(
                    id: "psalm-33-21",
                    reference: "Psalm 33:21",
                    text: "For our heart rejoices in Him,\n  Because we trust in His holy name.",
                    prayer: "Lord, fill my heart with joy because I trust in Your holy name and Your unfailing promises."
                ),
                PrayerVerse(
                    id: "psalm-33-22",
                    reference: "Psalm 33:22",
                    text: "Let Your lovingkindness, O Lord, be upon us,\n  According as we have hoped in You.",
                    prayer: "Father, let Your lovingkindness rest upon me as I place my hope completely in You."
                ),
                PrayerVerse(
                    id: "psalm-33-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your power, faithfulness, and unfailing love. Help me trust Your Word, rely on Your strength, and place my hope fully in You. Remind me that Your plans are perfect and that Your lovingkindness never fails. Fill my heart with worship, gratitude, and confidence as I follow You each day. May my life bring honor and glory to Your holy name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 34,
            title: "Taste and See",
            chapterReference: "Psalm 34",
            summary: "Pray for trust in God's goodness and deliverance.",
            verses: [
                PrayerVerse(
                    id: "psalm-34-1",
                    reference: "Psalm 34:1",
                    text: "I will bless the Lord at all times;\n  His praise shall continually be in my mouth.",
                    prayer: "Lord, I will bless You at all times. Help me keep praise on my lips regardless of my circumstances."
                ),
                PrayerVerse(
                    id: "psalm-34-2",
                    reference: "Psalm 34:2",
                    text: "My soul will make its boast in the Lord;\n  The humble will hear it and rejoice.",
                    prayer: "Father, let my soul boast in You alone. May my life point others to Your goodness and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-34-3",
                    reference: "Psalm 34:3",
                    text: "O magnify the Lord with me,\n  And let us exalt His name together.",
                    prayer: "Lord, help me join with others in worship and magnify Your name together with joyful hearts."
                ),
                PrayerVerse(
                    id: "psalm-34-4",
                    reference: "Psalm 34:4",
                    text: "I sought the Lord, and He answered me,\n  And delivered me from all my fears.",
                    prayer: "Father, thank You for hearing me when I seek You. Deliver me from fears that try to overwhelm my heart."
                ),
                PrayerVerse(
                    id: "psalm-34-5",
                    reference: "Psalm 34:5",
                    text: "They looked to Him and were radiant,\n  And their faces will never be ashamed.",
                    prayer: "Lord, help me keep my eyes fixed on You. Let Your presence fill me with hope, confidence, and joy."
                ),
                PrayerVerse(
                    id: "psalm-34-6",
                    reference: "Psalm 34:6",
                    text: "This poor man cried, and the Lord heard him\n  And saved him out of all his troubles.",
                    prayer: "Father, when I feel weak and needy, remind me that You hear my prayers and come to my rescue."
                ),
                PrayerVerse(
                    id: "psalm-34-7",
                    reference: "Psalm 34:7",
                    text: "The angel of the Lord encamps around those who fear Him,\n  And rescues them.",
                    prayer: "Lord, thank You for surrounding Your people with Your protection. Help me rest securely in Your care."
                ),
                PrayerVerse(
                    id: "psalm-34-8",
                    reference: "Psalm 34:8",
                    text: "O taste and see that the Lord is good;\n  How blessed is the man who takes refuge in Him!",
                    prayer: "Father, help me experience and recognize Your goodness each day. Teach me to trust You more deeply."
                ),
                PrayerVerse(
                    id: "psalm-34-9",
                    reference: "Psalm 34:9",
                    text: "O fear the Lord, you His saints;\n  For to those who fear Him there is no want.",
                    prayer: "Lord, teach me to fear You with reverence and awe. Thank You for providing for those who place their trust in You."
                ),
                PrayerVerse(
                    id: "psalm-34-10",
                    reference: "Psalm 34:10",
                    text: "The young lions do lack and suffer hunger;\n  But they who seek the Lord shall not be in want of any good thing.",
                    prayer: "Father, remind me that You are my provider. Even when resources seem limited, You are enough."
                ),
                PrayerVerse(
                    id: "psalm-34-11",
                    reference: "Psalm 34:11",
                    text: "Come, you children, listen to me;\n  I will teach you the fear of the Lord.",
                    prayer: "Lord, give me a teachable heart that desires to learn Your ways and grow in wisdom."
                ),
                PrayerVerse(
                    id: "psalm-34-12",
                    reference: "Psalm 34:12",
                    text: "Who is the man who desires life\n  And loves length of days that he may see good?",
                    prayer: "Father, help me live a life that is meaningful, fruitful, and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "psalm-34-13",
                    reference: "Psalm 34:13",
                    text: "Keep your tongue from evil\n  And your lips from speaking deceit.",
                    prayer: "Lord, guard my tongue from evil and my lips from deceit. Help my words reflect Your truth and love."
                ),
                PrayerVerse(
                    id: "psalm-34-14",
                    reference: "Psalm 34:14",
                    text: "Depart from evil and do good;\n  Seek peace and pursue it.",
                    prayer: "Father, help me turn away from evil and pursue what is good. Teach me to seek peace and live it out daily."
                ),
                PrayerVerse(
                    id: "psalm-34-15",
                    reference: "Psalm 34:15",
                    text: "The eyes of the Lord are toward the righteous\n  And His ears are open to their cry.",
                    prayer: "Lord, thank You that Your eyes are upon the righteous and that You hear their prayers."
                ),
                PrayerVerse(
                    id: "psalm-34-16",
                    reference: "Psalm 34:16",
                    text: "The face of the Lord is against evildoers,\n  To cut off the memory of them from the earth.",
                    prayer: "Father, remind me that You are a God of justice and righteousness. Help me trust Your judgment."
                ),
                PrayerVerse(
                    id: "psalm-34-17",
                    reference: "Psalm 34:17",
                    text: "The righteous cry, and the Lord hears\n  And delivers them out of all their troubles.",
                    prayer: "Lord, thank You for hearing the cries of Your people and delivering them from trouble according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-34-18",
                    reference: "Psalm 34:18",
                    text: "The Lord is near to the brokenhearted\n  And saves those who are crushed in spirit.",
                    prayer: "Father, stay close to those who are brokenhearted. Bring comfort, healing, and hope to hurting hearts."
                ),
                PrayerVerse(
                    id: "psalm-34-19",
                    reference: "Psalm 34:19",
                    text: "Many are the afflictions of the righteous,\n  But the Lord delivers him out of them all.",
                    prayer: "Lord, even when I face many difficulties, help me trust that You remain faithful and present with me."
                ),
                PrayerVerse(
                    id: "psalm-34-20",
                    reference: "Psalm 34:20",
                    text: "He keeps all his bones,\n  Not one of them is broken.",
                    prayer: "Father, thank You for Your protection and care. Guard my life according to Your perfect purposes."
                ),
                PrayerVerse(
                    id: "psalm-34-21",
                    reference: "Psalm 34:21",
                    text: "Evil shall slay the wicked,\n  And those who hate the righteous will be condemned.",
                    prayer: "Lord, keep me on the path of righteousness and protect me from the consequences of sin and rebellion."
                ),
                PrayerVerse(
                    id: "psalm-34-22",
                    reference: "Psalm 34:22",
                    text: "The Lord redeems the soul of His servants,\n  And none of those who take refuge in Him will be condemned.",
                    prayer: "Father, thank You for redeeming Your servants and providing refuge for all who trust in You."
                ),
                PrayerVerse(
                    id: "psalm-34-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your goodness, protection, and faithfulness. Help me praise You in every season, trust You in every circumstance, and seek You with all my heart. Guard my words, guide my steps, and keep me close to You. When fears arise, remind me that You hear my prayers and surround me with Your care. May my life continually reflect Your goodness and bring glory to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 35,
            title: "Contend for Me",
            chapterReference: "Psalm 35",
            summary: "Pray for God's defense and vindication.",
            verses: [
                PrayerVerse(
                    id: "psalm-35-1",
                    reference: "Psalm 35:1",
                    text: "Contend, O Lord, with those who contend with me;\n  Fight against those who fight against me.",
                    prayer: "Lord, fight for me when I face battles beyond my strength. Be my defender and help me trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-35-2",
                    reference: "Psalm 35:2",
                    text: "Take hold of buckler and shield\n  And rise up for my help.",
                    prayer: "Father, thank You for being my shield and protection. Strengthen me when I feel vulnerable or afraid."
                ),
                PrayerVerse(
                    id: "psalm-35-3",
                    reference: "Psalm 35:3",
                    text: "Draw also the spear and the battle-axe to meet those who pursue me;\n  Say to my soul, “I am your salvation.”",
                    prayer: "Lord, remind my soul that You are my salvation. Fill my heart with confidence in Your deliverance and care."
                ),
                PrayerVerse(
                    id: "psalm-35-4",
                    reference: "Psalm 35:4",
                    text: "Let those be ashamed and dishonored who seek my life;\n  Let those be turned back and humiliated who devise evil against me.",
                    prayer: "Father, frustrate every plan that seeks to harm me spiritually and draw me away from Your will."
                ),
                PrayerVerse(
                    id: "psalm-35-5",
                    reference: "Psalm 35:5",
                    text: "Let them be like chaff before the wind,\n  With the angel of the Lord driving them on.",
                    prayer: "Lord, remove obstacles placed by the enemy and lead me securely in the path You have prepared."
                ),
                PrayerVerse(
                    id: "psalm-35-6",
                    reference: "Psalm 35:6",
                    text: "Let their way be dark and slippery,\n  With the angel of the Lord pursuing them.",
                    prayer: "Father, guide me through difficult and uncertain seasons. Let Your light direct my steps."
                ),
                PrayerVerse(
                    id: "psalm-35-7",
                    reference: "Psalm 35:7",
                    text: "For without cause they hid their net for me;\n  Without cause they dug a pit for my soul.",
                    prayer: "Lord, protect me from hidden traps, temptations, and dangers that I cannot see."
                ),
                PrayerVerse(
                    id: "psalm-35-8",
                    reference: "Psalm 35:8",
                    text: "Let destruction come upon him unawares,\n  And let the net which he hid catch himself;\n  Into that very destruction let him fall.",
                    prayer: "Father, I trust Your justice. Help me place every wrong and every hurt into Your hands."
                ),
                PrayerVerse(
                    id: "psalm-35-9",
                    reference: "Psalm 35:9",
                    text: "And my soul shall rejoice in the Lord;\n  It shall exult in His salvation.",
                    prayer: "Lord, let my soul rejoice in Your salvation and celebrate the victories You bring into my life."
                ),
                PrayerVerse(
                    id: "psalm-35-10",
                    reference: "Psalm 35:10",
                    text: "All my bones will say, “Lord, who is like You,\n  Who delivers the afflicted from him who is too strong for him,\n  And the afflicted and the needy from him who robs him?”",
                    prayer: "Father, thank You for rescuing the weak, the needy, and those who trust in You. Help me remember Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-35-11",
                    reference: "Psalm 35:11",
                    text: "Malicious witnesses rise up;\n  They ask me of things that I do not know.",
                    prayer: "Lord, when others misunderstand or falsely accuse me, help me respond with wisdom, grace, and integrity."
                ),
                PrayerVerse(
                    id: "psalm-35-12",
                    reference: "Psalm 35:12",
                    text: "They repay me evil for good,\n  To the bereavement of my soul.",
                    prayer: "Father, when I experience disappointment or betrayal, comfort my heart and remind me that You never fail."
                ),
                PrayerVerse(
                    id: "psalm-35-13",
                    reference: "Psalm 35:13",
                    text: "But as for me, when they were sick, my clothing was sackcloth;\n  I humbled my soul with fasting,\n  And my prayer kept returning to my bosom.",
                    prayer: "Lord, teach me to pray for others, even those who may oppose or hurt me. Help me reflect Your mercy."
                ),
                PrayerVerse(
                    id: "psalm-35-14",
                    reference: "Psalm 35:14",
                    text: "I went about as though it were my friend or brother;\n  I bowed down mourning, as one who sorrows for a mother.",
                    prayer: "Father, give me a compassionate heart that genuinely cares for others and seeks their good."
                ),
                PrayerVerse(
                    id: "psalm-35-15",
                    reference: "Psalm 35:15",
                    text: "But at my stumbling they rejoiced and gathered themselves together;\n  The smiters whom I did not know gathered together against me,\n  They slandered me without ceasing.",
                    prayer: "Lord, when I feel rejected or mocked, help me find my identity and security in You alone."
                ),
                PrayerVerse(
                    id: "psalm-35-16",
                    reference: "Psalm 35:16",
                    text: "Like godless jesters at a feast,\n  They gnashed at me with their teeth.",
                    prayer: "Father, guard my heart from bitterness. Teach me to forgive and trust You with every injustice."
                ),
                PrayerVerse(
                    id: "psalm-35-17",
                    reference: "Psalm 35:17",
                    text: "Lord, how long will You look on?\n  Rescue my soul from their ravages,\n  My only life from the lions.",
                    prayer: "Lord, rescue me from discouragement and despair. Renew my strength and restore my hope in You."
                ),
                PrayerVerse(
                    id: "psalm-35-18",
                    reference: "Psalm 35:18",
                    text: "I will give You thanks in the great congregation;\n  I will praise You among a mighty throng.",
                    prayer: "Father, I will give thanks to You publicly and praise You for Your faithfulness in my life."
                ),
                PrayerVerse(
                    id: "psalm-35-19",
                    reference: "Psalm 35:19",
                    text: "Do not let those who are wrongfully my enemies rejoice over me;\n  Nor let those who hate me without cause wink maliciously.",
                    prayer: "Lord, protect me from those who rejoice in wrongdoing. Help me remain faithful to truth and righteousness."
                ),
                PrayerVerse(
                    id: "psalm-35-20",
                    reference: "Psalm 35:20",
                    text: "For they do not speak peace,\n  But they devise deceitful words against those who are quiet in the land.",
                    prayer: "Father, let peace, truth, and integrity guide my relationships and conversations."
                ),
                PrayerVerse(
                    id: "psalm-35-21",
                    reference: "Psalm 35:21",
                    text: "They opened their mouth wide against me;\n  They said, “Aha, aha, our eyes have seen it!”",
                    prayer: "Lord, when others speak against me, help me trust that You know the truth and see every situation clearly."
                ),
                PrayerVerse(
                    id: "psalm-35-22",
                    reference: "Psalm 35:22",
                    text: "You have seen it, O Lord, do not keep silent;\n  O Lord, do not be far from me.",
                    prayer: "Father, thank You that You see my struggles and understand every challenge I face."
                ),
                PrayerVerse(
                    id: "psalm-35-23",
                    reference: "Psalm 35:23",
                    text: "Stir up Yourself, and awake to my right\n  And to my cause, my God and my Lord.",
                    prayer: "Lord, arise and defend me according to Your perfect wisdom and justice."
                ),
                PrayerVerse(
                    id: "psalm-35-24",
                    reference: "Psalm 35:24",
                    text: "Judge me, O Lord my God, according to Your righteousness,\n  And do not let them rejoice over me.",
                    prayer: "Father, judge righteously and help me trust Your timing in every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-35-25",
                    reference: "Psalm 35:25",
                    text: "Do not let them say in their heart, “Aha, our desire!”\n  Do not let them say, “We have swallowed him up!”",
                    prayer: "Lord, do not allow fear or discouragement to gain victory in my life. Strengthen my faith in You."
                ),
                PrayerVerse(
                    id: "psalm-35-26",
                    reference: "Psalm 35:26",
                    text: "Let those be ashamed and humiliated altogether who rejoice at my distress;\n  Let those be clothed with shame and dishonor who magnify themselves over me.",
                    prayer: "Father, bring humility where there is pride and establish righteousness where there is wrongdoing."
                ),
                PrayerVerse(
                    id: "psalm-35-27",
                    reference: "Psalm 35:27",
                    text: "Let them shout for joy and rejoice, who favor my vindication;\n  And let them say continually, “The Lord be magnified,\n  Who delights in the prosperity of His servant.”",
                    prayer: "Lord, let those who love You rejoice in Your goodness. Fill my heart with gratitude and praise."
                ),
                PrayerVerse(
                    id: "psalm-35-28",
                    reference: "Psalm 35:28",
                    text: "And my tongue shall declare Your righteousness\n  And Your praise all day long.",
                    prayer: "Father, may my tongue continually speak of Your righteousness and declare Your praise throughout the day."
                ),
                PrayerVerse(
                    id: "psalm-35-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my defender, protector, and source of strength. When I face difficulties, misunderstandings, or spiritual battles, help me trust You completely. Guard my heart from fear, bitterness, and discouragement. Fill me with compassion, faith, and confidence in Your justice. May my life continually praise You and testify to Your faithfulness, goodness, and salvation.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 36,
            title: "Your Love Reaches",
            chapterReference: "Psalm 36",
            summary: "Pray in awe of God's unfailing love.",
            verses: [
                PrayerVerse(
                    id: "psalm-36-1",
                    reference: "Psalm 36:1",
                    text: "Transgression speaks to the ungodly within his heart;\n  There is no fear of God before his eyes.",
                    prayer: "Lord, protect my heart from the deception of sin. Help me walk in reverence for You and remain sensitive to Your truth."
                ),
                PrayerVerse(
                    id: "psalm-36-2",
                    reference: "Psalm 36:2",
                    text: "For it flatters him in his own eyes\n  Concerning the discovery of his iniquity and the hatred of it.",
                    prayer: "Father, guard me from self-deception and pride. Give me humility to recognize my need for Your grace every day."
                ),
                PrayerVerse(
                    id: "psalm-36-3",
                    reference: "Psalm 36:3",
                    text: "The words of his mouth are wickedness and deceit;\n  He has ceased to be wise and to do good.",
                    prayer: "Lord, let my words reflect wisdom, kindness, and truth. Keep me from speech that dishonors You."
                ),
                PrayerVerse(
                    id: "psalm-36-4",
                    reference: "Psalm 36:4",
                    text: "He plans wickedness upon his bed;\n  He sets himself on a path that is not good;\n  He does not despise evil.",
                    prayer: "Father, help me reject sinful paths and choose what is good, righteous, and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "psalm-36-5",
                    reference: "Psalm 36:5",
                    text: "Your lovingkindness, O Lord, extends to the heavens,\n  Your faithfulness reaches to the skies.",
                    prayer: "Lord, thank You for Your lovingkindness that reaches to the heavens. Your faithfulness is beyond measure, and I trust in Your unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-36-6",
                    reference: "Psalm 36:6",
                    text: "Your righteousness is like the mountains of God;\n  Your judgments are like a great deep.\n  O Lord, You preserve man and beast.",
                    prayer: "Father, Your righteousness and justice are perfect. Help me rest confidently in Your wisdom and Your care."
                ),
                PrayerVerse(
                    id: "psalm-36-7",
                    reference: "Psalm 36:7",
                    text: "How precious is Your lovingkindness, O God!\n  And the children of men take refuge in the shadow of Your wings.",
                    prayer: "Lord, thank You for the precious gift of Your love. Help me find refuge under the shadow of Your wings."
                ),
                PrayerVerse(
                    id: "psalm-36-8",
                    reference: "Psalm 36:8",
                    text: "They drink their fill of the abundance of Your house;\n  And You give them to drink of the river of Your delights.",
                    prayer: "Father, satisfy my soul with the abundance of Your presence. Fill my life with the joy that comes from knowing You."
                ),
                PrayerVerse(
                    id: "psalm-36-9",
                    reference: "Psalm 36:9",
                    text: "For with You is the fountain of life;\n  In Your light we see light.",
                    prayer: "Lord, You are the source of life and light. Help me walk in Your truth and allow Your light to guide my path."
                ),
                PrayerVerse(
                    id: "psalm-36-10",
                    reference: "Psalm 36:10",
                    text: "O continue Your lovingkindness to those who know You,\n  And Your righteousness to the upright in heart.",
                    prayer: "Father, continue pouring out Your lovingkindness upon those who know You. Help me remain faithful and devoted to You."
                ),
                PrayerVerse(
                    id: "psalm-36-11",
                    reference: "Psalm 36:11",
                    text: "Let not the foot of pride come upon me,\n  And let not the hand of the wicked drive me away.",
                    prayer: "Lord, protect me from pride and from influences that seek to pull me away from Your will."
                ),
                PrayerVerse(
                    id: "psalm-36-12",
                    reference: "Psalm 36:12",
                    text: "There the doers of iniquity have fallen;\n  They have been thrust down and cannot rise.",
                    prayer: "Father, thank You that evil will not ultimately prevail. Help me trust in Your victory, justice, and sovereign plan."
                ),
                PrayerVerse(
                    id: "psalm-36-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your unfailing love, faithfulness, and righteousness. Protect my heart from sin and pride, and help me walk daily in Your truth. Let me find refuge in Your presence and satisfaction in Your love. Guide me by Your light, strengthen my faith, and help me trust fully in Your perfect justice and care. May my life reflect gratitude for Your goodness and glory.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 37,
            title: "Do Not Fret",
            chapterReference: "Psalm 37",
            summary: "Pray for patience and trust in God's timing.",
            verses: [
                PrayerVerse(
                    id: "psalm-37-1",
                    reference: "Psalm 37:1",
                    text: "Do not fret because of evildoers,\n  Be not envious toward wrongdoers.",
                    prayer: "Lord, help me not become discouraged when I see wrongdoing prosper. Keep my eyes focused on You and Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-37-2",
                    reference: "Psalm 37:2",
                    text: "For they will wither quickly like the grass\n  And fade like the green herb.",
                    prayer: "Father, remind me that earthly success is temporary, but Your kingdom and Your promises endure forever."
                ),
                PrayerVerse(
                    id: "psalm-37-3",
                    reference: "Psalm 37:3",
                    text: "Trust in the Lord and do good;\n  Dwell in the land and cultivate faithfulness.",
                    prayer: "Lord, help me trust in You and continue doing good. Teach me to live faithfully wherever You have placed me."
                ),
                PrayerVerse(
                    id: "psalm-37-4",
                    reference: "Psalm 37:4",
                    text: "Delight yourself in the Lord;\n  And He will give you the desires of your heart.",
                    prayer: "Father, help me delight myself in You above all else. Shape my desires so they align with Your will."
                ),
                PrayerVerse(
                    id: "psalm-37-5",
                    reference: "Psalm 37:5",
                    text: "Commit your way to the Lord,\n  Trust also in Him, and He will do it.",
                    prayer: "Lord, I commit my life and my plans to You. Guide my steps and help me trust Your direction."
                ),
                PrayerVerse(
                    id: "psalm-37-6",
                    reference: "Psalm 37:6",
                    text: "He will bring forth your righteousness as the light\n  And your judgment as the noonday.",
                    prayer: "Father, thank You that You bring righteousness and truth into the light. Help me trust Your timing."
                ),
                PrayerVerse(
                    id: "psalm-37-7",
                    reference: "Psalm 37:7",
                    text: "Rest in the Lord and wait patiently for Him;\n  Do not fret because of him who prospers in his way,\n  Because of the man who carries out wicked schemes.",
                    prayer: "Lord, teach me to rest in You and wait patiently for Your work to unfold in my life."
                ),
                PrayerVerse(
                    id: "psalm-37-8",
                    reference: "Psalm 37:8",
                    text: "Cease from anger and forsake wrath;\n  Do not fret; it leads only to evildoing.",
                    prayer: "Father, remove anger, bitterness, and frustration from my heart. Fill me instead with peace and trust."
                ),
                PrayerVerse(
                    id: "psalm-37-9",
                    reference: "Psalm 37:9",
                    text: "For evildoers will be cut off,\n  But those who wait for the Lord, they will inherit the land.",
                    prayer: "Lord, help me remember that those who hope in You will inherit blessings far greater than anything this world offers."
                ),
                PrayerVerse(
                    id: "psalm-37-10",
                    reference: "Psalm 37:10",
                    text: "Yet a little while and the wicked man will be no more;\n  And you will look carefully for his place and he will not be there.",
                    prayer: "Father, remind me that evil is temporary, but Your reign is eternal."
                ),
                PrayerVerse(
                    id: "psalm-37-11",
                    reference: "Psalm 37:11",
                    text: "But the humble will inherit the land\n  And will delight themselves in abundant prosperity.",
                    prayer: "Lord, cultivate humility within me and help me experience the peace that comes from trusting You."
                ),
                PrayerVerse(
                    id: "psalm-37-12",
                    reference: "Psalm 37:12",
                    text: "The wicked plots against the righteous\n  And gnashes at him with his teeth.",
                    prayer: "Father, when others oppose what is right, help me remain faithful and confident in Your protection."
                ),
                PrayerVerse(
                    id: "psalm-37-13",
                    reference: "Psalm 37:13",
                    text: "The Lord laughs at him,\n  For He sees his day is coming.",
                    prayer: "Lord, thank You that You see the end from the beginning and that nothing takes You by surprise."
                ),
                PrayerVerse(
                    id: "psalm-37-14",
                    reference: "Psalm 37:14",
                    text: "The wicked have drawn the sword and bent their bow\n  To cast down the afflicted and the needy,\n  To slay those who are upright in conduct.",
                    prayer: "Father, protect the vulnerable and help me stand for what is right with courage and compassion."
                ),
                PrayerVerse(
                    id: "psalm-37-15",
                    reference: "Psalm 37:15",
                    text: "Their sword will enter their own heart,\n  And their bows will be broken.",
                    prayer: "Lord, I trust that Your justice will prevail. Help me leave judgment in Your hands."
                ),
                PrayerVerse(
                    id: "psalm-37-16",
                    reference: "Psalm 37:16",
                    text: "Better is the little of the righteous\n  Than the abundance of many wicked.",
                    prayer: "Father, teach me to value a life of righteousness over worldly wealth and success."
                ),
                PrayerVerse(
                    id: "psalm-37-17",
                    reference: "Psalm 37:17",
                    text: "For the arms of the wicked will be broken,\n  But the Lord sustains the righteous.",
                    prayer: "Lord, thank You for sustaining those who trust in You. Strengthen me through every season."
                ),
                PrayerVerse(
                    id: "psalm-37-18",
                    reference: "Psalm 37:18",
                    text: "The Lord knows the days of the blameless,\n  And their inheritance will be forever.",
                    prayer: "Father, thank You that You know every detail of my life and faithfully care for me."
                ),
                PrayerVerse(
                    id: "psalm-37-19",
                    reference: "Psalm 37:19",
                    text: "They will not be ashamed in the time of evil,\n  And in the days of famine they will have abundance.",
                    prayer: "Lord, help me trust You during difficult times and remember that You are my provider."
                ),
                PrayerVerse(
                    id: "psalm-37-20",
                    reference: "Psalm 37:20",
                    text: "But the wicked will perish;\n  And the enemies of the Lord will be like the glory of the pastures,\n  They vanish—like smoke they vanish away.",
                    prayer: "Father, remind me that only what is built upon You will last forever."
                ),
                PrayerVerse(
                    id: "psalm-37-21",
                    reference: "Psalm 37:21",
                    text: "The wicked borrows and does not pay back,\n  But the righteous is gracious and gives.",
                    prayer: "Lord, help me live generously and reflect Your kindness toward others."
                ),
                PrayerVerse(
                    id: "psalm-37-22",
                    reference: "Psalm 37:22",
                    text: "For those blessed by Him will inherit the land,\n  But those cursed by Him will be cut off.",
                    prayer: "Father, thank You for Your blessing upon those who follow You. Help me walk faithfully in Your ways."
                ),
                PrayerVerse(
                    id: "psalm-37-23",
                    reference: "Psalm 37:23",
                    text: "The steps of a man are established by the Lord,\n  And He delights in his way.",
                    prayer: "Lord, establish my steps and guide me according to Your purpose and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-37-24",
                    reference: "Psalm 37:24",
                    text: "When he falls, he will not be hurled headlong,\n  Because the Lord is the One who holds his hand.",
                    prayer: "Father, when I stumble, thank You for lifting me up and helping me continue forward."
                ),
                PrayerVerse(
                    id: "psalm-37-25",
                    reference: "Psalm 37:25",
                    text: "I have been young and now I am old,\n  Yet I have not seen the righteous forsaken\n  Or his descendants begging bread.",
                    prayer: "Lord, thank You for Your lifelong faithfulness and provision. Help me remember Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-37-26",
                    reference: "Psalm 37:26",
                    text: "All day long he is gracious and lends,\n  And his descendants are a blessing.",
                    prayer: "Father, let generosity and compassion characterize my life as they reflect Your heart."
                ),
                PrayerVerse(
                    id: "psalm-37-27",
                    reference: "Psalm 37:27",
                    text: "Depart from evil and do good,\n  So you will abide forever.",
                    prayer: "Lord, help me turn away from evil and pursue what is good and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "psalm-37-28",
                    reference: "Psalm 37:28",
                    text: "For the Lord loves justice\n  And does not forsake His godly ones;\n  They are preserved forever,\n  But the descendants of the wicked will be cut off.",
                    prayer: "Father, thank You for loving justice and never abandoning those who trust in You."
                ),
                PrayerVerse(
                    id: "psalm-37-29",
                    reference: "Psalm 37:29",
                    text: "The righteous will inherit the land\n  And dwell in it forever.",
                    prayer: "Lord, help me focus on the eternal inheritance You have prepared for Your people."
                ),
                PrayerVerse(
                    id: "psalm-37-30",
                    reference: "Psalm 37:30",
                    text: "The mouth of the righteous utters wisdom,\n  And his tongue speaks justice.",
                    prayer: "Father, let wisdom guide my words and help me speak truth with grace and love."
                ),
                PrayerVerse(
                    id: "psalm-37-31",
                    reference: "Psalm 37:31",
                    text: "The law of his God is in his heart;\n  His steps do not slip.",
                    prayer: "Lord, write Your Word upon my heart so that I may walk faithfully in Your ways."
                ),
                PrayerVerse(
                    id: "psalm-37-32",
                    reference: "Psalm 37:32",
                    text: "The wicked spies upon the righteous\n  And seeks to kill him.",
                    prayer: "Father, protect me from those things that seek to pull me away from You and weaken my faith."
                ),
                PrayerVerse(
                    id: "psalm-37-33",
                    reference: "Psalm 37:33",
                    text: "The Lord will not leave him in his hand\n  Or let him be condemned when he is judged.",
                    prayer: "Lord, thank You that You never abandon Your people and that Your hand remains upon us."
                ),
                PrayerVerse(
                    id: "psalm-37-34",
                    reference: "Psalm 37:34",
                    text: "Wait for the Lord and keep His way,\n  And He will exalt you to inherit the land;\n  When the wicked are cut off, you will see it.",
                    prayer: "Father, help me wait patiently for You and trust Your perfect timing in all things."
                ),
                PrayerVerse(
                    id: "psalm-37-35",
                    reference: "Psalm 37:35",
                    text: "I have seen a wicked, violent man\n  Spreading himself like a luxuriant tree in its native soil.",
                    prayer: "Lord, remind me that worldly power is temporary and cannot compare to Your eternal kingdom."
                ),
                PrayerVerse(
                    id: "psalm-37-36",
                    reference: "Psalm 37:36",
                    text: "Then he passed away, and lo, he was no more;\n  I sought for him, but he could not be found.",
                    prayer: "Father, help me keep an eternal perspective and remember what truly matters."
                ),
                PrayerVerse(
                    id: "psalm-37-37",
                    reference: "Psalm 37:37",
                    text: "Mark the blameless man, and behold the upright;\n  For the man of peace will have a posterity.",
                    prayer: "Lord, help me pursue integrity, peace, and faithfulness throughout my life."
                ),
                PrayerVerse(
                    id: "psalm-37-38",
                    reference: "Psalm 37:38",
                    text: "But transgressors will be altogether destroyed;\n  The posterity of the wicked will be cut off.",
                    prayer: "Father, strengthen my resolve to walk in obedience and remain faithful to You."
                ),
                PrayerVerse(
                    id: "psalm-37-39",
                    reference: "Psalm 37:39",
                    text: "But the salvation of the righteous is from the Lord;\n  He is their strength in time of trouble.",
                    prayer: "Lord, thank You for being my salvation, my refuge, and my strength in times of trouble."
                ),
                PrayerVerse(
                    id: "psalm-37-40",
                    reference: "Psalm 37:40",
                    text: "The Lord helps them and delivers them;\n  He delivers them from the wicked and saves them,\n  Because they take refuge in Him.",
                    prayer: "Father, thank You for helping and delivering those who trust in You. May my confidence always remain in Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-37-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your faithfulness, justice, and provision. Help me trust You when I am tempted to compare my life to others or become discouraged by what I see around me. Teach me to delight in You, commit my ways to You, and wait patiently for Your perfect timing. Establish my steps, strengthen my faith, and help me live with integrity, generosity, and peace. May my life remain firmly rooted in Your promises and Your unfailing love.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 38,
            title: "Do Not Forsake Me",
            chapterReference: "Psalm 38",
            summary: "Pray for healing and God's presence in suffering.",
            verses: [
                PrayerVerse(
                    id: "psalm-38-1",
                    reference: "Psalm 38:1",
                    text: "O Lord, rebuke me not in Your wrath,\n  And chasten me not in Your burning anger.",
                    prayer: "Lord, when You correct me, help me receive Your discipline with humility and a willing heart."
                ),
                PrayerVerse(
                    id: "psalm-38-2",
                    reference: "Psalm 38:2",
                    text: "For Your arrows have sunk deep into me,\n  And Your hand has pressed down on me.",
                    prayer: "Father, remind me that Your correction comes from love and is meant to draw me closer to You."
                ),
                PrayerVerse(
                    id: "psalm-38-3",
                    reference: "Psalm 38:3",
                    text: "There is no soundness in my flesh because of Your indignation;\n  There is no health in my bones because of my sin.",
                    prayer: "Lord, reveal areas of my life that need healing and restoration. Help me turn fully to You."
                ),
                PrayerVerse(
                    id: "psalm-38-4",
                    reference: "Psalm 38:4",
                    text: "For my iniquities are gone over my head;\n  As a heavy burden they weigh too much for me.",
                    prayer: "Father, when the weight of sin and failure feels overwhelming, remind me of Your mercy and forgiveness."
                ),
                PrayerVerse(
                    id: "psalm-38-5",
                    reference: "Psalm 38:5",
                    text: "My wounds grow foul and fester\n  Because of my folly.",
                    prayer: "Lord, help me recognize the consequences of sin and give me wisdom to walk in obedience."
                ),
                PrayerVerse(
                    id: "psalm-38-6",
                    reference: "Psalm 38:6",
                    text: "I am bent over and greatly bowed down;\n  I go mourning all day long.",
                    prayer: "Father, when I feel burdened and discouraged, strengthen me and lift my eyes toward Your hope."
                ),
                PrayerVerse(
                    id: "psalm-38-7",
                    reference: "Psalm 38:7",
                    text: "For my loins are filled with burning,\n  And there is no soundness in my flesh.",
                    prayer: "Lord, bring healing to every area of weakness in my life—physically, emotionally, and spiritually."
                ),
                PrayerVerse(
                    id: "psalm-38-8",
                    reference: "Psalm 38:8",
                    text: "I am benumbed and badly crushed;\n  I groan because of the agitation of my heart.",
                    prayer: "Father, when I feel exhausted and overwhelmed, renew my strength and sustain me by Your grace."
                ),
                PrayerVerse(
                    id: "psalm-38-9",
                    reference: "Psalm 38:9",
                    text: "Lord, all my desire is before You;\n  And my sighing is not hidden from You.",
                    prayer: "Lord, You know every desire and struggle within my heart. Thank You for understanding me completely."
                ),
                PrayerVerse(
                    id: "psalm-38-10",
                    reference: "Psalm 38:10",
                    text: "My heart throbs, my strength fails me;\n  And the light of my eyes, even that has gone from me.",
                    prayer: "Father, when my strength fails, remind me that Your power is made perfect in weakness."
                ),
                PrayerVerse(
                    id: "psalm-38-11",
                    reference: "Psalm 38:11",
                    text: "My loved ones and my friends stand aloof from my plague;\n  And my kinsmen stand afar off.",
                    prayer: "Lord, when I feel isolated or alone, help me remember that You never leave nor forsake me."
                ),
                PrayerVerse(
                    id: "psalm-38-12",
                    reference: "Psalm 38:12",
                    text: "Those who seek my life lay snares for me;\n  And those who seek to injure me have threatened destruction,\n  And they devise treachery all day long.",
                    prayer: "Father, protect me from harmful influences and from those things that seek to draw me away from You."
                ),
                PrayerVerse(
                    id: "psalm-38-13",
                    reference: "Psalm 38:13",
                    text: "But I, like a deaf man, do not hear;\n  And I am like a mute man who does not open his mouth.",
                    prayer: "Lord, teach me when to remain silent and when to speak with wisdom and grace."
                ),
                PrayerVerse(
                    id: "psalm-38-14",
                    reference: "Psalm 38:14",
                    text: "Yes, I am like a man who does not hear,\n  And in whose mouth are no arguments.",
                    prayer: "Father, help me respond to difficult situations with patience, humility, and trust in You."
                ),
                PrayerVerse(
                    id: "psalm-38-15",
                    reference: "Psalm 38:15",
                    text: "For I hope in You, O Lord;\n  You will answer, O Lord my God.",
                    prayer: "Lord, I place my hope in You. Thank You for hearing my prayers and caring for my needs."
                ),
                PrayerVerse(
                    id: "psalm-38-16",
                    reference: "Psalm 38:16",
                    text: "For I said, “May they not rejoice over me,\n  Who, when my foot slips, would magnify themselves against me.”",
                    prayer: "Father, keep me from discouragement and help me trust You even when circumstances seem difficult."
                ),
                PrayerVerse(
                    id: "psalm-38-17",
                    reference: "Psalm 38:17",
                    text: "For I am ready to fall,\n  And my sorrow is continually before me.",
                    prayer: "Lord, when I stumble, strengthen me and help me continue walking faithfully with You."
                ),
                PrayerVerse(
                    id: "psalm-38-18",
                    reference: "Psalm 38:18",
                    text: "For I confess my iniquity;\n  I am full of anxiety because of my sin.",
                    prayer: "Father, thank You for the freedom that comes through confession and repentance. Help me walk honestly before You."
                ),
                PrayerVerse(
                    id: "psalm-38-19",
                    reference: "Psalm 38:19",
                    text: "But my enemies are vigorous and strong,\n  And many are those who hate me wrongfully.",
                    prayer: "Lord, give me wisdom when facing opposition and help me respond with faith and integrity."
                ),
                PrayerVerse(
                    id: "psalm-38-20",
                    reference: "Psalm 38:20",
                    text: "And those who repay evil for good,\n  They oppose me, because I follow what is good.",
                    prayer: "Father, help me continue pursuing what is right, even when it is difficult."
                ),
                PrayerVerse(
                    id: "psalm-38-21",
                    reference: "Psalm 38:21",
                    text: "Do not forsake me, O Lord;\n  O my God, do not be far from me!",
                    prayer: "Lord, stay near to me in every season. Let Your presence be my comfort and strength."
                ),
                PrayerVerse(
                    id: "psalm-38-22",
                    reference: "Psalm 38:22",
                    text: "Make haste to help me,\n  O Lord, my salvation!",
                    prayer: "Father, come quickly to help me. Thank You for being my Savior, my refuge, and my hope."
                ),
                PrayerVerse(
                    id: "psalm-38-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your mercy, patience, and faithfulness. When I feel burdened by weakness, failure, or difficult circumstances, help me turn to You with honesty and trust. Strengthen me, restore me, and remind me that Your grace is greater than my shortcomings. Stay near to me, guide my steps, and help me walk faithfully in Your ways. May my hope always remain in You.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 39,
            title: "Show Me My End",
            chapterReference: "Psalm 39",
            summary: "Pray for perspective and hope.",
            verses: [
                PrayerVerse(
                    id: "psalm-39-1",
                    reference: "Psalm 39:1",
                    text: "I said, “I will guard my ways\n  That I may not sin with my tongue;\n  I will guard my mouth as with a muzzle\n  While the wicked are in my presence.”",
                    prayer: "Lord, help me guard my words and speak with wisdom, especially in difficult situations. Let my speech honor You."
                ),
                PrayerVerse(
                    id: "psalm-39-2",
                    reference: "Psalm 39:2",
                    text: "I was mute and silent,\n  I refrained even from good,\n  And my sorrow grew worse.",
                    prayer: "Father, teach me patience and self-control when I am tempted to speak impulsively or react in frustration."
                ),
                PrayerVerse(
                    id: "psalm-39-3",
                    reference: "Psalm 39:3",
                    text: "My heart was hot within me,\n  While I was musing the fire burned;\n  Then I spoke with my tongue:",
                    prayer: "Lord, when emotions rise within me, help me bring them before You in prayer rather than allowing them to control me."
                ),
                PrayerVerse(
                    id: "psalm-39-4",
                    reference: "Psalm 39:4",
                    text: "“Lord, make me to know my end\n  And what is the extent of my days;\n  Let me know how transient I am.",
                    prayer: "Father, remind me of the brevity of life. Help me live each day with purpose, wisdom, and an eternal perspective."
                ),
                PrayerVerse(
                    id: "psalm-39-5",
                    reference: "Psalm 39:5",
                    text: "Behold, You have made my days as handbreadths,\n  And my lifetime as nothing in Your sight;\n  Surely every man at his best is a mere breath. Selah.",
                    prayer: "Lord, teach me humility. Help me remember that my life is temporary and that true significance is found in You."
                ),
                PrayerVerse(
                    id: "psalm-39-6",
                    reference: "Psalm 39:6",
                    text: "Surely every man walks about as a phantom;\n  Surely they make an uproar for nothing;\n  He amasses riches and does not know who will gather them.",
                    prayer: "Father, keep me from chasing things that will not last. Help me invest my time and energy in what has eternal value."
                ),
                PrayerVerse(
                    id: "psalm-39-7",
                    reference: "Psalm 39:7",
                    text: "“And now, Lord, for what do I wait?\n  My hope is in You.",
                    prayer: "Lord, You are my hope. When uncertainty surrounds me, help me place my confidence fully in You."
                ),
                PrayerVerse(
                    id: "psalm-39-8",
                    reference: "Psalm 39:8",
                    text: "Deliver me from all my transgressions;\n  Make me not the reproach of the foolish.",
                    prayer: "Father, forgive my sins and shortcomings. Thank You for Your mercy and grace that continually restore me."
                ),
                PrayerVerse(
                    id: "psalm-39-9",
                    reference: "Psalm 39:9",
                    text: "I have become mute, I do not open my mouth,\n  Because it is You who have done it.",
                    prayer: "Lord, help me trust Your sovereignty even when I do not understand what You are doing in my life."
                ),
                PrayerVerse(
                    id: "psalm-39-10",
                    reference: "Psalm 39:10",
                    text: "Remove Your plague from me;\n  Because of the opposition of Your hand I am perishing.",
                    prayer: "Father, when I experience hardship or correction, help me respond with humility and a willingness to learn from You."
                ),
                PrayerVerse(
                    id: "psalm-39-11",
                    reference: "Psalm 39:11",
                    text: "With reproofs You chasten a man for iniquity;\n  You consume as a moth what is precious to him;\n  Surely every man is a mere breath. Selah.",
                    prayer: "Lord, remind me that earthly things fade away, but Your truth and Your kingdom endure forever."
                ),
                PrayerVerse(
                    id: "psalm-39-12",
                    reference: "Psalm 39:12",
                    text: "“Hear my prayer, O Lord, and give ear to my cry;\n  Do not be silent at my tears;\n  For I am a stranger with You,\n  A sojourner like all my fathers.",
                    prayer: "Father, hear my prayers and see my tears. Thank You for caring about every burden and concern I bring before You."
                ),
                PrayerVerse(
                    id: "psalm-39-13",
                    reference: "Psalm 39:13",
                    text: "Turn Your gaze away from me, that I may smile again\n  Before I depart and am no more.”",
                    prayer: "Lord, renew my strength and fill me with hope. Help me walk faithfully through every season of life with confidence in Your love."
                ),
                PrayerVerse(
                    id: "psalm-39-closing",
                    reference: "Closing",
                    text: "Lord, thank You for reminding me that life is brief and that my hope is found in You alone. Help me use my time wisely, guard my words carefully, and keep an eternal perspective in all that I do. Forgive my sins, strengthen my faith, and teach me to trust You through every season of life. May my heart remain fixed on You, and may my life bring glory to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 40,
            title: "I Waited Patiently",
            chapterReference: "Psalm 40",
            summary: "Pray with gratitude for answered prayer.",
            verses: [
                PrayerVerse(
                    id: "psalm-40-1",
                    reference: "Psalm 40:1",
                    text: "I waited patiently for the Lord;\n  And He inclined to me and heard my cry.",
                    prayer: "Lord, thank You for hearing my prayers as I patiently wait for You. Help me trust Your timing and remain faithful while I wait."
                ),
                PrayerVerse(
                    id: "psalm-40-2",
                    reference: "Psalm 40:2",
                    text: "He brought me up out of the pit of destruction, out of the miry clay,\n  And He set my feet upon a rock making my footsteps firm.",
                    prayer: "Father, thank You for lifting me out of difficult situations and placing my feet on solid ground. Strengthen my faith in You."
                ),
                PrayerVerse(
                    id: "psalm-40-3",
                    reference: "Psalm 40:3",
                    text: "He put a new song in my mouth, a song of praise to our God;\n  Many will see and fear\n  And will trust in the Lord.",
                    prayer: "Lord, place a new song of praise in my heart. May my life testify to Your goodness and inspire others to trust You."
                ),
                PrayerVerse(
                    id: "psalm-40-4",
                    reference: "Psalm 40:4",
                    text: "How blessed is the man who has made the Lord his trust,\n  And has not turned to the proud, nor to those who lapse into falsehood.",
                    prayer: "Father, help me place my trust completely in You rather than in worldly influences or human strength."
                ),
                PrayerVerse(
                    id: "psalm-40-5",
                    reference: "Psalm 40:5",
                    text: "Many, O Lord my God, are the wonders which You have done,\n  And Your thoughts toward us;\n  There is none to compare with You.\n  If I would declare and speak of them,\n  They would be too numerous to count.",
                    prayer: "Lord, thank You for Your wonderful works and countless blessings. Help me never lose sight of Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-40-6",
                    reference: "Psalm 40:6",
                    text: "Sacrifice and meal offering You have not desired;\n  My ears You have opened;\n  Burnt offering and sin offering You have not required.",
                    prayer: "Father, teach me that what You desire most is a heart that loves, obeys, and honors You."
                ),
                PrayerVerse(
                    id: "psalm-40-7",
                    reference: "Psalm 40:7",
                    text: "Then I said, “Behold, I come;\n  In the scroll of the book it is written of me.",
                    prayer: "Lord, help me willingly follow Your plans and purposes for my life with faith and obedience."
                ),
                PrayerVerse(
                    id: "psalm-40-8",
                    reference: "Psalm 40:8",
                    text: "I delight to do Your will, O my God;\n  Your Law is within my heart.”",
                    prayer: "Father, let Your will become my delight. Write Your truth deeply upon my heart."
                ),
                PrayerVerse(
                    id: "psalm-40-9",
                    reference: "Psalm 40:9",
                    text: "I have proclaimed glad tidings of righteousness in the great congregation;\n  Behold, I will not restrain my lips,\n  O Lord, You know.",
                    prayer: "Lord, help me boldly share Your goodness and faithfulness with those around me."
                ),
                PrayerVerse(
                    id: "psalm-40-10",
                    reference: "Psalm 40:10",
                    text: "I have not hidden Your righteousness within my heart;\n  I have spoken of Your faithfulness and Your salvation;\n  I have not concealed Your lovingkindness and Your truth from the great congregation.",
                    prayer: "Father, let my life proclaim Your righteousness, salvation, and unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-40-11",
                    reference: "Psalm 40:11",
                    text: "You, O Lord, will not withhold Your compassion from me;\n  Your lovingkindness and Your truth will continually preserve me.",
                    prayer: "Lord, do not withhold Your mercy from me. Surround me daily with Your lovingkindness and truth."
                ),
                PrayerVerse(
                    id: "psalm-40-12",
                    reference: "Psalm 40:12",
                    text: "For evils beyond number have surrounded me;\n  My iniquities have overtaken me, so that I am not able to see;\n  They are more numerous than the hairs of my head,\n  And my heart has failed me.",
                    prayer: "Father, when troubles surround me, remind me that Your grace is greater than my fears and failures."
                ),
                PrayerVerse(
                    id: "psalm-40-13",
                    reference: "Psalm 40:13",
                    text: "Be pleased, O Lord, to deliver me;\n  Make haste, O Lord, to help me.",
                    prayer: "Lord, come quickly to help me in times of need. Thank You that I can always call upon You."
                ),
                PrayerVerse(
                    id: "psalm-40-14",
                    reference: "Psalm 40:14",
                    text: "Let those be ashamed and humiliated together\n  Who seek my life to destroy it;\n  Let those be turned back and dishonored\n  Who delight in my hurt.",
                    prayer: "Father, protect me from discouragement and from anything that seeks to draw me away from You."
                ),
                PrayerVerse(
                    id: "psalm-40-15",
                    reference: "Psalm 40:15",
                    text: "Let those be appalled because of their shame\n  Who say to me, “Aha, aha!”",
                    prayer: "Lord, establish truth and righteousness. Help me remain faithful even when facing opposition."
                ),
                PrayerVerse(
                    id: "psalm-40-16",
                    reference: "Psalm 40:16",
                    text: "Let all who seek You rejoice and be glad in You;\n  Let those who love Your salvation say continually,\n  “The Lord be magnified!”",
                    prayer: "Father, fill the hearts of those who seek You with joy, peace, and confidence in Your salvation."
                ),
                PrayerVerse(
                    id: "psalm-40-17",
                    reference: "Psalm 40:17",
                    text: "Since I am afflicted and needy,\n  Let the Lord be mindful of me.\n  You are my help and my deliverer;\n  Do not delay, O my God.",
                    prayer: "Lord, though I am needy and dependent upon You, thank You for thinking of me and caring for every detail of my life."
                ),
                PrayerVerse(
                    id: "psalm-40-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing my prayers, sustaining me through difficult seasons, and faithfully guiding my life. Help me trust Your timing, delight in Your will, and boldly share Your goodness with others. When troubles arise, remind me that You are my help and my deliverer. Fill my heart with gratitude, strengthen my faith, and help me walk in obedience to You every day. May my life continually proclaim Your love, mercy, and salvation.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 41,
            title: "Blessed is He Who Cares",
            chapterReference: "Psalm 41",
            summary: "Pray for compassion and healing.",
            verses: [
                PrayerVerse(
                    id: "psalm-41-1",
                    reference: "Psalm 41:1",
                    text: "How blessed is he who considers the helpless;\n  The Lord will deliver him in a day of trouble.",
                    prayer: "Lord, help me care for those who are poor, hurting, and in need. Give me a compassionate heart that reflects Your love."
                ),
                PrayerVerse(
                    id: "psalm-41-2",
                    reference: "Psalm 41:2",
                    text: "The Lord will protect him and keep him alive,\n  And he shall be called blessed upon the earth;\n  And do not give him over to the desire of his enemies.",
                    prayer: "Father, thank You for Your protection and care. Help me trust Your provision and faithfulness in every season."
                ),
                PrayerVerse(
                    id: "psalm-41-3",
                    reference: "Psalm 41:3",
                    text: "The Lord will sustain him upon his sickbed;\n  In his illness, You restore him to health.",
                    prayer: "Lord, strengthen those who are sick, weary, or struggling. Bring healing, comfort, and restoration according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-41-4",
                    reference: "Psalm 41:4",
                    text: "As for me, I said, “O Lord, be gracious to me;\n  Heal my soul, for I have sinned against You.”",
                    prayer: "Father, I ask for Your mercy. Forgive my sins, renew my spirit, and draw me closer to You."
                ),
                PrayerVerse(
                    id: "psalm-41-5",
                    reference: "Psalm 41:5",
                    text: "My enemies speak evil against me,\n  “When will he die, and his name perish?”",
                    prayer: "Lord, when others speak negatively about me or misunderstand me, help me respond with grace and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-41-6",
                    reference: "Psalm 41:6",
                    text: "And when he comes to see me, he speaks falsehood;\n  His heart gathers wickedness to itself;\n  When he goes outside, he tells it.",
                    prayer: "Father, give me discernment regarding the intentions of others and help me walk in truth and integrity."
                ),
                PrayerVerse(
                    id: "psalm-41-7",
                    reference: "Psalm 41:7",
                    text: "All who hate me whisper together against me;\n  Against me they devise my hurt, saying,",
                    prayer: "Lord, protect me from discouragement when I face criticism, gossip, or opposition."
                ),
                PrayerVerse(
                    id: "psalm-41-8",
                    reference: "Psalm 41:8",
                    text: "“A wicked thing is poured out upon him,\n  That when he lies down, he will not rise up again.”",
                    prayer: "Father, remind me that my identity is secure in You and not in the opinions of others."
                ),
                PrayerVerse(
                    id: "psalm-41-9",
                    reference: "Psalm 41:9",
                    text: "Even my close friend in whom I trusted,\n  Who ate my bread,\n  Has lifted up his heel against me.",
                    prayer: "Lord, when I experience disappointment or betrayal, help me trust You and find healing in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-41-10",
                    reference: "Psalm 41:10",
                    text: "But You, O Lord, be gracious to me and raise me up,\n  That I may repay them.",
                    prayer: "Father, thank You for Your mercy and restoration. Strengthen me and help me continue walking faithfully with You."
                ),
                PrayerVerse(
                    id: "psalm-41-11",
                    reference: "Psalm 41:11",
                    text: "By this I know that You are pleased with me,\n  Because my enemy does not shout in triumph over me.",
                    prayer: "Lord, thank You for the assurance of Your favor and Your presence in my life."
                ),
                PrayerVerse(
                    id: "psalm-41-12",
                    reference: "Psalm 41:12",
                    text: "As for me, You uphold me in my integrity,\n  And You set me in Your presence forever.",
                    prayer: "Father, uphold me in integrity and help me remain faithful before You all the days of my life."
                ),
                PrayerVerse(
                    id: "psalm-41-13",
                    reference: "Psalm 41:13",
                    text: "Blessed be the Lord, the God of Israel,\n  From everlasting to everlasting.\n  Amen and Amen.",
                    prayer: "Lord, You are worthy of praise forever. Let my heart continually worship and glorify Your holy name."
                ),
                PrayerVerse(
                    id: "psalm-41-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your mercy, compassion, and faithfulness. Help me care for others as You care for me. Strengthen me in times of weakness, heal my heart when I am wounded, and uphold me in integrity and truth. When I face disappointment, criticism, or betrayal, remind me that You are my refuge and my strength. May my life continually bring praise and honor to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 42,
            title: "As the Deer Pants",
            chapterReference: "Psalm 42",
            summary: "Pray for deep longing and hope in God.",
            verses: [
                PrayerVerse(
                    id: "psalm-42-1",
                    reference: "Psalm 42:1",
                    text: "As the deer pants for the water brooks,\n  So my soul pants for You, O God.",
                    prayer: "Lord, just as a deer longs for water, help my soul hunger and thirst for Your presence above all else."
                ),
                PrayerVerse(
                    id: "psalm-42-2",
                    reference: "Psalm 42:2",
                    text: "My soul thirsts for God, for the living God;\n  When shall I come and appear before God?",
                    prayer: "Father, deepen my desire to know You and draw near to You each day. Let my heart find satisfaction in You alone."
                ),
                PrayerVerse(
                    id: "psalm-42-3",
                    reference: "Psalm 42:3",
                    text: "My tears have been my food day and night,\n  While they say to me all day long, “Where is your God?”",
                    prayer: "Lord, when I experience sorrow or discouragement, remind me that You are near and that You hear every prayer."
                ),
                PrayerVerse(
                    id: "psalm-42-4",
                    reference: "Psalm 42:4",
                    text: "These things I remember and I pour out my soul within me.\n  For I used to go along with the throng and lead them in procession to the house of God,\n  With the voice of joy and thanksgiving, a multitude keeping festival.",
                    prayer: "Father, help me remember Your faithfulness in seasons of joy and worship. Let those memories strengthen my faith."
                ),
                PrayerVerse(
                    id: "psalm-42-5",
                    reference: "Psalm 42:5",
                    text: "Why are you in despair, O my soul?\n  And why have you become disturbed within me?\n  Hope in God, for I shall again praise Him\n  For the help of His presence.",
                    prayer: "Lord, when my soul feels downcast, help me place my hope in You and continue praising You for Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-42-6",
                    reference: "Psalm 42:6",
                    text: "O my God, my soul is in despair within me;\n  Therefore I remember You from the land of the Jordan\n  And the peaks of Hermon, from Mount Mizar.",
                    prayer: "Father, when I feel overwhelmed or distant, remind me of Your presence and Your promises."
                ),
                PrayerVerse(
                    id: "psalm-42-7",
                    reference: "Psalm 42:7",
                    text: "Deep calls to deep at the sound of Your waterfalls;\n  All Your breakers and Your waves have rolled over me.",
                    prayer: "Lord, even when life feels like deep waters crashing around me, help me trust that You remain in control."
                ),
                PrayerVerse(
                    id: "psalm-42-8",
                    reference: "Psalm 42:8",
                    text: "The Lord will command His lovingkindness in the daytime;\n  And His song will be with me in the night,\n  A prayer to the God of my life.",
                    prayer: "Father, thank You for Your lovingkindness that follows me day and night. Fill my heart with confidence in Your care."
                ),
                PrayerVerse(
                    id: "psalm-42-9",
                    reference: "Psalm 42:9",
                    text: "I will say to God my rock, “Why have You forgotten me?\n  Why do I go mourning because of the oppression of the enemy?”",
                    prayer: "Lord, You are my rock. Help me bring my questions, concerns, and struggles honestly before You."
                ),
                PrayerVerse(
                    id: "psalm-42-10",
                    reference: "Psalm 42:10",
                    text: "As a shattering of my bones, my adversaries revile me,\n  While they say to me all day long, “Where is your God?”",
                    prayer: "Father, when others challenge my faith or circumstances seem difficult, strengthen my confidence in You."
                ),
                PrayerVerse(
                    id: "psalm-42-11",
                    reference: "Psalm 42:11",
                    text: "Why are you in despair, O my soul?\n  And why have you become disturbed within me?\n  Hope in God, for I shall yet praise Him,\n  The help of my countenance and my God.",
                    prayer: "Lord, when my soul is discouraged, remind me once again to place my hope in You. You are my Savior and my God."
                ),
                PrayerVerse(
                    id: "psalm-42-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being the One my soul longs for. When I feel weary, discouraged, or overwhelmed, draw me closer to Your presence. Help me place my hope in You, trust Your faithfulness, and remember Your goodness even during difficult seasons. Refresh my spirit, strengthen my faith, and fill my heart with the peace that comes from knowing You. May my life continually praise You as my Savior and my God.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 43,
            title: "Send Your Light",
            chapterReference: "Psalm 43",
            summary: "Pray for guidance and vindication.",
            verses: [
                PrayerVerse(
                    id: "psalm-43-1",
                    reference: "Psalm 43:1",
                    text: "Vindicate me, O God, and plead my case against an ungodly nation;\n  O deliver me from the deceitful and unjust man!",
                    prayer: "Lord, defend my cause and help me trust in Your justice. When I face unfair situations, remind me that You are my righteous Judge."
                ),
                PrayerVerse(
                    id: "psalm-43-2",
                    reference: "Psalm 43:2",
                    text: "For You are the God of my strength; why have You rejected me?\n  Why do I go mourning because of the oppression of the enemy?",
                    prayer: "Father, You are my strength and refuge. When I feel rejected, discouraged, or confused, help me remain secure in Your love."
                ),
                PrayerVerse(
                    id: "psalm-43-3",
                    reference: "Psalm 43:3",
                    text: "O send out Your light and Your truth, let them lead me;\n  Let them bring me to Your holy hill\n  And to Your dwelling places.",
                    prayer: "Lord, send out Your light and Your truth to guide me. Lead me closer to Your presence and direct my steps according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-43-4",
                    reference: "Psalm 43:4",
                    text: "Then I will go to the altar of God,\n  To God my exceeding joy;\n  And upon the lyre I shall praise You, O God, my God.",
                    prayer: "Father, bring me into deeper fellowship with You. Let my heart find joy, peace, and satisfaction in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-43-5",
                    reference: "Psalm 43:5",
                    text: "Why are you in despair, O my soul?\n  And why are you disturbed within me?\n  Hope in God, for I shall again praise Him,\n  The help of my countenance and my God.",
                    prayer: "Lord, when my soul is discouraged, help me place my hope in You. Remind me that You are my Savior, my help, and my God."
                ),
                PrayerVerse(
                    id: "psalm-43-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my strength, my guide, and my source of hope. When I face uncertainty or discouragement, help me trust in Your truth and follow Your light. Draw me closer to Your presence and fill my heart with joy that comes from knowing You. May I continually place my hope in You and praise You as my Savior and my God.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 44,
            title: "In God We Make Our Boast",
            chapterReference: "Psalm 44",
            summary: "Pray for trust in God despite difficulties.",
            verses: [
                PrayerVerse(
                    id: "psalm-44-1",
                    reference: "Psalm 44:1",
                    text: "O God, we have heard with our ears,\n  Our fathers have told us\n  The work that You did in their days,\n  In the days of old.",
                    prayer: "Lord, thank You for the testimonies of Your faithfulness throughout generations. Help me remember all that You have done."
                ),
                PrayerVerse(
                    id: "psalm-44-2",
                    reference: "Psalm 44:2",
                    text: "You with Your own hand drove out the nations;\n  Then You planted them;\n  You afflicted the peoples,\n  Then You spread them abroad.",
                    prayer: "Father, thank You for Your power and guidance throughout history. Remind me that You are still working today."
                ),
                PrayerVerse(
                    id: "psalm-44-3",
                    reference: "Psalm 44:3",
                    text: "For by their own sword they did not possess the land,\n  And their own arm did not save them,\n  But Your right hand and Your arm and the light of Your presence,\n  For You favored them.",
                    prayer: "Lord, victory comes not through human strength but through Your favor and presence. Help me trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-44-4",
                    reference: "Psalm 44:4",
                    text: "You are my King, O God;\n  Command victories for Jacob.",
                    prayer: "Father, You are my King and my God. Rule over my life and direct my steps according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-44-5",
                    reference: "Psalm 44:5",
                    text: "Through You we will push back our adversaries;\n  Through Your name we will trample down those who rise up against us.",
                    prayer: "Lord, through Your strength help me overcome every challenge and remain faithful in every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-44-6",
                    reference: "Psalm 44:6",
                    text: "For I will not trust in my bow,\n  Nor will my sword save me.",
                    prayer: "Father, keep me from placing my confidence in my own abilities. Teach me to rely upon You."
                ),
                PrayerVerse(
                    id: "psalm-44-7",
                    reference: "Psalm 44:7",
                    text: "But You have saved us from our adversaries,\n  And You have put to shame those who hate us.",
                    prayer: "Lord, thank You for delivering Your people. Help me remember that You are my source of help and protection."
                ),
                PrayerVerse(
                    id: "psalm-44-8",
                    reference: "Psalm 44:8",
                    text: "In God we have boasted all day long,\n  And we will give thanks to Your name forever. Selah.",
                    prayer: "Father, may my life continually praise You and give glory to Your name."
                ),
                PrayerVerse(
                    id: "psalm-44-9",
                    reference: "Psalm 44:9",
                    text: "Yet You have rejected us and brought us to dishonor,\n  And do not go out with our armies.",
                    prayer: "Lord, when I feel abandoned or confused by circumstances, help me continue trusting Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-44-10",
                    reference: "Psalm 44:10",
                    text: "You cause us to turn back from the adversary;\n  And those who hate us have taken spoil for themselves.",
                    prayer: "Father, when setbacks come, strengthen my heart and remind me that You have not forgotten me."
                ),
                PrayerVerse(
                    id: "psalm-44-11",
                    reference: "Psalm 44:11",
                    text: "You give us as sheep to be eaten\n  And have scattered us among the nations.",
                    prayer: "Lord, protect Your people and sustain us through seasons of hardship and uncertainty."
                ),
                PrayerVerse(
                    id: "psalm-44-12",
                    reference: "Psalm 44:12",
                    text: "You sell Your people cheaply,\n  And have not profited by their sale.",
                    prayer: "Father, help me trust You when I do not understand what You are doing in my life."
                ),
                PrayerVerse(
                    id: "psalm-44-13",
                    reference: "Psalm 44:13",
                    text: "You make us a reproach to our neighbors,\n  A scoffing and a derision to those around us.",
                    prayer: "Lord, when I face criticism, rejection, or misunderstanding, help me respond with grace and faith."
                ),
                PrayerVerse(
                    id: "psalm-44-14",
                    reference: "Psalm 44:14",
                    text: "You make us a byword among the nations,\n  A laughingstock among the peoples.",
                    prayer: "Father, strengthen me when I feel discouraged by the opinions or actions of others."
                ),
                PrayerVerse(
                    id: "psalm-44-15",
                    reference: "Psalm 44:15",
                    text: "All day long my dishonor is before me\n  And my humiliation has overwhelmed me,",
                    prayer: "Lord, You know every burden I carry. Help me bring my pain and concerns honestly before You."
                ),
                PrayerVerse(
                    id: "psalm-44-16",
                    reference: "Psalm 44:16",
                    text: "Because of the voice of him who reproaches and reviles,\n  Because of the presence of the enemy and the avenger.",
                    prayer: "Father, remind me that Your approval matters more than the approval of people."
                ),
                PrayerVerse(
                    id: "psalm-44-17",
                    reference: "Psalm 44:17",
                    text: "All this has come upon us, but we have not forgotten You,\n  And we have not dealt falsely with Your covenant.",
                    prayer: "Lord, help me remain faithful to You even when life becomes difficult or confusing."
                ),
                PrayerVerse(
                    id: "psalm-44-18",
                    reference: "Psalm 44:18",
                    text: "Our heart has not turned back,\n  And our steps have not deviated from Your way,",
                    prayer: "Father, keep my heart from turning away from You. Strengthen my commitment to follow You."
                ),
                PrayerVerse(
                    id: "psalm-44-19",
                    reference: "Psalm 44:19",
                    text: "Yet You have crushed us in a place of jackals\n  And covered us with the shadow of death.",
                    prayer: "Lord, when I walk through dark seasons, help me trust that You are still present and working."
                ),
                PrayerVerse(
                    id: "psalm-44-20",
                    reference: "Psalm 44:20",
                    text: "If we had forgotten the name of our God\n  Or extended our hands to a strange god,",
                    prayer: "Father, guard my heart against idolatry and anything that seeks to take Your place in my life."
                ),
                PrayerVerse(
                    id: "psalm-44-21",
                    reference: "Psalm 44:21",
                    text: "Would not God find this out?\n  For He knows the secrets of the heart.",
                    prayer: "Lord, You know every thought and motive of my heart. Help me live with sincerity and integrity before You."
                ),
                PrayerVerse(
                    id: "psalm-44-22",
                    reference: "Psalm 44:22",
                    text: "But for Your sake we are killed all day long;\n  We are considered as sheep to be slaughtered.",
                    prayer: "Father, help me remain faithful even when following You requires sacrifice or endurance."
                ),
                PrayerVerse(
                    id: "psalm-44-23",
                    reference: "Psalm 44:23",
                    text: "Arouse Yourself, why do You sleep, O Lord?\n  Awake, do not reject us forever.",
                    prayer: "Lord, hear my prayers and respond according to Your perfect wisdom and love."
                ),
                PrayerVerse(
                    id: "psalm-44-24",
                    reference: "Psalm 44:24",
                    text: "Why do You hide Your face\n  And forget our affliction and our oppression?",
                    prayer: "Father, when You seem distant, help me trust that You are still near and attentive to my needs."
                ),
                PrayerVerse(
                    id: "psalm-44-25",
                    reference: "Psalm 44:25",
                    text: "For our soul has sunk down into the dust;\n  Our body cleaves to the earth.",
                    prayer: "Lord, lift me up when I feel overwhelmed, discouraged, or weighed down by life’s challenges."
                ),
                PrayerVerse(
                    id: "psalm-44-26",
                    reference: "Psalm 44:26",
                    text: "Rise up, be our help,\n  And redeem us for the sake of Your lovingkindness.",
                    prayer: "Father, arise and help Your people. Thank You for Your unfailing love and faithful redemption."
                ),
                PrayerVerse(
                    id: "psalm-44-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your faithfulness throughout every generation. Help me trust You not only during seasons of victory but also during times of uncertainty and hardship. Strengthen my faith when I do not understand Your plans, and remind me that Your love never fails. Keep my heart devoted to You, help me persevere through every challenge, and teach me to rely completely on Your strength and grace. May my life continually bring glory to Your name.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 45,
            title: "My Heart Overflows",
            chapterReference: "Psalm 45",
            summary: "Pray in worship of the King.",
            verses: [
                PrayerVerse(
                    id: "psalm-45-1",
                    reference: "Psalm 45:1",
                    text: "My heart overflows with a good theme;\n  I address my verses to the King;\n  My tongue is the pen of a ready writer.",
                    prayer: "Lord, fill my heart with words that honor and glorify You. Let my life reflect praise, worship, and devotion to Your name."
                ),
                PrayerVerse(
                    id: "psalm-45-2",
                    reference: "Psalm 45:2",
                    text: "You are fairer than the sons of men;\n  Grace is poured upon Your lips;\n  Therefore God has blessed You forever.",
                    prayer: "Father, thank You for the beauty of Your character, Your grace, and Your truth. Help me become more like You each day."
                ),
                PrayerVerse(
                    id: "psalm-45-3",
                    reference: "Psalm 45:3",
                    text: "Gird Your sword on Your thigh, O Mighty One,\n  In Your splendor and Your majesty!",
                    prayer: "Lord, You are mighty and powerful. Help me trust in Your strength rather than my own abilities."
                ),
                PrayerVerse(
                    id: "psalm-45-4",
                    reference: "Psalm 45:4",
                    text: "And in Your majesty ride on victoriously,\n  For the cause of truth and meekness and righteousness;\n  Let Your right hand teach You awesome things.",
                    prayer: "Father, thank You that You reign in truth, humility, and righteousness. Teach me to reflect those qualities in my life."
                ),
                PrayerVerse(
                    id: "psalm-45-5",
                    reference: "Psalm 45:5",
                    text: "Your arrows are sharp;\n  The peoples fall under You;\n  Your arrows are in the heart of the King’s enemies.",
                    prayer: "Lord, let Your truth penetrate my heart and transform my thoughts, attitudes, and actions."
                ),
                PrayerVerse(
                    id: "psalm-45-6",
                    reference: "Psalm 45:6",
                    text: "Your throne, O God, is forever and ever;\n  A scepter of uprightness is the scepter of Your kingdom.",
                    prayer: "Father, Your throne is everlasting. Help me place my confidence in Your eternal kingdom rather than temporary things."
                ),
                PrayerVerse(
                    id: "psalm-45-7",
                    reference: "Psalm 45:7",
                    text: "You have loved righteousness and hated wickedness;\n  Therefore God, Your God, has anointed You\n  With the oil of joy above Your fellows.",
                    prayer: "Lord, You love righteousness and hate evil. Give me a heart that desires what is good and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "psalm-45-8",
                    reference: "Psalm 45:8",
                    text: "All Your garments are fragrant with myrrh and aloes and cassia;\n  Out of ivory palaces stringed instruments have made You glad.",
                    prayer: "Father, let my life be marked by joy that comes from walking closely with You."
                ),
                PrayerVerse(
                    id: "psalm-45-9",
                    reference: "Psalm 45:9",
                    text: "Kings’ daughters are among Your noble ladies;\n  At Your right hand stands the queen in gold from Ophir.",
                    prayer: "Lord, thank You for the honor and privilege of belonging to You. Help me live as a faithful servant of Your kingdom."
                ),
                PrayerVerse(
                    id: "psalm-45-10",
                    reference: "Psalm 45:10",
                    text: "Listen, O daughter, give attention and incline your ear:\n  Forget your people and your father’s house;",
                    prayer: "Father, help me leave behind anything that competes with my devotion to You."
                ),
                PrayerVerse(
                    id: "psalm-45-11",
                    reference: "Psalm 45:11",
                    text: "Then the King will desire your beauty.\n  Because He is your Lord, bow down to Him.",
                    prayer: "Lord, may my heart be fully devoted to You. Teach me to worship You with sincerity and reverence."
                ),
                PrayerVerse(
                    id: "psalm-45-12",
                    reference: "Psalm 45:12",
                    text: "The daughter of Tyre will come with a gift;\n  The rich among the people will seek your favor.",
                    prayer: "Father, let my life be a blessing to others and a testimony of Your goodness and grace."
                ),
                PrayerVerse(
                    id: "psalm-45-13",
                    reference: "Psalm 45:13",
                    text: "The King’s daughter is all glorious within;\n  Her clothing is interwoven with gold.",
                    prayer: "Lord, thank You for the beauty that comes from a life transformed by Your presence."
                ),
                PrayerVerse(
                    id: "psalm-45-14",
                    reference: "Psalm 45:14",
                    text: "She will be led to the King in embroidered work;\n  The virgins, her companions who follow her,\n  Will be brought to You.",
                    prayer: "Father, help me walk with purity, humility, and faithfulness as I follow You."
                ),
                PrayerVerse(
                    id: "psalm-45-15",
                    reference: "Psalm 45:15",
                    text: "They will be led forth with gladness and rejoicing;\n  They will enter into the King’s palace.",
                    prayer: "Lord, fill my heart with joy and gladness as I live in fellowship with You."
                ),
                PrayerVerse(
                    id: "psalm-45-16",
                    reference: "Psalm 45:16",
                    text: "In place of your fathers will be your sons;\n  You shall make them princes in all the earth.",
                    prayer: "Father, help me leave a legacy of faith that points future generations toward You."
                ),
                PrayerVerse(
                    id: "psalm-45-17",
                    reference: "Psalm 45:17",
                    text: "I will cause Your name to be remembered in all generations;\n  Therefore the peoples will give You thanks forever and ever.",
                    prayer: "Lord, may Your name be remembered and praised throughout every generation. Use my life to bring honor to You."
                ),
                PrayerVerse(
                    id: "psalm-45-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your righteousness, beauty, truth, and eternal reign. Help me live a life that honors You in every thought, word, and action. Draw my heart closer to You and teach me to delight in Your presence. Fill me with joy, strengthen my faith, and help me leave a legacy that reflects Your goodness. May my life continually glorify Your name and point others toward Your everlasting kingdom.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        )
    ]

    // MARK: - Psalms 46-60
    private static let psalms46to60: [PrayerDay] = [
        PrayerDay(
            dayNumber: 46,
            title: "God is Our Refuge",
            chapterReference: "Psalm 46",
            summary: "Pray for strength and peace in chaos.",
            verses: [
                PrayerVerse(
                    id: "psalm-46-1",
                    reference: "Psalm 46:1",
                    text: "God is our refuge and strength,\n  A very present help in trouble.",
                    prayer: "Lord, thank You for being my refuge and strength, a very present help in times of trouble. Help me run to You first in every circumstance."
                ),
                PrayerVerse(
                    id: "psalm-46-2",
                    reference: "Psalm 46:2",
                    text: "Therefore we will not fear, though the earth should change\n  And though the mountains slip into the heart of the sea;",
                    prayer: "Father, when life feels unstable and uncertain, help me trust You and remain unshaken by fear."
                ),
                PrayerVerse(
                    id: "psalm-46-3",
                    reference: "Psalm 46:3",
                    text: "Though its waters roar and foam,\n  Though the mountains quake at its swelling pride. Selah.",
                    prayer: "Lord, even when chaos surrounds me, remind me that You are in control and that Your power is greater than any storm."
                ),
                PrayerVerse(
                    id: "psalm-46-4",
                    reference: "Psalm 46:4",
                    text: "There is a river whose streams make glad the city of God,\n  The holy dwelling places of the Most High.",
                    prayer: "Father, thank You for the peace and joy found in Your presence. Refresh my soul with the living water that comes from You."
                ),
                PrayerVerse(
                    id: "psalm-46-5",
                    reference: "Psalm 46:5",
                    text: "God is in the midst of her, she will not be moved;\n  God will help her when morning dawns.",
                    prayer: "Lord, because You are with me, I do not need to fear. Strengthen my faith and help me rest securely in Your care."
                ),
                PrayerVerse(
                    id: "psalm-46-6",
                    reference: "Psalm 46:6",
                    text: "The nations made an uproar, the kingdoms tottered;\n  He raised His voice, the earth melted.",
                    prayer: "Father, nations rise and fall, but Your kingdom stands forever. Help me place my hope in what is eternal."
                ),
                PrayerVerse(
                    id: "psalm-46-7",
                    reference: "Psalm 46:7",
                    text: "The Lord of hosts is with us;\n  The God of Jacob is our stronghold. Selah.",
                    prayer: "Lord, thank You for being with Your people. You are my fortress, my defender, and my safe place."
                ),
                PrayerVerse(
                    id: "psalm-46-8",
                    reference: "Psalm 46:8",
                    text: "Come, behold the works of the Lord,\n  Who has wrought desolations in the earth.",
                    prayer: "Father, help me recognize Your mighty works and remember Your faithfulness throughout history and in my own life."
                ),
                PrayerVerse(
                    id: "psalm-46-9",
                    reference: "Psalm 46:9",
                    text: "He makes wars to cease to the end of the earth;\n  He breaks the bow and cuts the spear in two;\n  He burns the chariots with fire.",
                    prayer: "Lord, thank You for bringing peace and for having authority over every conflict and struggle."
                ),
                PrayerVerse(
                    id: "psalm-46-10",
                    reference: "Psalm 46:10",
                    text: "“Cease striving and know that I am God;\n  I will be exalted among the nations, I will be exalted in the earth.”",
                    prayer: "Father, teach me to be still and know that You are God. Quiet my anxious thoughts and help me rest in Your sovereignty."
                ),
                PrayerVerse(
                    id: "psalm-46-11",
                    reference: "Psalm 46:11",
                    text: "The Lord of hosts is with us;\n  The God of Jacob is our stronghold. Selah.",
                    prayer: "Lord, thank You for being my refuge and strength. Help me walk confidently knowing that You are always with me."
                ),
                PrayerVerse(
                    id: "psalm-46-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, strength, and ever-present help. When fear, uncertainty, or difficulty come, remind me that You remain in control. Help me trust You completely, rest in Your presence, and find peace in Your promises. Teach me to be still before You and remember that You are God over every circumstance. Strengthen my faith and help me live each day with confidence in Your unfailing love and protection.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 47,
            title: "Clap Your Hands",
            chapterReference: "Psalm 47",
            summary: "Pray in joyful worship of God's kingship.",
            verses: [
                PrayerVerse(
                    id: "psalm-47-1",
                    reference: "Psalm 47:1",
                    text: "O clap your hands, all peoples;\n  Shout to God with the voice of joy.",
                    prayer: "Lord, I praise You with joy and thanksgiving. Help me celebrate Your goodness and greatness with all my heart."
                ),
                PrayerVerse(
                    id: "psalm-47-2",
                    reference: "Psalm 47:2",
                    text: "For the Lord Most High is to be feared,\n  A great King over all the earth.",
                    prayer: "Father, You are the Most High God, worthy of reverence and worship. Help me live in awe of Your majesty."
                ),
                PrayerVerse(
                    id: "psalm-47-3",
                    reference: "Psalm 47:3",
                    text: "He subdues peoples under us\n  And nations under our feet.",
                    prayer: "Lord, thank You for Your authority over every nation and every people. Remind me that You reign over all creation."
                ),
                PrayerVerse(
                    id: "psalm-47-4",
                    reference: "Psalm 47:4",
                    text: "He chooses our inheritance for us,\n  The glory of Jacob whom He loves. Selah.",
                    prayer: "Father, thank You for the blessings and inheritance You provide for Your people. Help me walk faithfully in Your promises."
                ),
                PrayerVerse(
                    id: "psalm-47-5",
                    reference: "Psalm 47:5",
                    text: "God has ascended with a shout,\n  The Lord, with the sound of a trumpet.",
                    prayer: "Lord, let my worship be joyful and sincere as I honor You as King over all."
                ),
                PrayerVerse(
                    id: "psalm-47-6",
                    reference: "Psalm 47:6",
                    text: "Sing praises to God, sing praises;\n  Sing praises to our King, sing praises.",
                    prayer: "Father, fill my heart with songs of praise. Help me continually worship You throughout my daily life."
                ),
                PrayerVerse(
                    id: "psalm-47-7",
                    reference: "Psalm 47:7",
                    text: "For God is the King of all the earth;\n  Sing praises with a skillful psalm.",
                    prayer: "Lord, You are King over all the earth. Give me wisdom to live under Your rule and according to Your truth."
                ),
                PrayerVerse(
                    id: "psalm-47-8",
                    reference: "Psalm 47:8",
                    text: "God reigns over the nations,\n  God sits on His holy throne.",
                    prayer: "Father, thank You that Your throne is established forever. Help me trust in Your sovereign authority."
                ),
                PrayerVerse(
                    id: "psalm-47-9",
                    reference: "Psalm 47:9",
                    text: "The princes of the people have assembled themselves as the people of the God of Abraham,\n  For the shields of the earth belong to God;\n  He is highly exalted.",
                    prayer: "Lord, thank You that people from every nation belong to You. Help me see Your kingdom perspective and love others as You do."
                ),
                PrayerVerse(
                    id: "psalm-47-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being the King over all the earth. You are worthy of all praise, honor, and worship. Help me live with joy, gratitude, and reverence as I follow You. Remind me that Your kingdom is eternal and that Your authority is above every earthly power. May my life continually bring glory to Your name, and may my heart remain devoted to worshiping You as my Lord and King.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 48,
            title: "Great is the Lord",
            chapterReference: "Psalm 48",
            summary: "Pray in praise of God's greatness.",
            verses: [
                PrayerVerse(
                    id: "psalm-48-1",
                    reference: "Psalm 48:1",
                    text: "Great is the Lord, and greatly to be praised,\n  In the city of our God, His holy mountain.",
                    prayer: "Lord, You are great and greatly to be praised. Help me worship You with reverence, gratitude, and joy."
                ),
                PrayerVerse(
                    id: "psalm-48-2",
                    reference: "Psalm 48:2",
                    text: "Beautiful in elevation, the joy of the whole earth,\n  Is Mount Zion in the far north,\n  The city of the great King.",
                    prayer: "Father, thank You for the beauty and majesty of Your kingdom. Help me keep my focus on what is eternal."
                ),
                PrayerVerse(
                    id: "psalm-48-3",
                    reference: "Psalm 48:3",
                    text: "God, in her palaces,\n  Has made Himself known as a stronghold.",
                    prayer: "Lord, thank You for being known as a refuge for Your people. Help me run to You whenever I face challenges."
                ),
                PrayerVerse(
                    id: "psalm-48-4",
                    reference: "Psalm 48:4",
                    text: "For, lo, the kings assembled themselves,\n  They passed by together.",
                    prayer: "Father, remind me that earthly powers are limited, but Your authority is without end."
                ),
                PrayerVerse(
                    id: "psalm-48-5",
                    reference: "Psalm 48:5",
                    text: "They saw it, then they were amazed;\n  They were terrified, they fled in alarm.",
                    prayer: "Lord, thank You that Your presence causes fear and uncertainty to fade. Help me trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-48-6",
                    reference: "Psalm 48:6",
                    text: "Panic seized them there,\n  Anguish, as of a woman in childbirth.",
                    prayer: "Father, when anxiety or fear comes, strengthen my heart and remind me that You are near."
                ),
                PrayerVerse(
                    id: "psalm-48-7",
                    reference: "Psalm 48:7",
                    text: "With the east wind\n  You break the ships of Tarshish.",
                    prayer: "Lord, no force on earth can stand against Your purposes. Help me trust in Your sovereign power."
                ),
                PrayerVerse(
                    id: "psalm-48-8",
                    reference: "Psalm 48:8",
                    text: "As we have heard, so have we seen\n  In the city of the Lord of hosts, in the city of our God;\n  God will establish her forever. Selah.",
                    prayer: "Father, thank You for Your faithfulness throughout generations. Help me remember Your works and trust Your promises."
                ),
                PrayerVerse(
                    id: "psalm-48-9",
                    reference: "Psalm 48:9",
                    text: "We have thought on Your lovingkindness, O God,\n  In the midst of Your temple.",
                    prayer: "Lord, I meditate on Your lovingkindness. Fill my heart with gratitude for Your mercy and grace."
                ),
                PrayerVerse(
                    id: "psalm-48-10",
                    reference: "Psalm 48:10",
                    text: "As is Your name, O God,\n  So is Your praise to the ends of the earth;\n  Your right hand is full of righteousness.",
                    prayer: "Father, Your name is worthy of praise throughout the earth. Let my life bring honor and glory to You."
                ),
                PrayerVerse(
                    id: "psalm-48-11",
                    reference: "Psalm 48:11",
                    text: "Let Mount Zion be glad,\n  Let the daughters of Judah rejoice\n  Because of Your judgments.",
                    prayer: "Lord, thank You for Your righteousness and perfect justice. Help me walk in Your ways."
                ),
                PrayerVerse(
                    id: "psalm-48-12",
                    reference: "Psalm 48:12",
                    text: "Walk about Zion and go around her;\n  Count her towers;",
                    prayer: "Father, help me remember and celebrate the ways You have worked in my life."
                ),
                PrayerVerse(
                    id: "psalm-48-13",
                    reference: "Psalm 48:13",
                    text: "Consider her ramparts;\n  Go through her palaces,\n  That you may tell it to the next generation.",
                    prayer: "Lord, let me faithfully pass on the testimony of Your goodness to future generations."
                ),
                PrayerVerse(
                    id: "psalm-48-14",
                    reference: "Psalm 48:14",
                    text: "For such is God,\n  Our God forever and ever;\n  He will guide us until death.",
                    prayer: "Father, thank You for being my God forever and ever. Guide me throughout my life and keep me close to You."
                ),
                PrayerVerse(
                    id: "psalm-48-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your greatness, faithfulness, and lovingkindness. You are my refuge, my guide, and my eternal King. Help me trust in Your power, remember Your goodness, and walk faithfully in Your ways. Let my life continually bring praise to Your name, and help me share the testimony of Your faithfulness with others. Thank You for leading me today and for being my God forever.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 49,
            title: "Why Should I Fear?",
            chapterReference: "Psalm 49",
            summary: "Pray for wisdom about wealth and eternity.",
            verses: [
                PrayerVerse(
                    id: "psalm-49-1",
                    reference: "Psalm 49:1",
                    text: "Hear this, all peoples;\n  Give ear, all inhabitants of the world,",
                    prayer: "Lord, help me listen carefully to Your wisdom and apply Your truth to my life."
                ),
                PrayerVerse(
                    id: "psalm-49-2",
                    reference: "Psalm 49:2",
                    text: "Both low and high,\n  Rich and poor together.",
                    prayer: "Father, remind me that Your Word is for all people, regardless of status, wealth, or position."
                ),
                PrayerVerse(
                    id: "psalm-49-3",
                    reference: "Psalm 49:3",
                    text: "My mouth will speak wisdom,\n  And the meditation of my heart will be understanding.",
                    prayer: "Lord, fill my heart with wisdom and understanding that comes from knowing You."
                ),
                PrayerVerse(
                    id: "psalm-49-4",
                    reference: "Psalm 49:4",
                    text: "I will incline my ear to a proverb;\n  I will express my riddle on the harp.",
                    prayer: "Father, help me seek Your truth and grow in spiritual discernment every day."
                ),
                PrayerVerse(
                    id: "psalm-49-5",
                    reference: "Psalm 49:5",
                    text: "Why should I fear in days of adversity,\n  When the iniquity of my foes surrounds me,",
                    prayer: "Lord, when fear surrounds me, help me trust in Your presence and protection."
                ),
                PrayerVerse(
                    id: "psalm-49-6",
                    reference: "Psalm 49:6",
                    text: "Even those who trust in their wealth\n  And boast in the abundance of their riches?",
                    prayer: "Father, keep me from placing confidence in wealth, possessions, or worldly success."
                ),
                PrayerVerse(
                    id: "psalm-49-7",
                    reference: "Psalm 49:7",
                    text: "No man can by any means redeem his brother\n  Or give to God a ransom for him—",
                    prayer: "Lord, remind me that no earthly resource can purchase salvation. Thank You for the gift of redemption through Your grace."
                ),
                PrayerVerse(
                    id: "psalm-49-8",
                    reference: "Psalm 49:8",
                    text: "For the redemption of his soul is costly,\n  And he should cease trying forever—",
                    prayer: "Father, thank You that true redemption comes from You alone and cannot be earned by human effort."
                ),
                PrayerVerse(
                    id: "psalm-49-9",
                    reference: "Psalm 49:9",
                    text: "That he should live on eternally,\n  That he should not undergo decay.",
                    prayer: "Lord, help me live with an eternal perspective rather than focusing only on temporary things."
                ),
                PrayerVerse(
                    id: "psalm-49-10",
                    reference: "Psalm 49:10",
                    text: "For he sees that even wise men die;\n  The stupid and the senseless alike perish\n  And leave their wealth to others.",
                    prayer: "Father, remind me that earthly life is brief and that wisdom is found in preparing for eternity."
                ),
                PrayerVerse(
                    id: "psalm-49-11",
                    reference: "Psalm 49:11",
                    text: "Their inner thought is that their houses are forever\n  And their dwelling places to all generations;\n  They have called their lands after their own names.",
                    prayer: "Lord, help me avoid placing my identity in accomplishments, possessions, or reputation."
                ),
                PrayerVerse(
                    id: "psalm-49-12",
                    reference: "Psalm 49:12",
                    text: "But man in his pomp will not endure;\n  He is like the beasts that perish.",
                    prayer: "Father, teach me humility and remind me that all earthly glory fades away."
                ),
                PrayerVerse(
                    id: "psalm-49-13",
                    reference: "Psalm 49:13",
                    text: "This is the way of those who are foolish,\n  And of those after them who approve their words. Selah.",
                    prayer: "Lord, keep me from foolish pride and help me walk in wisdom and dependence upon You."
                ),
                PrayerVerse(
                    id: "psalm-49-14",
                    reference: "Psalm 49:14",
                    text: "As sheep they are appointed for Sheol;\n  Death shall be their shepherd;\n  And the upright shall rule over them in the morning,\n  And their form shall be for Sheol to consume\n  So that they have no habitation.",
                    prayer: "Father, thank You for showing me the path that leads to eternal life and hope."
                ),
                PrayerVerse(
                    id: "psalm-49-15",
                    reference: "Psalm 49:15",
                    text: "But God will redeem my soul from the power of Sheol,\n  For He will receive me. Selah.",
                    prayer: "Lord, thank You for redeeming my soul and giving me the promise of everlasting life with You."
                ),
                PrayerVerse(
                    id: "psalm-49-16",
                    reference: "Psalm 49:16",
                    text: "Do not be afraid when a man becomes rich,\n  When the glory of his house is increased;",
                    prayer: "Father, help me remain content and faithful when others prosper materially."
                ),
                PrayerVerse(
                    id: "psalm-49-17",
                    reference: "Psalm 49:17",
                    text: "For when he dies he will carry nothing away;\n  His glory will not descend after him.",
                    prayer: "Lord, remind me that earthly possessions cannot be taken into eternity and that true treasure is found in You."
                ),
                PrayerVerse(
                    id: "psalm-49-18",
                    reference: "Psalm 49:18",
                    text: "Though while he lives he congratulates himself—\n  And though men praise you when you do well for yourself—",
                    prayer: "Father, keep me from seeking the praise of people more than the approval of You."
                ),
                PrayerVerse(
                    id: "psalm-49-19",
                    reference: "Psalm 49:19",
                    text: "He shall go to the generation of his fathers;\n  They will never see the light.",
                    prayer: "Lord, help me live wisely and faithfully so that my life reflects eternal values."
                ),
                PrayerVerse(
                    id: "psalm-49-20",
                    reference: "Psalm 49:20",
                    text: "Man in his pomp, yet without understanding,\n  Is like the beasts that perish.",
                    prayer: "Father, grant me understanding and help me walk according to Your wisdom rather than the wisdom of the world."
                ),
                PrayerVerse(
                    id: "psalm-49-closing",
                    reference: "Closing",
                    text: "Lord, thank You for teaching me what truly matters. Help me live with an eternal perspective and place my trust in You rather than in wealth, possessions, or worldly success. Fill me with wisdom, humility, and contentment. Thank You for redeeming my life and giving me the hope of eternity with You. May my heart remain focused on Your kingdom and Your purposes above all else.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 50,
            title: "The Mighty One Speaks",
            chapterReference: "Psalm 50",
            summary: "Pray for true worship and gratitude.",
            verses: [
                PrayerVerse(
                    id: "psalm-50-1",
                    reference: "Psalm 50:1",
                    text: "The Mighty One, God, the Lord, has spoken,\n  And summoned the earth from the rising of the sun to its setting.",
                    prayer: "Lord, You are the mighty God who speaks with authority. Help me listen carefully and respond faithfully to Your voice."
                ),
                PrayerVerse(
                    id: "psalm-50-2",
                    reference: "Psalm 50:2",
                    text: "Out of Zion, the perfection of beauty,\n  God has shone forth.",
                    prayer: "Father, Your glory shines with perfection. Help me recognize Your majesty and worship You with reverence."
                ),
                PrayerVerse(
                    id: "psalm-50-3",
                    reference: "Psalm 50:3",
                    text: "May our God come and not keep silence;\n  Fire devours before Him,\n  And it is very tempestuous around Him.",
                    prayer: "Lord, thank You that You are holy and just. Help me live in a way that honors Your righteousness."
                ),
                PrayerVerse(
                    id: "psalm-50-4",
                    reference: "Psalm 50:4",
                    text: "He summons the heavens above,\n  And the earth, to judge His people:",
                    prayer: "Father, You see all things and judge perfectly. Help me live with integrity before You."
                ),
                PrayerVerse(
                    id: "psalm-50-5",
                    reference: "Psalm 50:5",
                    text: "“Gather My godly ones to Me,\n  Those who have made a covenant with Me by sacrifice.”",
                    prayer: "Lord, thank You for calling Your people into relationship with You. Help me remain faithful to the covenant You have established through Christ."
                ),
                PrayerVerse(
                    id: "psalm-50-6",
                    reference: "Psalm 50:6",
                    text: "And the heavens declare His righteousness,\n  For God Himself is judge. Selah.",
                    prayer: "Father, Your judgments are true and righteous. Help me trust Your wisdom in all things."
                ),
                PrayerVerse(
                    id: "psalm-50-7",
                    reference: "Psalm 50:7",
                    text: "“Hear, O My people, and I will speak;\n  O Israel, I will testify against you;\n  I am God, your God.",
                    prayer: "Lord, give me ears to hear Your instruction and a heart willing to obey."
                ),
                PrayerVerse(
                    id: "psalm-50-8",
                    reference: "Psalm 50:8",
                    text: "I do not reprove you for your sacrifices,\n  And your burnt offerings are continually before Me.",
                    prayer: "Father, remind me that You desire more than outward actions—you desire a heart devoted to You."
                ),
                PrayerVerse(
                    id: "psalm-50-9",
                    reference: "Psalm 50:9",
                    text: "I shall take no young bull out of your house\n  Nor male goats out of your folds.",
                    prayer: "Lord, help me remember that everything belongs to You and that You are not dependent upon anything I can offer."
                ),
                PrayerVerse(
                    id: "psalm-50-10",
                    reference: "Psalm 50:10",
                    text: "For every beast of the forest is Mine,\n  The cattle on a thousand hills.",
                    prayer: "Father, thank You as the Creator and Owner of all things. Teach me to be a faithful steward of what You have entrusted to me."
                ),
                PrayerVerse(
                    id: "psalm-50-11",
                    reference: "Psalm 50:11",
                    text: "I know every bird of the mountains,\n  And everything that moves in the field is Mine.",
                    prayer: "Lord, You know every detail of creation and every detail of my life. Thank You for Your care and attention."
                ),
                PrayerVerse(
                    id: "psalm-50-12",
                    reference: "Psalm 50:12",
                    text: "If I were hungry I would not tell you,\n  For the world is Mine, and all it contains.",
                    prayer: "Father, remind me that You are completely self-sufficient and worthy of worship simply because of who You are."
                ),
                PrayerVerse(
                    id: "psalm-50-13",
                    reference: "Psalm 50:13",
                    text: "Shall I eat the flesh of bulls\n  Or drink the blood of male goats?",
                    prayer: "Lord, help me understand the true meaning of worship and devotion to You."
                ),
                PrayerVerse(
                    id: "psalm-50-14",
                    reference: "Psalm 50:14",
                    text: "Offer to God a sacrifice of thanksgiving\n  And pay your vows to the Most High;",
                    prayer: "Father, let gratitude and thanksgiving become a regular part of my life and relationship with You."
                ),
                PrayerVerse(
                    id: "psalm-50-15",
                    reference: "Psalm 50:15",
                    text: "Call upon Me in the day of trouble;\n  I shall rescue you, and you will honor Me.”",
                    prayer: "Lord, thank You for inviting me to call upon You in times of trouble. Help me trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-50-16",
                    reference: "Psalm 50:16",
                    text: "But to the wicked God says,\n  “What right have you to tell of My statutes\n  And to take My covenant in your mouth?",
                    prayer: "Father, help me not merely speak Your truth but live it faithfully every day."
                ),
                PrayerVerse(
                    id: "psalm-50-17",
                    reference: "Psalm 50:17",
                    text: "For you hate discipline,\n  And you cast My words behind you.",
                    prayer: "Lord, reveal areas where I resist correction and give me a teachable and humble heart."
                ),
                PrayerVerse(
                    id: "psalm-50-18",
                    reference: "Psalm 50:18",
                    text: "When you see a thief, you are pleased with him,\n  And you associate with adulterers.",
                    prayer: "Father, keep me from compromising with sin and help me walk in obedience to Your Word."
                ),
                PrayerVerse(
                    id: "psalm-50-19",
                    reference: "Psalm 50:19",
                    text: "You let your mouth loose in evil\n  And your tongue frames deceit.",
                    prayer: "Lord, guard my speech and help my words reflect truth, grace, and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-50-20",
                    reference: "Psalm 50:20",
                    text: "You sit and speak against your brother;\n  You slander your own mother’s son.",
                    prayer: "Father, protect my relationships and help me treat others with kindness, honesty, and love."
                ),
                PrayerVerse(
                    id: "psalm-50-21",
                    reference: "Psalm 50:21",
                    text: "These things you have done and I kept silence;\n  You thought that I was just like you;\n  I will reprove you and state the case in order before your eyes.",
                    prayer: "Lord, forgive me when I make assumptions about You that are not true. Help me know You as You have revealed Yourself."
                ),
                PrayerVerse(
                    id: "psalm-50-22",
                    reference: "Psalm 50:22",
                    text: "“Now consider this, you who forget God,\n  Or I will tear you in pieces, and there will be none to deliver.",
                    prayer: "Father, help me remember Your warnings and respond to them with repentance and faith."
                ),
                PrayerVerse(
                    id: "psalm-50-23",
                    reference: "Psalm 50:23",
                    text: "He who offers a sacrifice of thanksgiving honors Me;\n  And to him who orders his way aright\n  I shall show the salvation of God.”",
                    prayer: "Lord, let my life be marked by thanksgiving, obedience, and worship that glorifies You."
                ),
                PrayerVerse(
                    id: "psalm-50-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your holiness, justice, and mercy. Help me worship You not only with my words but also with my life. Teach me to walk in obedience, gratitude, and sincerity before You. Guard my heart from hypocrisy, strengthen my faith, and help me trust You in every circumstance. May my life continually bring honor and glory to Your name through genuine worship and faithful devotion.",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 51,
            title: "Create in Me a Clean Heart",
            chapterReference: "Psalm 51",
            summary: "Pray for repentance and restoration.",
            verses: [
                PrayerVerse(
                    id: "psalm-51-1",
                    reference: "Psalm 51:1",
                    text: "Be gracious to me, O God, according to Your lovingkindness;\n  According to the greatness of Your compassion blot out my transgressions.",
                    prayer: "Lord, have mercy on me according to Your lovingkindness. Thank You for Your compassion and unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-51-2",
                    reference: "Psalm 51:2",
                    text: "Wash me thoroughly from my iniquity\n  And cleanse me from my sin.",
                    prayer: "Father, cleanse me from sin and wash away anything that separates me from closer fellowship with You."
                ),
                PrayerVerse(
                    id: "psalm-51-3",
                    reference: "Psalm 51:3",
                    text: "For I know my transgressions,\n  And my sin is ever before me.",
                    prayer: "Lord, help me honestly recognize my failures and bring them before You with humility and repentance."
                ),
                PrayerVerse(
                    id: "psalm-51-4",
                    reference: "Psalm 51:4",
                    text: "Against You, You only, I have sinned\n  And done what is evil in Your sight,\n  So that You are justified when You speak\n  And blameless when You judge.",
                    prayer: "Father, help me acknowledge when I have sinned against You and trust in Your forgiveness and grace."
                ),
                PrayerVerse(
                    id: "psalm-51-5",
                    reference: "Psalm 51:5",
                    text: "Behold, I was brought forth in iniquity,\n  And in sin my mother conceived me.",
                    prayer: "Lord, remind me of my need for Your mercy and Your transforming work within my heart."
                ),
                PrayerVerse(
                    id: "psalm-51-6",
                    reference: "Psalm 51:6",
                    text: "Behold, You desire truth in the innermost being,\n  And in the hidden part You will make me know wisdom.",
                    prayer: "Father, You desire truth in my innermost being. Help me live with honesty, integrity, and sincerity before You."
                ),
                PrayerVerse(
                    id: "psalm-51-7",
                    reference: "Psalm 51:7",
                    text: "Purify me with hyssop, and I shall be clean;\n  Wash me, and I shall be whiter than snow.",
                    prayer: "Lord, cleanse my heart and make me spiritually clean. Thank You for the forgiveness found in You."
                ),
                PrayerVerse(
                    id: "psalm-51-8",
                    reference: "Psalm 51:8",
                    text: "Make me to hear joy and gladness,\n  Let the bones which You have broken rejoice.",
                    prayer: "Father, restore joy to my heart and help me rejoice again in Your grace and salvation."
                ),
                PrayerVerse(
                    id: "psalm-51-9",
                    reference: "Psalm 51:9",
                    text: "Hide Your face from my sins\n  And blot out all my iniquities.",
                    prayer: "Lord, remove the guilt and shame of past failures and help me walk in the freedom of Your forgiveness."
                ),
                PrayerVerse(
                    id: "psalm-51-10",
                    reference: "Psalm 51:10",
                    text: "Create in me a clean heart, O God,\n  And renew a steadfast spirit within me.",
                    prayer: "Father, create in me a clean heart and renew a steadfast spirit within me."
                ),
                PrayerVerse(
                    id: "psalm-51-11",
                    reference: "Psalm 51:11",
                    text: "Do not cast me away from Your presence\n  And do not take Your Holy Spirit from me.",
                    prayer: "Lord, help me remain close to You and sensitive to the leading of Your Spirit."
                ),
                PrayerVerse(
                    id: "psalm-51-12",
                    reference: "Psalm 51:12",
                    text: "Restore to me the joy of Your salvation\n  And sustain me with a willing spirit.",
                    prayer: "Father, restore to me the joy of Your salvation and sustain me with a willing and faithful spirit."
                ),
                PrayerVerse(
                    id: "psalm-51-13",
                    reference: "Psalm 51:13",
                    text: "Then I will teach transgressors Your ways,\n  And sinners will be converted to You.",
                    prayer: "Lord, use my testimony of Your grace to encourage others and point them toward You."
                ),
                PrayerVerse(
                    id: "psalm-51-14",
                    reference: "Psalm 51:14",
                    text: "Deliver me from bloodguiltiness, O God, the God of my salvation;\n  Then my tongue will joyfully sing of Your righteousness.",
                    prayer: "Father, thank You for Your deliverance and mercy. Let my life proclaim Your righteousness."
                ),
                PrayerVerse(
                    id: "psalm-51-15",
                    reference: "Psalm 51:15",
                    text: "O Lord, open my lips,\n  That my mouth may declare Your praise.",
                    prayer: "Lord, open my lips so that my mouth may declare Your praise and worship."
                ),
                PrayerVerse(
                    id: "psalm-51-16",
                    reference: "Psalm 51:16",
                    text: "For You do not delight in sacrifice, otherwise I would give it;\n  You are not pleased with burnt offering.",
                    prayer: "Father, remind me that You desire a surrendered heart more than outward religious activity."
                ),
                PrayerVerse(
                    id: "psalm-51-17",
                    reference: "Psalm 51:17",
                    text: "The sacrifices of God are a broken spirit;\n  A broken and a contrite heart, O God, You will not despise.",
                    prayer: "Lord, give me a humble and contrite spirit that remains dependent upon Your grace."
                ),
                PrayerVerse(
                    id: "psalm-51-18",
                    reference: "Psalm 51:18",
                    text: "By Your favor do good to Zion;\n  Build the walls of Jerusalem.",
                    prayer: "Father, bless and strengthen Your people. Build up and encourage Your church according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-51-19",
                    reference: "Psalm 51:19",
                    text: "Then You will delight in righteous sacrifices,\n  In burnt offering and whole burnt offering;\n  Then young bulls will be offered on Your altar.",
                    prayer: "Lord, let my worship be pleasing to You as it flows from a sincere and devoted heart."
                ),
                PrayerVerse(
                    id: "psalm-51-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your mercy, forgiveness, and unfailing love. Create in me a clean heart and renew a steadfast spirit within me. Help me walk in humility, honesty, and obedience before You. Restore the joy of my salvation and draw me closer to Your presence each day. May my life reflect Your grace, and may my worship come from a heart that is fully surrendered to You.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 52,
            title: "God Will Bring You Down",
            chapterReference: "Psalm 52",
            summary: "Pray for trust in God's justice.",
            verses: [
                PrayerVerse(
                    id: "psalm-52-1",
                    reference: "Psalm 52:1",
                    text: "[Psalm 52:1 - verse text to be added]",
                    prayer: "Lord, help me never boast in wrongdoing or place confidence in anything that opposes Your truth. Let my confidence be in Your goodness alone."
                ),
                PrayerVerse(
                    id: "psalm-52-2",
                    reference: "Psalm 52:2",
                    text: "[Psalm 52:2 - verse text to be added]",
                    prayer: "Father, guard my tongue and my words. Help me speak truthfully, kindly, and in ways that honor You."
                ),
                PrayerVerse(
                    id: "psalm-52-3",
                    reference: "Psalm 52:3",
                    text: "[Psalm 52:3 - verse text to be added]",
                    prayer: "Lord, help me love what is good and reject what is evil. Shape my heart to desire righteousness and truth."
                ),
                PrayerVerse(
                    id: "psalm-52-4",
                    reference: "Psalm 52:4",
                    text: "[Psalm 52:4 - verse text to be added]",
                    prayer: "Father, protect me from deception and from using words that harm others. Let my speech reflect Your love and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-52-5",
                    reference: "Psalm 52:5",
                    text: "[Psalm 52:5 - verse text to be added]",
                    prayer: "Lord, remind me that only what is rooted in You will endure. Help me build my life upon Your truth."
                ),
                PrayerVerse(
                    id: "psalm-52-6",
                    reference: "Psalm 52:6",
                    text: "[Psalm 52:6 - verse text to be added]",
                    prayer: "Father, help me learn from Your wisdom and walk humbly before You with reverence and faith."
                ),
                PrayerVerse(
                    id: "psalm-52-7",
                    reference: "Psalm 52:7",
                    text: "[Psalm 52:7 - verse text to be added]",
                    prayer: "Lord, keep me from trusting in wealth, success, or worldly security. Teach me to rely completely upon You."
                ),
                PrayerVerse(
                    id: "psalm-52-8",
                    reference: "Psalm 52:8",
                    text: "[Psalm 52:8 - verse text to be added]",
                    prayer: "Father, thank You that I can flourish in Your presence like an olive tree. Help me remain rooted in Your unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-52-9",
                    reference: "Psalm 52:9",
                    text: "[Psalm 52:9 - verse text to be added]",
                    prayer: "Lord, I will praise You for all You have done. Help me wait patiently upon You and trust in Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-52-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the truths of Psalm 52. Help me trust in Your justice and live a life that honors You.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 53,
            title: "Who Will Bring Salvation?",
            chapterReference: "Psalm 53",
            summary: "Pray for God's deliverance.",
            verses: [
                PrayerVerse(
                    id: "psalm-53-1",
                    reference: "Psalm 53:1",
                    text: "Lord, help me never live as though You are not present. Keep my heart grounded in faith, wisdom, and reverence for You.",
                    prayer: "Lord, help me never live as though You are not present. Keep my heart grounded in faith, wisdom, and reverence for You."
                ),
                PrayerVerse(
                    id: "psalm-53-2",
                    reference: "Psalm 53:2",
                    text: "Father, search my heart and draw me closer to You. Help me seek You sincerely and live with understanding that comes from Your truth.",
                    prayer: "Father, search my heart and draw me closer to You. Help me seek You sincerely and live with understanding that comes from Your truth."
                ),
                PrayerVerse(
                    id: "psalm-53-3",
                    reference: "Psalm 53:3",
                    text: "Lord, I acknowledge my need for Your grace. Forgive me when I fall short and lead me back into righteousness.",
                    prayer: "Lord, I acknowledge my need for Your grace. Forgive me when I fall short and lead me back into righteousness."
                ),
                PrayerVerse(
                    id: "psalm-53-4",
                    reference: "Psalm 53:4",
                    text: "Father, protect me from spiritual blindness and from actions that harm others. Teach me to walk in compassion, humility, and obedience.",
                    prayer: "Father, protect me from spiritual blindness and from actions that harm others. Teach me to walk in compassion, humility, and obedience."
                ),
                PrayerVerse(
                    id: "psalm-53-5",
                    reference: "Psalm 53:5",
                    text: "Lord, when fear rises suddenly, remind me that You are with Your people and that Your presence is greater than every threat.",
                    prayer: "Lord, when fear rises suddenly, remind me that You are with Your people and that Your presence is greater than every threat."
                ),
                PrayerVerse(
                    id: "psalm-53-6",
                    reference: "Psalm 53:6",
                    text: "Father, thank You for the salvation and restoration You provide. Fill my heart with joy as I trust in Your deliverance and faithfulness.",
                    prayer: "Father, thank You for the salvation and restoration You provide. Fill my heart with joy as I trust in Your deliverance and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-53-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your mercy, salvation, and restoring grace. Keep my heart from foolishness and unbelief, and help me seek You with sincerity and humility. Teach me to live with wisdom, compassion, and faithfulness. May my life reflect trust in Your presence, confidence in Your deliverance, and joy in the salvation You provide.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 54,
            title: "Save Me by Your Name",
            chapterReference: "Psalm 54",
            summary: "Pray for God's powerful help.",
            verses: [
                PrayerVerse(
                    id: "psalm-54-1",
                    reference: "Psalm 54:1",
                    text: "Lord, save me by Your name and defend me by Your power. Help me trust that You are able to deliver me in every situation.",
                    prayer: "Lord, save me by Your name and defend me by Your power. Help me trust that You are able to deliver me in every situation."
                ),
                PrayerVerse(
                    id: "psalm-54-2",
                    reference: "Psalm 54:2",
                    text: "Father, hear my prayer and listen to the words of my mouth. Thank You that I can bring every concern before You.",
                    prayer: "Father, hear my prayer and listen to the words of my mouth. Thank You that I can bring every concern before You."
                ),
                PrayerVerse(
                    id: "psalm-54-3",
                    reference: "Psalm 54:3",
                    text: "Lord, when opposition rises against me, protect my heart from fear and help me remain faithful to You.",
                    prayer: "Lord, when opposition rises against me, protect my heart from fear and help me remain faithful to You."
                ),
                PrayerVerse(
                    id: "psalm-54-4",
                    reference: "Psalm 54:4",
                    text: "Father, thank You for being my helper and the One who sustains my life. Strengthen me with Your presence and care.",
                    prayer: "Father, thank You for being my helper and the One who sustains my life. Strengthen me with Your presence and care."
                ),
                PrayerVerse(
                    id: "psalm-54-5",
                    reference: "Psalm 54:5",
                    text: "Lord, I trust Your justice and faithfulness. Help me leave every battle and every burden in Your hands.",
                    prayer: "Lord, I trust Your justice and faithfulness. Help me leave every battle and every burden in Your hands."
                ),
                PrayerVerse(
                    id: "psalm-54-6",
                    reference: "Psalm 54:6",
                    text: "Father, let my worship be willing and sincere. Help me give thanks to Your name because You are good.",
                    prayer: "Father, let my worship be willing and sincere. Help me give thanks to Your name because You are good."
                ),
                PrayerVerse(
                    id: "psalm-54-7",
                    reference: "Psalm 54:7",
                    text: "Lord, thank You for delivering me from trouble and for showing Your faithfulness in my life. Help me remember Your goodness and walk confidently in Your care.",
                    prayer: "Lord, thank You for delivering me from trouble and for showing Your faithfulness in my life. Help me remember Your goodness and walk confidently in Your care."
                ),
                PrayerVerse(
                    id: "psalm-54-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my helper, defender, and deliverer. When I face trouble or opposition, help me trust in Your name and rely on Your strength. Hear my prayers, sustain my life, and teach me to worship You with gratitude and faith. May my confidence remain in Your goodness and faithfulness every day.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 55,
            title: "Cast Your Cares",
            chapterReference: "Psalm 55",
            summary: "Pray for peace in betrayal and pain.",
            verses: [
                PrayerVerse(
                    id: "psalm-55-1",
                    reference: "Psalm 55:1",
                    text: "Lord, hear my prayer and do not hide Yourself from my plea. Thank You that I can bring every burden before You.",
                    prayer: "Lord, hear my prayer and do not hide Yourself from my plea. Thank You that I can bring every burden before You."
                ),
                PrayerVerse(
                    id: "psalm-55-2",
                    reference: "Psalm 55:2",
                    text: "Father, when my thoughts are troubled and my heart is overwhelmed, help me find peace in Your presence.",
                    prayer: "Father, when my thoughts are troubled and my heart is overwhelmed, help me find peace in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-55-3",
                    reference: "Psalm 55:3",
                    text: "Lord, when opposition or pressure surrounds me, strengthen my faith and help me trust You completely.",
                    prayer: "Lord, when opposition or pressure surrounds me, strengthen my faith and help me trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-55-4",
                    reference: "Psalm 55:4",
                    text: "Father, You know every fear within my heart. Draw near to me and give me courage.",
                    prayer: "Father, You know every fear within my heart. Draw near to me and give me courage."
                ),
                PrayerVerse(
                    id: "psalm-55-5",
                    reference: "Psalm 55:5",
                    text: "Lord, when anxiety overwhelms me, remind me that You are my refuge and my strength.",
                    prayer: "Lord, when anxiety overwhelms me, remind me that You are my refuge and my strength."
                ),
                PrayerVerse(
                    id: "psalm-55-6",
                    reference: "Psalm 55:6",
                    text: "Father, there are times I want to run away from difficulties. Help me find safety and rest in You instead.",
                    prayer: "Father, there are times I want to run away from difficulties. Help me find safety and rest in You instead."
                ),
                PrayerVerse(
                    id: "psalm-55-7",
                    reference: "Psalm 55:7",
                    text: "Lord, thank You that Your presence follows me wherever I go. Keep me close to You.",
                    prayer: "Lord, thank You that Your presence follows me wherever I go. Keep me close to You."
                ),
                PrayerVerse(
                    id: "psalm-55-8",
                    reference: "Psalm 55:8",
                    text: "Father, be my shelter during life's storms and protect me with Your peace.",
                    prayer: "Father, be my shelter during life's storms and protect me with Your peace."
                ),
                PrayerVerse(
                    id: "psalm-55-9",
                    reference: "Psalm 55:9",
                    text: "Lord, bring wisdom, order, and truth where there is confusion and conflict.",
                    prayer: "Lord, bring wisdom, order, and truth where there is confusion and conflict."
                ),
                PrayerVerse(
                    id: "psalm-55-10",
                    reference: "Psalm 55:10",
                    text: "Father, protect my heart from becoming consumed by negativity, fear, or division.",
                    prayer: "Father, protect my heart from becoming consumed by negativity, fear, or division."
                ),
                PrayerVerse(
                    id: "psalm-55-11",
                    reference: "Psalm 55:11",
                    text: "Lord, help me remain faithful to You even when surrounded by corruption or wrongdoing.",
                    prayer: "Lord, help me remain faithful to You even when surrounded by corruption or wrongdoing."
                ),
                PrayerVerse(
                    id: "psalm-55-12",
                    reference: "Psalm 55:12",
                    text: "Father, when I experience hurt from others, help me respond with grace and wisdom.",
                    prayer: "Father, when I experience hurt from others, help me respond with grace and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-55-13",
                    reference: "Psalm 55:13",
                    text: "Lord, You understand the pain of broken relationships. Bring healing and restoration to my heart.",
                    prayer: "Lord, You understand the pain of broken relationships. Bring healing and restoration to my heart."
                ),
                PrayerVerse(
                    id: "psalm-55-14",
                    reference: "Psalm 55:14",
                    text: "Father, thank You for the gift of fellowship and community. Help me value relationships that honor You.",
                    prayer: "Father, thank You for the gift of fellowship and community. Help me value relationships that honor You."
                ),
                PrayerVerse(
                    id: "psalm-55-15",
                    reference: "Psalm 55:15",
                    text: "Lord, protect me from evil influences and keep my heart firmly grounded in Your truth.",
                    prayer: "Lord, protect me from evil influences and keep my heart firmly grounded in Your truth."
                ),
                PrayerVerse(
                    id: "psalm-55-16",
                    reference: "Psalm 55:16",
                    text: "Father, I call upon You because You are my Savior and Deliverer. Thank You for hearing me.",
                    prayer: "Father, I call upon You because You are my Savior and Deliverer. Thank You for hearing me."
                ),
                PrayerVerse(
                    id: "psalm-55-17",
                    reference: "Psalm 55:17",
                    text: "Lord, help me bring every concern to You in prayer throughout the day.",
                    prayer: "Lord, help me bring every concern to You in prayer throughout the day."
                ),
                PrayerVerse(
                    id: "psalm-55-18",
                    reference: "Psalm 55:18",
                    text: "Father, thank You for giving peace to those who trust in You. Strengthen my confidence in Your care.",
                    prayer: "Father, thank You for giving peace to those who trust in You. Strengthen my confidence in Your care."
                ),
                PrayerVerse(
                    id: "psalm-55-19",
                    reference: "Psalm 55:19",
                    text: "Lord, You are eternal and unchanging. Help me trust Your wisdom and Your timing.",
                    prayer: "Lord, You are eternal and unchanging. Help me trust Your wisdom and Your timing."
                ),
                PrayerVerse(
                    id: "psalm-55-20",
                    reference: "Psalm 55:20",
                    text: "Father, teach me to walk with integrity and faithfulness in all my relationships.",
                    prayer: "Father, teach me to walk with integrity and faithfulness in all my relationships."
                ),
                PrayerVerse(
                    id: "psalm-55-21",
                    reference: "Psalm 55:21",
                    text: "Lord, give me discernment and wisdom when dealing with words that sound good but do not reflect truth.",
                    prayer: "Lord, give me discernment and wisdom when dealing with words that sound good but do not reflect truth."
                ),
                PrayerVerse(
                    id: "psalm-55-22",
                    reference: "Psalm 55:22",
                    text: "Father, I cast my burdens upon You. Thank You for sustaining me and caring for every detail of my life.",
                    prayer: "Father, I cast my burdens upon You. Thank You for sustaining me and caring for every detail of my life."
                ),
                PrayerVerse(
                    id: "psalm-55-23",
                    reference: "Psalm 55:23",
                    text: "Lord, help me trust You completely and walk faithfully in Your ways each day.",
                    prayer: "Lord, help me trust You completely and walk faithfully in Your ways each day."
                ),
                PrayerVerse(
                    id: "psalm-55-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, strength, and faithful helper. When fear, anxiety, or disappointment come, remind me that I can cast every burden upon You. Strengthen my faith, heal my heart, and guide me with Your wisdom. Help me trust You completely, walk faithfully in Your truth, and rest securely in Your unfailing love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 56,
            title: "When I Am Afraid",
            chapterReference: "Psalm 56",
            summary: "Pray for trust over fear.",
            verses: [
                PrayerVerse(
                    id: "psalm-56-1",
                    reference: "Psalm 56:1",
                    text: "Be gracious to me, O God, for man has trampled upon me;\n  Fighting all day long he oppresses me.",
                    prayer: "Heavenly Father, be gracious to me when I feel overwhelmed, attacked, or misunderstood. Remind me that Your mercy is greater than every challenge I face. Help me turn to You first instead of relying on my own strength. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-2",
                    reference: "Psalm 56:2",
                    text: "My foes have trampled upon me all day long,\n  For they are many who fight proudly against me.",
                    prayer: "Lord, when pressures surround me and difficulties seem relentless, help me remember that You are greater than anything that comes against me. Give me courage to stand firm and confidence in Your protection. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-3",
                    reference: "Psalm 56:3",
                    text: "When I am afraid,\n  I will put my trust in You.",
                    prayer: "Father, whenever fear enters my heart, teach me to immediately place my trust in You. Replace anxiety with faith, worry with peace, and uncertainty with confidence in Your promises. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-4",
                    reference: "Psalm 56:4",
                    text: "In God, whose word I praise,\n  In God I have put my trust;\n  I shall not be afraid.\n  What can mere man do to me?",
                    prayer: "Lord, thank You for Your faithful Word that never fails. Help me stand on Your promises and remember that if You are with me, I do not need to be afraid of what others may do. Strengthen my faith each day. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-5",
                    reference: "Psalm 56:5",
                    text: "All day long they distort my words;\n  All their thoughts are against me for evil.",
                    prayer: "Father, when people misunderstand my intentions or speak against me, help me respond with grace and wisdom. Guard my heart from bitterness and teach me to trust You as my defender. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-6",
                    reference: "Psalm 56:6",
                    text: "They attack, they lurk,\n  They watch my steps,\n  As they have waited to take my life.",
                    prayer: "Lord, nothing escapes Your attention. You see every situation, every challenge, and every hidden struggle. Help me rest in the knowledge that You are watching over me and working on my behalf. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-7",
                    reference: "Psalm 56:7",
                    text: "Because of wickedness, cast them forth,\n  In anger put down the peoples, O God!",
                    prayer: "Righteous God, I place every injustice into Your hands. Help me resist the desire for revenge and trust Your perfect judgment. Let my focus remain on honoring You rather than defending myself. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-8",
                    reference: "Psalm 56:8",
                    text: "You have taken account of my wanderings;\n  Put my tears in Your bottle.\n  Are they not in Your book?",
                    prayer: "Father, thank You for caring about every sorrow, every tear, and every burden I carry. When I feel alone in my struggles, remind me that You know my pain and hold me close. Comfort me with Your presence. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-9",
                    reference: "Psalm 56:9",
                    text: "Then my enemies will turn back in the day when I call;\n  This I know, that God is for me.",
                    prayer: "Lord, thank You that You are on my side. When challenges arise, help me remember that Your power, love, and faithfulness are working for my good. Strengthen my confidence in You. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-10",
                    reference: "Psalm 56:10",
                    text: "In God, whose word I praise,\n  In the Lord, whose word I praise,",
                    prayer: "Father, I praise You for Your trustworthy Word. Help me treasure Scripture, meditate on Your promises, and allow Your truth to guide every decision I make. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-11",
                    reference: "Psalm 56:11",
                    text: "In God I have put my trust, I shall not be afraid.\n  What can man do to me?",
                    prayer: "Lord, because I trust in You, I do not need to be controlled by fear. Fill my heart with courage and peace. Help me walk confidently, knowing that You are my refuge and strength. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-12",
                    reference: "Psalm 56:12",
                    text: "Your vows are binding upon me, O God;\n  I will render thank offerings to You.",
                    prayer: "Father, help me remain faithful to the commitments I have made to You. Let my life be marked by gratitude, obedience, and worship as I honor You in all I do. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-13",
                    reference: "Psalm 56:13",
                    text: "For You have delivered my soul from death,\n  Indeed my feet from stumbling,\n  So that I may walk before God\n  In the light of the living.",
                    prayer: "Lord, thank You for rescuing me, sustaining me, and guiding my steps. Help me walk in Your light each day and live in a way that brings glory to Your name. May my life reflect Your goodness and faithfulness. In Jesus' name, Amen."
                ),
                PrayerVerse(
                    id: "psalm-56-closing",
                    reference: "Closing",
                    text: "Heavenly Father, thank You for being my refuge when fear rises and my strength when challenges surround me. Help me trust You completely, knowing that You see every tear, hear every prayer, and faithfully keep Your promises. Teach me to walk by faith instead of fear, to praise You in every season, and to rest in the confidence that You are always with me. May my life bring honor to You as I follow Your guidance each day.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 57,
            title: "My Heart is Steadfast",
            chapterReference: "Psalm 57",
            summary: "Pray for confidence in God's mercy.",
            verses: [
                PrayerVerse(
                    id: "psalm-57-1",
                    reference: "Psalm 57:1",
                    text: "Be gracious to me, O God, be gracious to me,\n  For my soul takes refuge in You;\n  And in the shadow of Your wings I will take refuge\n  Until destruction passes by.",
                    prayer: "Lord, be gracious to me, for my soul takes refuge in You. Help me hide under the shadow of Your wings until every storm passes by."
                ),
                PrayerVerse(
                    id: "psalm-57-2",
                    reference: "Psalm 57:2",
                    text: "I will cry to God Most High,\n  To God who accomplishes all things for me.",
                    prayer: "Father, I cry out to You, the Most High God. Thank You for accomplishing Your purpose in my life and guiding me with faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-57-3",
                    reference: "Psalm 57:3",
                    text: "He will send from heaven and save me;\n  He reproaches him who tramples upon me. Selah.\n  God will send forth His lovingkindness and His truth.",
                    prayer: "Lord, send Your help from heaven and rescue me according to Your lovingkindness and truth. Strengthen my confidence in Your deliverance."
                ),
                PrayerVerse(
                    id: "psalm-57-4",
                    reference: "Psalm 57:4",
                    text: "My soul is among lions;\n  I must lie among those who breathe forth fire,\n  Even the sons of men, whose teeth are spears and arrows\n  And their tongue a sharp sword.",
                    prayer: "Father, when I feel surrounded by danger, fear, or opposition, protect my heart and help me remain faithful to You."
                ),
                PrayerVerse(
                    id: "psalm-57-5",
                    reference: "Psalm 57:5",
                    text: "Be exalted above the heavens, O God;\n  Let Your glory be above all the earth.",
                    prayer: "Lord, be exalted above the heavens and let Your glory be over all the earth. May my life bring honor and praise to Your name."
                ),
                PrayerVerse(
                    id: "psalm-57-6",
                    reference: "Psalm 57:6",
                    text: "They have prepared a net for my steps;\n  My soul is bowed down;\n  They dug a pit before me;\n  They themselves have fallen into the midst of it. Selah.",
                    prayer: "Father, protect me from hidden traps and discouragement. Lift me up when my soul feels bowed down."
                ),
                PrayerVerse(
                    id: "psalm-57-7",
                    reference: "Psalm 57:7",
                    text: "My heart is steadfast, O God, my heart is steadfast;\n  I will sing, yes, I will sing praises!",
                    prayer: "Lord, make my heart steadfast in You. Help me praise You with confidence, even in difficult seasons."
                ),
                PrayerVerse(
                    id: "psalm-57-8",
                    reference: "Psalm 57:8",
                    text: "Awake, my glory!\n  Awake, harp and lyre!\n  I will awaken the dawn.",
                    prayer: "Father, awaken praise within me. Let my soul rise with worship, gratitude, and renewed hope in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-57-9",
                    reference: "Psalm 57:9",
                    text: "I will give thanks to You, O Lord, among the peoples;\n  I will sing praises to You among the nations.",
                    prayer: "Lord, help me give thanks to You among all people. Let my life declare Your goodness and faithfulness wherever I go."
                ),
                PrayerVerse(
                    id: "psalm-57-10",
                    reference: "Psalm 57:10",
                    text: "For Your lovingkindness is great to the heavens\n  And Your truth to the clouds.",
                    prayer: "Father, Your lovingkindness is great to the heavens and Your truth reaches to the skies. Help me rest in Your unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-57-11",
                    reference: "Psalm 57:11",
                    text: "Be exalted above the heavens, O God;\n  Let Your glory be above all the earth.",
                    prayer: "Lord, be exalted above the heavens and let Your glory cover the earth. May everything in my life point back to Your greatness."
                ),
                PrayerVerse(
                    id: "psalm-57-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge in every storm. Help me trust Your lovingkindness, rest under Your protection, and praise You with a steadfast heart. When fear or trouble surrounds me, remind me that You are faithful, powerful, and near. May my life continually declare Your glory, Your goodness, and Your truth.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 58,
            title: "Do You Judge Uprightly?",
            chapterReference: "Psalm 58",
            summary: "Pray for God's righteous judgment.",
            // JSON resource: psalm_58_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-58-1",
                    reference: "Psalm 58:1",
                    text: "Do you indeed speak righteousness, O gods?\n  Do you judge uprightly, O sons of men?",
                    prayer: "Lord, help me value justice, truth, and righteousness in every decision I make. Guard my heart from silence when I should stand for what is right."
                ),
                PrayerVerse(
                    id: "psalm-58-2",
                    reference: "Psalm 58:2",
                    text: "No, in heart you work unrighteousness;\n  On earth you weigh out the violence of your hands.",
                    prayer: "Father, protect me from hidden motives and selfish actions. Teach me to walk with integrity in both my thoughts and my choices."
                ),
                PrayerVerse(
                    id: "psalm-58-3",
                    reference: "Psalm 58:3",
                    text: "The wicked are estranged from the womb;\n  These who speak lies go astray from birth.",
                    prayer: "Lord, keep me from drifting away from Your truth. Draw my heart back to You whenever I am tempted toward sin or deception."
                ),
                PrayerVerse(
                    id: "psalm-58-4",
                    reference: "Psalm 58:4",
                    text: "They have venom like the venom of a serpent;\n  Like a deaf cobra that stops up its ear,",
                    prayer: "Father, guard my words and influence. Do not let bitterness, pride, or harmful speech take root in my life."
                ),
                PrayerVerse(
                    id: "psalm-58-5",
                    reference: "Psalm 58:5",
                    text: "So that it does not hear the voice of charmers,\n  Or a skillful caster of spells.",
                    prayer: "Lord, help me stay sensitive to Your voice. Keep my heart from becoming stubborn or resistant to Your correction."
                ),
                PrayerVerse(
                    id: "psalm-58-6",
                    reference: "Psalm 58:6",
                    text: "O God, shatter their teeth in their mouth;\n  Break out the fangs of the young lions, O Lord.",
                    prayer: "Father, break the power of evil, injustice, and deception. Strengthen what is righteous and protect those who are vulnerable."
                ),
                PrayerVerse(
                    id: "psalm-58-7",
                    reference: "Psalm 58:7",
                    text: "Let them flow away like water that runs off;\n  When he aims his arrows, let them be as headless shafts.",
                    prayer: "Lord, let every destructive plan lose its power. Guide me away from anything that cannot stand before Your truth."
                ),
                PrayerVerse(
                    id: "psalm-58-8",
                    reference: "Psalm 58:8",
                    text: "Let them be as a snail which melts away as it goes along,\n  Like the miscarriages of a woman which never see the sun.",
                    prayer: "Father, remind me that evil is temporary and cannot overcome Your eternal righteousness. Help me trust Your justice."
                ),
                PrayerVerse(
                    id: "psalm-58-9",
                    reference: "Psalm 58:9",
                    text: "Before your pots can feel the fire of thorns\n  He will sweep them away with a whirlwind, the green and the burning alike.",
                    prayer: "Lord, act according to Your perfect wisdom and timing. Help me believe that You see every injustice and will make all things right."
                ),
                PrayerVerse(
                    id: "psalm-58-10",
                    reference: "Psalm 58:10",
                    text: "The righteous will rejoice when he sees the vengeance;\n  He will wash his feet in the blood of the wicked.",
                    prayer: "Father, teach me to rejoice not in revenge, but in the victory of Your righteousness, justice, and truth."
                ),
                PrayerVerse(
                    id: "psalm-58-11",
                    reference: "Psalm 58:11",
                    text: "And men will say, \"Surely there is a reward for the righteous;\n  Surely there is a God who judges on earth!\"",
                    prayer: "Lord, remind me that righteousness matters and that You are the Judge of all the earth. Help me live faithfully before You with reverence and trust."
                ),
                PrayerVerse(
                    id: "psalm-58-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being perfectly just, righteous, and true. Help me stand for what is right, reject deception, and trust Your judgment over every situation. Guard my heart from bitterness or revenge, and teach me to walk with integrity, humility, and faith. May my life reflect confidence in Your justice and devotion to Your truth.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 59,
            title: "Deliver Me from Enemies",
            chapterReference: "Psalm 59",
            summary: "Pray for protection and deliverance.",
            // JSON resource: psalm_59_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-59-1",
                    reference: "Psalm 59:1",
                    text: "Deliver me from my enemies, O my God;\n  Set me securely on high away from those who rise up against me.",
                    prayer: "Lord, deliver me from every enemy and protect me from anything that rises against my faith, peace, or obedience to You."
                ),
                PrayerVerse(
                    id: "psalm-59-2",
                    reference: "Psalm 59:2",
                    text: "Deliver me from those who do iniquity\n  And save me from men of bloodshed.",
                    prayer: "Father, rescue me from evil influences and guard my heart from anything that seeks to pull me away from Your truth."
                ),
                PrayerVerse(
                    id: "psalm-59-3",
                    reference: "Psalm 59:3",
                    text: "For behold, they have set an ambush for my life;\n  Fierce men launch an attack against me,\n  Not for my transgression nor for my sin, O Lord,",
                    prayer: "Lord, when I feel attacked or misunderstood, help me trust that You see the truth and know every detail of my life."
                ),
                PrayerVerse(
                    id: "psalm-59-4",
                    reference: "Psalm 59:4",
                    text: "For no guilt of mine, they run and set themselves against me.\n  Arouse Yourself to help me, and see!",
                    prayer: "Father, strengthen me when trouble comes without warning. Rise to help me and keep me steady in Your care."
                ),
                PrayerVerse(
                    id: "psalm-59-5",
                    reference: "Psalm 59:5",
                    text: "You, O Lord God of hosts, the God of Israel,\n  Awake to punish all the nations;\n  Do not be gracious to any who are treacherous in iniquity. Selah.",
                    prayer: "Lord, You are the God of all authority. Act according to Your justice and help me trust Your wisdom in every situation."
                ),
                PrayerVerse(
                    id: "psalm-59-6",
                    reference: "Psalm 59:6",
                    text: "They return at evening, they howl like a dog,\n  And go around the city.",
                    prayer: "Father, protect me from repeated attacks, discouragement, or fear. Surround me with Your peace when trouble returns."
                ),
                PrayerVerse(
                    id: "psalm-59-7",
                    reference: "Psalm 59:7",
                    text: "Behold, they belch forth with their mouth;\n  Swords are in their lips,\n  For, they say, \"Who hears?\"",
                    prayer: "Lord, guard my words and protect me from harmful speech. Help me speak truth with wisdom, grace, and humility."
                ),
                PrayerVerse(
                    id: "psalm-59-8",
                    reference: "Psalm 59:8",
                    text: "But You, O Lord, laugh at them;\n  You scoff at all the nations.",
                    prayer: "Father, remind me that You are not threatened by evil or opposition. Help me rest in Your power and sovereignty."
                ),
                PrayerVerse(
                    id: "psalm-59-9",
                    reference: "Psalm 59:9",
                    text: "Because of his strength I will watch for You,\n  For God is my stronghold.",
                    prayer: "Lord, You are my strength. Help me watch for Your help and trust You as my stronghold."
                ),
                PrayerVerse(
                    id: "psalm-59-10",
                    reference: "Psalm 59:10",
                    text: "My God in His lovingkindness will meet me;\n  God will let me look triumphantly upon my foes.",
                    prayer: "Father, thank You for meeting me with Your lovingkindness. Let me see Your faithfulness even in difficult moments."
                ),
                PrayerVerse(
                    id: "psalm-59-11",
                    reference: "Psalm 59:11",
                    text: "Do not slay them, or my people will forget;\n  Scatter them by Your power, and bring them down,\n  O Lord, our shield.",
                    prayer: "Lord, teach me to trust Your justice and timing. Help me learn from every trial and remain humble before You."
                ),
                PrayerVerse(
                    id: "psalm-59-12",
                    reference: "Psalm 59:12",
                    text: "On account of the sin of their mouth and the words of their lips,\n  Let them even be caught in their pride,\n  And on account of curses and lies which they utter.",
                    prayer: "Father, protect me from pride, harmful words, and sinful attitudes. Let my speech and heart honor You."
                ),
                PrayerVerse(
                    id: "psalm-59-13",
                    reference: "Psalm 59:13",
                    text: "Destroy them in wrath, destroy them that they may be no more;\n  That men may know that God rules in Jacob\n  To the ends of the earth. Selah.",
                    prayer: "Lord, bring an end to evil and let Your righteousness be known. May Your rule be recognized throughout the earth."
                ),
                PrayerVerse(
                    id: "psalm-59-14",
                    reference: "Psalm 59:14",
                    text: "They return at evening, they howl like a dog,\n  And go around the city.",
                    prayer: "Father, when trouble seems to return again and again, help me not lose heart but remain faithful in prayer."
                ),
                PrayerVerse(
                    id: "psalm-59-15",
                    reference: "Psalm 59:15",
                    text: "They wander about for food\n  And growl if they are not satisfied.",
                    prayer: "Lord, keep me from restless striving and dissatisfaction. Help me find my security and satisfaction in You."
                ),
                PrayerVerse(
                    id: "psalm-59-16",
                    reference: "Psalm 59:16",
                    text: "But as for me, I shall sing of Your strength;\n  Yes, I shall joyfully sing of Your lovingkindness in the morning,\n  For You have been my stronghold\n  And a refuge in the day of my distress.",
                    prayer: "Father, I will sing of Your strength and joyfully proclaim Your lovingkindness. Thank You for being my refuge in trouble."
                ),
                PrayerVerse(
                    id: "psalm-59-17",
                    reference: "Psalm 59:17",
                    text: "O my strength, I will sing praises to You;\n  For God is my stronghold, the God who shows me lovingkindness.",
                    prayer: "Lord, You are my strength and my stronghold. I praise You because Your lovingkindness never fails."
                ),
                PrayerVerse(
                    id: "psalm-59-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my defender, my refuge, and my strength. When trouble surrounds me or fear rises within me, help me trust in Your protection and lovingkindness. Guard my heart, guide my words, and keep me faithful through every challenge. May my life continually praise You as my stronghold and my faithful God.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 60,
            title: "You Have Rejected Us",
            chapterReference: "Psalm 60",
            summary: "Pray for restoration and victory.",
            // JSON resource: psalm_60_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-60-1",
                    reference: "Psalm 60:1",
                    text: "O God, You have rejected us. You have broken us;\n  You have been angry; O, restore us.",
                    prayer: "Lord, when life feels shaken and difficult, help me return to You with humility. Restore me by Your mercy and lead me back into peace."
                ),
                PrayerVerse(
                    id: "psalm-60-2",
                    reference: "Psalm 60:2",
                    text: "You have made the land quake, You have split it open;\n  Heal its breaches, for it totters.",
                    prayer: "Father, when the foundations around me feel broken, heal what has been fractured and steady my heart in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-60-3",
                    reference: "Psalm 60:3",
                    text: "You have made Your people experience hardship;\n  You have given us wine to drink that makes us stagger.",
                    prayer: "Lord, when hardship feels heavy, give me strength to endure and wisdom to keep trusting You through every trial."
                ),
                PrayerVerse(
                    id: "psalm-60-4",
                    reference: "Psalm 60:4",
                    text: "You have given a banner to those who fear You,\n  That it may be displayed because of the truth. Selah.",
                    prayer: "Father, thank You for giving Your people a banner of truth. Help me stand under Your name with courage, faith, and obedience."
                ),
                PrayerVerse(
                    id: "psalm-60-5",
                    reference: "Psalm 60:5",
                    text: "That Your beloved may be delivered,\n  Save with Your right hand, and answer us!",
                    prayer: "Lord, save those You love and answer us with Your power. Deliver me by Your right hand and help me trust Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-60-6",
                    reference: "Psalm 60:6",
                    text: "God has spoken in His holiness:\n  \"I will exult, I will portion out Shechem and measure out the valley of Succoth.",
                    prayer: "Father, You speak with holiness and authority. Help me trust Your promises and remember that every place and every outcome belongs to You."
                ),
                PrayerVerse(
                    id: "psalm-60-7",
                    reference: "Psalm 60:7",
                    text: "Gilead is Mine, and Manasseh is Mine;\n  Ephraim also is the helmet of My head;\n  Judah is My scepter.",
                    prayer: "Lord, You reign over every tribe, nation, and people. Help me rest in Your sovereignty and follow Your leadership with confidence."
                ),
                PrayerVerse(
                    id: "psalm-60-8",
                    reference: "Psalm 60:8",
                    text: "Moab is My washbowl;\n  Over Edom I shall throw My shoe;\n  Shout loud, O Philistia, because of Me!\"",
                    prayer: "Father, every enemy and every obstacle is under Your authority. Help me remember that nothing is greater than Your power."
                ),
                PrayerVerse(
                    id: "psalm-60-9",
                    reference: "Psalm 60:9",
                    text: "Who will bring me into the besieged city?\n  Who will lead me to Edom?",
                    prayer: "Lord, when I face challenges that seem impossible, lead me forward and give me courage to depend on You."
                ),
                PrayerVerse(
                    id: "psalm-60-10",
                    reference: "Psalm 60:10",
                    text: "Have not You Yourself, O God, rejected us?\n  And will You not go forth with our armies, O God?",
                    prayer: "Father, even when I feel distant or uncertain, draw me back to Your presence and remind me that my hope is in You."
                ),
                PrayerVerse(
                    id: "psalm-60-11",
                    reference: "Psalm 60:11",
                    text: "O give us help against the adversary,\n  For deliverance by man is in vain.",
                    prayer: "Lord, give me help against trouble, because human strength is never enough. Teach me to rely on You completely."
                ),
                PrayerVerse(
                    id: "psalm-60-12",
                    reference: "Psalm 60:12",
                    text: "Through God we shall do valiantly,\n  And it is He who will tread down our adversaries.",
                    prayer: "Father, through You I can do valiantly. Thank You that true victory comes from Your strength, power, and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-60-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my help, my strength, and my victory. When life feels shaken or uncertain, restore my heart and lead me back to trust. Teach me to depend on Your power rather than human strength, and help me walk with courage under Your banner of truth. May my confidence always rest in Your faithfulness and sovereign care.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        )
    ]

    // MARK: - Psalms 61-75
    private static let psalms61to75: [PrayerDay] = [
        PrayerDay(
            dayNumber: 61,
            title: "Hear My Cry",
            chapterReference: "Psalm 61",
            summary: "Pray for refuge and security in God.",
            // JSON resource: psalm_61_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-61-1",
                    reference: "Psalm 61:1",
                    text: "Hear my cry, O God;\n  Give heed to my prayer.",
                    prayer: "Lord, hear my cry and listen to my prayer. Thank You that I can come to You honestly with every need, fear, and burden."
                ),
                PrayerVerse(
                    id: "psalm-61-2",
                    reference: "Psalm 61:2",
                    text: "From the end of the earth I call to You when my heart is faint;\n  Lead me to the rock that is higher than I.",
                    prayer: "Father, when my heart feels overwhelmed, lead me to the rock that is higher than I am. Lift my eyes above my circumstances and help me rest in Your strength."
                ),
                PrayerVerse(
                    id: "psalm-61-3",
                    reference: "Psalm 61:3",
                    text: "For You have been a refuge for me,\n  A tower of strength against the enemy.",
                    prayer: "Lord, thank You for being my refuge and strong tower. Protect me from fear, discouragement, and anything that rises against my faith."
                ),
                PrayerVerse(
                    id: "psalm-61-4",
                    reference: "Psalm 61:4",
                    text: "Let me dwell in Your tent forever;\n  Let me take refuge in the shelter of Your wings. Selah.",
                    prayer: "Father, help me dwell in Your presence and take refuge under the shelter of Your wings. Let my soul find safety, peace, and comfort in You."
                ),
                PrayerVerse(
                    id: "psalm-61-5",
                    reference: "Psalm 61:5",
                    text: "For You have heard my vows, O God;\n  You have given me the inheritance of those who fear Your name.",
                    prayer: "Lord, thank You for hearing my vows and knowing the devotion of my heart. Help me live faithfully as one who belongs to You."
                ),
                PrayerVerse(
                    id: "psalm-61-6",
                    reference: "Psalm 61:6",
                    text: "You will prolong the king's life;\n  His years will be as many generations.",
                    prayer: "Father, sustain my life and guide my days according to Your purpose. Help me walk with wisdom, gratitude, and trust."
                ),
                PrayerVerse(
                    id: "psalm-61-7",
                    reference: "Psalm 61:7",
                    text: "He will abide before God forever;\n  Appoint lovingkindness and truth that they may preserve him.",
                    prayer: "Lord, let my life remain before You in faithfulness. Surround me with Your lovingkindness and truth, and keep me close to You."
                ),
                PrayerVerse(
                    id: "psalm-61-8",
                    reference: "Psalm 61:8",
                    text: "So I will sing praise to Your name forever,\n  That I may pay my vows day by day.",
                    prayer: "Father, help me sing praise to Your name every day. Let my worship be faithful, sincere, and pleasing to You."
                ),
                PrayerVerse(
                    id: "psalm-61-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, my strong tower, and the rock higher than I am. When my heart is overwhelmed, lead me back to Your presence and shelter me under Your wings. Strengthen my faith, guide my days, and help me live with devotion, gratitude, and praise. May my life remain anchored in Your lovingkindness and truth.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 62,
            title: "My Soul Finds Rest",
            chapterReference: "Psalm 62",
            summary: "Pray for quiet trust in God alone.",
            // JSON resource: psalm_62_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-62-1",
                    reference: "Psalm 62:1",
                    text: "My soul waits in silence for God only;\n  From Him is my salvation.",
                    prayer: "Lord, help my soul wait in silence before You. Teach me to rest in Your presence and trust that my salvation comes from You alone."
                ),
                PrayerVerse(
                    id: "psalm-62-2",
                    reference: "Psalm 62:2",
                    text: "He only is my rock and my salvation,\n  My stronghold; I shall not be greatly shaken.",
                    prayer: "Father, You are my rock, my salvation, and my stronghold. Keep me steady and secure so I will not be greatly shaken."
                ),
                PrayerVerse(
                    id: "psalm-62-3",
                    reference: "Psalm 62:3",
                    text: "How long will you assail a man,\n  That you may murder him, all of you,\n  Like a leaning wall, like a tottering fence?",
                    prayer: "Lord, when pressure, opposition, or discouragement comes against me, strengthen my heart and help me remain firm in You."
                ),
                PrayerVerse(
                    id: "psalm-62-4",
                    reference: "Psalm 62:4",
                    text: "They have counseled only to thrust him down from his high position;\n  They delight in falsehood;\n  They bless with their mouth,\n  But inwardly they curse. Selah.",
                    prayer: "Father, protect me from deception, false words, and hidden motives. Help me walk in truth and discernment."
                ),
                PrayerVerse(
                    id: "psalm-62-5",
                    reference: "Psalm 62:5",
                    text: "My soul, wait in silence for God only,\n  For my hope is from Him.",
                    prayer: "Lord, teach my soul to wait quietly for You, because my hope comes from You alone."
                ),
                PrayerVerse(
                    id: "psalm-62-6",
                    reference: "Psalm 62:6",
                    text: "He only is my rock and my salvation,\n  My stronghold; I shall not be shaken.",
                    prayer: "Father, You are my rock, my salvation, and my stronghold. Help me trust You completely and remain unshaken in faith."
                ),
                PrayerVerse(
                    id: "psalm-62-7",
                    reference: "Psalm 62:7",
                    text: "On God my salvation and my glory rest;\n  The rock of my strength, my refuge is in God.",
                    prayer: "Lord, my salvation and glory rest in You. Thank You for being the rock of my strength and my refuge."
                ),
                PrayerVerse(
                    id: "psalm-62-8",
                    reference: "Psalm 62:8",
                    text: "Trust in Him at all times, O people;\n  Pour out your heart before Him;\n  God is a refuge for us. Selah.",
                    prayer: "Father, help me trust in You at all times and pour out my heart before You. Thank You for being a refuge for Your people."
                ),
                PrayerVerse(
                    id: "psalm-62-9",
                    reference: "Psalm 62:9",
                    text: "Men of low degree are only vanity and men of rank are a lie;\n  In the balances they go up;\n  They are together lighter than breath.",
                    prayer: "Lord, remind me that human status, strength, and approval are temporary. Keep my heart anchored in what is eternal."
                ),
                PrayerVerse(
                    id: "psalm-62-10",
                    reference: "Psalm 62:10",
                    text: "Do not trust in oppression\n  And do not vainly hope in robbery;\n  If riches increase, do not set your heart upon them.",
                    prayer: "Father, keep me from trusting in dishonest gain, power, or possessions. Help me place my confidence in You alone."
                ),
                PrayerVerse(
                    id: "psalm-62-11",
                    reference: "Psalm 62:11",
                    text: "Once God has spoken;\n  Twice I have heard this:\n  That power belongs to God;",
                    prayer: "Lord, You have spoken with power and authority. Help me remember that all strength belongs to You."
                ),
                PrayerVerse(
                    id: "psalm-62-12",
                    reference: "Psalm 62:12",
                    text: "And lovingkindness is Yours, O Lord,\n  For You recompense a man according to his work.",
                    prayer: "Father, thank You for Your lovingkindness and justice. Help me live faithfully, knowing that You see every heart and every action."
                ),
                PrayerVerse(
                    id: "psalm-62-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my rock, my salvation, my refuge, and my strength. Teach my soul to wait quietly before You and to place my hope in You alone. Keep me from trusting in temporary things, and help me pour out my heart before You with honesty and faith. May my life remain steady, secure, and rooted in Your lovingkindness and power.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 63,
            title: "You Are My God",
            chapterReference: "Psalm 63",
            summary: "Pray for earnest seeking after God.",
            // JSON resource: psalm_63_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-63-1",
                    reference: "Psalm 63:1",
                    text: "O God, You are my God; I shall seek You earnestly;\n  My soul thirsts for You, my flesh yearns for You,\n  In a dry and weary land where there is no water.",
                    prayer: "Lord, You are my God, and I seek You earnestly. Let my soul thirst for You and my heart long for Your presence above everything else."
                ),
                PrayerVerse(
                    id: "psalm-63-2",
                    reference: "Psalm 63:2",
                    text: "Thus I have seen You in the sanctuary,\n  To see Your power and Your glory.",
                    prayer: "Father, help me behold Your power and glory. Open my eyes to recognize Your presence and worship You with awe."
                ),
                PrayerVerse(
                    id: "psalm-63-3",
                    reference: "Psalm 63:3",
                    text: "Because Your lovingkindness is better than life,\n  My lips will praise You.",
                    prayer: "Lord, Your lovingkindness is better than life. Let my lips praise You with gratitude, joy, and devotion."
                ),
                PrayerVerse(
                    id: "psalm-63-4",
                    reference: "Psalm 63:4",
                    text: "So I will bless You as long as I live;\n  I will lift up my hands in Your name.",
                    prayer: "Father, help me bless You as long as I live. Teach me to lift my hands and my heart in worship to Your name."
                ),
                PrayerVerse(
                    id: "psalm-63-5",
                    reference: "Psalm 63:5",
                    text: "My soul is satisfied as with marrow and fatness,\n  And my mouth offers praises with joyful lips.",
                    prayer: "Lord, satisfy my soul with Your goodness. Fill my heart with joy so that my mouth praises You with gladness."
                ),
                PrayerVerse(
                    id: "psalm-63-6",
                    reference: "Psalm 63:6",
                    text: "When I remember You on my bed,\n  I meditate on You in the night watches,",
                    prayer: "Father, when I remember You in the quiet moments, draw my thoughts toward Your faithfulness and peace."
                ),
                PrayerVerse(
                    id: "psalm-63-7",
                    reference: "Psalm 63:7",
                    text: "For You have been my help,\n  And in the shadow of Your wings I sing for joy.",
                    prayer: "Lord, thank You for being my help. Let me rejoice under the shadow of Your wings, safe in Your protection and love."
                ),
                PrayerVerse(
                    id: "psalm-63-8",
                    reference: "Psalm 63:8",
                    text: "My soul clings to You;\n  Your right hand upholds me.",
                    prayer: "Father, help my soul cling to You. Uphold me by Your right hand and keep me steady in faith."
                ),
                PrayerVerse(
                    id: "psalm-63-9",
                    reference: "Psalm 63:9",
                    text: "But those who seek my life to destroy it,\n  Will go into the depths of the earth.",
                    prayer: "Lord, protect me from anything that seeks to harm my soul or pull me away from Your truth."
                ),
                PrayerVerse(
                    id: "psalm-63-10",
                    reference: "Psalm 63:10",
                    text: "They will be delivered over to the power of the sword;\n  They will be a prey for foxes.",
                    prayer: "Father, remind me that evil cannot overcome Your justice. Help me trust that every outcome rests in Your hands."
                ),
                PrayerVerse(
                    id: "psalm-63-11",
                    reference: "Psalm 63:11",
                    text: "But the king will rejoice in God;\n  Everyone who swears by Him will glory,\n  For the mouths of those who speak lies will be stopped.",
                    prayer: "Lord, let my joy be found in You. Keep my heart faithful, truthful, and confident in Your righteousness."
                ),
                PrayerVerse(
                    id: "psalm-63-closing",
                    reference: "Closing",
                    text: "Lord, thank You for satisfying my soul with Your presence, love, and faithfulness. Teach me to seek You earnestly, praise You joyfully, and cling to You through every season. When my heart feels dry or weary, refresh me with Your goodness and uphold me by Your strength. May my life continually worship You and find its deepest joy in Your unfailing love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 64,
            title: "Protect Me from the Wicked",
            chapterReference: "Psalm 64",
            summary: "Pray for God's shield against evil.",
            // JSON resource: psalm_64_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-64-1",
                    reference: "Psalm 64:1",
                    text: "Hear my voice, O God, in my complaint;\n  Preserve my life from dread of the enemy.",
                    prayer: "Lord, hear my voice when I bring my concerns before You. Preserve my life from fear and help me trust in Your protection."
                ),
                PrayerVerse(
                    id: "psalm-64-2",
                    reference: "Psalm 64:2",
                    text: "Hide me from the secret counsel of evildoers,\n  From the tumult of those who do iniquity,",
                    prayer: "Father, hide me from harmful plans and protect me from anything that rises against my peace, faith, or obedience to You."
                ),
                PrayerVerse(
                    id: "psalm-64-3",
                    reference: "Psalm 64:3",
                    text: "Who have sharpened their tongue like a sword.\n  They aimed bitter speech as their arrow,",
                    prayer: "Lord, guard me from words that wound and accusations that discourage. Help me respond with wisdom, grace, and truth."
                ),
                PrayerVerse(
                    id: "psalm-64-4",
                    reference: "Psalm 64:4",
                    text: "To shoot from concealment at the blameless;\n  Suddenly they shoot at him, and do not fear.",
                    prayer: "Father, protect me from hidden attacks and unseen dangers. Keep my heart steady and confident in Your care."
                ),
                PrayerVerse(
                    id: "psalm-64-5",
                    reference: "Psalm 64:5",
                    text: "They hold fast to themselves an evil purpose;\n  They talk of laying snares secretly;\n  They say, \"Who can see them?\"",
                    prayer: "Lord, when evil seems bold or hidden plans seem strong, remind me that You see everything and remain perfectly just."
                ),
                PrayerVerse(
                    id: "psalm-64-6",
                    reference: "Psalm 64:6",
                    text: "They devise injustices, saying,\n  \"We are ready with a well-conceived plot\";\n  For the inward thought and the heart of a man are deep.",
                    prayer: "Father, You know the depths of every heart. Search me, purify me, and keep my motives aligned with Your truth."
                ),
                PrayerVerse(
                    id: "psalm-64-7",
                    reference: "Psalm 64:7",
                    text: "But God will shoot at them with an arrow;\n  Suddenly they will be wounded.",
                    prayer: "Lord, defend me with Your power and bring justice according to Your perfect wisdom and timing."
                ),
                PrayerVerse(
                    id: "psalm-64-8",
                    reference: "Psalm 64:8",
                    text: "So they will make him stumble;\n  Their own tongue is against them;\n  All who see them will shake the head.",
                    prayer: "Father, let falsehood and harmful words lose their power. Help truth, humility, and righteousness prevail."
                ),
                PrayerVerse(
                    id: "psalm-64-9",
                    reference: "Psalm 64:9",
                    text: "Then all men will fear,\n  And they will declare the work of God,\n  And will consider what He has done.",
                    prayer: "Lord, let my life lead others to recognize Your works and stand in awe of Your justice, wisdom, and power."
                ),
                PrayerVerse(
                    id: "psalm-64-10",
                    reference: "Psalm 64:10",
                    text: "The righteous man will be glad in the Lord and will take refuge in Him;\n  And all the upright in heart will glory.",
                    prayer: "Father, help me rejoice in You and take refuge in Your presence. Let my heart remain upright, thankful, and confident in Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-64-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, defender, and righteous Judge. Protect me from fear, harmful words, and hidden dangers. Search my heart, strengthen my faith, and help me walk in truth and integrity. May my life rejoice in Your protection and point others toward Your wisdom, justice, and unfailing love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 65,
            title: "Praise Awaits You",
            chapterReference: "Psalm 65",
            summary: "Pray in gratitude for God's provision.",
            // JSON resource: psalm_65_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-65-1",
                    reference: "Psalm 65:1",
                    text: "There will be silence before You, and praise in Zion, O God,\n  And to You the vow will be performed.",
                    prayer: "Lord, praise belongs to You. Help my heart remain faithful in worship, gratitude, and devotion to Your name."
                ),
                PrayerVerse(
                    id: "psalm-65-2",
                    reference: "Psalm 65:2",
                    text: "O You who hear prayer,\n  To You all men come.",
                    prayer: "Father, thank You for hearing prayer. Draw all people closer to You and teach me to bring every need before You."
                ),
                PrayerVerse(
                    id: "psalm-65-3",
                    reference: "Psalm 65:3",
                    text: "Iniquities prevail against me;\n  As for our transgressions, You forgive them.",
                    prayer: "Lord, when sin and weakness feel overwhelming, thank You for providing forgiveness, mercy, and atonement."
                ),
                PrayerVerse(
                    id: "psalm-65-4",
                    reference: "Psalm 65:4",
                    text: "How blessed is the one whom You choose and bring near to You\n  To dwell in Your courts.\n  We will be satisfied with the goodness of Your house,\n  Your holy temple.",
                    prayer: "Father, thank You for the blessing of drawing near to You. Satisfy my soul with the goodness of Your presence."
                ),
                PrayerVerse(
                    id: "psalm-65-5",
                    reference: "Psalm 65:5",
                    text: "By awesome deeds You answer us in righteousness, O God of our salvation,\n  You who are the trust of all the ends of the earth and of the farthest sea;",
                    prayer: "Lord, answer me with righteousness and saving power. Help me trust You as the hope of all the earth."
                ),
                PrayerVerse(
                    id: "psalm-65-6",
                    reference: "Psalm 65:6",
                    text: "Who establishes the mountains by His strength,\n  Being girded with might;",
                    prayer: "Father, You establish the mountains by Your strength. Remind me that Your power is greater than anything I face."
                ),
                PrayerVerse(
                    id: "psalm-65-7",
                    reference: "Psalm 65:7",
                    text: "Who stills the roaring of the seas,\n  The roaring of their waves,\n  And the tumult of the peoples.",
                    prayer: "Lord, You quiet the roaring seas and the noise of nations. Calm every storm within me and teach me to rest in Your authority."
                ),
                PrayerVerse(
                    id: "psalm-65-8",
                    reference: "Psalm 65:8",
                    text: "They who dwell in the ends of the earth stand in awe of Your signs;\n  You make the dawn and the sunset shout for joy.",
                    prayer: "Father, let my heart stand in awe of Your works. Fill my days with joy as I recognize Your presence from morning to evening."
                ),
                PrayerVerse(
                    id: "psalm-65-9",
                    reference: "Psalm 65:9",
                    text: "You visit the earth and cause it to overflow;\n  You greatly enrich it;\n  The stream of God is full of water;\n  You prepare their grain, for thus You prepare the earth.",
                    prayer: "Lord, thank You for caring for the earth and providing abundantly. Teach me to recognize Your hand in every blessing."
                ),
                PrayerVerse(
                    id: "psalm-65-10",
                    reference: "Psalm 65:10",
                    text: "You water its furrows abundantly,\n  You settle its ridges,\n  You soften it with showers,\n  You bless its growth.",
                    prayer: "Father, prepare and nourish what You have planted in my life. Let growth come through Your grace and faithful provision."
                ),
                PrayerVerse(
                    id: "psalm-65-11",
                    reference: "Psalm 65:11",
                    text: "You have crowned the year with Your bounty,\n  And Your paths drip with fatness.",
                    prayer: "Lord, crown my days with Your goodness. Let every season of my life overflow with gratitude for Your abundance."
                ),
                PrayerVerse(
                    id: "psalm-65-12",
                    reference: "Psalm 65:12",
                    text: "The pastures of the wilderness drip,\n  And the hills gird themselves with rejoicing.",
                    prayer: "Father, let even the quiet places of my life be filled with Your blessing, peace, and joy."
                ),
                PrayerVerse(
                    id: "psalm-65-13",
                    reference: "Psalm 65:13",
                    text: "The meadows are clothed with flocks\n  And the valleys are covered with grain;\n  They shout for joy, yes, they sing.",
                    prayer: "Lord, let all creation remind me to worship You. May my life also shout for joy and sing praise to Your name."
                ),
                PrayerVerse(
                    id: "psalm-65-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing prayer, forgiving sin, and filling the earth with Your goodness. Help me draw near to You with gratitude and awe. Calm every storm within me, nourish what You have planted in my life, and crown my days with Your faithful provision. May my heart continually worship You and rejoice in Your abundant love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 66,
            title: "Shout for Joy",
            chapterReference: "Psalm 66",
            summary: "Pray in celebration of God's awesome deeds.",
            // JSON resource: psalm_66_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-66-1",
                    reference: "Psalm 66:1",
                    text: "Shout joyfully to God, all the earth;",
                    prayer: "Lord, let my heart shout joyfully to You. Help my life reflect praise, gratitude, and worship for Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-66-2",
                    reference: "Psalm 66:2",
                    text: "Sing the glory of His name;\n  Make His praise glorious.",
                    prayer: "Father, help me sing the glory of Your name and give You the honor You deserve in every season."
                ),
                PrayerVerse(
                    id: "psalm-66-3",
                    reference: "Psalm 66:3",
                    text: "Say to God, \"How awesome are Your works!\n  Because of the greatness of Your power Your enemies will give feigned obedience to You.",
                    prayer: "Lord, Your works are awesome and powerful. Help me stand in awe of Your greatness and trust Your authority."
                ),
                PrayerVerse(
                    id: "psalm-66-4",
                    reference: "Psalm 66:4",
                    text: "All the earth will worship You,\n  And will sing praises to You;\n  They will sing praises to Your name.\" Selah.",
                    prayer: "Father, may all the earth worship You and sing praises to Your name. Let my life join creation in honoring You."
                ),
                PrayerVerse(
                    id: "psalm-66-5",
                    reference: "Psalm 66:5",
                    text: "Come and see the works of God,\n  Who is awesome in His deeds toward the sons of men.",
                    prayer: "Lord, open my eyes to see Your wonderful works. Help me remember Your faithfulness and recognize Your hand in my life."
                ),
                PrayerVerse(
                    id: "psalm-66-6",
                    reference: "Psalm 66:6",
                    text: "He turned the sea into dry land;\n  They passed through the river on foot;\n  There let us rejoice in Him!",
                    prayer: "Father, thank You for making a way where there seemed to be no way. Help me rejoice in Your deliverance."
                ),
                PrayerVerse(
                    id: "psalm-66-7",
                    reference: "Psalm 66:7",
                    text: "He rules by His might forever;\n  His eyes keep watch on the nations;\n  Let not the rebellious exalt themselves. Selah.",
                    prayer: "Lord, You rule forever by Your power. Keep my heart humble and help me trust Your sovereign authority."
                ),
                PrayerVerse(
                    id: "psalm-66-8",
                    reference: "Psalm 66:8",
                    text: "Bless our God, O peoples,\n  And sound His praise abroad,",
                    prayer: "Father, help me bless You openly and let the sound of praise be heard from my life."
                ),
                PrayerVerse(
                    id: "psalm-66-9",
                    reference: "Psalm 66:9",
                    text: "Who keeps us in life\n  And does not allow our feet to slip.",
                    prayer: "Lord, thank You for preserving my life and keeping my steps secure. Help me walk faithfully in Your care."
                ),
                PrayerVerse(
                    id: "psalm-66-10",
                    reference: "Psalm 66:10",
                    text: "For You have tried us, O God;\n  You have refined us as silver is refined.",
                    prayer: "Father, when You test and refine me, help me trust that You are shaping my faith for Your purpose."
                ),
                PrayerVerse(
                    id: "psalm-66-11",
                    reference: "Psalm 66:11",
                    text: "You brought us into the net;\n  You laid an oppressive burden upon our loins.",
                    prayer: "Lord, when I go through burdens or difficult seasons, strengthen me and keep my heart anchored in You."
                ),
                PrayerVerse(
                    id: "psalm-66-12",
                    reference: "Psalm 66:12",
                    text: "You made men ride over our heads;\n  We went through fire and through water,\n  Yet You brought us out into a place of abundance.",
                    prayer: "Father, thank You for bringing me through trials into a place of abundance, peace, and renewed hope."
                ),
                PrayerVerse(
                    id: "psalm-66-13",
                    reference: "Psalm 66:13",
                    text: "I shall come into Your house with burnt offerings;\n  I shall pay You my vows,",
                    prayer: "Lord, help me come before You with sincere worship and a faithful heart."
                ),
                PrayerVerse(
                    id: "psalm-66-14",
                    reference: "Psalm 66:14",
                    text: "Which my lips uttered\n  And my mouth spoke when I was in distress.",
                    prayer: "Father, help me honor the commitments I make to You and live with integrity before Your presence."
                ),
                PrayerVerse(
                    id: "psalm-66-15",
                    reference: "Psalm 66:15",
                    text: "I shall offer to You burnt offerings of fat beasts,\n  With the smoke of rams;\n  I shall make an offering of bulls with male goats. Selah.",
                    prayer: "Lord, let my worship be pleasing to You. May everything I offer come from a grateful and surrendered heart."
                ),
                PrayerVerse(
                    id: "psalm-66-16",
                    reference: "Psalm 66:16",
                    text: "Come and hear, all who fear God,\n  And I will tell of what He has done for my soul.",
                    prayer: "Father, help me tell others what You have done for my soul. Give me courage to share Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-66-17",
                    reference: "Psalm 66:17",
                    text: "I cried to Him with my mouth,\n  And He was extolled with my tongue.",
                    prayer: "Lord, let praise be on my tongue when I cry out to You. Help my prayers be filled with faith and gratitude."
                ),
                PrayerVerse(
                    id: "psalm-66-18",
                    reference: "Psalm 66:18",
                    text: "If I regard wickedness in my heart,\n  The Lord will not hear;",
                    prayer: "Father, search my heart and remove anything that would hinder my fellowship with You."
                ),
                PrayerVerse(
                    id: "psalm-66-19",
                    reference: "Psalm 66:19",
                    text: "But certainly God has heard;\n  He has given heed to the voice of my prayer.",
                    prayer: "Lord, thank You for hearing my prayer and listening to my voice. Strengthen my confidence in Your faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-66-20",
                    reference: "Psalm 66:20",
                    text: "Blessed be God,\n  Who has not turned away my prayer\n  Nor His lovingkindness from me.",
                    prayer: "Father, blessed be Your name. Thank You for not turning away my prayer or removing Your lovingkindness from me."
                ),
                PrayerVerse(
                    id: "psalm-66-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your awesome works, faithful deliverance, and unfailing love. Help me praise You with joy, trust You through refining seasons, and share Your goodness with others. Keep my heart pure before You, my steps secure in Your care, and my worship sincere. May my life continually bless Your name and testify to all You have done.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 67,
            title: "May God Be Gracious",
            chapterReference: "Psalm 67",
            summary: "Pray for God's blessing and salvation for all.",
            // JSON resource: psalm_67_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-67-1",
                    reference: "Psalm 67:1",
                    text: "God be gracious to us and bless us,\n  And cause His face to shine upon us— Selah.",
                    prayer: "Lord, be gracious to me and bless me. Let Your face shine upon my life so that I may walk in Your favor, peace, and presence."
                ),
                PrayerVerse(
                    id: "psalm-67-2",
                    reference: "Psalm 67:2",
                    text: "That Your way may be known on the earth,\n  Your salvation among all nations.",
                    prayer: "Father, make Your way known through my life. Help me reflect Your salvation, goodness, and truth to the people around me."
                ),
                PrayerVerse(
                    id: "psalm-67-3",
                    reference: "Psalm 67:3",
                    text: "Let the peoples praise You, O God;\n  Let all the peoples praise You.",
                    prayer: "Lord, may all people praise You. Let my heart join in worship and gratitude for who You are and all You have done."
                ),
                PrayerVerse(
                    id: "psalm-67-4",
                    reference: "Psalm 67:4",
                    text: "Let the nations be glad and sing for joy;\n  For You will judge the peoples with uprightness\n  And guide the nations on the earth. Selah.",
                    prayer: "Father, let the nations rejoice because You judge with fairness and guide the people of the earth. Help me trust Your righteous rule."
                ),
                PrayerVerse(
                    id: "psalm-67-5",
                    reference: "Psalm 67:5",
                    text: "Let the peoples praise You, O God;\n  Let all the peoples praise You.",
                    prayer: "Lord, may every people and every nation praise You. Let my life continually honor Your name with worship and thanksgiving."
                ),
                PrayerVerse(
                    id: "psalm-67-6",
                    reference: "Psalm 67:6",
                    text: "The earth has yielded its produce;\n  God, our God, blesses us.",
                    prayer: "Father, thank You for Your provision and blessing. Help me recognize every good gift as coming from Your hand."
                ),
                PrayerVerse(
                    id: "psalm-67-7",
                    reference: "Psalm 67:7",
                    text: "God blesses us,\n  That all the ends of the earth may fear Him.",
                    prayer: "Lord, bless us so that all the ends of the earth may fear and honor You. Use my life to point others toward Your greatness and grace."
                ),
                PrayerVerse(
                    id: "psalm-67-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your grace, blessing, and salvation. Let Your face shine upon my life and make Your ways known through me. Help me worship You with gratitude, trust Your righteous rule, and reflect Your goodness to others. May my life point people toward Your love, Your truth, and Your glory.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 68,
            title: "Let God Arise",
            chapterReference: "Psalm 68",
            summary: "Pray in worship of God's mighty power.",
            // JSON resource: psalm_68_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-68-1",
                    reference: "Psalm 68:1",
                    text: "Let God arise, let His enemies be scattered,\n  And let those who hate Him flee before Him.",
                    prayer: "Lord, rise up in power and scatter everything that opposes Your truth, Your goodness, and Your will in my life."
                ),
                PrayerVerse(
                    id: "psalm-68-2",
                    reference: "Psalm 68:2",
                    text: "As smoke is driven away, so drive them away;\n  As wax melts before the fire,\n  So let the wicked perish before God.",
                    prayer: "Father, remove what is evil, false, and harmful. Let Your righteousness prevail and purify my heart before You."
                ),
                PrayerVerse(
                    id: "psalm-68-3",
                    reference: "Psalm 68:3",
                    text: "But let the righteous be glad; let them exult before God;\n  Yes, let them rejoice with gladness.",
                    prayer: "Lord, help me rejoice in Your presence. Fill my heart with gladness because You are faithful, righteous, and good."
                ),
                PrayerVerse(
                    id: "psalm-68-4",
                    reference: "Psalm 68:4",
                    text: "Sing to God, sing praises to His name;\n  Lift up a song for Him who rides through the deserts,\n  Whose name is the Lord, and exult before Him.",
                    prayer: "Father, teach me to sing praises to Your name. Help me worship You with joy and honor You as the One who reigns above all."
                ),
                PrayerVerse(
                    id: "psalm-68-5",
                    reference: "Psalm 68:5",
                    text: "A father of the fatherless and a judge for the widows,\n  Is God in His holy habitation.",
                    prayer: "Lord, thank You for being a Father to the fatherless and a defender of the vulnerable. Help me reflect Your compassion and care."
                ),
                PrayerVerse(
                    id: "psalm-68-6",
                    reference: "Psalm 68:6",
                    text: "God makes a home for the lonely;\n  He leads out the prisoners into prosperity,\n  Only the rebellious dwell in a parched land.",
                    prayer: "Father, thank You for placing the lonely in families and bringing freedom to those who are bound. Use my life to bring encouragement and hope."
                ),
                PrayerVerse(
                    id: "psalm-68-7",
                    reference: "Psalm 68:7",
                    text: "O God, when You went forth before Your people,\n  When You marched through the wilderness, Selah.",
                    prayer: "Lord, thank You for leading Your people through every wilderness. Lead me faithfully through every season of uncertainty."
                ),
                PrayerVerse(
                    id: "psalm-68-8",
                    reference: "Psalm 68:8",
                    text: "The earth quaked;\n  The heavens also dropped rain at the presence of God;\n  Sinai itself quaked at the presence of God, the God of Israel.",
                    prayer: "Father, creation trembles before Your presence. Help me live with reverence, awe, and confidence in Your power."
                ),
                PrayerVerse(
                    id: "psalm-68-9",
                    reference: "Psalm 68:9",
                    text: "You shed abroad a plentiful rain, O God;\n  You confirmed Your inheritance when it was parched.",
                    prayer: "Lord, thank You for sending abundant rain and refreshing what is weary. Restore my soul when I feel dry or weak."
                ),
                PrayerVerse(
                    id: "psalm-68-10",
                    reference: "Psalm 68:10",
                    text: "Your creatures settled in it;\n  You provided in Your goodness for the poor, O God.",
                    prayer: "Father, thank You for providing for Your people. Help me trust Your care and recognize Your goodness in every blessing."
                ),
                PrayerVerse(
                    id: "psalm-68-11",
                    reference: "Psalm 68:11",
                    text: "The Lord gives the command;\n  The women who proclaim the good tidings are a great host:",
                    prayer: "Lord, let Your Word go forth with power. Help me receive Your truth and share Your goodness with faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-68-12",
                    reference: "Psalm 68:12",
                    text: "“Kings of armies flee, they flee,\n  And she who remains at home will divide the spoil!”",
                    prayer: "Father, thank You for giving victory that does not depend on human strength. Help me trust in Your power and provision."
                ),
                PrayerVerse(
                    id: "psalm-68-13",
                    reference: "Psalm 68:13",
                    text: "When you lie down among the sheepfolds,\n  You are like the wings of a dove covered with silver,\n  And its pinions with glistening gold.",
                    prayer: "Lord, even in ordinary places, You reveal beauty and blessing. Help me see Your grace in every part of my life."
                ),
                PrayerVerse(
                    id: "psalm-68-14",
                    reference: "Psalm 68:14",
                    text: "When the Almighty scattered the kings there,\n  It was snowing in Zalmon.",
                    prayer: "Father, You scatter darkness and bring light. Let Your victory shine over every place of fear, confusion, or discouragement."
                ),
                PrayerVerse(
                    id: "psalm-68-15",
                    reference: "Psalm 68:15",
                    text: "A mountain of God is the mountain of Bashan;\n  A mountain of many peaks is the mountain of Bashan.",
                    prayer: "Lord, Your mountain is majestic and strong. Help me remember that Your kingdom is greater than every earthly power."
                ),
                PrayerVerse(
                    id: "psalm-68-16",
                    reference: "Psalm 68:16",
                    text: "Why do you look with envy, O mountains with many peaks,\n  At the mountain which God has desired for His abode?\n  Surely the Lord will dwell there forever.",
                    prayer: "Father, thank You for choosing to dwell with Your people. Make my heart a place where Your presence is welcomed and honored."
                ),
                PrayerVerse(
                    id: "psalm-68-17",
                    reference: "Psalm 68:17",
                    text: "The chariots of God are myriads, thousands upon thousands;\n  The Lord is among them as at Sinai, in holiness.",
                    prayer: "Lord, You are surrounded by heavenly power and glory. Help me trust that You are never lacking strength, authority, or help."
                ),
                PrayerVerse(
                    id: "psalm-68-18",
                    reference: "Psalm 68:18",
                    text: "You have ascended on high, You have led captive Your captives;\n  You have received gifts among men,\n  Even among the rebellious also, that the Lord God may dwell there.",
                    prayer: "Father, thank You for the victory and gifts You give. Help me use every blessing to honor You and serve others."
                ),
                PrayerVerse(
                    id: "psalm-68-19",
                    reference: "Psalm 68:19",
                    text: "Blessed be the Lord, who daily bears our burden,\n  The God who is our salvation. Selah.",
                    prayer: "Lord, blessed be Your name. Thank You for daily bearing my burdens and sustaining me with Your grace."
                ),
                PrayerVerse(
                    id: "psalm-68-20",
                    reference: "Psalm 68:20",
                    text: "God is to us a God of deliverances;\n  And to God the Lord belong escapes from death.",
                    prayer: "Father, You are the God of salvation and deliverance. Help me trust You with my life, my future, and every burden I carry."
                ),
                PrayerVerse(
                    id: "psalm-68-21",
                    reference: "Psalm 68:21",
                    text: "Surely God will shatter the head of His enemies,\n  The hairy crown of him who goes on in his guilty deeds.",
                    prayer: "Lord, defeat the power of sin and anything that rebels against Your truth in my heart. Lead me in righteousness."
                ),
                PrayerVerse(
                    id: "psalm-68-22",
                    reference: "Psalm 68:22",
                    text: "The Lord said, “I will bring them back from Bashan.\n  I will bring them back from the depths of the sea;",
                    prayer: "Father, no place is beyond Your reach. Thank You that You can rescue, restore, and bring back what seems lost."
                ),
                PrayerVerse(
                    id: "psalm-68-23",
                    reference: "Psalm 68:23",
                    text: "That your foot may shatter them in blood,\n  The tongue of your dogs may have its portion from your enemies.”",
                    prayer: "Lord, establish Your justice and protect Your people. Help me trust Your righteous judgment in all things."
                ),
                PrayerVerse(
                    id: "psalm-68-24",
                    reference: "Psalm 68:24",
                    text: "They have seen Your procession, O God,\n  The procession of my God, my King, into the sanctuary.",
                    prayer: "Father, help me recognize Your procession and movement in my life. Let me follow where You lead with worship and faith."
                ),
                PrayerVerse(
                    id: "psalm-68-25",
                    reference: "Psalm 68:25",
                    text: "The singers went on, the musicians after them,\n  In the midst of the maidens beating tambourines.",
                    prayer: "Lord, let my life be filled with praise, worship, and joyful gratitude before You."
                ),
                PrayerVerse(
                    id: "psalm-68-26",
                    reference: "Psalm 68:26",
                    text: "Bless God in the congregations,\n  Even the Lord, you who are of the fountain of Israel.",
                    prayer: "Father, help me bless You among Your people and honor You with a sincere and faithful heart."
                ),
                PrayerVerse(
                    id: "psalm-68-27",
                    reference: "Psalm 68:27",
                    text: "There is Benjamin, the youngest, ruling them,\n  The princes of Judah in their throng,\n  The princes of Zebulun, the princes of Naphtali.",
                    prayer: "Lord, thank You for calling every person and every generation into Your purposes. Help me serve faithfully where You place me."
                ),
                PrayerVerse(
                    id: "psalm-68-28",
                    reference: "Psalm 68:28",
                    text: "Your God has commanded your strength;\n  Show Yourself strong, O God, who have acted on our behalf.",
                    prayer: "Father, strengthen what You have worked in me. Confirm Your purposes and help me walk in Your power."
                ),
                PrayerVerse(
                    id: "psalm-68-29",
                    reference: "Psalm 68:29",
                    text: "Because of Your temple at Jerusalem\n  Kings will bring gifts to You.",
                    prayer: "Lord, may my life bring offerings of praise and devotion to You, the King who is worthy of all honor."
                ),
                PrayerVerse(
                    id: "psalm-68-30",
                    reference: "Psalm 68:30",
                    text: "Rebuke the beasts in the reeds,\n  The herd of bulls with the calves of the peoples,\n  Trampling under foot the pieces of silver;\n  He has scattered the peoples who delight in war.",
                    prayer: "Father, restrain evil and humble every proud power. Let peace, justice, and righteousness increase."
                ),
                PrayerVerse(
                    id: "psalm-68-31",
                    reference: "Psalm 68:31",
                    text: "Envoys will come out of Egypt;\n  Ethiopia will quickly stretch out her hands to God.",
                    prayer: "Lord, draw people from every nation toward You. Let hearts everywhere lift their hands in worship and surrender."
                ),
                PrayerVerse(
                    id: "psalm-68-32",
                    reference: "Psalm 68:32",
                    text: "Sing to God, O kingdoms of the earth,\n  Sing praises to the Lord, Selah.",
                    prayer: "Father, may all kingdoms of the earth sing praises to You. Help my life join that song with joy and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-68-33",
                    reference: "Psalm 68:33",
                    text: "To Him who rides upon the highest heavens, which are from ancient times;\n  Behold, He speaks forth with His voice, a mighty voice.",
                    prayer: "Lord, You ride upon the highest heavens and speak with mighty power. Help me listen with reverence and trust."
                ),
                PrayerVerse(
                    id: "psalm-68-34",
                    reference: "Psalm 68:34",
                    text: "Ascribe strength to God;\n  His majesty is over Israel\n  And His strength is in the skies.",
                    prayer: "Father, all strength belongs to You. Help me depend on Your power and give You glory for every victory."
                ),
                PrayerVerse(
                    id: "psalm-68-35",
                    reference: "Psalm 68:35",
                    text: "O God, You are awesome from Your sanctuary.\n  The God of Israel Himself gives strength and power to the people.\n  Blessed be God!",
                    prayer: "Lord, You are awesome from Your sanctuary and You give strength to Your people. Thank You for being my source of power, help, and hope."
                ),
                PrayerVerse(
                    id: "psalm-68-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being mighty, compassionate, and faithful. You carry my burdens, provide for my needs, defend the vulnerable, and give strength to Your people. Help me walk in worship, trust Your power, and live under Your righteous rule. May my life continually praise You, reflect Your compassion, and declare Your glory to the world.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 69,
            title: "Save Me, O God",
            chapterReference: "Psalm 69",
            summary: "Pray for deliverance in overwhelming distress.",
            // JSON resource: psalm_69_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-69-1",
                    reference: "Psalm 69:1",
                    text: "Save me, O God,\n  For the waters have threatened my life.",
                    prayer: "Lord, save me when I feel overwhelmed and surrounded by trouble. Lift me above the waters and keep my heart anchored in You."
                ),
                PrayerVerse(
                    id: "psalm-69-2",
                    reference: "Psalm 69:2",
                    text: "I have sunk in deep mire, and there is no foothold;\n  I have come into deep waters, and a flood overflows me.",
                    prayer: "Father, when I feel stuck in deep places and unable to stand, place my feet on solid ground and strengthen my faith."
                ),
                PrayerVerse(
                    id: "psalm-69-3",
                    reference: "Psalm 69:3",
                    text: "I am weary with my crying; my throat is parched;\n  My eyes fail while I wait for my God.",
                    prayer: "Lord, when I grow weary from crying out and waiting, renew my strength and remind me that You hear me."
                ),
                PrayerVerse(
                    id: "psalm-69-4",
                    reference: "Psalm 69:4",
                    text: "Those who hate me without a cause are more than the hairs of my head;\n  Those who would destroy me are powerful, being wrongfully my enemies;\n  What I did not steal, I then have to restore.",
                    prayer: "Father, when I face opposition I do not understand, help me respond with faith, patience, and trust in Your justice."
                ),
                PrayerVerse(
                    id: "psalm-69-5",
                    reference: "Psalm 69:5",
                    text: "O God, it is You who knows my folly,\n  And my wrongs are not hidden from You.",
                    prayer: "Lord, You know my foolishness and every hidden weakness. Search me, forgive me, and lead me into wisdom and humility."
                ),
                PrayerVerse(
                    id: "psalm-69-6",
                    reference: "Psalm 69:6",
                    text: "May those who wait for You not be ashamed through me, O Lord God of hosts;\n  May those who seek You not be dishonored through me, O God of Israel.",
                    prayer: "Father, do not let my life bring shame to those who hope in You. Help me live faithfully and honor Your name."
                ),
                PrayerVerse(
                    id: "psalm-69-7",
                    reference: "Psalm 69:7",
                    text: "Because for Your sake I have borne reproach;\n  Dishonor has covered my face.",
                    prayer: "Lord, when following You brings rejection or misunderstanding, strengthen me to endure with love and obedience."
                ),
                PrayerVerse(
                    id: "psalm-69-8",
                    reference: "Psalm 69:8",
                    text: "I have become estranged from my brothers\n  And an alien to my mother's sons.",
                    prayer: "Father, when I feel alone or distant from others, remind me that I am fully known and loved by You."
                ),
                PrayerVerse(
                    id: "psalm-69-9",
                    reference: "Psalm 69:9",
                    text: "For zeal for Your house has consumed me,\n  And the reproaches of those who reproach You have fallen on me.",
                    prayer: "Lord, give me zeal for Your house and Your glory. Let my heart be devoted to what honors You."
                ),
                PrayerVerse(
                    id: "psalm-69-10",
                    reference: "Psalm 69:10",
                    text: "When I wept in my soul with fasting,\n  It became my reproach.",
                    prayer: "Father, when humility or obedience is misunderstood, help me remain faithful to You rather than seeking human approval."
                ),
                PrayerVerse(
                    id: "psalm-69-11",
                    reference: "Psalm 69:11",
                    text: "When I made sackcloth my clothing,\n  I became a byword to them.",
                    prayer: "Lord, teach me to endure ridicule or criticism with grace, keeping my eyes fixed on You."
                ),
                PrayerVerse(
                    id: "psalm-69-12",
                    reference: "Psalm 69:12",
                    text: "Those who sit in the gate talk about me,\n  And I am the song of the drunkards.",
                    prayer: "Father, when others speak against me, help me rest in Your truth and remember that Your voice matters most."
                ),
                PrayerVerse(
                    id: "psalm-69-13",
                    reference: "Psalm 69:13",
                    text: "But as for me, my prayer is to You, O Lord, at an acceptable time;\n  O God, in the greatness of Your lovingkindness,\n  Answer me with Your saving truth.",
                    prayer: "Lord, I pray to You in an acceptable time. Answer me according to Your abundant lovingkindness and saving truth."
                ),
                PrayerVerse(
                    id: "psalm-69-14",
                    reference: "Psalm 69:14",
                    text: "Deliver me from the mire and do not let me sink;\n  May I be delivered from my foes and from the deep waters.",
                    prayer: "Father, deliver me from sinking under fear, shame, or discouragement. Rescue me from anything that pulls me away from You."
                ),
                PrayerVerse(
                    id: "psalm-69-15",
                    reference: "Psalm 69:15",
                    text: "May the flood of water not overflow me\n  Nor the deep swallow me up,\n  Nor the pit shut its mouth on me.",
                    prayer: "Lord, do not let the flood overwhelm me. Keep me from being swallowed by despair and surround me with Your mercy."
                ),
                PrayerVerse(
                    id: "psalm-69-16",
                    reference: "Psalm 69:16",
                    text: "Answer me, O Lord, for Your lovingkindness is good;\n  According to the greatness of Your compassion, turn to me,",
                    prayer: "Father, answer me because Your lovingkindness is good. Turn to me with compassion and renew my hope."
                ),
                PrayerVerse(
                    id: "psalm-69-17",
                    reference: "Psalm 69:17",
                    text: "And do not hide Your face from Your servant,\n  For I am in distress; answer me quickly.",
                    prayer: "Lord, do not hide Your face from me in my distress. Draw near quickly and comfort my heart."
                ),
                PrayerVerse(
                    id: "psalm-69-18",
                    reference: "Psalm 69:18",
                    text: "Oh draw near to my soul and redeem it;\n  Ransom me because of my enemies!",
                    prayer: "Father, draw near to my soul and redeem me. Rescue me by Your grace and restore my peace."
                ),
                PrayerVerse(
                    id: "psalm-69-19",
                    reference: "Psalm 69:19",
                    text: "You know my reproach and my shame and my dishonor;\n  All my adversaries are before You.",
                    prayer: "Lord, You know every reproach, shame, and burden I carry. Help me bring my pain honestly before You."
                ),
                PrayerVerse(
                    id: "psalm-69-20",
                    reference: "Psalm 69:20",
                    text: "Reproach has broken my heart and I am so sick.\n  And I looked for sympathy, but there was none,\n  And for comforters, but I found none.",
                    prayer: "Father, when my heart feels broken and comfort feels far away, be my healer, companion, and source of strength."
                ),
                PrayerVerse(
                    id: "psalm-69-21",
                    reference: "Psalm 69:21",
                    text: "They also gave me gall for my food\n  And for my thirst they gave me vinegar to drink.",
                    prayer: "Lord, when bitterness or disappointment comes near, protect my heart and help me receive the comfort only You can give."
                ),
                PrayerVerse(
                    id: "psalm-69-22",
                    reference: "Psalm 69:22",
                    text: "May their table before them become a snare;\n  And when they are in peace, may it become a trap.",
                    prayer: "Father, remove anything that becomes a snare in my life. Help me recognize danger and walk in wisdom."
                ),
                PrayerVerse(
                    id: "psalm-69-23",
                    reference: "Psalm 69:23",
                    text: "May their eyes grow dim so that they cannot see,\n  And make their loins shake continually.",
                    prayer: "Lord, open my eyes to truth and keep me from spiritual blindness. Strengthen me to walk uprightly before You."
                ),
                PrayerVerse(
                    id: "psalm-69-24",
                    reference: "Psalm 69:24",
                    text: "Pour out Your indignation on them,\n  And may Your burning anger overtake them.",
                    prayer: "Father, I trust Your justice. Help me leave judgment in Your hands and walk humbly before You."
                ),
                PrayerVerse(
                    id: "psalm-69-25",
                    reference: "Psalm 69:25",
                    text: "May their camp be desolate;\n  May none dwell in their tents.",
                    prayer: "Lord, let every place of emptiness in my life be restored by Your presence, mercy, and purpose."
                ),
                PrayerVerse(
                    id: "psalm-69-26",
                    reference: "Psalm 69:26",
                    text: "For they have persecuted him whom You Yourself have smitten,\n  And they tell of the pain of those whom You have wounded.",
                    prayer: "Father, give me compassion for those who are wounded. Help me never add pain to someone You are healing."
                ),
                PrayerVerse(
                    id: "psalm-69-27",
                    reference: "Psalm 69:27",
                    text: "Add iniquity to their iniquity,\n  And may they not come into Your righteousness.",
                    prayer: "Lord, protect me from hardening my heart. Lead me away from sin and deeper into righteousness."
                ),
                PrayerVerse(
                    id: "psalm-69-28",
                    reference: "Psalm 69:28",
                    text: "May they be blotted out of the book of life\n  And may they not be recorded with the righteous.",
                    prayer: "Father, help me live in a way that honors the life You have given me and keeps my name rooted in Your grace."
                ),
                PrayerVerse(
                    id: "psalm-69-29",
                    reference: "Psalm 69:29",
                    text: "But I am afflicted and in pain;\n  May Your salvation, O God, set me securely on high.",
                    prayer: "Lord, when I am afflicted or in pain, let Your salvation lift me up and restore my hope."
                ),
                PrayerVerse(
                    id: "psalm-69-30",
                    reference: "Psalm 69:30",
                    text: "I will praise the name of God with song\n  And magnify Him with thanksgiving.",
                    prayer: "Father, I will praise Your name with song and magnify You with thanksgiving. Fill my heart with worship."
                ),
                PrayerVerse(
                    id: "psalm-69-31",
                    reference: "Psalm 69:31",
                    text: "And it will please the Lord better than an ox\n  Or a young bull with horns and hoofs.",
                    prayer: "Lord, let my praise and gratitude be pleasing to You. May my worship come from a sincere and surrendered heart."
                ),
                PrayerVerse(
                    id: "psalm-69-32",
                    reference: "Psalm 69:32",
                    text: "The humble have seen it and are glad;\n  You who seek God, let your heart revive.",
                    prayer: "Father, encourage the humble and those who seek You. Let their hearts be revived by Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-69-33",
                    reference: "Psalm 69:33",
                    text: "For the Lord hears the needy\n  And does not despise His who are prisoners.",
                    prayer: "Lord, thank You for hearing the needy and not despising those who are bound or broken. Let Your mercy bring freedom."
                ),
                PrayerVerse(
                    id: "psalm-69-34",
                    reference: "Psalm 69:34",
                    text: "Let heaven and earth praise Him,\n  The seas and everything that moves in them.",
                    prayer: "Father, let heaven, earth, and all creation praise You. Help my life join that worship with joy and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-69-35",
                    reference: "Psalm 69:35",
                    text: "For God will save Zion and build the cities of Judah,\n  That they may dwell there and possess it.",
                    prayer: "Lord, save and restore Your people. Build what is broken and establish what belongs to You."
                ),
                PrayerVerse(
                    id: "psalm-69-36",
                    reference: "Psalm 69:36",
                    text: "The descendants of His servants will inherit it,\n  And those who love His name will dwell in it.",
                    prayer: "Father, thank You for the inheritance You give to those who love Your name. Help me dwell faithfully in Your promises."
                ),
                PrayerVerse(
                    id: "psalm-69-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing me when I am overwhelmed, weary, or brokenhearted. Rescue me from despair, restore my hope, and keep my heart faithful to You. Teach me to endure hardship with humility, trust Your justice, and praise Your name with gratitude. May my life be rooted in Your mercy, lifted by Your salvation, and devoted to Your glory.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 70,
            title: "Hasten to Help Me",
            chapterReference: "Psalm 70",
            summary: "Pray for urgent help from God.",
            // JSON resource: psalm_70_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-70-1",
                    reference: "Psalm 70:1",
                    text: "O God, hasten to deliver me;\n  O Lord, hasten to my help!",
                    prayer: "Lord, come quickly to help me when I am in need. Teach me to call on You first and trust Your timing."
                ),
                PrayerVerse(
                    id: "psalm-70-2",
                    reference: "Psalm 70:2",
                    text: "Let those be ashamed and humiliated\n  Who seek my life;\n  Let those be turned back and dishonored\n  Who delight in my hurt.",
                    prayer: "Father, protect me from anything that seeks to harm my soul, weaken my faith, or pull me away from Your truth."
                ),
                PrayerVerse(
                    id: "psalm-70-3",
                    reference: "Psalm 70:3",
                    text: "Let those be turned back because of their shame\n  Who say, “Aha, aha!”",
                    prayer: "Lord, turn back every voice of shame, fear, and discouragement. Help me listen instead to Your truth and love."
                ),
                PrayerVerse(
                    id: "psalm-70-4",
                    reference: "Psalm 70:4",
                    text: "Let all who seek You rejoice and be glad in You;\n  And let those who love Your salvation say continually,\n  “Let God be magnified.”",
                    prayer: "Father, let all who seek You rejoice and be glad in You. Fill my heart with joy in Your salvation and love."
                ),
                PrayerVerse(
                    id: "psalm-70-5",
                    reference: "Psalm 70:5",
                    text: "But I am afflicted and needy;\n  Hasten to me, O God!\n  You are my help and my deliverer;\n  O Lord, do not delay.",
                    prayer: "Lord, I am needy and dependent on You. You are my help and my deliverer, so please do not delay in strengthening and guiding me."
                ),
                PrayerVerse(
                    id: "psalm-70-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my help, my deliverer, and my source of salvation. When I feel weak, rushed, afraid, or overwhelmed, help me seek You with confidence. Protect me from discouragement, fill me with joy in Your presence, and remind me that You are near to all who call upon You.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 71,
            title: "You Are My Hope",
            chapterReference: "Psalm 71",
            summary: "Pray for lifelong trust in God.",
            // JSON resource: psalm_71_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-71-1",
                    reference: "Psalm 71:1",
                    text: "In You, O Lord, I have taken refuge;\n  Let me never be ashamed.",
                    prayer: "Lord, I take refuge in You. Keep me from shame and help me trust in Your righteousness and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-71-2",
                    reference: "Psalm 71:2",
                    text: "In Your righteousness deliver me and rescue me;\n  Incline Your ear to me and save me.",
                    prayer: "Father, deliver me and rescue me according to Your righteousness. Incline Your ear to me and save me."
                ),
                PrayerVerse(
                    id: "psalm-71-3",
                    reference: "Psalm 71:3",
                    text: "Be to me a rock of habitation to which I may continually come;\n  You have given commandment to save me,\n  For You are my rock and my fortress.",
                    prayer: "Lord, be my rock of refuge, my strong fortress, and my place of safety. Help me run to You in every season."
                ),
                PrayerVerse(
                    id: "psalm-71-4",
                    reference: "Psalm 71:4",
                    text: "Rescue me, O my God, out of the hand of the wicked,\n  Out of the grasp of the wrongdoer and ruthless man,",
                    prayer: "Father, rescue me from wickedness, injustice, and anything that seeks to harm my faith or peace."
                ),
                PrayerVerse(
                    id: "psalm-71-5",
                    reference: "Psalm 71:5",
                    text: "For You are my hope;\n  O Lord God, You are my confidence from my youth.",
                    prayer: "Lord, You are my hope and my confidence. Help me trust You from this day forward with a steady and faithful heart."
                ),
                PrayerVerse(
                    id: "psalm-71-6",
                    reference: "Psalm 71:6",
                    text: "By You I have been sustained from my birth;\n  You are He who took me from my mother's womb;\n  My praise is continually of You.",
                    prayer: "Father, You have sustained me from the beginning of my life. Let my praise continually be directed to You."
                ),
                PrayerVerse(
                    id: "psalm-71-7",
                    reference: "Psalm 71:7",
                    text: "I have become a marvel to many,\n  For You are my strong refuge.",
                    prayer: "Lord, let my life be a testimony of Your strength, protection, and faithfulness to those around me."
                ),
                PrayerVerse(
                    id: "psalm-71-8",
                    reference: "Psalm 71:8",
                    text: "My mouth is filled with Your praise\n  And with Your glory all day long.",
                    prayer: "Father, fill my mouth with Your praise and let my life declare Your glory throughout the day."
                ),
                PrayerVerse(
                    id: "psalm-71-9",
                    reference: "Psalm 71:9",
                    text: "Do not cast me off in the time of old age;\n  Do not forsake me when my strength fails.",
                    prayer: "Lord, do not cast me away in any season of weakness. Stay near to me and strengthen me when I feel tired or vulnerable."
                ),
                PrayerVerse(
                    id: "psalm-71-10",
                    reference: "Psalm 71:10",
                    text: "For my enemies have spoken against me;\n  And those who watch for my life have consulted together,",
                    prayer: "Father, protect me from voices that speak against me or try to discourage my faith."
                ),
                PrayerVerse(
                    id: "psalm-71-11",
                    reference: "Psalm 71:11",
                    text: "Saying, “God has forsaken him;\n  Pursue and seize him, for there is no one to deliver.”",
                    prayer: "Lord, when others assume I am alone or abandoned, remind me that You are always with me."
                ),
                PrayerVerse(
                    id: "psalm-71-12",
                    reference: "Psalm 71:12",
                    text: "O God, do not be far from me;\n  O my God, hasten to my help!",
                    prayer: "Father, do not be far from me. Come quickly to help me and surround me with Your presence."
                ),
                PrayerVerse(
                    id: "psalm-71-13",
                    reference: "Psalm 71:13",
                    text: "Let those who are adversaries of my soul be ashamed and consumed;\n  Let them be covered with reproach and dishonor, who seek to injure me.",
                    prayer: "Lord, silence every accusation, fear, and attack that rises against my soul. Cover me with Your protection and peace."
                ),
                PrayerVerse(
                    id: "psalm-71-14",
                    reference: "Psalm 71:14",
                    text: "But as for me, I will hope continually,\n  And will praise You yet more and more.",
                    prayer: "Father, help me hope continually in You and praise You more and more each day."
                ),
                PrayerVerse(
                    id: "psalm-71-15",
                    reference: "Psalm 71:15",
                    text: "My mouth shall tell of Your righteousness\n  And of Your salvation all day long;\n  For I do not know the sum of them.",
                    prayer: "Lord, let my mouth tell of Your righteousness and salvation. Help me share Your goodness even beyond what I can fully understand."
                ),
                PrayerVerse(
                    id: "psalm-71-16",
                    reference: "Psalm 71:16",
                    text: "I will come with the mighty deeds of the Lord God;\n  I will make mention of Your righteousness, Yours alone.",
                    prayer: "Father, help me walk in Your strength and proclaim Your righteousness alone."
                ),
                PrayerVerse(
                    id: "psalm-71-17",
                    reference: "Psalm 71:17",
                    text: "O God, You have taught me from my youth,\n  And I still declare Your wondrous deeds.",
                    prayer: "Lord, You have taught me from my youth. Help me continue declaring Your wonderful works throughout my life."
                ),
                PrayerVerse(
                    id: "psalm-71-18",
                    reference: "Psalm 71:18",
                    text: "And even when I am old and gray, O God, do not forsake me,\n  Until I declare Your strength to this generation,\n  Your power to all who are to come.",
                    prayer: "Father, even as seasons change, do not forsake me. Help me declare Your strength and power to the next generation."
                ),
                PrayerVerse(
                    id: "psalm-71-19",
                    reference: "Psalm 71:19",
                    text: "For Your righteousness, O God, reaches to the heavens,\n  You who have done great things;\n  O God, who is like You?",
                    prayer: "Lord, Your righteousness reaches to the heavens. Thank You for the great things You have done; there is none like You."
                ),
                PrayerVerse(
                    id: "psalm-71-20",
                    reference: "Psalm 71:20",
                    text: "You who have shown me many troubles and distresses\n  Will revive me again,\n  And will bring me up again from the depths of the earth.",
                    prayer: "Father, even after many troubles, revive me again and lift me up by Your grace."
                ),
                PrayerVerse(
                    id: "psalm-71-21",
                    reference: "Psalm 71:21",
                    text: "May You increase my greatness\n  And turn to comfort me.",
                    prayer: "Lord, increase my strength, restore my comfort, and guide me deeper into Your peace."
                ),
                PrayerVerse(
                    id: "psalm-71-22",
                    reference: "Psalm 71:22",
                    text: "I will also praise You with a harp,\n  Even Your truth, O my God;\n  To You I will sing praises with the lyre,\n  O Holy One of Israel.",
                    prayer: "Father, I will praise You for Your faithfulness. Let my worship honor Your truth and Your holiness."
                ),
                PrayerVerse(
                    id: "psalm-71-23",
                    reference: "Psalm 71:23",
                    text: "My lips will shout for joy when I sing praises to You;\n  And my soul, which You have redeemed.",
                    prayer: "Lord, let my lips shout for joy because You have redeemed my soul and filled my life with hope."
                ),
                PrayerVerse(
                    id: "psalm-71-24",
                    reference: "Psalm 71:24",
                    text: "My tongue also will utter Your righteousness all day long;\n  For they are ashamed, for they are humiliated who seek my hurt.",
                    prayer: "Father, let my tongue speak of Your righteousness throughout the day. Help me remember that You are faithful, just, and good."
                ),
                PrayerVerse(
                    id: "psalm-71-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my refuge, my hope, and my strength through every season of life. You have sustained me from the beginning, taught me through the years, and carried me through many troubles. Help me praise You continually, declare Your faithfulness to the next generation, and trust Your righteousness in every circumstance. May my life remain rooted in Your protection, comfort, and redeeming love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 72,
            title: "Endow the King",
            chapterReference: "Psalm 72",
            summary: "Pray for righteous leadership and justice.",
            // JSON resource: psalm_72_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-72-1",
                    reference: "Psalm 72:1",
                    text: "Give the king Your judgments, O God,\n  And Your righteousness to the king's son.",
                    prayer: "Lord, give me wisdom to value justice and righteousness. Teach me to make decisions that honor You and reflect Your truth."
                ),
                PrayerVerse(
                    id: "psalm-72-2",
                    reference: "Psalm 72:2",
                    text: "May he judge Your people with righteousness\n  And Your afflicted with justice.",
                    prayer: "Father, help me care about justice for all people. Let my actions reflect fairness, compassion, and righteousness."
                ),
                PrayerVerse(
                    id: "psalm-72-3",
                    reference: "Psalm 72:3",
                    text: "Let the mountains bring peace to the people,\n  And the hills, in righteousness.",
                    prayer: "Lord, let peace and righteousness grow in my life. Make my heart a place where Your goodness is welcomed and seen."
                ),
                PrayerVerse(
                    id: "psalm-72-4",
                    reference: "Psalm 72:4",
                    text: "May he vindicate the afflicted of the people,\n  Save the children of the needy\n  And crush the oppressor.",
                    prayer: "Father, defend the weak, the needy, and those who are oppressed. Use my life to reflect Your compassion and care."
                ),
                PrayerVerse(
                    id: "psalm-72-5",
                    reference: "Psalm 72:5",
                    text: "Let them fear You while the sun endures,\n  And as long as the moon, throughout all generations.",
                    prayer: "Lord, teach me to live with reverence for You from generation to generation. Let my faithfulness point others toward Your name."
                ),
                PrayerVerse(
                    id: "psalm-72-6",
                    reference: "Psalm 72:6",
                    text: "May he come down like rain upon the mown grass,\n  Like showers that water the earth.",
                    prayer: "Father, let Your presence refresh my soul like rain on dry ground. Bring renewal, peace, and life where I feel weary."
                ),
                PrayerVerse(
                    id: "psalm-72-7",
                    reference: "Psalm 72:7",
                    text: "In his days may the righteous flourish,\n  And abundance of peace till the moon is no more.",
                    prayer: "Lord, let righteousness flourish and peace increase in my life. Help me walk in Your ways with a steady and faithful heart."
                ),
                PrayerVerse(
                    id: "psalm-72-8",
                    reference: "Psalm 72:8",
                    text: "May he also rule from sea to sea\n  And from the River to the ends of the earth.",
                    prayer: "Father, You reign over all. Help me trust Your authority and surrender every area of my life to Your rule."
                ),
                PrayerVerse(
                    id: "psalm-72-9",
                    reference: "Psalm 72:9",
                    text: "Let the nomads of the desert bow before him,\n  And his enemies lick the dust.",
                    prayer: "Lord, every power and every enemy must bow before You. Help me remember that nothing is greater than Your authority."
                ),
                PrayerVerse(
                    id: "psalm-72-10",
                    reference: "Psalm 72:10",
                    text: "Let the kings of Tarshish and of the islands bring presents;\n  The kings of Sheba and Seba offer gifts.",
                    prayer: "Father, may people from every place bring honor to You. Let my life also offer worship, gratitude, and devotion."
                ),
                PrayerVerse(
                    id: "psalm-72-11",
                    reference: "Psalm 72:11",
                    text: "And let all kings bow down before him,\n  All nations serve him.",
                    prayer: "Lord, You are worthy of worship from every nation and every heart. Help me honor You as King over all."
                ),
                PrayerVerse(
                    id: "psalm-72-12",
                    reference: "Psalm 72:12",
                    text: "For he will deliver the needy when he cries for help,\n  The afflicted also, and him who has no helper.",
                    prayer: "Father, thank You for hearing the needy and rescuing those who have no helper. Make me attentive to those who are hurting."
                ),
                PrayerVerse(
                    id: "psalm-72-13",
                    reference: "Psalm 72:13",
                    text: "He will have compassion on the poor and needy,\n  And the lives of the needy he will save.",
                    prayer: "Lord, give me compassion for the poor and weak. Help me care about the lives of those who need mercy and protection."
                ),
                PrayerVerse(
                    id: "psalm-72-14",
                    reference: "Psalm 72:14",
                    text: "He will rescue their life from oppression and violence,\n  And their blood will be precious in his sight;",
                    prayer: "Father, redeem people from oppression and violence. Teach me to value every life as precious in Your sight."
                ),
                PrayerVerse(
                    id: "psalm-72-15",
                    reference: "Psalm 72:15",
                    text: "So may he live, and may the gold of Sheba be given to him;\n  And let them pray for him continually;\n  Let them bless him all day long.",
                    prayer: "Lord, may my life continually bless and honor You. Let prayer, praise, and gratitude remain alive in my heart each day."
                ),
                PrayerVerse(
                    id: "psalm-72-16",
                    reference: "Psalm 72:16",
                    text: "May there be abundance of grain in the earth on top of the mountains;\n  Its fruit will wave like the cedars of Lebanon;\n  And may those from the city flourish like vegetation of the earth.",
                    prayer: "Father, let Your blessing produce fruitfulness in every area of my life. Help what You plant in me grow for Your glory."
                ),
                PrayerVerse(
                    id: "psalm-72-17",
                    reference: "Psalm 72:17",
                    text: "May his name endure forever;\n  May his name increase as long as the sun shines;\n  And let men bless themselves by him;\n  Let all nations call him blessed.",
                    prayer: "Lord, may Your name endure forever and Your blessing reach every generation. Use my life to point others toward Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-72-18",
                    reference: "Psalm 72:18",
                    text: "Blessed be the Lord God, the God of Israel,\n  Who alone works wonders.",
                    prayer: "Father, blessed are You, the God who alone works wonders. Help me remember Your power and praise You for all You do."
                ),
                PrayerVerse(
                    id: "psalm-72-19",
                    reference: "Psalm 72:19",
                    text: "And blessed be His glorious name forever;\n  And may the whole earth be filled with His glory.\n  Amen, and Amen.",
                    prayer: "Lord, blessed be Your glorious name forever. Let the whole earth be filled with Your glory, and let my life join in that praise."
                ),
                PrayerVerse(
                    id: "psalm-72-20",
                    reference: "Psalm 72:20",
                    text: "The prayers of David the son of Jesse are ended.",
                    prayer: "Father, thank You for faithful prayers that point generations toward You. Help my prayers and my life honor You to the end."
                ),
                PrayerVerse(
                    id: "psalm-72-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your righteousness, justice, compassion, and glory. Teach me to care for the weak, defend what is right, and walk humbly under Your authority. Let peace and righteousness flourish in my heart, and let my life point others toward Your eternal kingdom. May Your name be blessed forever, and may the whole earth be filled with Your glory.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 73,
            title: "Who Have I But You?",
            chapterReference: "Psalm 73",
            summary: "Pray for perspective when the wicked prosper.",
            // JSON resource: psalm_73_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-73-1",
                    reference: "Psalm 73:1",
                    text: "Surely God is good to Israel,\n  To those who are pure in heart!",
                    prayer: "Lord, thank You for being good to those who seek You with a pure heart. Help me trust Your goodness even when life feels confusing."
                ),
                PrayerVerse(
                    id: "psalm-73-2",
                    reference: "Psalm 73:2",
                    text: "But as for me, my feet came close to stumbling,\n  My steps had almost slipped.",
                    prayer: "Father, when my steps feel unsteady and my faith feels weak, hold me close and keep me from slipping away from Your truth."
                ),
                PrayerVerse(
                    id: "psalm-73-3",
                    reference: "Psalm 73:3",
                    text: "For I was envious of the arrogant\n  As I saw the prosperity of the wicked.",
                    prayer: "Lord, guard my heart from envy when I see others prosper. Help me focus on Your faithfulness instead of comparing my life to others."
                ),
                PrayerVerse(
                    id: "psalm-73-4",
                    reference: "Psalm 73:4",
                    text: "For there are no pains in their death,\n  And their body is fat.",
                    prayer: "Father, when it seems like others live without struggle, remind me that appearances do not reveal the whole story."
                ),
                PrayerVerse(
                    id: "psalm-73-5",
                    reference: "Psalm 73:5",
                    text: "They are not in trouble as other men,\n  Nor are they plagued like mankind.",
                    prayer: "Lord, keep my heart from frustration when life feels unfair. Help me trust that You see clearly and judge rightly."
                ),
                PrayerVerse(
                    id: "psalm-73-6",
                    reference: "Psalm 73:6",
                    text: "Therefore pride is their necklace;\n  The garment of violence covers them.",
                    prayer: "Father, protect me from pride and arrogance. Clothe me instead with humility, compassion, and obedience."
                ),
                PrayerVerse(
                    id: "psalm-73-7",
                    reference: "Psalm 73:7",
                    text: "Their eye bulges from fatness;\n  The imaginations of their heart run riot.",
                    prayer: "Lord, guard my desires from greed and selfishness. Teach me to be content in You and satisfied by Your presence."
                ),
                PrayerVerse(
                    id: "psalm-73-8",
                    reference: "Psalm 73:8",
                    text: "They mock and wickedly speak of oppression;\n  They speak from on high.",
                    prayer: "Father, keep my words from arrogance, cruelty, or pride. Let my speech reflect truth, kindness, and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-73-9",
                    reference: "Psalm 73:9",
                    text: "They have set their mouth against the heavens,\n  And their tongue parades through the earth.",
                    prayer: "Lord, protect me from speaking as though I am above others. Help me walk humbly under Your authority."
                ),
                PrayerVerse(
                    id: "psalm-73-10",
                    reference: "Psalm 73:10",
                    text: "Therefore his people return to this place,\n  And waters of abundance are drunk by them.",
                    prayer: "Father, give me discernment when people are influenced by false success or empty promises. Keep my heart anchored in Your truth."
                ),
                PrayerVerse(
                    id: "psalm-73-11",
                    reference: "Psalm 73:11",
                    text: "They say, “How does God know?\n  And is there knowledge with the Most High?”",
                    prayer: "Lord, remind me that You see everything. Nothing is hidden from Your knowledge, wisdom, or justice."
                ),
                PrayerVerse(
                    id: "psalm-73-12",
                    reference: "Psalm 73:12",
                    text: "Behold, these are the wicked;\n  And always at ease, they have increased in wealth.",
                    prayer: "Father, when the wicked seem at ease, help me remember that temporary prosperity is not the same as eternal security."
                ),
                PrayerVerse(
                    id: "psalm-73-13",
                    reference: "Psalm 73:13",
                    text: "Surely in vain I have kept my heart pure\n  And washed my hands in innocence;",
                    prayer: "Lord, when I wonder whether faithfulness is worth it, remind me that walking with You is never empty or wasted."
                ),
                PrayerVerse(
                    id: "psalm-73-14",
                    reference: "Psalm 73:14",
                    text: "For I have been stricken all day long\n  And chastened every morning.",
                    prayer: "Father, when discipline, hardship, or correction comes, help me trust that You are shaping my heart for good."
                ),
                PrayerVerse(
                    id: "psalm-73-15",
                    reference: "Psalm 73:15",
                    text: "If I had said, “I will speak thus,”\n  Behold, I would have betrayed the generation of Your children.",
                    prayer: "Lord, guard my words when I am confused or discouraged. Help me not lead others into doubt, but bring my questions honestly to You."
                ),
                PrayerVerse(
                    id: "psalm-73-16",
                    reference: "Psalm 73:16",
                    text: "When I pondered to understand this,\n  It was troublesome in my sight",
                    prayer: "Father, when I cannot understand what I see, give me patience, humility, and faith to wait for Your wisdom."
                ),
                PrayerVerse(
                    id: "psalm-73-17",
                    reference: "Psalm 73:17",
                    text: "Until I came into the sanctuary of God;\n  Then I perceived their end.",
                    prayer: "Lord, bring me into Your presence and help me see life from Your eternal perspective."
                ),
                PrayerVerse(
                    id: "psalm-73-18",
                    reference: "Psalm 73:18",
                    text: "Surely You set them in slippery places;\n  You cast them down to destruction.",
                    prayer: "Father, remind me that life built apart from You stands on unstable ground. Keep my feet firmly planted in Your truth."
                ),
                PrayerVerse(
                    id: "psalm-73-19",
                    reference: "Psalm 73:19",
                    text: "How they are destroyed in a moment!\n  They are utterly swept away by sudden terrors!",
                    prayer: "Lord, help me remember how quickly earthly security can disappear. Teach me to build my life on what is eternal."
                ),
                PrayerVerse(
                    id: "psalm-73-20",
                    reference: "Psalm 73:20",
                    text: "Like a dream when one awakes,\n  O Lord, when aroused, You will despise their form.",
                    prayer: "Father, let temporary things lose their power over my heart. Help me seek what lasts forever in Your kingdom."
                ),
                PrayerVerse(
                    id: "psalm-73-21",
                    reference: "Psalm 73:21",
                    text: "When my heart was embittered\n  And I was pierced within,",
                    prayer: "Lord, when my heart becomes bitter or wounded, soften me with Your mercy and restore my peace."
                ),
                PrayerVerse(
                    id: "psalm-73-22",
                    reference: "Psalm 73:22",
                    text: "Then I was senseless and ignorant;\n  I was like a beast before You.",
                    prayer: "Father, forgive me when I lack understanding or respond with foolishness. Teach me wisdom and humility."
                ),
                PrayerVerse(
                    id: "psalm-73-23",
                    reference: "Psalm 73:23",
                    text: "Nevertheless I am continually with You;\n  You have taken hold of my right hand.",
                    prayer: "Lord, thank You that even when I struggle, I am continually with You. Hold my right hand and guide me with Your love."
                ),
                PrayerVerse(
                    id: "psalm-73-24",
                    reference: "Psalm 73:24",
                    text: "With Your counsel You will guide me,\n  And afterward receive me to glory.",
                    prayer: "Father, guide me with Your counsel and lead me toward the hope and glory found in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-73-25",
                    reference: "Psalm 73:25",
                    text: "Whom have I in heaven but You?\n  And besides You, I desire nothing on earth.",
                    prayer: "Lord, whom have I in heaven but You? Help me desire You above everything on earth."
                ),
                PrayerVerse(
                    id: "psalm-73-26",
                    reference: "Psalm 73:26",
                    text: "My flesh and my heart may fail,\n  But God is the strength of my heart and my portion forever.",
                    prayer: "Father, when my flesh and heart fail, be the strength of my heart and my portion forever."
                ),
                PrayerVerse(
                    id: "psalm-73-27",
                    reference: "Psalm 73:27",
                    text: "For, behold, those who are far from You will perish;\n  You have destroyed all those who are unfaithful to You.",
                    prayer: "Lord, keep me close to You and protect me from anything that would pull my heart away from Your presence."
                ),
                PrayerVerse(
                    id: "psalm-73-28",
                    reference: "Psalm 73:28",
                    text: "But as for me, the nearness of God is my good;\n  I have made the Lord God my refuge,\n  That I may tell of all Your works.",
                    prayer: "Father, it is good for me to draw near to You. Help me make You my refuge and declare all Your works with gratitude and faith."
                ),
                PrayerVerse(
                    id: "psalm-73-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my strength, my portion, and my refuge. When life feels unfair or confusing, bring me into Your presence and help me see with eternal perspective. Guard my heart from envy, bitterness, and comparison, and teach me to desire You above all else. Hold my hand, guide me with Your counsel, and keep me close to You forever.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 74,
            title: "Remember Your Congregation",
            chapterReference: "Psalm 74",
            summary: "Pray for God's intervention and restoration.",
            // JSON resource: psalm_74_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-74-1",
                    reference: "Psalm 74:1",
                    text: "O God, why have You rejected us forever?\n  Why does Your anger smoke against the sheep of Your pasture?",
                    prayer: "Lord, when I feel forgotten or distant from Your presence, help me remember that You are still faithful and near to Your people."
                ),
                PrayerVerse(
                    id: "psalm-74-2",
                    reference: "Psalm 74:2",
                    text: "Remember Your congregation, which You have purchased of old,\n  Which You have redeemed to be the tribe of Your inheritance;\n  And this Mount Zion, where You have dwelt.",
                    prayer: "Father, remember Your people with mercy. Thank You for redeeming us and calling us to belong to You."
                ),
                PrayerVerse(
                    id: "psalm-74-3",
                    reference: "Psalm 74:3",
                    text: "Turn Your footsteps toward the perpetual ruins;\n  The enemy has damaged everything within the sanctuary.",
                    prayer: "Lord, restore what has been broken and bring healing where there has been loss, damage, or discouragement."
                ),
                PrayerVerse(
                    id: "psalm-74-4",
                    reference: "Psalm 74:4",
                    text: "Your adversaries have roared in the midst of Your meeting place;\n  They have set up their own standards for signs.",
                    prayer: "Father, when voices of opposition seem loud, help me stay anchored in Your truth and confidence in Your power."
                ),
                PrayerVerse(
                    id: "psalm-74-5",
                    reference: "Psalm 74:5",
                    text: "It seems as if one had lifted up\n  His axe in a forest of trees.",
                    prayer: "Lord, protect what is holy and precious. Help me honor the things that belong to You with reverence and care."
                ),
                PrayerVerse(
                    id: "psalm-74-6",
                    reference: "Psalm 74:6",
                    text: "And now all its carved work\n  They smash with hatchet and hammers.",
                    prayer: "Father, defend the work of Your hands and preserve what You have built in my life."
                ),
                PrayerVerse(
                    id: "psalm-74-7",
                    reference: "Psalm 74:7",
                    text: "They have burned Your sanctuary to the ground;\n  They have defiled the dwelling place of Your name.",
                    prayer: "Lord, when sacred things are treated carelessly, give me a heart that values Your presence, Your Word, and Your name."
                ),
                PrayerVerse(
                    id: "psalm-74-8",
                    reference: "Psalm 74:8",
                    text: "They said in their heart, “Let us completely subdue them.”\n  They have burned all the meeting places of God in the land.",
                    prayer: "Father, protect Your people and places of worship. Let Your truth remain strong through every generation."
                ),
                PrayerVerse(
                    id: "psalm-74-9",
                    reference: "Psalm 74:9",
                    text: "We do not see our signs;\n  There is no longer any prophet,\n  Nor is there any among us who knows how long.",
                    prayer: "Lord, when I cannot clearly see signs of Your work, help me trust that You are still moving even in silence."
                ),
                PrayerVerse(
                    id: "psalm-74-10",
                    reference: "Psalm 74:10",
                    text: "How long, O God, will the adversary revile,\n  And the enemy spurn Your name forever?",
                    prayer: "Father, when I wonder how long hardship will continue, strengthen my patience and renew my hope in You."
                ),
                PrayerVerse(
                    id: "psalm-74-11",
                    reference: "Psalm 74:11",
                    text: "Why do You withdraw Your hand, even Your right hand?\n  From within Your bosom, destroy them!",
                    prayer: "Lord, do not hold back Your help. Stretch out Your hand in mercy and bring deliverance according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-74-12",
                    reference: "Psalm 74:12",
                    text: "Yet God is my king from of old,\n  Who works deeds of deliverance in the midst of the earth.",
                    prayer: "Father, thank You that You have been my King from long ago. Help me remember Your saving works and trust Your authority."
                ),
                PrayerVerse(
                    id: "psalm-74-13",
                    reference: "Psalm 74:13",
                    text: "You divided the sea by Your strength;\n  You broke the heads of the sea monsters in the waters.",
                    prayer: "Lord, You rule over the sea and every force of chaos. Speak peace over every storm in my life."
                ),
                PrayerVerse(
                    id: "psalm-74-14",
                    reference: "Psalm 74:14",
                    text: "You crushed the heads of Leviathan;\n  You gave him as food for the creatures of the wilderness.",
                    prayer: "Father, You overcome every enemy and every power that rises against Your purposes. Help me trust Your victory."
                ),
                PrayerVerse(
                    id: "psalm-74-15",
                    reference: "Psalm 74:15",
                    text: "You broke open springs and torrents;\n  You dried up ever-flowing streams.",
                    prayer: "Lord, You open springs and dry up rivers. Remind me that You can provide, redirect, and make a way where I see none."
                ),
                PrayerVerse(
                    id: "psalm-74-16",
                    reference: "Psalm 74:16",
                    text: "Yours is the day, Yours also is the night;\n  You have prepared the light and the sun.",
                    prayer: "Father, the day and night belong to You. Help me trust Your care in both bright seasons and dark ones."
                ),
                PrayerVerse(
                    id: "psalm-74-17",
                    reference: "Psalm 74:17",
                    text: "You have established all the boundaries of the earth;\n  You have made summer and winter.",
                    prayer: "Lord, You established the boundaries of the earth and formed the seasons. Help me rest in Your wisdom and order."
                ),
                PrayerVerse(
                    id: "psalm-74-18",
                    reference: "Psalm 74:18",
                    text: "Remember this, O Lord, that the enemy has reviled,\n  And a foolish people has spurned Your name.",
                    prayer: "Father, when people mock Your name or reject Your truth, help me remain faithful, humble, and devoted to You."
                ),
                PrayerVerse(
                    id: "psalm-74-19",
                    reference: "Psalm 74:19",
                    text: "Do not deliver the soul of Your turtledove to the wild beast;\n  Do not forget the life of Your afflicted forever.",
                    prayer: "Lord, protect the vulnerable and do not forget those who depend on You. Keep my soul safe in Your care."
                ),
                PrayerVerse(
                    id: "psalm-74-20",
                    reference: "Psalm 74:20",
                    text: "Consider the covenant;\n  For the dark places of the land are full of the habitations of violence.",
                    prayer: "Father, remember Your covenant and shine Your light in dark places. Let Your faithfulness bring hope where there is fear."
                ),
                PrayerVerse(
                    id: "psalm-74-21",
                    reference: "Psalm 74:21",
                    text: "Let not the oppressed return dishonored;\n  Let the afflicted and needy praise Your name.",
                    prayer: "Lord, do not let the oppressed turn away in shame. Let the poor and needy praise Your name through Your mercy and help."
                ),
                PrayerVerse(
                    id: "psalm-74-22",
                    reference: "Psalm 74:22",
                    text: "Arise, O God, and plead Your own cause;\n  Remember how the foolish man reproaches You all day long.",
                    prayer: "Father, arise and defend Your cause. Help me trust that Your truth, justice, and glory will prevail."
                ),
                PrayerVerse(
                    id: "psalm-74-23",
                    reference: "Psalm 74:23",
                    text: "Do not forget the voice of Your adversaries,\n  The uproar of those who rise against You which ascends continually.",
                    prayer: "Lord, do not forget the noise of opposition. Silence what dishonors You and let Your name be exalted above all."
                ),
                PrayerVerse(
                    id: "psalm-74-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being King over every season, every storm, and every struggle. When I feel confused, forgotten, or surrounded by opposition, help me remember Your covenant, Your power, and Your faithfulness. Restore what is broken, defend what belongs to You, and keep my heart anchored in hope. May my life trust Your timing, honor Your name, and praise You through every season.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 75,
            title: "We Give Thanks",
            chapterReference: "Psalm 75",
            summary: "Pray in gratitude for God's judgment.",
            // JSON resource: psalm_75_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-75-1",
                    reference: "Psalm 75:1",
                    text: "We give thanks to You, O God, we give thanks,\n  For Your name is near;\n  Men declare Your wondrous works.",
                    prayer: "Lord, I give thanks to You because Your name is near. Help me remember Your wonderful works and praise You with a grateful heart."
                ),
                PrayerVerse(
                    id: "psalm-75-2",
                    reference: "Psalm 75:2",
                    text: "“When I select an appointed time,\n  It is I who judge with equity.",
                    prayer: "Father, thank You that You judge with fairness and perfect timing. Help me trust Your appointed seasons and Your righteous decisions."
                ),
                PrayerVerse(
                    id: "psalm-75-3",
                    reference: "Psalm 75:3",
                    text: "“The earth and all who dwell in it melt;\n  It is I who have firmly set its pillars. Selah.",
                    prayer: "Lord, when the world feels unstable, remind me that You hold everything together. Keep my heart steady in Your strength."
                ),
                PrayerVerse(
                    id: "psalm-75-4",
                    reference: "Psalm 75:4",
                    text: "“I said to the boastful, ‘Do not boast,’\n  And to the wicked, ‘Do not lift up the horn;",
                    prayer: "Father, protect me from pride and arrogance. Teach me to walk humbly before You and others."
                ),
                PrayerVerse(
                    id: "psalm-75-5",
                    reference: "Psalm 75:5",
                    text: "Do not lift up your horn on high,\n  Do not speak with insolent pride.’”",
                    prayer: "Lord, keep me from lifting myself up in pride. Help me submit my heart, words, and actions to Your authority."
                ),
                PrayerVerse(
                    id: "psalm-75-6",
                    reference: "Psalm 75:6",
                    text: "For not from the east, nor from the west,\n  Nor from the desert comes exaltation;",
                    prayer: "Father, remind me that promotion and honor do not come from human striving, but from Your hand."
                ),
                PrayerVerse(
                    id: "psalm-75-7",
                    reference: "Psalm 75:7",
                    text: "But God is the Judge;\n  He puts down one and exalts another.",
                    prayer: "Lord, You are the Judge who raises up and brings down according to Your wisdom. Help me trust Your justice and timing."
                ),
                PrayerVerse(
                    id: "psalm-75-8",
                    reference: "Psalm 75:8",
                    text: "For a cup is in the hand of the Lord, and the wine foams;\n  It is well mixed, and He pours out of this;\n  Surely all the wicked of the earth must drain and drink down its dregs.",
                    prayer: "Father, help me remember the seriousness of Your holiness and judgment. Teach me to live with reverence and obedience."
                ),
                PrayerVerse(
                    id: "psalm-75-9",
                    reference: "Psalm 75:9",
                    text: "But as for me, I will declare it forever;\n  I will sing praises to the God of Jacob.",
                    prayer: "Lord, I will declare Your praise forever. Let my life continually testify to Your righteousness and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-75-10",
                    reference: "Psalm 75:10",
                    text: "And all the horns of the wicked He will cut off,\n  But the horns of the righteous will be lifted up.",
                    prayer: "Father, remove pride and wickedness, and strengthen what is righteous. Help me walk in humility, truth, and faithfulness before You."
                ),
                PrayerVerse(
                    id: "psalm-75-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being near, righteous, and sovereign over every season. Help me trust Your timing, reject pride, and walk humbly before You. When life feels unstable, remind me that You hold all things together. May my life continually give thanks, declare Your praise, and reflect confidence in Your justice and faithfulness.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        )
    ]

    // MARK: - Psalms 76-90
    private static let psalms76to90: [PrayerDay] = [
        PrayerDay(
            dayNumber: 76,
            title: "You Are Resplendent",
            chapterReference: "Psalm 76",
            summary: "Pray in awe of God's majesty.",
            // JSON resource: psalm_76_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-76-1",
                    reference: "Psalm 76:1",
                    text: "God is known in Judah;\n  His name is great in Israel.",
                    prayer: "Lord, make Your name known in my life. Help me honor You with reverence, gratitude, and faithful obedience."
                ),
                PrayerVerse(
                    id: "psalm-76-2",
                    reference: "Psalm 76:2",
                    text: "His tabernacle is in Salem;\n  His dwelling place also is in Zion.",
                    prayer: "Father, thank You for dwelling among Your people. Let my heart be a place where Your presence is welcomed and honored."
                ),
                PrayerVerse(
                    id: "psalm-76-3",
                    reference: "Psalm 76:3",
                    text: "There He broke the flaming arrows,\n  The shield and the sword and the weapons of war. Selah.",
                    prayer: "Lord, break every weapon of fear, temptation, and opposition that rises against my faith. Let Your peace rule over me."
                ),
                PrayerVerse(
                    id: "psalm-76-4",
                    reference: "Psalm 76:4",
                    text: "You are resplendent,\n  More majestic than the mountains of prey.",
                    prayer: "Father, You are glorious and majestic. Help me see Your greatness above every earthly power or challenge."
                ),
                PrayerVerse(
                    id: "psalm-76-5",
                    reference: "Psalm 76:5",
                    text: "The stouthearted were plundered,\n  They sank into sleep;\n  And none of the warriors could use his hands.",
                    prayer: "Lord, no strength can stand against You. Teach me to rely on Your power instead of my own ability."
                ),
                PrayerVerse(
                    id: "psalm-76-6",
                    reference: "Psalm 76:6",
                    text: "At Your rebuke, O God of Jacob,\n  Both rider and horse were cast into a dead sleep.",
                    prayer: "Father, when You speak, all creation responds. Help me listen to Your voice with humility and trust."
                ),
                PrayerVerse(
                    id: "psalm-76-7",
                    reference: "Psalm 76:7",
                    text: "You, even You, are to be feared;\n  And who may stand in Your presence when once You are angry?",
                    prayer: "Lord, You are to be feared with holy reverence. Teach me to live with awe, respect, and obedience before You."
                ),
                PrayerVerse(
                    id: "psalm-76-8",
                    reference: "Psalm 76:8",
                    text: "You caused judgment to be heard from heaven;\n  The earth feared and was still",
                    prayer: "Father, Your judgment is righteous and true. Help me trust Your justice even when I do not understand Your timing."
                ),
                PrayerVerse(
                    id: "psalm-76-9",
                    reference: "Psalm 76:9",
                    text: "When God arose to judgment,\n  To save all the humble of the earth. Selah.",
                    prayer: "Lord, thank You for rising to save the humble and afflicted. Help me trust Your compassion and protection."
                ),
                PrayerVerse(
                    id: "psalm-76-10",
                    reference: "Psalm 76:10",
                    text: "For the wrath of man shall praise You;\n  With a remnant of wrath You will gird Yourself.",
                    prayer: "Father, even human anger cannot overpower Your purposes. Turn every situation toward Your glory and truth."
                ),
                PrayerVerse(
                    id: "psalm-76-11",
                    reference: "Psalm 76:11",
                    text: "Make vows to the Lord your God and fulfill them;\n  Let all who are around Him bring gifts to Him who is to be feared.",
                    prayer: "Lord, help me fulfill my commitments to You and bring offerings of praise, obedience, and devotion."
                ),
                PrayerVerse(
                    id: "psalm-76-12",
                    reference: "Psalm 76:12",
                    text: "He will cut off the spirit of princes;\n  He is feared by the kings of the earth.",
                    prayer: "Father, You are sovereign over every ruler, power, and authority. Help me trust Your rule above all earthly strength."
                ),
                PrayerVerse(
                    id: "psalm-76-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your power, majesty, justice, and saving mercy. Help me live with holy reverence, trust Your authority, and rest in Your protection. Break every fear that rises against my faith, and teach me to honor You with obedience, worship, and gratitude. May my life reflect confidence in Your sovereign rule and praise for Your glorious name.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 77,
            title: "I Cried to God",
            chapterReference: "Psalm 77",
            summary: "Pray for remembrance of God's faithfulness.",
            // JSON resource: psalm_77_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-77-1",
                    reference: "Psalm 77:1",
                    text: "My voice rises to God, and I will cry aloud;\n  My voice rises to God, and He will hear me.",
                    prayer: "Lord, I cry aloud to You, trusting that You hear me. Help me bring every fear, burden, and question honestly before You."
                ),
                PrayerVerse(
                    id: "psalm-77-2",
                    reference: "Psalm 77:2",
                    text: "In the day of my trouble I sought the Lord;\n  In the night my hand was stretched out without weariness;\n  My soul refused to be comforted.",
                    prayer: "Father, when I am in distress, teach me to seek You first. Comfort my heart when my soul feels weary and troubled."
                ),
                PrayerVerse(
                    id: "psalm-77-3",
                    reference: "Psalm 77:3",
                    text: "When I remember God, then I am disturbed;\n  When I sigh, then my spirit grows faint. Selah.",
                    prayer: "Lord, when remembering my struggles makes me restless, steady my spirit and help me rest in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-77-4",
                    reference: "Psalm 77:4",
                    text: "You have held my eyelids open;\n  I am so troubled that I cannot speak.",
                    prayer: "Father, when I cannot sleep or find words to pray, remain near to me and quiet my anxious thoughts."
                ),
                PrayerVerse(
                    id: "psalm-77-5",
                    reference: "Psalm 77:5",
                    text: "I have considered the days of old,\n  The years of long ago.",
                    prayer: "Lord, help me remember the days of Your faithfulness. Let past testimonies strengthen my trust in You today."
                ),
                PrayerVerse(
                    id: "psalm-77-6",
                    reference: "Psalm 77:6",
                    text: "I will remember my song in the night;\n  I will meditate with my heart,\n  And my spirit ponders:",
                    prayer: "Father, when I search my heart in the night, guide my thoughts toward Your truth, mercy, and unfailing love."
                ),
                PrayerVerse(
                    id: "psalm-77-7",
                    reference: "Psalm 77:7",
                    text: "Will the Lord reject forever?\n  And will He never be favorable again?",
                    prayer: "Lord, when I wonder whether You have forgotten me, remind me that Your love is steadfast and Your presence remains near."
                ),
                PrayerVerse(
                    id: "psalm-77-8",
                    reference: "Psalm 77:8",
                    text: "Has His lovingkindness ceased forever?\n  Has His promise come to an end forever?",
                    prayer: "Father, when doubts rise within me, help me remember that Your lovingkindness has not ended and Your promises have not failed."
                ),
                PrayerVerse(
                    id: "psalm-77-9",
                    reference: "Psalm 77:9",
                    text: "Has God forgotten to be gracious,\n  Or has He in anger withdrawn His compassion? Selah.",
                    prayer: "Lord, when my pain makes it hard to see Your mercy, open my eyes again to Your compassion and faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-77-10",
                    reference: "Psalm 77:10",
                    text: "Then I said, “It is my grief,\n  That the right hand of the Most High has changed.”",
                    prayer: "Father, when my heart feels weak, help me turn my thoughts toward Your power and the works of Your mighty hand."
                ),
                PrayerVerse(
                    id: "psalm-77-11",
                    reference: "Psalm 77:11",
                    text: "I shall remember the deeds of the Lord;\n  Surely I will remember Your wonders of old.",
                    prayer: "Lord, I will remember Your deeds. Help me recall Your wonders and trust that You are still working in my life."
                ),
                PrayerVerse(
                    id: "psalm-77-12",
                    reference: "Psalm 77:12",
                    text: "I will meditate on all Your work\n  And muse on Your deeds.",
                    prayer: "Father, teach me to meditate on all You have done and consider Your works with gratitude, faith, and reverence."
                ),
                PrayerVerse(
                    id: "psalm-77-13",
                    reference: "Psalm 77:13",
                    text: "Your way, O God, is holy;\n  What god is great like our God?",
                    prayer: "Lord, Your way is holy. Help me trust Your character and remember that there is no god as great as You."
                ),
                PrayerVerse(
                    id: "psalm-77-14",
                    reference: "Psalm 77:14",
                    text: "You are the God who works wonders;\n  You have made known Your strength among the peoples.",
                    prayer: "Father, You are the God who works wonders. Show Your strength in my life and help me trust Your power."
                ),
                PrayerVerse(
                    id: "psalm-77-15",
                    reference: "Psalm 77:15",
                    text: "You have by Your power redeemed Your people,\n  The sons of Jacob and Joseph. Selah.",
                    prayer: "Lord, thank You for redeeming Your people. Remind me that Your salvation is greater than every fear and trouble I face."
                ),
                PrayerVerse(
                    id: "psalm-77-16",
                    reference: "Psalm 77:16",
                    text: "The waters saw You, O God;\n  The waters saw You, they were in anguish;\n  The deeps also trembled.",
                    prayer: "Father, creation responds to Your power. Help me stand in awe of Your greatness and trust Your authority over every storm."
                ),
                PrayerVerse(
                    id: "psalm-77-17",
                    reference: "Psalm 77:17",
                    text: "The clouds poured out water;\n  The skies gave forth a sound;\n  Your arrows flashed here and there.",
                    prayer: "Lord, when life feels like thunder, rain, and lightning around me, help me remember that You remain sovereign over all things."
                ),
                PrayerVerse(
                    id: "psalm-77-18",
                    reference: "Psalm 77:18",
                    text: "The sound of Your thunder was in the whirlwind;\n  The lightnings lit up the world;\n  The earth trembled and shook.",
                    prayer: "Father, Your voice is powerful and Your presence shakes creation. Help me listen with reverence and follow You with trust."
                ),
                PrayerVerse(
                    id: "psalm-77-19",
                    reference: "Psalm 77:19",
                    text: "Your way was in the sea\n  And Your paths in the mighty waters,\n  And Your footprints may not be known.",
                    prayer: "Lord, even when Your path is hidden and I cannot see Your footprints, help me trust that You are leading me faithfully."
                ),
                PrayerVerse(
                    id: "psalm-77-20",
                    reference: "Psalm 77:20",
                    text: "You led Your people like a flock\n  By the hand of Moses and Aaron.",
                    prayer: "Father, thank You for shepherding Your people with care. Lead me gently, guide me wisely, and keep me close to You."
                ),
                PrayerVerse(
                    id: "psalm-77-closing",
                    reference: "Closing",
                    text: "Lord, thank You for hearing me when I cry out and for remaining faithful when my heart feels troubled. Help me remember Your works, trust Your promises, and meditate on Your goodness in every season. When Your path is hard to see, remind me that You are still guiding me as a faithful Shepherd. Strengthen my faith, quiet my fears, and keep my heart anchored in Your holy and unfailing love.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 78,
            title: "Tell the Next Generation",
            chapterReference: "Psalm 78",
            summary: "Pray for faithfulness in teaching God's ways.",
            // JSON resource: psalm_78_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-78-1",
                    reference: "Psalm 78:1",
                    text: "Listen, O my people, to my instruction;\n    Incline your ears to the words of my mouth.",
                    prayer: "Lord, open my ears to Your instruction and help me listen carefully to the wisdom of Your Word."
                ),
                PrayerVerse(
                    id: "psalm-78-2",
                    reference: "Psalm 78:2",
                    text: "I will open my mouth in a parable;\n    I will utter dark sayings of old,",
                    prayer: "Father, teach me to receive the truths You reveal and understand the lessons You want my heart to learn."
                ),
                PrayerVerse(
                    id: "psalm-78-3",
                    reference: "Psalm 78:3",
                    text: "Which we have heard and known,\n    And our fathers have told us.",
                    prayer: "Lord, thank You for the testimonies passed down through generations. Help me remember and value what You have done."
                ),
                PrayerVerse(
                    id: "psalm-78-4",
                    reference: "Psalm 78:4",
                    text: "We will not conceal them from their children,\n    But tell to the generation to come the praises of the Lord,\n    And His strength and His wondrous works that He has done.",
                    prayer: "Father, help me faithfully declare Your praise, strength, and wonderful works to the next generation."
                ),
                PrayerVerse(
                    id: "psalm-78-5",
                    reference: "Psalm 78:5",
                    text: "For He established a testimony in Jacob\n    And appointed a law in Israel,\n    Which He commanded our fathers\n    That they should teach them to their children,",
                    prayer: "Lord, thank You for giving Your people truth and instruction. Help me build my life on Your Word and share it faithfully."
                ),
                PrayerVerse(
                    id: "psalm-78-6",
                    reference: "Psalm 78:6",
                    text: "That the generation to come might know, even the children yet to be born,\n    That they may arise and tell them to their children,",
                    prayer: "Father, let future generations know Your goodness. Use my life to help others place their hope in You."
                ),
                PrayerVerse(
                    id: "psalm-78-7",
                    reference: "Psalm 78:7",
                    text: "That they should put their confidence in God\n    And not forget the works of God,\n    But keep His commandments,",
                    prayer: "Lord, help me set my hope in You, remember Your works, and keep Your commandments with a faithful heart."
                ),
                PrayerVerse(
                    id: "psalm-78-8",
                    reference: "Psalm 78:8",
                    text: "And not be like their fathers,\n    A stubborn and rebellious generation,\n    A generation that did not prepare its heart\n    And whose spirit was not faithful to God.",
                    prayer: "Father, keep me from stubbornness and rebellion. Give me a steadfast heart that remains faithful to You."
                ),
                PrayerVerse(
                    id: "psalm-78-9",
                    reference: "Psalm 78:9",
                    text: "The sons of Ephraim were archers equipped with bows,\n    Yet they turned back in the day of battle.",
                    prayer: "Lord, when I am equipped for battle but tempted to retreat, give me courage to stand firm in faith."
                ),
                PrayerVerse(
                    id: "psalm-78-10",
                    reference: "Psalm 78:10",
                    text: "They did not keep the covenant of God\n    And refused to walk in His law;",
                    prayer: "Father, help me keep Your covenant and walk obediently according to Your instruction."
                ),
                PrayerVerse(
                    id: "psalm-78-11",
                    reference: "Psalm 78:11",
                    text: "They forgot His deeds\n    And His miracles that He had shown them.",
                    prayer: "Lord, protect me from forgetting Your works. Keep Your faithfulness fresh in my heart and mind."
                ),
                PrayerVerse(
                    id: "psalm-78-12",
                    reference: "Psalm 78:12",
                    text: "He wrought wonders before their fathers\n    In the land of Egypt, in the field of Zoan.",
                    prayer: "Father, remind me of the wonders You have done for Your people and help me trust Your power today."
                ),
                PrayerVerse(
                    id: "psalm-78-13",
                    reference: "Psalm 78:13",
                    text: "He divided the sea and caused them to pass through,\n    And He made the waters stand up like a heap.",
                    prayer: "Lord, You made a way through the sea. Help me believe that You can make a way through every impossible situation."
                ),
                PrayerVerse(
                    id: "psalm-78-14",
                    reference: "Psalm 78:14",
                    text: "Then He led them with the cloud by day\n    And all the night with a light of fire.",
                    prayer: "Father, thank You for guiding Your people by day and night. Guide my steps with Your presence and wisdom."
                ),
                PrayerVerse(
                    id: "psalm-78-15",
                    reference: "Psalm 78:15",
                    text: "He split the rocks in the wilderness\n    And gave them abundant drink like the ocean depths.",
                    prayer: "Lord, You provided water from the rock. Refresh my soul and provide for me in ways only You can."
                ),
                PrayerVerse(
                    id: "psalm-78-16",
                    reference: "Psalm 78:16",
                    text: "He brought forth streams also from the rock\n    And caused waters to run down like rivers.",
                    prayer: "Father, let Your provision flow into the dry places of my life and remind me that You are faithful."
                ),
                PrayerVerse(
                    id: "psalm-78-17",
                    reference: "Psalm 78:17",
                    text: "Yet they still continued to sin against Him,\n    To rebel against the Most High in the desert.",
                    prayer: "Lord, forgive me when I continue in sin despite Your goodness. Turn my heart back to obedience."
                ),
                PrayerVerse(
                    id: "psalm-78-18",
                    reference: "Psalm 78:18",
                    text: "And in their heart they put God to the test\n    By asking food according to their desire.",
                    prayer: "Father, protect me from testing You with unbelief. Help me trust Your care without demanding my own way."
                ),
                PrayerVerse(
                    id: "psalm-78-19",
                    reference: "Psalm 78:19",
                    text: "Then they spoke against God;\n    They said, “Can God prepare a table in the wilderness?",
                    prayer: "Lord, forgive me when I question Your ability to provide. Strengthen my confidence in Your power."
                ),
                PrayerVerse(
                    id: "psalm-78-20",
                    reference: "Psalm 78:20",
                    text: "Behold, He struck the rock so that waters gushed out,\n    And streams were overflowing;\n    Can He give bread also?\n    Will He provide meat for His people?”",
                    prayer: "Father, You have provided before, and You can provide again. Help me remember Your past faithfulness when I face present needs."
                ),
                PrayerVerse(
                    id: "psalm-78-21",
                    reference: "Psalm 78:21",
                    text: "Therefore the Lord heard and was full of wrath;\n    And a fire was kindled against Jacob\n    And anger also mounted against Israel,",
                    prayer: "Lord, when my heart complains or doubts, correct me with mercy and lead me back to trust."
                ),
                PrayerVerse(
                    id: "psalm-78-22",
                    reference: "Psalm 78:22",
                    text: "Because they did not believe in God\n    And did not trust in His salvation.",
                    prayer: "Father, help me believe in You fully and trust in Your salvation with a steady heart."
                ),
                PrayerVerse(
                    id: "psalm-78-23",
                    reference: "Psalm 78:23",
                    text: "Yet He commanded the clouds above\n    And opened the doors of heaven;",
                    prayer: "Lord, thank You for opening heaven and providing for Your people. Help me receive Your gifts with gratitude."
                ),
                PrayerVerse(
                    id: "psalm-78-24",
                    reference: "Psalm 78:24",
                    text: "He rained down manna upon them to eat\n    And gave them food from heaven.",
                    prayer: "Father, thank You for daily provision. Teach me not to take Your blessings for granted."
                ),
                PrayerVerse(
                    id: "psalm-78-25",
                    reference: "Psalm 78:25",
                    text: "Man did eat the bread of angels;\n    He sent them food in abundance.",
                    prayer: "Lord, You fed Your people with abundance. Help me trust that You know exactly what I need."
                ),
                PrayerVerse(
                    id: "psalm-78-26",
                    reference: "Psalm 78:26",
                    text: "He caused the east wind to blow in the heavens\n    And by His power He directed the south wind.",
                    prayer: "Father, command the winds and direct circumstances according to Your wisdom. Help me trust Your control over all things."
                ),
                PrayerVerse(
                    id: "psalm-78-27",
                    reference: "Psalm 78:27",
                    text: "When He rained meat upon them like the dust,\n    Even winged fowl like the sand of the seas,",
                    prayer: "Lord, thank You for providing abundantly. Give me a grateful heart that recognizes Your generosity."
                ),
                PrayerVerse(
                    id: "psalm-78-28",
                    reference: "Psalm 78:28",
                    text: "Then He let them fall in the midst of their camp,\n    Round about their dwellings.",
                    prayer: "Father, let Your provision reach the exact places where it is needed. Help me depend on Your timing."
                ),
                PrayerVerse(
                    id: "psalm-78-29",
                    reference: "Psalm 78:29",
                    text: "So they ate and were well filled,\n    And their desire He gave to them.",
                    prayer: "Lord, thank You for satisfying needs according to Your will. Teach me contentment and gratitude."
                ),
                PrayerVerse(
                    id: "psalm-78-30",
                    reference: "Psalm 78:30",
                    text: "Before they had satisfied their desire,\n    While their food was in their mouths,",
                    prayer: "Father, guard my heart from craving more than what You provide. Teach me to desire You above all."
                ),
                PrayerVerse(
                    id: "psalm-78-31",
                    reference: "Psalm 78:31",
                    text: "The anger of God rose against them\n    And killed some of their stoutest ones,\n    And subdued the choice men of Israel.",
                    prayer: "Lord, help me take Your holiness seriously and live with reverence, humility, and obedience."
                ),
                PrayerVerse(
                    id: "psalm-78-32",
                    reference: "Psalm 78:32",
                    text: "In spite of all this they still sinned\n    And did not believe in His wonderful works.",
                    prayer: "Father, forgive me when I see Your works yet still struggle to trust You. Strengthen my faith."
                ),
                PrayerVerse(
                    id: "psalm-78-33",
                    reference: "Psalm 78:33",
                    text: "So He brought their days to an end in futility\n    And their years in sudden terror.",
                    prayer: "Lord, teach me not to waste my days in unbelief, but to live with purpose, trust, and obedience."
                ),
                PrayerVerse(
                    id: "psalm-78-34",
                    reference: "Psalm 78:34",
                    text: "When He killed them, then they sought Him,\n    And returned and searched diligently for God;",
                    prayer: "Father, when hardship brings me back to You, help my repentance be sincere and lasting."
                ),
                PrayerVerse(
                    id: "psalm-78-35",
                    reference: "Psalm 78:35",
                    text: "And they remembered that God was their rock,\n    And the Most High God their Redeemer.",
                    prayer: "Lord, remind me that You are my rock, my Redeemer, and the Most High God."
                ),
                PrayerVerse(
                    id: "psalm-78-36",
                    reference: "Psalm 78:36",
                    text: "But they deceived Him with their mouth\n    And lied to Him with their tongue.",
                    prayer: "Father, keep my worship from becoming empty words. Let my devotion be sincere and true."
                ),
                PrayerVerse(
                    id: "psalm-78-37",
                    reference: "Psalm 78:37",
                    text: "For their heart was not steadfast toward Him,\n    Nor were they faithful in His covenant.",
                    prayer: "Lord, make my heart steadfast before You and help me remain faithful to Your covenant."
                ),
                PrayerVerse(
                    id: "psalm-78-38",
                    reference: "Psalm 78:38",
                    text: "But He, being compassionate, forgave their iniquity and did not destroy them;\n    And often He restrained His anger\n    And did not arouse all His wrath.",
                    prayer: "Father, thank You for being compassionate, forgiving, and patient. Your mercy holds back what I deserve."
                ),
                PrayerVerse(
                    id: "psalm-78-39",
                    reference: "Psalm 78:39",
                    text: "Thus He remembered that they were but flesh,\n    A wind that passes and does not return.",
                    prayer: "Lord, remember my weakness with compassion. Help me depend on Your grace each day."
                ),
                PrayerVerse(
                    id: "psalm-78-40",
                    reference: "Psalm 78:40",
                    text: "How often they rebelled against Him in the wilderness\n    And grieved Him in the desert!",
                    prayer: "Father, forgive me for the ways I grieve Your heart. Teach me to walk in obedience and gratitude."
                ),
                PrayerVerse(
                    id: "psalm-78-41",
                    reference: "Psalm 78:41",
                    text: "Again and again they tempted God,\n    And pained the Holy One of Israel.",
                    prayer: "Lord, keep me from limiting You by unbelief. Help me trust Your power without fear."
                ),
                PrayerVerse(
                    id: "psalm-78-42",
                    reference: "Psalm 78:42",
                    text: "They did not remember His power,\n    The day when He redeemed them from the adversary,",
                    prayer: "Father, help me remember Your hand of deliverance and the ways You have rescued me."
                ),
                PrayerVerse(
                    id: "psalm-78-43",
                    reference: "Psalm 78:43",
                    text: "When He performed His signs in Egypt\n    And His marvels in the field of Zoan,",
                    prayer: "Lord, remind me of Your signs and wonders, and let them strengthen my faith in Your authority."
                ),
                PrayerVerse(
                    id: "psalm-78-44",
                    reference: "Psalm 78:44",
                    text: "And turned their rivers to blood,\n    And their streams, they could not drink.",
                    prayer: "Father, You are sovereign over creation and judgment. Help me honor Your holiness."
                ),
                PrayerVerse(
                    id: "psalm-78-45",
                    reference: "Psalm 78:45",
                    text: "He sent among them swarms of flies which devoured them,\n    And frogs which destroyed them.",
                    prayer: "Lord, protect me from the consequences of rebellion and lead me into the safety of obedience."
                ),
                PrayerVerse(
                    id: "psalm-78-46",
                    reference: "Psalm 78:46",
                    text: "He gave also their crops to the grasshopper\n    And the product of their labor to the locust.",
                    prayer: "Father, help me recognize that everything I have belongs to You and should be used for Your glory."
                ),
                PrayerVerse(
                    id: "psalm-78-47",
                    reference: "Psalm 78:47",
                    text: "He destroyed their vines with hailstones\n    And their sycamore trees with frost.",
                    prayer: "Lord, when loss or hardship comes, help me remain faithful and trust Your purposes."
                ),
                PrayerVerse(
                    id: "psalm-78-48",
                    reference: "Psalm 78:48",
                    text: "He gave over their cattle also to the hailstones\n    And their herds to bolts of lightning.",
                    prayer: "Father, protect what You have entrusted to me and help me steward every blessing wisely."
                ),
                PrayerVerse(
                    id: "psalm-78-49",
                    reference: "Psalm 78:49",
                    text: "He sent upon them His burning anger,\n    Fury and indignation and trouble,\n    A band of destroying angels.",
                    prayer: "Lord, Your judgment is serious and holy. Teach me to live with reverence and awe before You."
                ),
                PrayerVerse(
                    id: "psalm-78-50",
                    reference: "Psalm 78:50",
                    text: "He leveled a path for His anger;\n    He did not spare their soul from death,\n    But gave over their life to the plague,",
                    prayer: "Father, thank You for making a way of deliverance. Help me walk in the freedom of Your mercy."
                ),
                PrayerVerse(
                    id: "psalm-78-51",
                    reference: "Psalm 78:51",
                    text: "And smote all the firstborn in Egypt,\n    The first issue of their virility in the tents of Ham.",
                    prayer: "Lord, remind me that every household and generation needs Your salvation and protection."
                ),
                PrayerVerse(
                    id: "psalm-78-52",
                    reference: "Psalm 78:52",
                    text: "But He led forth His own people like sheep\n    And guided them in the wilderness like a flock;",
                    prayer: "Father, thank You for leading Your people like sheep. Shepherd my life with patience and care."
                ),
                PrayerVerse(
                    id: "psalm-78-53",
                    reference: "Psalm 78:53",
                    text: "He led them safely, so that they did not fear;\n    But the sea engulfed their enemies.",
                    prayer: "Lord, guide me safely and keep fear from ruling my heart as I follow You."
                ),
                PrayerVerse(
                    id: "psalm-78-54",
                    reference: "Psalm 78:54",
                    text: "So He brought them to His holy land,\n    To this hill country which His right hand had gained.",
                    prayer: "Father, bring me into the place You have prepared and help me recognize Your faithful hand."
                ),
                PrayerVerse(
                    id: "psalm-78-55",
                    reference: "Psalm 78:55",
                    text: "He also drove out the nations before them\n    And apportioned them for an inheritance by measurement,\n    And made the tribes of Israel dwell in their tents.",
                    prayer: "Lord, thank You for providing inheritance and blessing. Help me receive Your gifts with humility."
                ),
                PrayerVerse(
                    id: "psalm-78-56",
                    reference: "Psalm 78:56",
                    text: "Yet they tempted and rebelled against the Most High God\n    And did not keep His testimonies,",
                    prayer: "Father, protect me from testing You or resisting Your instruction. Give me a submissive heart."
                ),
                PrayerVerse(
                    id: "psalm-78-57",
                    reference: "Psalm 78:57",
                    text: "But turned back and acted treacherously like their fathers;\n    They turned aside like a treacherous bow.",
                    prayer: "Lord, keep me from turning away like an unfaithful heart. Make me steady and trustworthy before You."
                ),
                PrayerVerse(
                    id: "psalm-78-58",
                    reference: "Psalm 78:58",
                    text: "For they provoked Him with their high places\n    And aroused His jealousy with their graven images.",
                    prayer: "Father, remove every idol and divided affection from my life. Help me worship You alone."
                ),
                PrayerVerse(
                    id: "psalm-78-59",
                    reference: "Psalm 78:59",
                    text: "When God heard, He was filled with wrath\n    And greatly abhorred Israel;",
                    prayer: "Lord, when sin grieves You, help me repent quickly and return to Your ways."
                ),
                PrayerVerse(
                    id: "psalm-78-60",
                    reference: "Psalm 78:60",
                    text: "So that He abandoned the dwelling place at Shiloh,\n    The tent which He had pitched among men,",
                    prayer: "Father, help me never take Your presence for granted. Teach me to honor where You dwell."
                ),
                PrayerVerse(
                    id: "psalm-78-61",
                    reference: "Psalm 78:61",
                    text: "And gave up His strength to captivity\n    And His glory into the hand of the adversary.",
                    prayer: "Lord, preserve what displays Your strength and glory in my life. Keep me close to Your presence."
                ),
                PrayerVerse(
                    id: "psalm-78-62",
                    reference: "Psalm 78:62",
                    text: "He also delivered His people to the sword,\n    And was filled with wrath at His inheritance.",
                    prayer: "Father, protect Your people and lead us away from rebellion into faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-78-63",
                    reference: "Psalm 78:63",
                    text: "Fire devoured His young men,\n    And His virgins had no wedding songs.",
                    prayer: "Lord, when judgment and loss come, teach me to learn, repent, and seek Your restoration."
                ),
                PrayerVerse(
                    id: "psalm-78-64",
                    reference: "Psalm 78:64",
                    text: "His priests fell by the sword,\n    And His widows could not weep.",
                    prayer: "Father, comfort those who mourn and restore what has been broken by sin, loss, or hardship."
                ),
                PrayerVerse(
                    id: "psalm-78-65",
                    reference: "Psalm 78:65",
                    text: "Then the Lord awoke as if from sleep,\n    Like a warrior overcome by wine.",
                    prayer: "Lord, rise up with power and mercy. Awaken hope where there has been discouragement."
                ),
                PrayerVerse(
                    id: "psalm-78-66",
                    reference: "Psalm 78:66",
                    text: "He drove His adversaries backward;\n    He put on them an everlasting reproach.",
                    prayer: "Father, defeat what opposes Your will and establish Your righteousness in my life."
                ),
                PrayerVerse(
                    id: "psalm-78-67",
                    reference: "Psalm 78:67",
                    text: "He also rejected the tent of Joseph,\n    And did not choose the tribe of Ephraim,",
                    prayer: "Lord, help me trust Your choices, even when they are different from what I expected."
                ),
                PrayerVerse(
                    id: "psalm-78-68",
                    reference: "Psalm 78:68",
                    text: "But chose the tribe of Judah,\n    Mount Zion which He loved.",
                    prayer: "Father, thank You for choosing what belongs to You. Help me value Your presence above all."
                ),
                PrayerVerse(
                    id: "psalm-78-69",
                    reference: "Psalm 78:69",
                    text: "And He built His sanctuary like the heights,\n    Like the earth which He has founded forever.",
                    prayer: "Lord, establish Your work firmly and make my life a dwelling place for Your glory."
                ),
                PrayerVerse(
                    id: "psalm-78-70",
                    reference: "Psalm 78:70",
                    text: "He also chose David His servant\n    And took him from the sheepfolds;",
                    prayer: "Father, thank You for calling ordinary people into Your purposes. Help me serve faithfully where You place me."
                ),
                PrayerVerse(
                    id: "psalm-78-71",
                    reference: "Psalm 78:71",
                    text: "From the care of the ewes with suckling lambs He brought him\n    To shepherd Jacob His people,\n    And Israel His inheritance.",
                    prayer: "Lord, shape me into a faithful shepherd of what You entrust to me. Help me care for others with humility and love."
                ),
                PrayerVerse(
                    id: "psalm-78-72",
                    reference: "Psalm 78:72",
                    text: "So he shepherded them according to the integrity of his heart,\n    And guided them with his skillful hands.",
                    prayer: "Father, give me integrity of heart and skillful hands. Help me lead, serve, and live faithfully before You."
                ),
                PrayerVerse(
                    id: "psalm-78-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your patience, compassion, guidance, and faithfulness through every generation. Help me remember Your works, trust Your provision, and walk in obedience to Your Word. Keep my heart from rebellion, unbelief, and forgetfulness. Teach me to pass on Your truth, serve with integrity, and live as a testimony of Your mercy and power.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 79,
            title: "Help Us, O God",
            chapterReference: "Psalm 79",
            summary: "Pray for mercy and deliverance.",
            // JSON resource: psalm_79_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-79-1",
                    reference: "Psalm 79:1",
                    text: "O God, the nations have invaded Your inheritance;\n    They have defiled Your holy temple;\n    They have laid Jerusalem in ruins.",
                    prayer: "Lord, when sacred things are broken or dishonored, help me grieve with faith and trust that You are still present and sovereign."
                ),
                PrayerVerse(
                    id: "psalm-79-2",
                    reference: "Psalm 79:2",
                    text: "They have given the dead bodies of Your servants for food to the birds of the heavens,\n    The flesh of Your godly ones to the beasts of the earth.",
                    prayer: "Father, protect Your people and bring dignity, mercy, and care where there has been loss, suffering, or destruction."
                ),
                PrayerVerse(
                    id: "psalm-79-3",
                    reference: "Psalm 79:3",
                    text: "They have poured out their blood like water round about Jerusalem;\n    And there was no one to bury them.",
                    prayer: "Lord, when sorrow surrounds me, help me bring my pain honestly before You and trust Your compassion."
                ),
                PrayerVerse(
                    id: "psalm-79-4",
                    reference: "Psalm 79:4",
                    text: "We have become a reproach to our neighbors,\n    A scoffing and derision to those around us.",
                    prayer: "Father, when I feel mocked, rejected, or misunderstood, remind me that my identity is secure in You."
                ),
                PrayerVerse(
                    id: "psalm-79-5",
                    reference: "Psalm 79:5",
                    text: "How long, O Lord? Will You be angry forever?\n    Will Your jealousy burn like fire?",
                    prayer: "Lord, when hardship feels long and overwhelming, strengthen my patience and renew my hope in Your mercy."
                ),
                PrayerVerse(
                    id: "psalm-79-6",
                    reference: "Psalm 79:6",
                    text: "Pour out Your wrath upon the nations which do not know You,\n    And upon the kingdoms which do not call upon Your name.",
                    prayer: "Father, bring justice where Your name is rejected and Your truth is ignored. Help me trust Your righteous judgment."
                ),
                PrayerVerse(
                    id: "psalm-79-7",
                    reference: "Psalm 79:7",
                    text: "For they have devoured Jacob\n    And laid waste his habitation.",
                    prayer: "Lord, restore what has been damaged by sin, rebellion, or destruction. Let Your mercy bring healing and renewal."
                ),
                PrayerVerse(
                    id: "psalm-79-8",
                    reference: "Psalm 79:8",
                    text: "Do not remember the iniquities of our forefathers against us;\n    Let Your compassion come quickly to meet us,\n    For we are brought very low.",
                    prayer: "Father, do not remember past sins against me. Meet me with compassion and help me walk in repentance and grace."
                ),
                PrayerVerse(
                    id: "psalm-79-9",
                    reference: "Psalm 79:9",
                    text: "Help us, O God of our salvation, for the glory of Your name;\n    And deliver us and forgive our sins for Your name’s sake.",
                    prayer: "Lord, help me for the glory of Your name. Deliver me, forgive me, and let my life reflect Your mercy and salvation."
                ),
                PrayerVerse(
                    id: "psalm-79-10",
                    reference: "Psalm 79:10",
                    text: "Why should the nations say, “Where is their God?”\n    Let there be known among the nations in our sight,\n    Vengeance for the blood of Your servants which has been shed.",
                    prayer: "Father, let Your name be honored among all people. Show Your faithfulness so others may know that You are God."
                ),
                PrayerVerse(
                    id: "psalm-79-11",
                    reference: "Psalm 79:11",
                    text: "Let the groaning of the prisoner come before You;\n    According to the greatness of Your power preserve those who are doomed to die.",
                    prayer: "Lord, hear the groaning of those who suffer. Bring freedom, mercy, and hope to those who feel trapped or condemned."
                ),
                PrayerVerse(
                    id: "psalm-79-12",
                    reference: "Psalm 79:12",
                    text: "And return to our neighbors sevenfold into their bosom\n    The reproach with which they have reproached You, O Lord.",
                    prayer: "Father, deal with injustice according to Your wisdom. Help me leave vengeance in Your hands and walk in faithfulness."
                ),
                PrayerVerse(
                    id: "psalm-79-13",
                    reference: "Psalm 79:13",
                    text: "So we Your people and the sheep of Your pasture\n    Will give thanks to You forever;\n    To all generations we will tell of Your praise.",
                    prayer: "Lord, thank You for making us the sheep of Your pasture. Help me give thanks to You forever and declare Your praise to every generation."
                ),
                PrayerVerse(
                    id: "psalm-79-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being merciful, just, and faithful even in seasons of sorrow, loss, and confusion. Help me trust You when life feels broken, seek Your forgiveness with humility, and rely on Your compassion. Restore what has been damaged, defend Your name, and teach me to praise You through every generation. May my life remain grateful, faithful, and anchored in Your salvation.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 80,
            title: "Restore Us",
            chapterReference: "Psalm 80",
            summary: "Pray for renewal and God's favor.",
            // JSON resource: psalm_80_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-80-1",
                    reference: "Psalm 80:1",
                    text: "Oh, give ear, Shepherd of Israel,\n    You who lead Joseph like a flock;\n    You who are enthroned above the cherubim, shine forth!",
                    prayer: "Lord, Shepherd of Your people, hear my prayer. Lead me with Your wisdom, care, and faithful presence."
                ),
                PrayerVerse(
                    id: "psalm-80-2",
                    reference: "Psalm 80:2",
                    text: "Before Ephraim and Benjamin and Manasseh, stir up Your power\n    And come to save us!",
                    prayer: "Father, awaken Your strength and come to help me. Let Your power bring rescue, renewal, and hope."
                ),
                PrayerVerse(
                    id: "psalm-80-3",
                    reference: "Psalm 80:3",
                    text: "O God, restore us\n    And cause Your face to shine upon us, and we will be saved.",
                    prayer: "Lord, restore me and let Your face shine upon me. Bring salvation, peace, and spiritual renewal to my heart."
                ),
                PrayerVerse(
                    id: "psalm-80-4",
                    reference: "Psalm 80:4",
                    text: "O Lord God of hosts,\n    How long will You be angry with the prayer of Your people?",
                    prayer: "Father, when prayer feels heavy and answers feel delayed, help me keep seeking You with faith and patience."
                ),
                PrayerVerse(
                    id: "psalm-80-5",
                    reference: "Psalm 80:5",
                    text: "You have fed them with the bread of tears,\n    And You have made them to drink tears in large measure.",
                    prayer: "Lord, when sorrow feels like daily bread, comfort me with Your mercy and remind me that You are near."
                ),
                PrayerVerse(
                    id: "psalm-80-6",
                    reference: "Psalm 80:6",
                    text: "You make us an object of contention to our neighbors,\n    And our enemies laugh among themselves.",
                    prayer: "Father, when conflict or opposition surrounds me, protect my heart from discouragement and keep me anchored in You."
                ),
                PrayerVerse(
                    id: "psalm-80-7",
                    reference: "Psalm 80:7",
                    text: "O God of hosts, restore us\n    And cause Your face to shine upon us, and we will be saved.",
                    prayer: "Lord, restore me again and let Your face shine upon me. Let Your presence bring healing, strength, and salvation."
                ),
                PrayerVerse(
                    id: "psalm-80-8",
                    reference: "Psalm 80:8",
                    text: "You removed a vine from Egypt;\n    You drove out the nations and planted it.",
                    prayer: "Father, thank You for planting and establishing Your people. Help me remain rooted in Your purpose and care."
                ),
                PrayerVerse(
                    id: "psalm-80-9",
                    reference: "Psalm 80:9",
                    text: "You cleared the ground before it,\n    And it took deep root and filled the land.",
                    prayer: "Lord, prepare the ground of my heart so that faith, obedience, and love may grow deeply within me."
                ),
                PrayerVerse(
                    id: "psalm-80-10",
                    reference: "Psalm 80:10",
                    text: "The mountains were covered with its shadow,\n    And the cedars of God with its boughs.",
                    prayer: "Father, let the life You plant in me grow strong and become a testimony of Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-80-11",
                    reference: "Psalm 80:11",
                    text: "It was sending out its branches to the sea\n    And its shoots to the River.",
                    prayer: "Lord, expand the fruitfulness of my life according to Your will, and let my influence honor You."
                ),
                PrayerVerse(
                    id: "psalm-80-12",
                    reference: "Psalm 80:12",
                    text: "Why have You broken down its hedges,\n    So that all who pass that way pick its fruit?",
                    prayer: "Father, when protection feels removed or life feels exposed, help me return to You and trust Your covering."
                ),
                PrayerVerse(
                    id: "psalm-80-13",
                    reference: "Psalm 80:13",
                    text: "A boar from the forest eats it away\n    And whatever moves in the field feeds on it.",
                    prayer: "Lord, guard what You have planted in me from anything that would damage, weaken, or destroy it."
                ),
                PrayerVerse(
                    id: "psalm-80-14",
                    reference: "Psalm 80:14",
                    text: "O God of hosts, turn again now, we beseech You;\n    Look down from heaven and see, and take care of this vine,",
                    prayer: "Father, turn again toward me with mercy. Look upon what You have planted and restore it by Your grace."
                ),
                PrayerVerse(
                    id: "psalm-80-15",
                    reference: "Psalm 80:15",
                    text: "Even the shoot which Your right hand has planted,\n    And on the son whom You have strengthened for Yourself.",
                    prayer: "Lord, strengthen the work of Your hand. Establish what You have chosen and nurture what belongs to You."
                ),
                PrayerVerse(
                    id: "psalm-80-16",
                    reference: "Psalm 80:16",
                    text: "It is burned with fire, it is cut down;\n    They perish at the rebuke of Your countenance.",
                    prayer: "Father, when things feel burned, broken, or cut down, bring renewal through Your presence and power."
                ),
                PrayerVerse(
                    id: "psalm-80-17",
                    reference: "Psalm 80:17",
                    text: "Let Your hand be upon the man of Your right hand,\n    Upon the son of man whom You made strong for Yourself.",
                    prayer: "Lord, let Your hand be upon the one You strengthen. Uphold me by Your grace and help me remain faithful."
                ),
                PrayerVerse(
                    id: "psalm-80-18",
                    reference: "Psalm 80:18",
                    text: "Then we shall not turn back from You;\n    Revive us, and we will call upon Your name.",
                    prayer: "Father, keep me from turning back from You. Revive me, and I will call upon Your name."
                ),
                PrayerVerse(
                    id: "psalm-80-19",
                    reference: "Psalm 80:19",
                    text: "O Lord God of hosts, restore us;\n    Cause Your face to shine upon us, and we will be saved.",
                    prayer: "Lord, restore me, let Your face shine upon me, and bring salvation, hope, and peace to my life."
                ),
                PrayerVerse(
                    id: "psalm-80-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my Shepherd, Restorer, and faithful Keeper. Restore what is weak, revive what has grown weary, and protect what You have planted in my life. Let Your face shine upon me, and lead me back into deeper trust, obedience, and hope. May my life remain rooted in Your presence and strengthened by Your grace.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 81,
            title: "Sing for Joy",
            chapterReference: "Psalm 81",
            summary: "Pray for obedience and celebration.",
            // JSON resource: psalm_81_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-81-1",
                    reference: "Psalm 81:1",
                    text: "Sing for joy to God our strength;\n    Shout joyfully to the God of Jacob.",
                    prayer: "Lord, fill my heart with joyful praise. Help me sing to You with gratitude because You are my strength and my God."
                ),
                PrayerVerse(
                    id: "psalm-81-2",
                    reference: "Psalm 81:2",
                    text: "Raise a song, strike the timbrel,\n    The sweet sounding lyre with the harp.",
                    prayer: "Father, awaken worship within me. Let every part of my life join in praise to Your holy name."
                ),
                PrayerVerse(
                    id: "psalm-81-3",
                    reference: "Psalm 81:3",
                    text: "Blow the trumpet at the new moon,\n    At the full moon, on our feast day.",
                    prayer: "Lord, teach me to honor sacred rhythms of worship, remembrance, and celebration before You."
                ),
                PrayerVerse(
                    id: "psalm-81-4",
                    reference: "Psalm 81:4",
                    text: "For it is a statute for Israel,\n    An ordinance of the God of Jacob.",
                    prayer: "Father, help me obey Your ways and remember the instructions You have given to Your people."
                ),
                PrayerVerse(
                    id: "psalm-81-5",
                    reference: "Psalm 81:5",
                    text: "He established it for a testimony in Joseph\n    When he went throughout the land of Egypt.\n    I heard a language that I did not know:",
                    prayer: "Lord, thank You for establishing testimony and truth among Your people. Help me listen when You speak."
                ),
                PrayerVerse(
                    id: "psalm-81-6",
                    reference: "Psalm 81:6",
                    text: "“I relieved his shoulder of the burden,\n    His hands were freed from the basket.",
                    prayer: "Father, thank You for lifting burdens and setting people free. Remove what weighs me down and lead me into Your rest."
                ),
                PrayerVerse(
                    id: "psalm-81-7",
                    reference: "Psalm 81:7",
                    text: "You called in trouble and I rescued you;\n    I answered you in the hiding place of thunder;\n    I proved you at the waters of Meribah. Selah.",
                    prayer: "Lord, when I cry out in distress, thank You for hearing and answering me. Help me trust Your presence in every trial."
                ),
                PrayerVerse(
                    id: "psalm-81-8",
                    reference: "Psalm 81:8",
                    text: "Hear, O My people, and I will admonish you;\n    O Israel, if you would listen to Me!",
                    prayer: "Father, give me ears to hear Your warning and instruction. Help my heart remain teachable and obedient."
                ),
                PrayerVerse(
                    id: "psalm-81-9",
                    reference: "Psalm 81:9",
                    text: "Let there be no strange god among you;\n    Nor shall you worship any foreign god.",
                    prayer: "Lord, keep me from idols and anything that competes with my devotion to You."
                ),
                PrayerVerse(
                    id: "psalm-81-10",
                    reference: "Psalm 81:10",
                    text: "I, the Lord, am your God,\n    Who brought you up from the land of Egypt;\n    Open your mouth wide and I will fill it.",
                    prayer: "Father, You are the Lord my God who provides. Open my heart to receive what only You can give."
                ),
                PrayerVerse(
                    id: "psalm-81-11",
                    reference: "Psalm 81:11",
                    text: "“But My people did not listen to My voice,\n    And Israel did not obey Me.",
                    prayer: "Lord, forgive me when I resist Your voice or refuse Your ways. Draw me back to faithful obedience."
                ),
                PrayerVerse(
                    id: "psalm-81-12",
                    reference: "Psalm 81:12",
                    text: "So I gave them over to the stubbornness of their heart,\n    To walk in their own devices.",
                    prayer: "Father, protect me from stubbornness and from following the desires of my own heart apart from You."
                ),
                PrayerVerse(
                    id: "psalm-81-13",
                    reference: "Psalm 81:13",
                    text: "Oh that My people would listen to Me,\n    That Israel would walk in My ways!",
                    prayer: "Lord, help me listen to You and walk in Your ways with humility, faith, and trust."
                ),
                PrayerVerse(
                    id: "psalm-81-14",
                    reference: "Psalm 81:14",
                    text: "I would quickly subdue their enemies\n    And turn My hand against their adversaries.",
                    prayer: "Father, defeat what opposes Your will in my life and lead me into freedom through obedience."
                ),
                PrayerVerse(
                    id: "psalm-81-15",
                    reference: "Psalm 81:15",
                    text: "Those who hate the Lord would pretend obedience to Him,\n    And their time of punishment would be forever.",
                    prayer: "Lord, let every false thing lose its power before You. Establish truth, reverence, and faithfulness in my heart."
                ),
                PrayerVerse(
                    id: "psalm-81-16",
                    reference: "Psalm 81:16",
                    text: "But I would feed you with the finest of the wheat,\n    And with honey from the rock I would satisfy you.”",
                    prayer: "Father, satisfy me with Your goodness. Feed my soul with what is pure, lasting, and life-giving."
                ),
                PrayerVerse(
                    id: "psalm-81-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my strength, my deliverer, and my faithful provider. Teach me to listen to Your voice, reject every idol, and walk in Your ways with a willing heart. Free me from stubbornness, satisfy my soul with Your goodness, and let my life be filled with joyful praise and obedient worship.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 82,
            title: "Defend the Weak",
            chapterReference: "Psalm 82",
            summary: "Pray for justice and righteousness.",
            // JSON resource: psalm_82_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-82-1",
                    reference: "Psalm 82:1",
                    text: "God takes His stand in His own congregation;\n    He judges in the midst of the rulers.",
                    prayer: "Lord, You stand as the righteous Judge over all. Help me remember that every authority is accountable to You."
                ),
                PrayerVerse(
                    id: "psalm-82-2",
                    reference: "Psalm 82:2",
                    text: "How long will you judge unjustly\n    And show partiality to the wicked? Selah.",
                    prayer: "Father, protect my heart from partiality, injustice, or favoritism. Teach me to love what is fair, honest, and right."
                ),
                PrayerVerse(
                    id: "psalm-82-3",
                    reference: "Psalm 82:3",
                    text: "Vindicate the weak and fatherless;\n    Do justice to the afflicted and destitute.",
                    prayer: "Lord, help me defend the weak, the fatherless, the afflicted, and those who cannot defend themselves."
                ),
                PrayerVerse(
                    id: "psalm-82-4",
                    reference: "Psalm 82:4",
                    text: "Rescue the weak and needy;\n    Deliver them out of the hand of the wicked.",
                    prayer: "Father, use my life to bring help, protection, and compassion to those who are vulnerable or oppressed."
                ),
                PrayerVerse(
                    id: "psalm-82-5",
                    reference: "Psalm 82:5",
                    text: "They do not know nor do they understand;\n    They walk about in darkness;\n    All the foundations of the earth are shaken.",
                    prayer: "Lord, when people walk in darkness and confusion, let Your truth bring light, wisdom, and stability."
                ),
                PrayerVerse(
                    id: "psalm-82-6",
                    reference: "Psalm 82:6",
                    text: "I said, “You are gods,\n    And all of you are sons of the Most High.",
                    prayer: "Father, remind me that every person carries responsibility before You. Help me live with humility and reverence."
                ),
                PrayerVerse(
                    id: "psalm-82-7",
                    reference: "Psalm 82:7",
                    text: "Nevertheless you will die like men\n    And fall like any one of the princes.”",
                    prayer: "Lord, teach me to remember the limits of human power and the certainty of eternity. Keep my heart humble before You."
                ),
                PrayerVerse(
                    id: "psalm-82-8",
                    reference: "Psalm 82:8",
                    text: "Arise, O God, judge the earth!\n    For it is You who possesses all the nations.",
                    prayer: "Father, arise and judge the earth with righteousness. Let Your justice, truth, and kingdom be known among all nations."
                ),
                PrayerVerse(
                    id: "psalm-82-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being the righteous Judge over all the earth. Help me reject injustice, defend the vulnerable, and walk humbly before You. Teach me to value truth, mercy, and righteousness in every decision. May my life reflect Your justice and compassion, and may Your kingdom be honored among all people.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 83,
            title: "Do Not Keep Silent",
            chapterReference: "Psalm 83",
            summary: "Pray for God to act against enemies.",
            // JSON resource: psalm_83_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-83-1",
                    reference: "Psalm 83:1",
                    text: "O God, do not remain quiet;\n    Do not be silent and, O God, do not be still.",
                    prayer: "Lord, do not let me mistake silence for absence. Help me trust that You are near, attentive, and faithful even when I am waiting."
                ),
                PrayerVerse(
                    id: "psalm-83-2",
                    reference: "Psalm 83:2",
                    text: "For behold, Your enemies make an uproar,\n    And those who hate You have exalted themselves.",
                    prayer: "Father, when opposition rises loudly, keep my heart steady and remind me that You remain sovereign over every situation."
                ),
                PrayerVerse(
                    id: "psalm-83-3",
                    reference: "Psalm 83:3",
                    text: "They make shrewd plans against Your people,\n    And conspire together against Your treasured ones.",
                    prayer: "Lord, protect Your people from hidden schemes and harmful intentions. Guard what belongs to You with mercy and power."
                ),
                PrayerVerse(
                    id: "psalm-83-4",
                    reference: "Psalm 83:4",
                    text: "They have said, “Come, and let us wipe them out as a nation,\n    That the name of Israel be remembered no more.”",
                    prayer: "Father, preserve the identity and witness of Your people. Help me remain faithful when truth is opposed or forgotten."
                ),
                PrayerVerse(
                    id: "psalm-83-5",
                    reference: "Psalm 83:5",
                    text: "For they have conspired together with one mind;\n    Against You they make a covenant:",
                    prayer: "Lord, when people unite against Your purposes, help me trust that Your plans cannot be defeated."
                ),
                PrayerVerse(
                    id: "psalm-83-6",
                    reference: "Psalm 83:6",
                    text: "The tents of Edom and the Ishmaelites,\n    Moab and the Hagrites;",
                    prayer: "Father, You see every force that stands against Your people. Strengthen my confidence in Your protection and justice."
                ),
                PrayerVerse(
                    id: "psalm-83-7",
                    reference: "Psalm 83:7",
                    text: "Gebal and Ammon and Amalek,\n    Philistia with the inhabitants of Tyre;",
                    prayer: "Lord, no alliance or opposition is greater than You. Help me rest in Your authority above every earthly power."
                ),
                PrayerVerse(
                    id: "psalm-83-8",
                    reference: "Psalm 83:8",
                    text: "Assyria also has joined with them;\n    They have become a help to the children of Lot. Selah.",
                    prayer: "Father, when opposition seems strong or well-supported, remind me that Your strength is greater than all human power."
                ),
                PrayerVerse(
                    id: "psalm-83-9",
                    reference: "Psalm 83:9",
                    text: "Deal with them as with Midian,\n    As with Sisera and Jabin at the torrent of Kishon,",
                    prayer: "Lord, remember Your past victories and faithfulness. Help me trust that You are still able to deliver today."
                ),
                PrayerVerse(
                    id: "psalm-83-10",
                    reference: "Psalm 83:10",
                    text: "Who were destroyed at En-dor,\n    Who became as dung for the ground.",
                    prayer: "Father, remind me that pride and rebellion never have the final word. Your justice and truth will stand forever."
                ),
                PrayerVerse(
                    id: "psalm-83-11",
                    reference: "Psalm 83:11",
                    text: "Make their nobles like Oreb and Zeeb\n    And all their princes like Zebah and Zalmunna,",
                    prayer: "Lord, bring down every proud thing that resists Your will. Establish humility, righteousness, and obedience in my heart."
                ),
                PrayerVerse(
                    id: "psalm-83-12",
                    reference: "Psalm 83:12",
                    text: "Who said, “Let us possess for ourselves\n    The pastures of God.”",
                    prayer: "Father, protect me from grasping for what belongs to You. Teach me to honor Your authority and trust Your provision."
                ),
                PrayerVerse(
                    id: "psalm-83-13",
                    reference: "Psalm 83:13",
                    text: "O my God, make them like the whirling dust,\n    Like chaff before the wind.",
                    prayer: "Lord, scatter confusion, fear, and opposition like dust before the wind. Let Your truth remain firm in my life."
                ),
                PrayerVerse(
                    id: "psalm-83-14",
                    reference: "Psalm 83:14",
                    text: "Like fire that burns the forest\n    And like a flame that sets the mountains on fire,",
                    prayer: "Father, let Your power consume what is evil, false, or harmful. Purify my heart and strengthen what honors You."
                ),
                PrayerVerse(
                    id: "psalm-83-15",
                    reference: "Psalm 83:15",
                    text: "So pursue them with Your tempest\n    And terrify them with Your storm.",
                    prayer: "Lord, pursue what opposes Your will and bring every hidden thing into Your light, justice, and truth."
                ),
                PrayerVerse(
                    id: "psalm-83-16",
                    reference: "Psalm 83:16",
                    text: "Fill their faces with dishonor,\n    That they may seek Your name, O Lord.",
                    prayer: "Father, let every heart that resists You be brought to humility, so that Your name may be sought and honored."
                ),
                PrayerVerse(
                    id: "psalm-83-17",
                    reference: "Psalm 83:17",
                    text: "Let them be ashamed and dismayed forever,\n    And let them be humiliated and perish,",
                    prayer: "Lord, humble pride and expose false confidence. Help me live with reverence before You."
                ),
                PrayerVerse(
                    id: "psalm-83-18",
                    reference: "Psalm 83:18",
                    text: "That they may know that You alone, whose name is the Lord,\n    Are the Most High over all the earth.",
                    prayer: "Father, let all people know that You alone are the Lord Most High over all the earth. May my life declare Your greatness."
                ),
                PrayerVerse(
                    id: "psalm-83-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being the Most High over all the earth. When opposition, fear, or confusion surrounds me, help me trust Your power, justice, and faithful protection. Guard my heart from pride, strengthen my confidence in Your authority, and let my life honor Your name. May Your truth prevail, Your purposes stand, and Your glory be known among all people.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 84,
            title: "How Lovely is Your Dwelling",
            chapterReference: "Psalm 84",
            summary: "Pray for love of God's presence.",
            // JSON resource: psalm_84_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-84-1",
                    reference: "Psalm 84:1",
                    text: "How lovely are Your dwelling places,\n    O Lord of hosts!",
                    prayer: "Lord, how lovely is Your dwelling place. Help me treasure Your presence above every comfort, achievement, or desire."
                ),
                PrayerVerse(
                    id: "psalm-84-2",
                    reference: "Psalm 84:2",
                    text: "My soul longed and even yearned for the courts of the Lord;\n    My heart and my flesh sing for joy to the living God.",
                    prayer: "Father, let my soul long for You with sincere devotion. May my heart and life cry out for the living God."
                ),
                PrayerVerse(
                    id: "psalm-84-3",
                    reference: "Psalm 84:3",
                    text: "The bird also has found a house,\n    And the swallow a nest for herself, where she may lay her young,\n    Even Your altars, O Lord of hosts,\n    My King and my God.",
                    prayer: "Lord, thank You that there is room near You for the weak, the small, and the weary. Let my heart find home in Your presence."
                ),
                PrayerVerse(
                    id: "psalm-84-4",
                    reference: "Psalm 84:4",
                    text: "How blessed are those who dwell in Your house!\n    They are ever praising You. Selah.",
                    prayer: "Father, blessed are those who dwell with You and continually praise Your name. Teach me to live a life of worship."
                ),
                PrayerVerse(
                    id: "psalm-84-5",
                    reference: "Psalm 84:5",
                    text: "How blessed is the man whose strength is in You,\n    In whose heart are the highways to Zion!",
                    prayer: "Lord, bless me with strength that comes from You. Set my heart on the path that leads closer to Your presence."
                ),
                PrayerVerse(
                    id: "psalm-84-6",
                    reference: "Psalm 84:6",
                    text: "Passing through the valley of Baca they make it a spring;\n    The early rain also covers it with blessings.",
                    prayer: "Father, when I pass through dry or difficult places, turn them into places of blessing, growth, and renewed hope."
                ),
                PrayerVerse(
                    id: "psalm-84-7",
                    reference: "Psalm 84:7",
                    text: "They go from strength to strength,\n    Every one of them appears before God in Zion.",
                    prayer: "Lord, lead me from strength to strength. Help me keep moving forward in faith until I stand before You."
                ),
                PrayerVerse(
                    id: "psalm-84-8",
                    reference: "Psalm 84:8",
                    text: "O Lord God of hosts, hear my prayer;\n    Give ear, O God of Jacob! Selah.",
                    prayer: "Father, hear my prayer and listen with mercy. Thank You that I can call upon You with confidence."
                ),
                PrayerVerse(
                    id: "psalm-84-9",
                    reference: "Psalm 84:9",
                    text: "Behold our shield, O God,\n    And look upon the face of Your anointed.",
                    prayer: "Lord, look upon my life with grace. Cover me with Your favor and keep me close to Your anointed purpose."
                ),
                PrayerVerse(
                    id: "psalm-84-10",
                    reference: "Psalm 84:10",
                    text: "For a day in Your courts is better than a thousand outside.\n    I would rather stand at the threshold of the house of my God\n    Than dwell in the tents of wickedness.",
                    prayer: "Father, one day in Your presence is better than a thousand elsewhere. Help me value nearness to You above everything this world offers."
                ),
                PrayerVerse(
                    id: "psalm-84-11",
                    reference: "Psalm 84:11",
                    text: "For the Lord God is a sun and shield;\n    The Lord gives grace and glory;\n    No good thing does He withhold from those who walk uprightly.",
                    prayer: "Lord, You are my sun and shield. Thank You for giving grace, glory, protection, and every good thing according to Your will."
                ),
                PrayerVerse(
                    id: "psalm-84-12",
                    reference: "Psalm 84:12",
                    text: "O Lord of hosts,\n    How blessed is the man who trusts in You!",
                    prayer: "Father, blessed is the one who trusts in You. Strengthen my trust and help me rest securely in Your goodness."
                ),
                PrayerVerse(
                    id: "psalm-84-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the beauty, safety, and joy of Your presence. Teach me to long for You above all else and to walk from strength to strength by Your grace. Turn dry valleys into places of blessing, guard me as my sun and shield, and help me trust You with all my heart. May my life remain rooted in worship, gratitude, and nearness to You.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 85,
            title: "Show Us Your Mercy",
            chapterReference: "Psalm 85",
            summary: "Pray for revival and God's favor.",
            // JSON resource: psalm_85_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-85-1",
                    reference: "Psalm 85:1",
                    text: "O Lord, You showed favor to Your land;\n    You restored the captivity of Jacob.",
                    prayer: "Lord, thank You for showing favor and restoring what was broken. Help me recognize Your mercy in every season of renewal."
                ),
                PrayerVerse(
                    id: "psalm-85-2",
                    reference: "Psalm 85:2",
                    text: "You forgave the iniquity of Your people;\n    You covered all their sin. Selah.",
                    prayer: "Father, thank You for forgiving sin and covering shame with Your grace. Teach me to walk in repentance and gratitude."
                ),
                PrayerVerse(
                    id: "psalm-85-3",
                    reference: "Psalm 85:3",
                    text: "You withdrew all Your fury;\n    You turned away from Your burning anger.",
                    prayer: "Lord, thank You for turning away wrath and offering mercy. Help me never take Your compassion for granted."
                ),
                PrayerVerse(
                    id: "psalm-85-4",
                    reference: "Psalm 85:4",
                    text: "Restore us, O God of our salvation,\n    And cause Your indignation toward us to cease.",
                    prayer: "Father, restore me again and draw my heart back to You. Let Your salvation renew my spirit and strengthen my faith."
                ),
                PrayerVerse(
                    id: "psalm-85-5",
                    reference: "Psalm 85:5",
                    text: "Will You be angry with us forever?\n    Will You prolong Your anger to all generations?",
                    prayer: "Lord, when discipline feels long or difficult, help me trust Your purpose and wait for Your mercy with hope."
                ),
                PrayerVerse(
                    id: "psalm-85-6",
                    reference: "Psalm 85:6",
                    text: "Will You not Yourself revive us again,\n    That Your people may rejoice in You?",
                    prayer: "Father, revive me again so that my heart may rejoice in You. Bring fresh life, joy, and worship into my soul."
                ),
                PrayerVerse(
                    id: "psalm-85-7",
                    reference: "Psalm 85:7",
                    text: "Show us Your lovingkindness, O Lord,\n    And grant us Your salvation.",
                    prayer: "Lord, show me Your lovingkindness and grant me Your salvation. Help me rest in Your faithful love."
                ),
                PrayerVerse(
                    id: "psalm-85-8",
                    reference: "Psalm 85:8",
                    text: "I will hear what God the Lord will say;\n    For He will speak peace to His people, to His godly ones;\n    But let them not turn back to folly.",
                    prayer: "Father, help me listen carefully to what You speak. Let Your peace guide me, and keep me from returning to foolishness."
                ),
                PrayerVerse(
                    id: "psalm-85-9",
                    reference: "Psalm 85:9",
                    text: "Surely His salvation is near to those who fear Him,\n    That glory may dwell in our land.",
                    prayer: "Lord, thank You that Your salvation is near to those who fear You. Let Your glory dwell in my life."
                ),
                PrayerVerse(
                    id: "psalm-85-10",
                    reference: "Psalm 85:10",
                    text: "Lovingkindness and truth have met together;\n    Righteousness and peace have kissed each other.",
                    prayer: "Father, let lovingkindness and truth meet in my heart. Let righteousness and peace shape the way I live."
                ),
                PrayerVerse(
                    id: "psalm-85-11",
                    reference: "Psalm 85:11",
                    text: "Truth springs from the earth,\n    And righteousness looks down from heaven.",
                    prayer: "Lord, let truth spring up in my life and righteousness shine over me. Help me live faithfully before You."
                ),
                PrayerVerse(
                    id: "psalm-85-12",
                    reference: "Psalm 85:12",
                    text: "Indeed, the Lord will give what is good,\n    And our land will yield its produce.",
                    prayer: "Father, thank You for giving what is good. Let my life bear fruit through Your blessing and provision."
                ),
                PrayerVerse(
                    id: "psalm-85-13",
                    reference: "Psalm 85:13",
                    text: "Righteousness will go before Him\n    And will make His footsteps into a way.",
                    prayer: "Lord, let righteousness go before me and guide my steps. Help me walk in the path You prepare."
                ),
                PrayerVerse(
                    id: "psalm-85-closing",
                    reference: "Closing",
                    text: "Lord, thank You for Your mercy, forgiveness, restoration, and peace. Revive my heart again and teach me to listen to Your voice. Let truth, righteousness, and lovingkindness shape my life, and keep me from returning to foolishness. May Your glory dwell in me, and may my steps follow the path of Your righteousness.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
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

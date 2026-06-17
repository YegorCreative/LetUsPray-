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

    // MARK: - Psalms 1-15
    private static let psalms1to15: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "Blessed is the One",
            chapterReference: "Psalm 1",
            summary: "Pray for delight in God's Word and fruitfulness in life.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "The Lord's Anointed",
            chapterReference: "Psalm 2",
            summary: "Pray for submission to God's sovereignty and trust in His Son.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Shield Around Me",
            chapterReference: "Psalm 3",
            summary: "Pray for peace and protection in times of trouble.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Answer When I Call",
            chapterReference: "Psalm 4",
            summary: "Pray for confidence in God's faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Morning Prayer",
            chapterReference: "Psalm 5",
            summary: "Pray for guidance and protection at the start of each day.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Have Mercy",
            chapterReference: "Psalm 6",
            summary: "Pray for healing and God's compassion in distress.",
            verses: []
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
            dayNumber: 1,
            title: "You Are My Lord",
            chapterReference: "Psalm 16",
            summary: "Pray for joy and security in God alone.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "Hear a Just Cause",
            chapterReference: "Psalm 17",
            summary: "Pray for vindication and protection.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "I Love You, Lord",
            chapterReference: "Psalm 18",
            summary: "Pray in gratitude for God's deliverance and strength.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "The Heavens Declare",
            chapterReference: "Psalm 19",
            summary: "Pray in awe of God's creation and Word.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "May the Lord Answer",
            chapterReference: "Psalm 20",
            summary: "Pray for trust in God's name and strength.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "The King Rejoices",
            chapterReference: "Psalm 21",
            summary: "Pray with gratitude for God's blessings and faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "My God, My God",
            chapterReference: "Psalm 22",
            summary: "Pray through suffering with hope in God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "The Lord is My Shepherd",
            chapterReference: "Psalm 23",
            summary: "Pray for peace and trust in God's provision.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Lift Up Your Heads",
            chapterReference: "Psalm 24",
            summary: "Pray in worship of the King of glory.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "To You, O Lord",
            chapterReference: "Psalm 25",
            summary: "Pray for guidance and forgiveness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "Vindicate Me",
            chapterReference: "Psalm 26",
            summary: "Pray for integrity and faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "The Lord is My Light",
            chapterReference: "Psalm 27",
            summary: "Pray for courage and confidence in God's presence.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "To You I Call",
            chapterReference: "Psalm 28",
            summary: "Pray for God to hear and deliver.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "Ascribe to the Lord",
            chapterReference: "Psalm 29",
            summary: "Pray in worship of God's powerful voice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "You Lifted Me Up",
            chapterReference: "Psalm 30",
            summary: "Pray in thanksgiving for God's healing and restoration.",
            verses: []
        )
    ]

    // MARK: - Psalms 31-45
    private static let psalms31to45: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "Into Your Hands",
            chapterReference: "Psalm 31",
            summary: "Pray for trust and refuge in times of distress.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "Blessed is the Forgiven",
            chapterReference: "Psalm 32",
            summary: "Pray for confession and forgiveness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Sing Joyfully",
            chapterReference: "Psalm 33",
            summary: "Pray in praise of God's faithfulness and creation.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Taste and See",
            chapterReference: "Psalm 34",
            summary: "Pray for trust in God's goodness and deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Contend for Me",
            chapterReference: "Psalm 35",
            summary: "Pray for God's defense and vindication.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Your Love Reaches",
            chapterReference: "Psalm 36",
            summary: "Pray in awe of God's unfailing love.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Do Not Fret",
            chapterReference: "Psalm 37",
            summary: "Pray for patience and trust in God's timing.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Do Not Forsake Me",
            chapterReference: "Psalm 38",
            summary: "Pray for healing and God's presence in suffering.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Show Me My End",
            chapterReference: "Psalm 39",
            summary: "Pray for perspective and hope.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "I Waited Patiently",
            chapterReference: "Psalm 40",
            summary: "Pray with gratitude for answered prayer.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "Blessed is He Who Cares",
            chapterReference: "Psalm 41",
            summary: "Pray for compassion and healing.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "As the Deer Pants",
            chapterReference: "Psalm 42",
            summary: "Pray for deep longing and hope in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "Send Your Light",
            chapterReference: "Psalm 43",
            summary: "Pray for guidance and vindication.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "In God We Make Our Boast",
            chapterReference: "Psalm 44",
            summary: "Pray for trust in God despite difficulties.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "My Heart Overflows",
            chapterReference: "Psalm 45",
            summary: "Pray in worship of the King.",
            verses: []
        )
    ]

    // MARK: - Psalms 46-60
    private static let psalms46to60: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "God is Our Refuge",
            chapterReference: "Psalm 46",
            summary: "Pray for strength and peace in chaos.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "Clap Your Hands",
            chapterReference: "Psalm 47",
            summary: "Pray in joyful worship of God's kingship.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Great is the Lord",
            chapterReference: "Psalm 48",
            summary: "Pray in praise of God's greatness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Why Should I Fear?",
            chapterReference: "Psalm 49",
            summary: "Pray for wisdom about wealth and eternity.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "The Mighty One Speaks",
            chapterReference: "Psalm 50",
            summary: "Pray for true worship and gratitude.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Create in Me a Clean Heart",
            chapterReference: "Psalm 51",
            summary: "Pray for repentance and restoration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "God Will Bring You Down",
            chapterReference: "Psalm 52",
            summary: "Pray for trust in God's justice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Who Will Bring Salvation?",
            chapterReference: "Psalm 53",
            summary: "Pray for God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Save Me by Your Name",
            chapterReference: "Psalm 54",
            summary: "Pray for God's powerful help.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Cast Your Cares",
            chapterReference: "Psalm 55",
            summary: "Pray for peace in betrayal and pain.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "When I Am Afraid",
            chapterReference: "Psalm 56",
            summary: "Pray for trust over fear.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "My Heart is Steadfast",
            chapterReference: "Psalm 57",
            summary: "Pray for confidence in God's mercy.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "Do You Judge Uprightly?",
            chapterReference: "Psalm 58",
            summary: "Pray for God's righteous judgment.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "Deliver Me from Enemies",
            chapterReference: "Psalm 59",
            summary: "Pray for protection and deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "You Have Rejected Us",
            chapterReference: "Psalm 60",
            summary: "Pray for restoration and victory.",
            verses: []
        )
    ]

    // MARK: - Psalms 61-75
    private static let psalms61to75: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "Hear My Cry",
            chapterReference: "Psalm 61",
            summary: "Pray for refuge and security in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "My Soul Finds Rest",
            chapterReference: "Psalm 62",
            summary: "Pray for quiet trust in God alone.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "You Are My God",
            chapterReference: "Psalm 63",
            summary: "Pray for earnest seeking after God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Protect Me from the Wicked",
            chapterReference: "Psalm 64",
            summary: "Pray for God's shield against evil.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Praise Awaits You",
            chapterReference: "Psalm 65",
            summary: "Pray in gratitude for God's provision.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Shout for Joy",
            chapterReference: "Psalm 66",
            summary: "Pray in celebration of God's awesome deeds.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "May God Be Gracious",
            chapterReference: "Psalm 67",
            summary: "Pray for God's blessing and salvation for all.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Let God Arise",
            chapterReference: "Psalm 68",
            summary: "Pray in worship of God's mighty power.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Save Me, O God",
            chapterReference: "Psalm 69",
            summary: "Pray for deliverance in overwhelming distress.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Hasten to Help Me",
            chapterReference: "Psalm 70",
            summary: "Pray for urgent help from God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "You Are My Hope",
            chapterReference: "Psalm 71",
            summary: "Pray for lifelong trust in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Endow the King",
            chapterReference: "Psalm 72",
            summary: "Pray for righteous leadership and justice.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "Who Have I But You?",
            chapterReference: "Psalm 73",
            summary: "Pray for perspective when the wicked prosper.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "Remember Your Congregation",
            chapterReference: "Psalm 74",
            summary: "Pray for God's intervention and restoration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "We Give Thanks",
            chapterReference: "Psalm 75",
            summary: "Pray in gratitude for God's judgment.",
            verses: []
        )
    ]

    // MARK: - Psalms 76-90
    private static let psalms76to90: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "You Are Resplendent",
            chapterReference: "Psalm 76",
            summary: "Pray in awe of God's majesty.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "I Cried to God",
            chapterReference: "Psalm 77",
            summary: "Pray for remembrance of God's faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Tell the Next Generation",
            chapterReference: "Psalm 78",
            summary: "Pray for faithfulness in teaching God's ways.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Help Us, O God",
            chapterReference: "Psalm 79",
            summary: "Pray for mercy and deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Restore Us",
            chapterReference: "Psalm 80",
            summary: "Pray for renewal and God's favor.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Sing for Joy",
            chapterReference: "Psalm 81",
            summary: "Pray for obedience and celebration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Defend the Weak",
            chapterReference: "Psalm 82",
            summary: "Pray for justice and righteousness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Do Not Keep Silent",
            chapterReference: "Psalm 83",
            summary: "Pray for God to act against enemies.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "How Lovely is Your Dwelling",
            chapterReference: "Psalm 84",
            summary: "Pray for love of God's presence.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Show Us Your Mercy",
            chapterReference: "Psalm 85",
            summary: "Pray for revival and God's favor.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "Teach Me Your Way",
            chapterReference: "Psalm 86",
            summary: "Pray for guidance and a undivided heart.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Glorious Things",
            chapterReference: "Psalm 87",
            summary: "Pray in celebration of God's city.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "Darkness is My Friend",
            chapterReference: "Psalm 88",
            summary: "Pray honestly through deep despair.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "I Will Sing of Your Love",
            chapterReference: "Psalm 89",
            summary: "Pray for trust in God's covenant faithfulness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "Teach Us to Number Our Days",
            chapterReference: "Psalm 90",
            summary: "Pray for wisdom about the brevity of life.",
            verses: []
        )
    ]

    // MARK: - Psalms 91-105
    private static let psalms91to105: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "Under His Wings",
            chapterReference: "Psalm 91",
            summary: "Pray for protection and refuge.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "It is Good to Praise",
            chapterReference: "Psalm 92",
            summary: "Pray in thanksgiving for God's works.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "The Lord Reigns",
            chapterReference: "Psalm 93",
            summary: "Pray in worship of God's sovereign rule.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "God of Vengeance",
            chapterReference: "Psalm 94",
            summary: "Pray for God's justice and discipline.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Come, Let Us Worship",
            chapterReference: "Psalm 95",
            summary: "Pray with a heart of worship and obedience.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Sing to the Lord",
            chapterReference: "Psalm 96",
            summary: "Pray in joyful praise of God's glory.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "The Lord Reigns, Let the Earth Rejoice",
            chapterReference: "Psalm 97",
            summary: "Pray in celebration of God's righteous reign.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "A New Song",
            chapterReference: "Psalm 98",
            summary: "Pray with joy for God's salvation.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Holy is He",
            chapterReference: "Psalm 99",
            summary: "Pray in reverence of God's holiness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Shout for Joy",
            chapterReference: "Psalm 100",
            summary: "Pray with thanksgiving and gladness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "I Will Walk in Integrity",
            chapterReference: "Psalm 101",
            summary: "Pray for blameless living.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Hear My Prayer",
            chapterReference: "Psalm 102",
            summary: "Pray for comfort in affliction.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "Praise the Lord, O My Soul",
            chapterReference: "Psalm 103",
            summary: "Pray in gratitude for God's benefits and compassion.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "How Many Are Your Works",
            chapterReference: "Psalm 104",
            summary: "Pray in awe of God's creation.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "Give Thanks to the Lord",
            chapterReference: "Psalm 105",
            summary: "Pray with remembrance of God's faithfulness.",
            verses: []
        )
    ]

    // MARK: - Psalms 106-120
    private static let psalms106to120: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "We Have Sinned",
            chapterReference: "Psalm 106",
            summary: "Pray in confession and repentance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "Give Thanks for His Unfailing Love",
            chapterReference: "Psalm 107",
            summary: "Pray in gratitude for God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "My Heart is Steadfast",
            chapterReference: "Psalm 108",
            summary: "Pray with confidence in God's help.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "God of My Praise",
            chapterReference: "Psalm 109",
            summary: "Pray for God's vindication.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Sit at My Right Hand",
            chapterReference: "Psalm 110",
            summary: "Pray in worship of the Messianic King.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Great Are His Works",
            chapterReference: "Psalm 111",
            summary: "Pray in praise of God's deeds.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Blessed is the One Who Fears",
            chapterReference: "Psalm 112",
            summary: "Pray for righteousness and generosity.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Who is Like the Lord?",
            chapterReference: "Psalm 113",
            summary: "Pray in worship of God's incomparable nature.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "When Israel Came Out",
            chapterReference: "Psalm 114",
            summary: "Pray in remembrance of God's mighty deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Not to Us",
            chapterReference: "Psalm 115",
            summary: "Pray for God's glory alone.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "I Love the Lord",
            chapterReference: "Psalm 116",
            summary: "Pray in gratitude for answered prayer.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Praise the Lord, All Nations",
            chapterReference: "Psalm 117",
            summary: "Pray for universal praise of God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "His Love Endures Forever",
            chapterReference: "Psalm 118",
            summary: "Pray in thanksgiving for God's steadfast love.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "Your Word is a Lamp",
            chapterReference: "Psalm 119",
            summary: "Pray for love of God's Word and obedience.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "I Call on the Lord",
            chapterReference: "Psalm 120",
            summary: "Pray for deliverance from deceit.",
            verses: []
        )
    ]

    // MARK: - Psalms 121-135
    private static let psalms121to135: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "I Lift Up My Eyes",
            chapterReference: "Psalm 121",
            summary: "Pray for God's watchful protection.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "I Rejoiced",
            chapterReference: "Psalm 122",
            summary: "Pray for love of God's house and peace.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "To You I Lift My Eyes",
            chapterReference: "Psalm 123",
            summary: "Pray for mercy and relief from contempt.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "If the Lord Had Not Been",
            chapterReference: "Psalm 124",
            summary: "Pray in gratitude for God's deliverance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Those Who Trust",
            chapterReference: "Psalm 125",
            summary: "Pray for steadfast trust in God.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Restore Our Fortunes",
            chapterReference: "Psalm 126",
            summary: "Pray for restoration and joy.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Unless the Lord Builds",
            chapterReference: "Psalm 127",
            summary: "Pray for dependence on God in all endeavors.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Blessed Are All Who Fear",
            chapterReference: "Psalm 128",
            summary: "Pray for blessing in family and work.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Often They Have Afflicted Me",
            chapterReference: "Psalm 129",
            summary: "Pray for endurance through persecution.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Out of the Depths",
            chapterReference: "Psalm 130",
            summary: "Pray for forgiveness and hope.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "My Heart is Not Proud",
            chapterReference: "Psalm 131",
            summary: "Pray for humility and quiet trust.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Remember David",
            chapterReference: "Psalm 132",
            summary: "Pray for God's presence and promises.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "How Good and Pleasant",
            chapterReference: "Psalm 133",
            summary: "Pray for unity among believers.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "Praise the Lord at Night",
            chapterReference: "Psalm 134",
            summary: "Pray with nighttime worship and blessing.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "Praise the Name of the Lord",
            chapterReference: "Psalm 135",
            summary: "Pray in praise of God's greatness.",
            verses: []
        )
    ]

    // MARK: - Psalms 136-150
    private static let psalms136to150: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "His Love Endures Forever",
            chapterReference: "Psalm 136",
            summary: "Pray in thanksgiving for God's enduring love.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 2,
            title: "By the Rivers of Babylon",
            chapterReference: "Psalm 137",
            summary: "Pray with longing for home and restoration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 3,
            title: "I Will Praise You",
            chapterReference: "Psalm 138",
            summary: "Pray with wholehearted thanksgiving.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 4,
            title: "You Have Searched Me",
            chapterReference: "Psalm 139",
            summary: "Pray in awe of God's intimate knowledge.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Rescue Me from Evil",
            chapterReference: "Psalm 140",
            summary: "Pray for protection from the wicked.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Set a Guard",
            chapterReference: "Psalm 141",
            summary: "Pray for control over words and actions.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 7,
            title: "I Cry Aloud",
            chapterReference: "Psalm 142",
            summary: "Pray for refuge when overwhelmed.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 8,
            title: "Do Not Bring to Judgment",
            chapterReference: "Psalm 143",
            summary: "Pray for mercy and guidance.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Praise to the Rock",
            chapterReference: "Psalm 144",
            summary: "Pray for God's strength in battle.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Great is the Lord",
            chapterReference: "Psalm 145",
            summary: "Pray in exaltation of God's greatness.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 11,
            title: "Praise the Lord, My Soul",
            chapterReference: "Psalm 146",
            summary: "Pray with trust in God's help.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 12,
            title: "He Heals the Brokenhearted",
            chapterReference: "Psalm 147",
            summary: "Pray in praise of God's care and power.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 13,
            title: "Praise from Heaven and Earth",
            chapterReference: "Psalm 148",
            summary: "Pray in cosmic worship of the Creator.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 14,
            title: "Sing a New Song",
            chapterReference: "Psalm 149",
            summary: "Pray with joyful praise and celebration.",
            verses: []
        ),
        PrayerDay(
            dayNumber: 15,
            title: "Let Everything That Has Breath",
            chapterReference: "Psalm 150",
            summary: "Pray in final, resounding praise of God.",
            verses: []
        )
    ]

}

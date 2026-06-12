import Foundation

enum ProverbsPrayerData {
    static let plan = PrayerPlan(
        id: "30-days-in-proverbs",
        title: "30 Days in Proverbs",
        subtitle: "Pray Through Scripture One Verse at a Time",
        description: "A gentle guided journey through Proverbs, helping you pray for wisdom, humility, trust, and steady obedience.",
        category: .wisdom,
        durationDays: 30,
        accentColorName: "wisdom",
        coverIcon: "book.pages.fill",
        days: detailedDays + placeholderDays
    )

    private static let detailedDays: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "Wisdom Begins",
            chapterReference: "Proverbs 1",
            summary: "Begin with reverence, teachability, and a heart ready to receive God's wisdom.",
            verses: [
                PrayerVerse(
                    id: "prov-1-1",
                    reference: "Proverbs 1:1",
                    text: "The proverbs of Solomon introduce a treasure of wisdom.",
                    prayer: "Lord, thank You for preserving wisdom through Your Word. Open my heart to receive the teaching of Proverbs with humility and eagerness."
                ),
                PrayerVerse(
                    id: "prov-1-2",
                    reference: "Proverbs 1:2",
                    text: "Purpose: to know wisdom and instruction.",
                    prayer: "Father, help me truly know wisdom—not just facts—but instruction that shapes my character and daily choices."
                ),
                PrayerVerse(
                    id: "prov-1-3",
                    reference: "Proverbs 1:3",
                    text: "To receive wise dealing, righteousness, justice, and equity.",
                    prayer: "God, train me to receive wisdom that produces righteousness, justice, and integrity in every area of my life."
                ),
                PrayerVerse(
                    id: "prov-1-4",
                    reference: "Proverbs 1:4",
                    text: "To give prudence to the simple and knowledge to the young.",
                    prayer: "Grant me prudence and sound judgment. Make me teachable like a child, eager to learn Your ways."
                ),
                PrayerVerse(
                    id: "prov-1-5",
                    reference: "Proverbs 1:5",
                    text: "The wise hear and increase learning.",
                    prayer: "Keep me listening, Lord. Grow me beyond complacency so I keep increasing in understanding all my days."
                ),
                PrayerVerse(
                    id: "prov-1-6",
                    reference: "Proverbs 1:6",
                    text: "Understanding proverbs, sayings, and riddles of the wise.",
                    prayer: "Spirit of God, grant insight to understand the sayings of the wise and to apply them rightly."
                ),
                PrayerVerse(
                    id: "prov-1-7",
                    reference: "Proverbs 1:7",
                    text: "The fear of the Lord is the beginning of knowledge.",
                    prayer: "Lord, root me in holy reverence. Let awe of You be the foundation of my thoughts, desires, and decisions."
                ),
                PrayerVerse(
                    id: "prov-1-8",
                    reference: "Proverbs 1:8",
                    text: "Hear your father's instruction; don't forsake your mother's teaching.",
                    prayer: "Give me a teachable spirit. Help me honor godly counsel and remember the faithful instruction I’ve received."
                ),
                PrayerVerse(
                    id: "prov-1-9",
                    reference: "Proverbs 1:9",
                    text: "Instruction is a graceful garland and a beautiful adornment.",
                    prayer: "Make wisdom my adornment, Lord. Let Your truth be visible in my demeanor, words, and actions."
                ),
                PrayerVerse(
                    id: "prov-1-10",
                    reference: "Proverbs 1:10",
                    text: "If sinners entice you, do not consent.",
                    prayer: "Strengthen my will to say no to temptation. Anchor me in Your ways when enticing paths appear."
                ),
                PrayerVerse(
                    id: "prov-1-11",
                    reference: "Proverbs 1:11",
                    text: "Do not join violent or predatory schemes.",
                    prayer: "Keep me far from any plan that harms others. Form in me a heart that protects, serves, and seeks peace."
                ),
                PrayerVerse(
                    id: "prov-1-12",
                    reference: "Proverbs 1:12",
                    text: "The wicked lurk to swallow lives like Sheol.",
                    prayer: "Guard me from hidden traps and destructive alliances. Lead me in paths of life, not death."
                ),
                PrayerVerse(
                    id: "prov-1-13",
                    reference: "Proverbs 1:13",
                    text: "Promises of easy gain and stolen treasure.",
                    prayer: "Lord, free me from greed and shortcuts. Teach me to value honest work and contentment over quick profit."
                ),
                PrayerVerse(
                    id: "prov-1-14",
                    reference: "Proverbs 1:14",
                    text: "Do not throw in your lot with them.",
                    prayer: "Give me courage to stand apart when the crowd chooses compromise. Help me choose integrity over approval."
                ),
                PrayerVerse(
                    id: "prov-1-15",
                    reference: "Proverbs 1:15",
                    text: "Keep your feet from their path.",
                    prayer: "Order my steps, Lord. Keep my feet on Your straight path and away from every slippery way."
                ),
                PrayerVerse(
                    id: "prov-1-16",
                    reference: "Proverbs 1:16",
                    text: "Their feet run to evil and hurry to shed blood.",
                    prayer: "Turn my haste into patience and my impulses into prayerful discernment. Make me quick to do good, not evil."
                ),
                PrayerVerse(
                    id: "prov-1-17",
                    reference: "Proverbs 1:17",
                    text: "A net spread in sight of any bird is useless.",
                    prayer: "Give me spiritual sight to recognize obvious traps. Make me wise to the enemy’s schemes."
                ),
                PrayerVerse(
                    id: "prov-1-18",
                    reference: "Proverbs 1:18",
                    text: "The violent set a trap for their own lives.",
                    prayer: "Expose self-destructive patterns in me, Lord, and replace them with Your life-giving ways."
                ),
                PrayerVerse(
                    id: "prov-1-19",
                    reference: "Proverbs 1:19",
                    text: "Greedy gain steals the life of its possessors.",
                    prayer: "Root out greed and envy from my heart. Teach me generosity, contentment, and trust in Your provision."
                ),
                PrayerVerse(
                    id: "prov-1-20",
                    reference: "Proverbs 1:20",
                    text: "Wisdom cries aloud in the streets.",
                    prayer: "Help me hear wisdom’s voice in ordinary places. Tune my ears to Your call amid the noise of life."
                ),
                PrayerVerse(
                    id: "prov-1-21",
                    reference: "Proverbs 1:21",
                    text: "She raises her voice at the city gates.",
                    prayer: "Let Your wisdom shape my public life—my work, my conversations, and my influence for good."
                ),
                PrayerVerse(
                    id: "prov-1-22",
                    reference: "Proverbs 1:22",
                    text: "How long will the simple love being simple?",
                    prayer: "Lord, deliver me from loving ease and resisting growth. Give me desire to mature and to seek understanding."
                ),
                PrayerVerse(
                    id: "prov-1-23",
                    reference: "Proverbs 1:23",
                    text: "Turn at my reproof; I will pour out my spirit to you.",
                    prayer: "When You correct me, help me turn quickly. Pour out Your Spirit and make Your words clear to me."
                ),
                PrayerVerse(
                    id: "prov-1-24",
                    reference: "Proverbs 1:24",
                    text: "Because I called and you refused...",
                    prayer: "Keep me from stubborn refusal. Give me a soft heart that answers when You call."
                ),
                PrayerVerse(
                    id: "prov-1-25",
                    reference: "Proverbs 1:25",
                    text: "You ignored all my counsel and would have none of my reproof.",
                    prayer: "Forgive me for the times I ignored Your counsel. Teach me to welcome Your correction as an expression of love."
                ),
                PrayerVerse(
                    id: "prov-1-26",
                    reference: "Proverbs 1:26",
                    text: "I also will laugh at your calamity...",
                    prayer: "Lord, sober my heart. Help me respond today so I won’t reap the sorrow of delayed obedience."
                ),
                PrayerVerse(
                    id: "prov-1-27",
                    reference: "Proverbs 1:27",
                    text: "When terror strikes like a storm...",
                    prayer: "Be my refuge when trouble comes. Teach me to build my life on Your wisdom before storms arrive."
                ),
                PrayerVerse(
                    id: "prov-1-28",
                    reference: "Proverbs 1:28",
                    text: "Then they will call on me, but I will not answer.",
                    prayer: "Keep me from delaying repentance. Draw me to seek You now, while Your voice is near."
                ),
                PrayerVerse(
                    id: "prov-1-29",
                    reference: "Proverbs 1:29",
                    text: "They hated knowledge and did not choose the fear of the Lord.",
                    prayer: "Place in me a deep love for truth and a willing choice to fear You above all."
                ),
                PrayerVerse(
                    id: "prov-1-30",
                    reference: "Proverbs 1:30",
                    text: "They would have none of my counsel and despised my reproof.",
                    prayer: "Make me quick to receive Your counsel and eager to be corrected, that I may walk securely."
                ),
                PrayerVerse(
                    id: "prov-1-31",
                    reference: "Proverbs 1:31",
                    text: "They shall eat the fruit of their way.",
                    prayer: "Spare me from the bitter fruit of my own stubbornness. Lead me to sow seeds of wisdom and reap life."
                ),
                PrayerVerse(
                    id: "prov-1-32",
                    reference: "Proverbs 1:32",
                    text: "The simple are killed by turning away; fools are destroyed by complacency.",
                    prayer: "Rescue me from complacency. Keep me awake, attentive, and responsive to Your guidance."
                ),
                PrayerVerse(
                    id: "prov-1-33",
                    reference: "Proverbs 1:33",
                    text: "Whoever listens to me will dwell secure and be at ease, without dread of disaster.",
                    prayer: "Lord, I choose to listen to You. Let Your wisdom make me dwell secure, at peace, and unafraid in Your care."
                ),
                PrayerVerse(
                    id: "prov-1-closing",
                    reference: "Closing Prayer",
                    text: "A final prayer of commitment.",
                    prayer: "Father, thank You for the wisdom of Proverbs 1. Root me in holy reverence, keep me teachable, and lead me from every trap into Your secure paths. In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 2,
            title: "Seek Understanding",
            chapterReference: "Proverbs 2",
            summary: "Ask for discernment, treasure God's words, and pursue insight with intention.",
            verses: [
                PrayerVerse(
                    id: "prov-2-1",
                    reference: "Proverbs 2:1",
                    text: "Dear Jesus, help me receive Your words and treasure Your commandments in my heart.",
                    prayer: "Dear Jesus, help me receive Your words and treasure Your commandments in my heart."
                ),
                PrayerVerse(
                    id: "prov-2-2",
                    reference: "Proverbs 2:2",
                    text: "Father, make my ears attentive to wisdom and my heart eager to understand Your truth.",
                    prayer: "Father, make my ears attentive to wisdom and my heart eager to understand Your truth."
                ),
                PrayerVerse(
                    id: "prov-2-3",
                    reference: "Proverbs 2:3",
                    text: "Lord, give me a hunger for discernment and understanding. Teach me to seek wisdom earnestly.",
                    prayer: "Lord, give me a hunger for discernment and understanding. Teach me to seek wisdom earnestly."
                ),
                PrayerVerse(
                    id: "prov-2-4",
                    reference: "Proverbs 2:4",
                    text: "Jesus, help me pursue wisdom as diligently as one searches for silver and hidden treasure.",
                    prayer: "Jesus, help me pursue wisdom as diligently as one searches for silver and hidden treasure."
                ),
                PrayerVerse(
                    id: "prov-2-5",
                    reference: "Proverbs 2:5",
                    text: "Father, reveal to me the fear of the Lord and help me grow in the knowledge of God.",
                    prayer: "Father, reveal to me the fear of the Lord and help me grow in the knowledge of God."
                ),
                PrayerVerse(
                    id: "prov-2-6",
                    reference: "Proverbs 2:6",
                    text: "Lord, thank You for being the source of wisdom. Fill me with knowledge, understanding, and discernment.",
                    prayer: "Lord, thank You for being the source of wisdom. Fill me with knowledge, understanding, and discernment."
                ),
                PrayerVerse(
                    id: "prov-2-7",
                    reference: "Proverbs 2:7",
                    text: "Jesus, store up sound wisdom for me and be my shield as I walk in integrity.",
                    prayer: "Jesus, store up sound wisdom for me and be my shield as I walk in integrity."
                ),
                PrayerVerse(
                    id: "prov-2-8",
                    reference: "Proverbs 2:8",
                    text: "Father, guard my path and protect my steps as I seek to follow You faithfully.",
                    prayer: "Father, guard my path and protect my steps as I seek to follow You faithfully."
                ),
                PrayerVerse(
                    id: "prov-2-9",
                    reference: "Proverbs 2:9",
                    text: "Lord, help me understand righteousness, justice, fairness, and every good path.",
                    prayer: "Lord, help me understand righteousness, justice, fairness, and every good path."
                ),
                PrayerVerse(
                    id: "prov-2-10",
                    reference: "Proverbs 2:10",
                    text: "Jesus, let wisdom enter my heart and make knowledge delightful to my soul.",
                    prayer: "Jesus, let wisdom enter my heart and make knowledge delightful to my soul."
                ),
                PrayerVerse(
                    id: "prov-2-11",
                    reference: "Proverbs 2:11",
                    text: "Father, let discretion watch over me and understanding protect me from harm.",
                    prayer: "Father, let discretion watch over me and understanding protect me from harm."
                ),
                PrayerVerse(
                    id: "prov-2-12",
                    reference: "Proverbs 2:12",
                    text: "Lord, deliver me from evil ways and from people who speak what is corrupt and deceptive.",
                    prayer: "Lord, deliver me from evil ways and from people who speak what is corrupt and deceptive."
                ),
                PrayerVerse(
                    id: "prov-2-13",
                    reference: "Proverbs 2:13",
                    text: "Jesus, keep me from abandoning the path of righteousness and walking in darkness.",
                    prayer: "Jesus, keep me from abandoning the path of righteousness and walking in darkness."
                ),
                PrayerVerse(
                    id: "prov-2-14",
                    reference: "Proverbs 2:14",
                    text: "Father, protect me from finding pleasure in evil or delighting in sin.",
                    prayer: "Father, protect me from finding pleasure in evil or delighting in sin."
                ),
                PrayerVerse(
                    id: "prov-2-15",
                    reference: "Proverbs 2:15",
                    text: "Lord, keep my feet from crooked paths and guide me in Your truth.",
                    prayer: "Lord, keep my feet from crooked paths and guide me in Your truth."
                ),
                PrayerVerse(
                    id: "prov-2-16",
                    reference: "Proverbs 2:16",
                    text: "Jesus, protect me from sexual temptation and from voices that seek to pull me away from You.",
                    prayer: "Jesus, protect me from sexual temptation and from voices that seek to pull me away from You."
                ),
                PrayerVerse(
                    id: "prov-2-17",
                    reference: "Proverbs 2:17",
                    text: "Father, help me remain faithful to every covenant and commitment that honors You.",
                    prayer: "Father, help me remain faithful to every covenant and commitment that honors You."
                ),
                PrayerVerse(
                    id: "prov-2-18",
                    reference: "Proverbs 2:18",
                    text: "Lord, keep me far from paths that lead to spiritual death and destruction.",
                    prayer: "Lord, keep me far from paths that lead to spiritual death and destruction."
                ),
                PrayerVerse(
                    id: "prov-2-19",
                    reference: "Proverbs 2:19",
                    text: "Jesus, preserve me from choices that separate me from Your wisdom and life.",
                    prayer: "Jesus, preserve me from choices that separate me from Your wisdom and life."
                ),
                PrayerVerse(
                    id: "prov-2-20",
                    reference: "Proverbs 2:20",
                    text: "Father, help me walk in the company of the righteous and follow the ways of godly people.",
                    prayer: "Father, help me walk in the company of the righteous and follow the ways of godly people."
                ),
                PrayerVerse(
                    id: "prov-2-21",
                    reference: "Proverbs 2:21",
                    text: "Lord, establish me among those who are upright and faithful before You.",
                    prayer: "Lord, establish me among those who are upright and faithful before You."
                ),
                PrayerVerse(
                    id: "prov-2-22",
                    reference: "Proverbs 2:22",
                    text: "Jesus, keep me from wickedness and help me remain firmly rooted in Your truth all the days of my life.",
                    prayer: "Jesus, keep me from wickedness and help me remain firmly rooted in Your truth all the days of my life."
                ),
                PrayerVerse(
                    id: "prov-2-closing",
                    reference: "Closing",
                    text: "In Jesus’ name, Amen. 🙏🏻",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Trust the Lord",
            chapterReference: "Proverbs 3",
            summary: "Rest your whole life in God's direction and trust His faithful leading.",
            verses: [
                PrayerVerse(
                    id: "prov-3-1",
                    reference: "Proverbs 3:5",
                    text: "Trust in the Lord with your whole heart, not leaning only on your own understanding.",
                    prayer: "Father, when my thoughts feel limited, teach me to trust You more than my own perspective."
                ),
                PrayerVerse(
                    id: "prov-3-2",
                    reference: "Proverbs 3:6",
                    text: "In every way, acknowledge God, and He makes the path straight before you.",
                    prayer: "I offer You every part of this day. Lead my decisions, conversations, and hidden thoughts into Your straight path."
                ),
                PrayerVerse(
                    id: "prov-3-3",
                    reference: "Proverbs 3:7-8",
                    text: "Turn from evil, walk humbly, and find renewal in the Lord's wisdom.",
                    prayer: "Keep me humble and honest before You. Let obedience bring peace to my soul and health to my inner life."
                )
            ]
        )
    ]

    private static let placeholderDays: [PrayerDay] = [
        PrayerDay(dayNumber: 4, title: "Guard Your Heart", chapterReference: "Proverbs 4", summary: "Pray for a guarded heart and steady direction.", verses: []),
        PrayerDay(dayNumber: 5, title: "Walk in Integrity", chapterReference: "Proverbs 5", summary: "Ask for purity, discernment, and faithful living.", verses: []),
        PrayerDay(dayNumber: 6, title: "Choose Diligence", chapterReference: "Proverbs 6", summary: "Pray for diligence and freedom from destructive habits.", verses: []),
        PrayerDay(dayNumber: 7, title: "Treasure Wisdom", chapterReference: "Proverbs 7", summary: "Seek wisdom that protects and keeps you near God's heart.", verses: []),
        PrayerDay(
            dayNumber: 8,
            title: "Answer Wisdom's Call",
            chapterReference: "Proverbs 8",
            summary: "Open your life to the voice of wisdom.",
            verses: [
                PrayerVerse(
                    id: "prov-8-1",
                    reference: "Proverbs 8:1",
                    text: "Dear Jesus, help me hear the voice of wisdom and respond when You call.",
                    prayer: "Dear Jesus, help me hear the voice of wisdom and respond when You call."
                ),
                PrayerVerse(
                    id: "prov-8-2",
                    reference: "Proverbs 8:2",
                    text: "Father, place me on the path of understanding and help me walk in Your truth.",
                    prayer: "Father, place me on the path of understanding and help me walk in Your truth."
                ),
                PrayerVerse(
                    id: "prov-8-3",
                    reference: "Proverbs 8:3",
                    text: "Lord, make my heart attentive to Your instruction wherever I go.",
                    prayer: "Lord, make my heart attentive to Your instruction wherever I go."
                ),
                PrayerVerse(
                    id: "prov-8-4",
                    reference: "Proverbs 8:4",
                    text: "Jesus, thank You for calling all people to wisdom. Help me answer Your call faithfully.",
                    prayer: "Jesus, thank You for calling all people to wisdom. Help me answer Your call faithfully."
                ),
                PrayerVerse(
                    id: "prov-8-5",
                    reference: "Proverbs 8:5",
                    text: "Father, give me understanding and teach me to grow in wisdom and discernment.",
                    prayer: "Father, give me understanding and teach me to grow in wisdom and discernment."
                ),
                PrayerVerse(
                    id: "prov-8-6",
                    reference: "Proverbs 8:6",
                    text: "Lord, help me listen carefully to noble and righteous instruction.",
                    prayer: "Lord, help me listen carefully to noble and righteous instruction."
                ),
                PrayerVerse(
                    id: "prov-8-7",
                    reference: "Proverbs 8:7",
                    text: "Jesus, let my mouth speak truth and keep me far from wickedness.",
                    prayer: "Jesus, let my mouth speak truth and keep me far from wickedness."
                ),
                PrayerVerse(
                    id: "prov-8-8",
                    reference: "Proverbs 8:8",
                    text: "Father, help my words be honest, upright, and pleasing in Your sight.",
                    prayer: "Father, help my words be honest, upright, and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "prov-8-9",
                    reference: "Proverbs 8:9",
                    text: "Lord, open my understanding so I may recognize and embrace Your truth.",
                    prayer: "Lord, open my understanding so I may recognize and embrace Your truth."
                ),
                PrayerVerse(
                    id: "prov-8-10",
                    reference: "Proverbs 8:10",
                    text: "Jesus, help me choose wisdom over silver and worldly gain.",
                    prayer: "Jesus, help me choose wisdom over silver and worldly gain."
                ),
                PrayerVerse(
                    id: "prov-8-11",
                    reference: "Proverbs 8:11",
                    text: "Father, teach me that wisdom is more valuable than any treasure this world can offer.",
                    prayer: "Father, teach me that wisdom is more valuable than any treasure this world can offer."
                ),
                PrayerVerse(
                    id: "prov-8-12",
                    reference: "Proverbs 8:12",
                    text: "Lord, fill me with prudence, knowledge, and sound judgment.",
                    prayer: "Lord, fill me with prudence, knowledge, and sound judgment."
                ),
                PrayerVerse(
                    id: "prov-8-13",
                    reference: "Proverbs 8:13",
                    text: "Jesus, help me fear You by turning away from evil, pride, arrogance, and corruption.",
                    prayer: "Jesus, help me fear You by turning away from evil, pride, arrogance, and corruption."
                ),
                PrayerVerse(
                    id: "prov-8-14",
                    reference: "Proverbs 8:14",
                    text: "Father, grant me counsel, wisdom, understanding, and strength.",
                    prayer: "Father, grant me counsel, wisdom, understanding, and strength."
                ),
                PrayerVerse(
                    id: "prov-8-15",
                    reference: "Proverbs 8:15",
                    text: "Lord, guide leaders, rulers, and authorities to govern with wisdom and righteousness.",
                    prayer: "Lord, guide leaders, rulers, and authorities to govern with wisdom and righteousness."
                ),
                PrayerVerse(
                    id: "prov-8-16",
                    reference: "Proverbs 8:16",
                    text: "Jesus, help those in positions of influence make decisions that honor You.",
                    prayer: "Jesus, help those in positions of influence make decisions that honor You."
                ),
                PrayerVerse(
                    id: "prov-8-17",
                    reference: "Proverbs 8:17",
                    text: "Father, help me seek You diligently and wholeheartedly every day.",
                    prayer: "Father, help me seek You diligently and wholeheartedly every day."
                ),
                PrayerVerse(
                    id: "prov-8-18",
                    reference: "Proverbs 8:18",
                    text: "Lord, remind me that true riches, honor, and lasting blessings come from You.",
                    prayer: "Lord, remind me that true riches, honor, and lasting blessings come from You."
                ),
                PrayerVerse(
                    id: "prov-8-19",
                    reference: "Proverbs 8:19",
                    text: "Jesus, let the fruit of wisdom in my life be greater than gold or silver.",
                    prayer: "Jesus, let the fruit of wisdom in my life be greater than gold or silver."
                ),
                PrayerVerse(
                    id: "prov-8-20",
                    reference: "Proverbs 8:20",
                    text: "Father, lead me in the way of righteousness and justice.",
                    prayer: "Father, lead me in the way of righteousness and justice."
                ),
                PrayerVerse(
                    id: "prov-8-21",
                    reference: "Proverbs 8:21",
                    text: "Lord, bless me with the inheritance of wisdom that endures forever.",
                    prayer: "Lord, bless me with the inheritance of wisdom that endures forever."
                ),
                PrayerVerse(
                    id: "prov-8-22",
                    reference: "Proverbs 8:22",
                    text: "Jesus, thank You for Your eternal wisdom that existed before the foundations of the earth.",
                    prayer: "Jesus, thank You for Your eternal wisdom that existed before the foundations of the earth."
                ),
                PrayerVerse(
                    id: "prov-8-23",
                    reference: "Proverbs 8:23",
                    text: "Father, remind me that Your plans and purposes have existed from everlasting.",
                    prayer: "Father, remind me that Your plans and purposes have existed from everlasting."
                ),
                PrayerVerse(
                    id: "prov-8-24",
                    reference: "Proverbs 8:24",
                    text: "Lord, thank You for Your wisdom that existed before creation itself.",
                    prayer: "Lord, thank You for Your wisdom that existed before creation itself."
                ),
                PrayerVerse(
                    id: "prov-8-25",
                    reference: "Proverbs 8:25",
                    text: "Jesus, help me stand firm upon the eternal foundation of Your truth.",
                    prayer: "Jesus, help me stand firm upon the eternal foundation of Your truth."
                ),
                PrayerVerse(
                    id: "prov-8-26",
                    reference: "Proverbs 8:26",
                    text: "Father, thank You for creating the earth and everything in it with perfect wisdom.",
                    prayer: "Father, thank You for creating the earth and everything in it with perfect wisdom."
                ),
                PrayerVerse(
                    id: "prov-8-27",
                    reference: "Proverbs 8:27",
                    text: "Lord, I praise You for establishing the heavens through Your wisdom and power.",
                    prayer: "Lord, I praise You for establishing the heavens through Your wisdom and power."
                ),
                PrayerVerse(
                    id: "prov-8-28",
                    reference: "Proverbs 8:28",
                    text: "Jesus, thank You for sustaining all creation by Your mighty hand.",
                    prayer: "Jesus, thank You for sustaining all creation by Your mighty hand."
                ),
                PrayerVerse(
                    id: "prov-8-29",
                    reference: "Proverbs 8:29",
                    text: "Father, thank You for setting boundaries and order throughout creation.",
                    prayer: "Father, thank You for setting boundaries and order throughout creation."
                ),
                PrayerVerse(
                    id: "prov-8-30",
                    reference: "Proverbs 8:30",
                    text: "Lord, help me delight in Your wisdom and walk closely with You every day.",
                    prayer: "Lord, help me delight in Your wisdom and walk closely with You every day."
                ),
                PrayerVerse(
                    id: "prov-8-31",
                    reference: "Proverbs 8:31",
                    text: "Jesus, thank You for Your love for mankind and Your delight in Your children.",
                    prayer: "Jesus, thank You for Your love for mankind and Your delight in Your children."
                ),
                PrayerVerse(
                    id: "prov-8-32",
                    reference: "Proverbs 8:32",
                    text: "Father, help me listen carefully to Your wisdom and follow Your ways.",
                    prayer: "Father, help me listen carefully to Your wisdom and follow Your ways."
                ),
                PrayerVerse(
                    id: "prov-8-33",
                    reference: "Proverbs 8:33",
                    text: "Lord, give me a teachable spirit that gladly receives instruction.",
                    prayer: "Lord, give me a teachable spirit that gladly receives instruction."
                ),
                PrayerVerse(
                    id: "prov-8-34",
                    reference: "Proverbs 8:34",
                    text: "Jesus, help me seek You daily and eagerly wait upon Your guidance.",
                    prayer: "Jesus, help me seek You daily and eagerly wait upon Your guidance."
                ),
                PrayerVerse(
                    id: "prov-8-35",
                    reference: "Proverbs 8:35",
                    text: "Father, thank You that those who find wisdom find life and receive Your favor.",
                    prayer: "Father, thank You that those who find wisdom find life and receive Your favor."
                ),
                PrayerVerse(
                    id: "prov-8-36",
                    reference: "Proverbs 8:36",
                    text: "Lord, protect me from rejecting wisdom and choosing paths that lead to harm and destruction.",
                    prayer: "Lord, protect me from rejecting wisdom and choosing paths that lead to harm and destruction."
                ),
                PrayerVerse(
                    id: "prov-8-closing",
                    reference: "Closing",
                    text: "In Jesus’ name, Amen. 🙏🏻",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 9,
            title: "Walk the Way of Insight",
            chapterReference: "Proverbs 9",
            summary: "Pray for humility that welcomes wise instruction.",
            verses: [
                PrayerVerse(
                    id: "prov-9-1",
                    reference: "Proverbs 9:1",
                    text: "Dear Jesus, help me build my life upon the foundation of Your wisdom and truth.",
                    prayer: "Dear Jesus, help me build my life upon the foundation of Your wisdom and truth."
                ),
                PrayerVerse(
                    id: "prov-9-2",
                    reference: "Proverbs 9:2",
                    text: "Father, thank You for preparing spiritual nourishment for those who seek You. Help me come to Your table daily.",
                    prayer: "Father, thank You for preparing spiritual nourishment for those who seek You. Help me come to Your table daily."
                ),
                PrayerVerse(
                    id: "prov-9-3",
                    reference: "Proverbs 9:3",
                    text: "Lord, let Your wisdom call clearly into my heart and draw me closer to You.",
                    prayer: "Lord, let Your wisdom call clearly into my heart and draw me closer to You."
                ),
                PrayerVerse(
                    id: "prov-9-4",
                    reference: "Proverbs 9:4",
                    text: "Jesus, help me humbly answer Your invitation to learn, grow, and walk in understanding.",
                    prayer: "Jesus, help me humbly answer Your invitation to learn, grow, and walk in understanding."
                ),
                PrayerVerse(
                    id: "prov-9-5",
                    reference: "Proverbs 9:5",
                    text: "Father, feed my soul with Your Word and satisfy me with Your truth.",
                    prayer: "Father, feed my soul with Your Word and satisfy me with Your truth."
                ),
                PrayerVerse(
                    id: "prov-9-6",
                    reference: "Proverbs 9:6",
                    text: "Lord, help me leave behind foolishness and walk in the way of wisdom and life.",
                    prayer: "Lord, help me leave behind foolishness and walk in the way of wisdom and life."
                ),
                PrayerVerse(
                    id: "prov-9-7",
                    reference: "Proverbs 9:7",
                    text: "Jesus, give me discernment to know when to speak and when to remain silent. Help me receive correction with humility.",
                    prayer: "Jesus, give me discernment to know when to speak and when to remain silent. Help me receive correction with humility."
                ),
                PrayerVerse(
                    id: "prov-9-8",
                    reference: "Proverbs 9:8",
                    text: "Father, protect me from pride and teach me to welcome wise rebuke and instruction.",
                    prayer: "Father, protect me from pride and teach me to welcome wise rebuke and instruction."
                ),
                PrayerVerse(
                    id: "prov-9-9",
                    reference: "Proverbs 9:9",
                    text: "Lord, help me continue growing in wisdom, knowledge, and understanding throughout my life.",
                    prayer: "Lord, help me continue growing in wisdom, knowledge, and understanding throughout my life."
                ),
                PrayerVerse(
                    id: "prov-9-10",
                    reference: "Proverbs 9:10",
                    text: "Jesus, teach me that the fear of the Lord is the beginning of wisdom and that knowing You is true understanding.",
                    prayer: "Jesus, teach me that the fear of the Lord is the beginning of wisdom and that knowing You is true understanding."
                ),
                PrayerVerse(
                    id: "prov-9-11",
                    reference: "Proverbs 9:11",
                    text: "Father, let wisdom add blessing, purpose, and fruitfulness to my life according to Your will.",
                    prayer: "Father, let wisdom add blessing, purpose, and fruitfulness to my life according to Your will."
                ),
                PrayerVerse(
                    id: "prov-9-12",
                    reference: "Proverbs 9:12",
                    text: "Lord, help me take personal responsibility for my choices and faithfully pursue wisdom.",
                    prayer: "Lord, help me take personal responsibility for my choices and faithfully pursue wisdom."
                ),
                PrayerVerse(
                    id: "prov-9-13",
                    reference: "Proverbs 9:13",
                    text: "Jesus, help me recognize foolishness and avoid voices that lead me away from Your truth.",
                    prayer: "Jesus, help me recognize foolishness and avoid voices that lead me away from Your truth."
                ),
                PrayerVerse(
                    id: "prov-9-14",
                    reference: "Proverbs 9:14",
                    text: "Father, protect me from distractions and temptations that seek to draw me off the path of righteousness.",
                    prayer: "Father, protect me from distractions and temptations that seek to draw me off the path of righteousness."
                ),
                PrayerVerse(
                    id: "prov-9-15",
                    reference: "Proverbs 9:15",
                    text: "Lord, help me stay focused on the path You have set before me.",
                    prayer: "Lord, help me stay focused on the path You have set before me."
                ),
                PrayerVerse(
                    id: "prov-9-16",
                    reference: "Proverbs 9:16",
                    text: "Jesus, give me discernment when temptation disguises itself as something desirable or harmless.",
                    prayer: "Jesus, give me discernment when temptation disguises itself as something desirable or harmless."
                ),
                PrayerVerse(
                    id: "prov-9-17",
                    reference: "Proverbs 9:17",
                    text: "Father, help me reject the false pleasures of sin and choose the lasting joy found in You.",
                    prayer: "Father, help me reject the false pleasures of sin and choose the lasting joy found in You."
                ),
                PrayerVerse(
                    id: "prov-9-18",
                    reference: "Proverbs 9:18",
                    text: "Lord, remind me that the path of foolishness leads to destruction, but Your way leads to life everlasting.",
                    prayer: "Lord, remind me that the path of foolishness leads to destruction, but Your way leads to life everlasting."
                ),
                PrayerVerse(
                    id: "prov-9-closing",
                    reference: "Closing",
                    text: "In Jesus’ name, Amen. 🙏🏻",
                    prayer: "In Jesus’ name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(dayNumber: 10, title: "Speak with Grace", chapterReference: "Proverbs 10", summary: "Invite God to shape your words with grace and truth.", verses: []),
        PrayerDay(dayNumber: 11, title: "Live Honestly", chapterReference: "Proverbs 11", summary: "Pray for integrity in every hidden place.", verses: []),
        PrayerDay(dayNumber: 12, title: "Love Correction", chapterReference: "Proverbs 12", summary: "Ask for a teachable spirit that embraces growth.", verses: []),
        PrayerDay(dayNumber: 13, title: "Guard Your Words", chapterReference: "Proverbs 13", summary: "Pray for restraint, wisdom, and healing speech.", verses: []),
        PrayerDay(dayNumber: 14, title: "Build a Wise Home", chapterReference: "Proverbs 14", summary: "Invite peace, patience, and wisdom into your relationships.", verses: []),
        PrayerDay(dayNumber: 15, title: "Choose Gentle Answers", chapterReference: "Proverbs 15", summary: "Pray for gentle responses and a listening spirit.", verses: []),
        PrayerDay(dayNumber: 16, title: "Commit Your Plans", chapterReference: "Proverbs 16", summary: "Offer your plans to God and ask Him to establish them.", verses: []),
        PrayerDay(dayNumber: 17, title: "Love Faithful Friendship", chapterReference: "Proverbs 17", summary: "Pray for covenant love and trustworthy companionship.", verses: []),
        PrayerDay(dayNumber: 18, title: "Listen Before Speaking", chapterReference: "Proverbs 18", summary: "Ask for listening ears and humble understanding.", verses: []),
        PrayerDay(dayNumber: 19, title: "Practice Compassion", chapterReference: "Proverbs 19", summary: "Pray for mercy toward those in need.", verses: []),
        PrayerDay(dayNumber: 20, title: "Receive Wise Counsel", chapterReference: "Proverbs 20", summary: "Invite trustworthy counsel and honest reflection.", verses: []),
        PrayerDay(dayNumber: 21, title: "Place Hope in the Lord", chapterReference: "Proverbs 21", summary: "Pray for a heart anchored in God's justice and mercy.", verses: []),
        PrayerDay(dayNumber: 22, title: "Pursue Humility", chapterReference: "Proverbs 22", summary: "Ask for lowliness of heart and lasting reverence.", verses: []),
        PrayerDay(dayNumber: 23, title: "Fix Your Eyes on Wisdom", chapterReference: "Proverbs 23", summary: "Pray for focus, sobriety, and inner stability.", verses: []),
        PrayerDay(dayNumber: 24, title: "Do Not Envy Evil", chapterReference: "Proverbs 24", summary: "Ask for courage to choose righteousness over comparison.", verses: []),
        PrayerDay(dayNumber: 25, title: "Wait with Patience", chapterReference: "Proverbs 25", summary: "Pray for restraint, patience, and thoughtful words.", verses: []),
        PrayerDay(dayNumber: 26, title: "Seek Steady Character", chapterReference: "Proverbs 26", summary: "Ask God to form maturity and consistency in you.", verses: []),
        PrayerDay(dayNumber: 27, title: "Live Attentively", chapterReference: "Proverbs 27", summary: "Pray for awareness, faithful friendship, and daily wisdom.", verses: []),
        PrayerDay(dayNumber: 28, title: "Walk Uprightly", chapterReference: "Proverbs 28", summary: "Invite bold integrity and wholehearted repentance.", verses: []),
        PrayerDay(dayNumber: 29, title: "Welcome Correction", chapterReference: "Proverbs 29", summary: "Pray for humility that responds quickly to truth.", verses: []),
        PrayerDay(dayNumber: 30, title: "Live with Noble Strength", chapterReference: "Proverbs 30-31", summary: "Close the journey by praying for wisdom, strength, and reverence.", verses: [])
    ]
}


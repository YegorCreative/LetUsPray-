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
        coverIcon: "book.pages",
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
                    text: "The proverbs of Solomon the son of David, king of Israel:",
                    prayer: "Lord, thank You for preserving wisdom through Your Word. Open my heart to receive the teaching of Proverbs with humility and eagerness."
                ),
                PrayerVerse(
                    id: "prov-1-2",
                    reference: "Proverbs 1:2",
                    text: "To know wisdom and instruction,\n  To discern the sayings of understanding,",
                    prayer: "Father, help me truly know wisdom—not just facts—but instruction that shapes my character and daily choices."
                ),
                PrayerVerse(
                    id: "prov-1-3",
                    reference: "Proverbs 1:3",
                    text: "To receive instruction in wise behavior,\n  Righteousness, justice and equity;",
                    prayer: "God, train me to receive wisdom that produces righteousness, justice, and integrity in every area of my life."
                ),
                PrayerVerse(
                    id: "prov-1-4",
                    reference: "Proverbs 1:4",
                    text: "To give prudence to the naive,\n  To the youth knowledge and discretion,",
                    prayer: "Grant me prudence and sound judgment. Make me teachable like a child, eager to learn Your ways."
                ),
                PrayerVerse(
                    id: "prov-1-5",
                    reference: "Proverbs 1:5",
                    text: "A wise man will hear and increase in learning,\n  And a man of understanding will acquire wise counsel,",
                    prayer: "Keep me listening, Lord. Grow me beyond complacency so I keep increasing in understanding all my days."
                ),
                PrayerVerse(
                    id: "prov-1-6",
                    reference: "Proverbs 1:6",
                    text: "To understand a proverb and a figure,\n  The words of the wise and their riddles.",
                    prayer: "Spirit of God, grant insight to understand the sayings of the wise and to apply them rightly."
                ),
                PrayerVerse(
                    id: "prov-1-7",
                    reference: "Proverbs 1:7",
                    text: "The fear of the Lord is the beginning of knowledge;\n  Fools despise wisdom and instruction.",
                    prayer: "Lord, root me in holy reverence. Let awe of You be the foundation of my thoughts, desires, and decisions."
                ),
                PrayerVerse(
                    id: "prov-1-8",
                    reference: "Proverbs 1:8",
                    text: "Hear, my son, your father's instruction\n  And do not forsake your mother's teaching;",
                    prayer: "Give me a teachable spirit. Help me honor godly counsel and remember the faithful instruction I've received."
                ),
                PrayerVerse(
                    id: "prov-1-9",
                    reference: "Proverbs 1:9",
                    text: "Indeed, they are a graceful wreath to your head\n  And ornaments about your neck.",
                    prayer: "Make wisdom my adornment, Lord. Let Your truth be visible in my demeanor, words, and actions."
                ),
                PrayerVerse(
                    id: "prov-1-10",
                    reference: "Proverbs 1:10",
                    text: "My son, if sinners entice you,\n  Do not consent.",
                    prayer: "Strengthen my will to say no to temptation. Anchor me in Your ways when enticing paths appear."
                ),
                PrayerVerse(
                    id: "prov-1-11",
                    reference: "Proverbs 1:11",
                    text: "If they say, \"Come with us,\n  Let us lie in wait for blood,\n  Let us ambush the innocent without cause;",
                    prayer: "Keep me far from any plan that harms others. Form in me a heart that protects, serves, and seeks peace."
                ),
                PrayerVerse(
                    id: "prov-1-12",
                    reference: "Proverbs 1:12",
                    text: "Let us swallow them alive like Sheol,\n  Even whole, as those who go down to the pit;",
                    prayer: "Guard me from hidden traps and destructive alliances. Lead me in paths of life, not death."
                ),
                PrayerVerse(
                    id: "prov-1-13",
                    reference: "Proverbs 1:13",
                    text: "We will find all kinds of precious wealth,\n  We will fill our houses with spoil;",
                    prayer: "Lord, free me from greed and shortcuts. Teach me to value honest work and contentment over quick profit."
                ),
                PrayerVerse(
                    id: "prov-1-14",
                    reference: "Proverbs 1:14",
                    text: "Throw in your lot with us,\n  We shall all have one purse,\"",
                    prayer: "Give me courage to stand apart when the crowd chooses compromise. Help me choose integrity over approval."
                ),
                PrayerVerse(
                    id: "prov-1-15",
                    reference: "Proverbs 1:15",
                    text: "My son, do not walk in the way with them.\n  Keep your feet from their path,",
                    prayer: "Order my steps, Lord. Keep my feet on Your straight path and away from every slippery way."
                ),
                PrayerVerse(
                    id: "prov-1-16",
                    reference: "Proverbs 1:16",
                    text: "For their feet run to evil\n  And they hasten to shed blood.",
                    prayer: "Turn my haste into patience and my impulses into prayerful discernment. Make me quick to do good, not evil."
                ),
                PrayerVerse(
                    id: "prov-1-17",
                    reference: "Proverbs 1:17",
                    text: "Indeed, it is useless to spread the baited net\n  In the sight of any bird;",
                    prayer: "Give me spiritual sight to recognize obvious traps. Make me wise to the enemy's schemes."
                ),
                PrayerVerse(
                    id: "prov-1-18",
                    reference: "Proverbs 1:18",
                    text: "But they lie in wait for their own blood;\n  They ambush their own lives.",
                    prayer: "Expose self-destructive patterns in me, Lord, and replace them with Your life-giving ways."
                ),
                PrayerVerse(
                    id: "prov-1-19",
                    reference: "Proverbs 1:19",
                    text: "So are the ways of everyone who gains by violence;\n  It takes away the life of its possessors.",
                    prayer: "Root out greed and envy from my heart. Teach me generosity, contentment, and trust in Your provision."
                ),
                PrayerVerse(
                    id: "prov-1-20",
                    reference: "Proverbs 1:20",
                    text: "Wisdom shouts in the street,\n  She lifts her voice in the square;",
                    prayer: "Help me hear wisdom's voice in ordinary places. Tune my ears to Your call amid the noise of life."
                ),
                PrayerVerse(
                    id: "prov-1-21",
                    reference: "Proverbs 1:21",
                    text: "At the head of the noisy streets she cries out;\n  At the entrance of the gates in the city she utters her sayings:",
                    prayer: "Let Your wisdom shape my public life—my work, my conversations, and my influence for good."
                ),
                PrayerVerse(
                    id: "prov-1-22",
                    reference: "Proverbs 1:22",
                    text: "\"How long, O naive ones, will you love being simple-minded?\n  And scoffers delight themselves in scoffing\n  And fools hate knowledge?",
                    prayer: "Lord, deliver me from loving ease and resisting growth. Give me desire to mature and to seek understanding."
                ),
                PrayerVerse(
                    id: "prov-1-23",
                    reference: "Proverbs 1:23",
                    text: "Turn to my reproof,\n  Behold, I will pour out my spirit on you;\n  I will make my words known to you.",
                    prayer: "When You correct me, help me turn quickly. Pour out Your Spirit and make Your words clear to me."
                ),
                PrayerVerse(
                    id: "prov-1-24",
                    reference: "Proverbs 1:24",
                    text: "Because I called and you refused,\n  I stretched out my hand and no one paid attention;",
                    prayer: "Keep me from stubborn refusal. Give me a soft heart that answers when You call."
                ),
                PrayerVerse(
                    id: "prov-1-25",
                    reference: "Proverbs 1:25",
                    text: "And you neglected all my counsel\n  And did not want my reproof;",
                    prayer: "Forgive me for the times I ignored Your counsel. Teach me to welcome Your correction as an expression of love."
                ),
                PrayerVerse(
                    id: "prov-1-26",
                    reference: "Proverbs 1:26",
                    text: "I will also laugh at your calamity;\n  I will mock when your dread comes,",
                    prayer: "Lord, sober my heart. Help me respond today so I won't reap the sorrow of delayed obedience."
                ),
                PrayerVerse(
                    id: "prov-1-27",
                    reference: "Proverbs 1:27",
                    text: "When your dread comes like a storm\n  And your calamity comes like a whirlwind,\n  When distress and anguish come upon you.",
                    prayer: "Be my refuge when trouble comes. Teach me to build my life on Your wisdom before storms arrive."
                ),
                PrayerVerse(
                    id: "prov-1-28",
                    reference: "Proverbs 1:28",
                    text: "Then they will call on me, but I will not answer;\n  They will seek me diligently but they will not find me,",
                    prayer: "Keep me from delaying repentance. Draw me to seek You now, while Your voice is near."
                ),
                PrayerVerse(
                    id: "prov-1-29",
                    reference: "Proverbs 1:29",
                    text: "Because they hated knowledge\n  And did not choose the fear of the Lord.",
                    prayer: "Place in me a deep love for truth and a willing choice to fear You above all."
                ),
                PrayerVerse(
                    id: "prov-1-30",
                    reference: "Proverbs 1:30",
                    text: "They would not accept my counsel,\n  They spurned all my reproof.",
                    prayer: "Make me quick to receive Your counsel and eager to be corrected, that I may walk securely."
                ),
                PrayerVerse(
                    id: "prov-1-31",
                    reference: "Proverbs 1:31",
                    text: "So they shall eat of the fruit of their own way\n  And be satiated with their own devices.",
                    prayer: "Spare me from the bitter fruit of my own stubbornness. Lead me to sow seeds of wisdom and reap life."
                ),
                PrayerVerse(
                    id: "prov-1-32",
                    reference: "Proverbs 1:32",
                    text: "For the waywardness of the naive will kill them,\n  And the complacency of fools will destroy them.",
                    prayer: "Rescue me from complacency. Keep me awake, attentive, and responsive to Your guidance."
                ),
                PrayerVerse(
                    id: "prov-1-33",
                    reference: "Proverbs 1:33",
                    text: "But he who listens to me shall live securely\n  And will be at ease from the dread of evil.\"",
                    prayer: "Lord, I choose to listen to You. Let Your wisdom make me dwell secure, at peace, and unafraid in Your care."
                ),
                PrayerVerse(
                    id: "prov-1-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
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
                    text: "My son, if you will receive my words\n  And treasure my commandments within you,",
                    prayer: "Dear Jesus, help me receive Your words and treasure Your commandments in my heart."
                ),
                PrayerVerse(
                    id: "prov-2-2",
                    reference: "Proverbs 2:2",
                    text: "Make your ear attentive to wisdom,\n  Incline your heart to understanding;",
                    prayer: "Father, make my ears attentive to wisdom and my heart eager to understand Your truth."
                ),
                PrayerVerse(
                    id: "prov-2-3",
                    reference: "Proverbs 2:3",
                    text: "For if you cry for discernment,\n  Lift your voice for understanding;",
                    prayer: "Lord, give me a hunger for discernment and understanding. Teach me to seek wisdom earnestly."
                ),
                PrayerVerse(
                    id: "prov-2-4",
                    reference: "Proverbs 2:4",
                    text: "If you seek her as silver\n  And search for her as for hidden treasures;",
                    prayer: "Jesus, help me pursue wisdom as diligently as one searches for silver and hidden treasure."
                ),
                PrayerVerse(
                    id: "prov-2-5",
                    reference: "Proverbs 2:5",
                    text: "Then you will discern the fear of the Lord\n  And discover the knowledge of God.",
                    prayer: "Father, reveal to me the fear of the Lord and help me grow in the knowledge of God."
                ),
                PrayerVerse(
                    id: "prov-2-6",
                    reference: "Proverbs 2:6",
                    text: "For the Lord gives wisdom;\n  From His mouth come knowledge and understanding.",
                    prayer: "Lord, thank You for being the source of wisdom. Fill me with knowledge, understanding, and discernment."
                ),
                PrayerVerse(
                    id: "prov-2-7",
                    reference: "Proverbs 2:7",
                    text: "He stores up sound wisdom for the upright;\n  He is a shield to those who walk in integrity,",
                    prayer: "Jesus, store up sound wisdom for me and be my shield as I walk in integrity."
                ),
                PrayerVerse(
                    id: "prov-2-8",
                    reference: "Proverbs 2:8",
                    text: "Guarding the paths of justice,\n  And He preserves the way of His godly ones.",
                    prayer: "Father, guard my path and protect my steps as I seek to follow You faithfully."
                ),
                PrayerVerse(
                    id: "prov-2-9",
                    reference: "Proverbs 2:9",
                    text: "Then you will discern righteousness and justice\n  And equity and every good course.",
                    prayer: "Lord, help me understand righteousness, justice, fairness, and every good path."
                ),
                PrayerVerse(
                    id: "prov-2-10",
                    reference: "Proverbs 2:10",
                    text: "For wisdom will enter your heart\n  And knowledge will be pleasant to your soul;",
                    prayer: "Jesus, let wisdom enter my heart and make knowledge delightful to my soul."
                ),
                PrayerVerse(
                    id: "prov-2-11",
                    reference: "Proverbs 2:11",
                    text: "Discretion will guard you,\n  Understanding will watch over you,",
                    prayer: "Father, let discretion watch over me and understanding protect me from harm."
                ),
                PrayerVerse(
                    id: "prov-2-12",
                    reference: "Proverbs 2:12",
                    text: "To deliver you from the way of evil,\n  From the man who speaks perverse things;",
                    prayer: "Lord, deliver me from evil ways and from people who speak what is corrupt and deceptive."
                ),
                PrayerVerse(
                    id: "prov-2-13",
                    reference: "Proverbs 2:13",
                    text: "From those who leave the paths of uprightness\n  To walk in the ways of darkness;",
                    prayer: "Jesus, keep me from abandoning the path of righteousness and walking in darkness."
                ),
                PrayerVerse(
                    id: "prov-2-14",
                    reference: "Proverbs 2:14",
                    text: "Who delight in doing evil\n  And rejoice in the perversity of evil;",
                    prayer: "Father, protect me from finding pleasure in evil or delighting in sin."
                ),
                PrayerVerse(
                    id: "prov-2-15",
                    reference: "Proverbs 2:15",
                    text: "Whose paths are crooked,\n  And who are devious in their ways;",
                    prayer: "Lord, keep my feet from crooked paths and guide me in Your truth."
                ),
                PrayerVerse(
                    id: "prov-2-16",
                    reference: "Proverbs 2:16",
                    text: "To deliver you from the strange woman,\n  From the adulteress who flatters with her words;",
                    prayer: "Jesus, protect me from sexual temptation and from voices that seek to pull me away from You."
                ),
                PrayerVerse(
                    id: "prov-2-17",
                    reference: "Proverbs 2:17",
                    text: "That leaves the companion of her youth\n  And forgets the covenant of her God;",
                    prayer: "Father, help me remain faithful to every covenant and commitment that honors You."
                ),
                PrayerVerse(
                    id: "prov-2-18",
                    reference: "Proverbs 2:18",
                    text: "For her house sinks down to death\n  And her tracks lead to the dead;",
                    prayer: "Lord, keep me far from paths that lead to spiritual death and destruction."
                ),
                PrayerVerse(
                    id: "prov-2-19",
                    reference: "Proverbs 2:19",
                    text: "None who go to her return again,\n  Nor do they reach the paths of life.",
                    prayer: "Jesus, preserve me from choices that separate me from Your wisdom and life."
                ),
                PrayerVerse(
                    id: "prov-2-20",
                    reference: "Proverbs 2:20",
                    text: "So you will walk in the way of good men\n  And keep to the paths of the righteous.",
                    prayer: "Father, help me walk in the company of the righteous and follow the ways of godly people."
                ),
                PrayerVerse(
                    id: "prov-2-21",
                    reference: "Proverbs 2:21",
                    text: "For the upright will live in the land\n  And the blameless will remain in it;",
                    prayer: "Lord, establish me among those who are upright and faithful before You."
                ),
                PrayerVerse(
                    id: "prov-2-22",
                    reference: "Proverbs 2:22",
                    text: "But the wicked will be cut off from the land\n  And the treacherous will be uprooted from it.",
                    prayer: "Jesus, keep me from wickedness and help me remain firmly rooted in Your truth all the days of my life."
                ),
                PrayerVerse(
                    id: "prov-2-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
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
                    reference: "Proverbs 3:1",
                    text: "My son, do not forget my teaching,\n  But let your heart keep my commandments;",
                    prayer: "Dear Jesus, help me never forget Your teachings and let my heart faithfully keep Your commandments."
                ),
                PrayerVerse(
                    id: "prov-3-2",
                    reference: "Proverbs 3:2",
                    text: "For length of days and years of life\n  And peace they will add to you.",
                    prayer: "Father, thank You for the promise of long life, peace, and well-being that comes from walking in Your wisdom. Help me follow Your ways daily."
                ),
                PrayerVerse(
                    id: "prov-3-3",
                    reference: "Proverbs 3:3",
                    text: "Do not let kindness and truth leave you;\n  Bind them around your neck,\n  Write them on the tablet of your heart.",
                    prayer: "Lord, let kindness and truth never leave me. Help me bind them around my neck and write them upon my heart."
                ),
                PrayerVerse(
                    id: "prov-3-4",
                    reference: "Proverbs 3:4",
                    text: "So you will find favor and good repute\n  In the sight of God and man.",
                    prayer: "Jesus, help me find favor and good understanding in the sight of God and people."
                ),
                PrayerVerse(
                    id: "prov-3-5",
                    reference: "Proverbs 3:5",
                    text: "Trust in the Lord with all your heart\n  And do not lean on your own understanding.",
                    prayer: "Father, help me trust in You with all my heart and never rely solely on my own understanding."
                ),
                PrayerVerse(
                    id: "prov-3-6",
                    reference: "Proverbs 3:6",
                    text: "In all your ways acknowledge Him,\n  And He will make your paths straight.",
                    prayer: "Lord, help me acknowledge You in all my ways, and faithfully follow the path You have prepared for me."
                ),
                PrayerVerse(
                    id: "prov-3-7",
                    reference: "Proverbs 3:7",
                    text: "Do not be wise in your own eyes;\n  Fear the Lord and turn away from evil.",
                    prayer: "Jesus, keep me from becoming wise in my own eyes. Teach me to fear You and turn away from evil."
                ),
                PrayerVerse(
                    id: "prov-3-8",
                    reference: "Proverbs 3:8",
                    text: "It will be healing to your body\n  And refreshment to your bones.",
                    prayer: "Father, let obedience to You bring health, strength, and renewal to my life."
                ),
                PrayerVerse(
                    id: "prov-3-9",
                    reference: "Proverbs 3:9",
                    text: "Honor the Lord from your wealth\n  And from the first of all your produce;",
                    prayer: "Lord, teach me to honor You with my possessions and with the first fruits of all You provide."
                ),
                PrayerVerse(
                    id: "prov-3-10",
                    reference: "Proverbs 3:10",
                    text: "So your barns will be filled with plenty\n  And your vats will overflow with new wine.",
                    prayer: "Jesus, help me trust You as my provider and remain faithful with every blessing You place in my hands."
                ),
                PrayerVerse(
                    id: "prov-3-11",
                    reference: "Proverbs 3:11",
                    text: "My son, do not reject the discipline of the Lord\n  Or loathe His reproof,",
                    prayer: "Father, help me not despise Your discipline or become discouraged when You correct me."
                ),
                PrayerVerse(
                    id: "prov-3-12",
                    reference: "Proverbs 3:12",
                    text: "For whom the Lord loves He reproves,\n  Even as a father corrects the son in whom he delights.",
                    prayer: "Lord, thank You for loving me as a Father loves His child. Help me receive Your correction with humility."
                ),
                PrayerVerse(
                    id: "prov-3-13",
                    reference: "Proverbs 3:13",
                    text: "How blessed is the man who finds wisdom\n  And the man who gains understanding.",
                    prayer: "Jesus, help me find wisdom and understanding and treasure them above all earthly riches."
                ),
                PrayerVerse(
                    id: "prov-3-14",
                    reference: "Proverbs 3:14",
                    text: "For her profit is better than the profit of silver\n  And her gain better than fine gold.",
                    prayer: "Father, teach me to value wisdom more than silver and greater than material gain."
                ),
                PrayerVerse(
                    id: "prov-3-15",
                    reference: "Proverbs 3:15",
                    text: "She is more precious than jewels;\n  And nothing you desire compares with her.",
                    prayer: "Lord, remind me that wisdom is more precious than jewels and that nothing compares to the treasure of knowing You."
                ),
                PrayerVerse(
                    id: "prov-3-16",
                    reference: "Proverbs 3:16",
                    text: "Long life is in her right hand;\n  In her left hand are riches and honor.",
                    prayer: "Jesus, thank You that wisdom brings blessings, stability, and purpose. Help me walk in it daily."
                ),
                PrayerVerse(
                    id: "prov-3-17",
                    reference: "Proverbs 3:17",
                    text: "Her ways are pleasant ways\n  And all her paths are peace.",
                    prayer: "Father, let my ways be pleasant and my paths filled with peace as I follow Your guidance."
                ),
                PrayerVerse(
                    id: "prov-3-18",
                    reference: "Proverbs 3:18",
                    text: "She is a tree of life to those who take hold of her,\n  And happy are all who hold her fast.",
                    prayer: "Lord, let Your wisdom become a tree of life to me, bringing growth, strength, and blessing."
                ),
                PrayerVerse(
                    id: "prov-3-19",
                    reference: "Proverbs 3:19",
                    text: "The Lord by wisdom founded the earth,\n  By understanding He established the heavens.",
                    prayer: "Jesus, thank You for creating the earth through wisdom. Help me learn from Your perfect design."
                ),
                PrayerVerse(
                    id: "prov-3-20",
                    reference: "Proverbs 3:20",
                    text: "By His knowledge the deeps were broken up\n  And the skies drip with dew.",
                    prayer: "Father, thank You for Your understanding and power displayed throughout creation."
                ),
                PrayerVerse(
                    id: "prov-3-21",
                    reference: "Proverbs 3:21",
                    text: "My son, let them not vanish from your sight;\n  Keep sound wisdom and discretion,",
                    prayer: "Lord, help me preserve sound wisdom and discretion and never let them depart from my sight."
                ),
                PrayerVerse(
                    id: "prov-3-22",
                    reference: "Proverbs 3:22",
                    text: "So they will be life to your soul\n  And adornment to your neck.",
                    prayer: "Jesus, let wisdom bring life to my soul and grace to my life."
                ),
                PrayerVerse(
                    id: "prov-3-23",
                    reference: "Proverbs 3:23",
                    text: "Then you will walk in your way securely\n  And your foot will not stumble.",
                    prayer: "Father, help me walk securely in Your ways and keep my feet from stumbling."
                ),
                PrayerVerse(
                    id: "prov-3-24",
                    reference: "Proverbs 3:24",
                    text: "When you lie down, you will not be afraid;\n  When you lie down, your sleep will be sweet.",
                    prayer: "Lord, grant me peaceful rest and remove fear and anxiety from my heart."
                ),
                PrayerVerse(
                    id: "prov-3-25",
                    reference: "Proverbs 3:25",
                    text: "Do not be afraid of sudden fear\n  Nor of the onslaught of the wicked when it comes;",
                    prayer: "Jesus, help me not be afraid of sudden fear or trouble when it comes."
                ),
                PrayerVerse(
                    id: "prov-3-26",
                    reference: "Proverbs 3:26",
                    text: "For the Lord will be your confidence\n  And will keep your foot from being caught.",
                    prayer: "Father, be my confidence and keep me safe from every trap of the enemy."
                ),
                PrayerVerse(
                    id: "prov-3-27",
                    reference: "Proverbs 3:27",
                    text: "Do not withhold good from those to whom it is due,\n  When it is in your power to do it.",
                    prayer: "Lord, help me never withhold good from those to whom it is due when it is within my power to help."
                ),
                PrayerVerse(
                    id: "prov-3-28",
                    reference: "Proverbs 3:28",
                    text: "Do not say to your neighbor, \"Go, and come back,\n  And tomorrow I will give it,\"\n  When you have it with you.",
                    prayer: "Jesus, teach me generosity and prompt obedience when I have the opportunity to bless others."
                ),
                PrayerVerse(
                    id: "prov-3-29",
                    reference: "Proverbs 3:29",
                    text: "Do not devise harm against your neighbor,\n  While he lives securely beside you.",
                    prayer: "Father, keep me from planning harm against anyone, especially those who trust me."
                ),
                PrayerVerse(
                    id: "prov-3-30",
                    reference: "Proverbs 3:30",
                    text: "Do not contend with a man without cause,\n  If he has done you no harm.",
                    prayer: "Lord, help me live peacefully with others and avoid unnecessary conflict."
                ),
                PrayerVerse(
                    id: "prov-3-31",
                    reference: "Proverbs 3:31",
                    text: "Do not envy a man of violence\n  And do not choose any of his ways.",
                    prayer: "Jesus, protect my heart from envy and keep me from admiring sinful ways."
                ),
                PrayerVerse(
                    id: "prov-3-32",
                    reference: "Proverbs 3:32",
                    text: "For the devious are an abomination to the Lord;\n  But He is intimate with the upright.",
                    prayer: "Father, help me walk in integrity, knowing that You delight in those who are upright."
                ),
                PrayerVerse(
                    id: "prov-3-33",
                    reference: "Proverbs 3:33",
                    text: "The curse of the Lord is on the house of the wicked,\n  But He blesses the dwelling of the righteous.",
                    prayer: "Lord, let Your blessing rest upon my home and help me live in a way that honors You."
                ),
                PrayerVerse(
                    id: "prov-3-34",
                    reference: "Proverbs 3:34",
                    text: "Though He scoffs at the scoffers,\n  Yet He gives grace to the afflicted.",
                    prayer: "Jesus, teach me humility and help me receive the grace You freely give."
                ),
                PrayerVerse(
                    id: "prov-3-35",
                    reference: "Proverbs 3:35",
                    text: "The wise will inherit honor,\n  But fools display dishonor.",
                    prayer: "Father, let wisdom guide my life so that I may walk in honor and reflect Your glory."
                ),
                PrayerVerse(
                    id: "prov-3-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        )
    ]

    private static let placeholderDays: [PrayerDay] = [
        PrayerDay(
            dayNumber: 4,
            title: "Guard Your Heart",
            chapterReference: "Proverbs 4",
            summary: "Pray for a guarded heart and steady direction.",
            verses: [
                PrayerVerse(
                    id: "prov-4-1",
                    reference: "Proverbs 4:1",
                    text: "Hear, O sons, the instruction of a father,\n  And give attention that you may gain understanding,",
                    prayer: "Dear Jesus, give me a listening heart that receives instruction and grows in understanding."
                ),
                PrayerVerse(
                    id: "prov-4-2",
                    reference: "Proverbs 4:2",
                    text: "For I give you sound teaching;\n  Do not abandon my instruction.",
                    prayer: "Father, help me value and hold tightly to the good teaching found in Your Word."
                ),
                PrayerVerse(
                    id: "prov-4-3",
                    reference: "Proverbs 4:3",
                    text: "When I was a son to my father,\n  Tender and the only son in the sight of my mother,",
                    prayer: "Lord, thank You for the people You have placed in my life to teach, guide, and encourage me."
                ),
                PrayerVerse(
                    id: "prov-4-4",
                    reference: "Proverbs 4:4",
                    text: "Then he taught me and said to me,\n  "Let your heart hold fast my words;\n  Keep my commandments and live;",
                    prayer: "Jesus, help me keep Your words in my heart and obey Your commands so that I may truly live."
                ),
                PrayerVerse(
                    id: "prov-4-5",
                    reference: "Proverbs 4:5",
                    text: "Acquire wisdom! Acquire understanding!\n  Do not forget nor turn away from the words of my mouth.",
                    prayer: "Father, help me pursue wisdom and understanding above all else. Let me never turn away from Your truth."
                ),
                PrayerVerse(
                    id: "prov-4-6",
                    reference: "Proverbs 4:6",
                    text: "Do not forsake her, and she will guard you;\n  Love her, and she will watch over you.",
                    prayer: "Lord, teach me to love wisdom and allow it to protect and preserve my life."
                ),
                PrayerVerse(
                    id: "prov-4-7",
                    reference: "Proverbs 4:7",
                    text: "The beginning of wisdom is: Acquire wisdom;\n  And with all your acquiring, get understanding.",
                    prayer: "Jesus, help me make wisdom my highest priority and seek understanding in everything I do."
                ),
                PrayerVerse(
                    id: "prov-4-8",
                    reference: "Proverbs 4:8",
                    text: "Prize her, and she will exalt you;\n  She will honor you if you embrace her.",
                    prayer: "Father, help me cherish wisdom so that my life may be lifted up and strengthened through it."
                ),
                PrayerVerse(
                    id: "prov-4-9",
                    reference: "Proverbs 4:9",
                    text: "She will place on your head a garland of grace;\n  She will present you with a crown of beauty."",
                    prayer: "Lord, let wisdom be like a crown of grace upon my life and bring honor to Your name."
                ),
                PrayerVerse(
                    id: "prov-4-10",
                    reference: "Proverbs 4:10",
                    text: "Hear, my son, and accept my sayings\n  And the years of your life will be many.",
                    prayer: "Jesus, help me hear and receive Your instruction so that my days may be fruitful and blessed."
                ),
                PrayerVerse(
                    id: "prov-4-11",
                    reference: "Proverbs 4:11",
                    text: "I have directed you in the way of wisdom;\n  I have led you in upright paths.",
                    prayer: "Father, guide me in the way of wisdom and lead me on straight paths."
                ),
                PrayerVerse(
                    id: "prov-4-12",
                    reference: "Proverbs 4:12",
                    text: "When you walk, your steps will not be impeded;\n  And if you run, you will not stumble.",
                    prayer: "Lord, direct my steps so that I may walk securely and not stumble."
                ),
                PrayerVerse(
                    id: "prov-4-13",
                    reference: "Proverbs 4:13",
                    text: "Take hold of instruction; do not let go.\n  Guard her, for she is your life.",
                    prayer: "Jesus, help me hold firmly to instruction and never let go of the wisdom You give."
                ),
                PrayerVerse(
                    id: "prov-4-14",
                    reference: "Proverbs 4:14",
                    text: "Do not enter the path of the wicked\n  And do not proceed in the way of evil men.",
                    prayer: "Father, keep me from entering the path of the wicked or following sinful influences."
                ),
                PrayerVerse(
                    id: "prov-4-15",
                    reference: "Proverbs 4:15",
                    text: "Avoid it, do not pass by it;\n  Turn away from it and pass on.",
                    prayer: "Lord, help me avoid evil, turn away from temptation, and continue walking in righteousness."
                ),
                PrayerVerse(
                    id: "prov-4-16",
                    reference: "Proverbs 4:16",
                    text: "For they cannot sleep unless they do evil;\n  And they are robbed of sleep unless they make someone stumble.",
                    prayer: "Jesus, protect me from hearts and minds that delight in wrongdoing and harm."
                ),
                PrayerVerse(
                    id: "prov-4-17",
                    reference: "Proverbs 4:17",
                    text: "For they eat the bread of wickedness\n  And drink the wine of violence.",
                    prayer: "Father, keep me from participating in sinful gain, injustice, or anything that dishonors You."
                ),
                PrayerVerse(
                    id: "prov-4-18",
                    reference: "Proverbs 4:18",
                    text: "But the path of the righteous is like the light of dawn,\n  That shines brighter and brighter until the full day.",
                    prayer: "Lord, let my path shine brighter and brighter as I grow in faith, wisdom, and obedience."
                ),
                PrayerVerse(
                    id: "prov-4-19",
                    reference: "Proverbs 4:19",
                    text: "The way of the wicked is like darkness;\n  They do not know over what they stumble.",
                    prayer: "Jesus, keep me from walking in darkness and help me recognize what causes people to stumble."
                ),
                PrayerVerse(
                    id: "prov-4-20",
                    reference: "Proverbs 4:20",
                    text: "My son, give attention to my words;\n  Incline your ear to my sayings.",
                    prayer: "Father, help me pay close attention to Your words and listen carefully to Your voice."
                ),
                PrayerVerse(
                    id: "prov-4-21",
                    reference: "Proverbs 4:21",
                    text: "Do not let them depart from your sight;\n  Keep them in the midst of your heart.",
                    prayer: "Lord, let Your truth remain continually before my eyes and deeply rooted in my heart."
                ),
                PrayerVerse(
                    id: "prov-4-22",
                    reference: "Proverbs 4:22",
                    text: "For they are life to those who find them\n  And health to all their body.",
                    prayer: "Jesus, thank You that Your Word brings life, healing, strength, and hope."
                ),
                PrayerVerse(
                    id: "prov-4-23",
                    reference: "Proverbs 4:23",
                    text: "Watch over your heart with all diligence,\n  For from it flow the springs of life.",
                    prayer: "Father, help me guard my heart diligently, for everything I do flows from it."
                ),
                PrayerVerse(
                    id: "prov-4-24",
                    reference: "Proverbs 4:24",
                    text: "Put away from you a deceitful mouth\n  And put devious speech far from you.",
                    prayer: "Lord, remove deceit, dishonesty, and corrupt speech from my mouth."
                ),
                PrayerVerse(
                    id: "prov-4-25",
                    reference: "Proverbs 4:25",
                    text: "Let your eyes look directly ahead\n  And let your gaze be fixed straight in front of you.",
                    prayer: "Jesus, help me keep my eyes focused on You and the path You have set before me."
                ),
                PrayerVerse(
                    id: "prov-4-26",
                    reference: "Proverbs 4:26",
                    text: "Watch the path of your feet\n  And all your ways will be established.",
                    prayer: "Father, teach me to carefully consider my choices and establish my steps in wisdom."
                ),
                PrayerVerse(
                    id: "prov-4-27",
                    reference: "Proverbs 4:27",
                    text: "Do not turn to the right nor to the left;\n  Turn your foot from evil.",
                    prayer: "Lord, help me not turn to the right or to the left, but keep me firmly on the path of righteousness and away from evil."
                ),
                PrayerVerse(
                    id: "prov-4-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Walk in Integrity",
            chapterReference: "Proverbs 5",
            summary: "Ask for purity, discernment, and faithful living.",
            verses: [
                PrayerVerse(
                    id: "prov-5-1",
                    reference: "Proverbs 5:1",
                    text: "Dear Jesus, help me pay attention to Your wisdom and incline my heart to Your understanding.",
                    prayer: "Dear Jesus, help me pay attention to Your wisdom and incline my heart to Your understanding."
                ),
                PrayerVerse(
                    id: "prov-5-2",
                    reference: "Proverbs 5:2",
                    text: "Father, help me preserve discretion and let my lips speak knowledge, truth, and wisdom.",
                    prayer: "Father, help me preserve discretion and let my lips speak knowledge, truth, and wisdom."
                ),
                PrayerVerse(
                    id: "prov-5-3",
                    reference: "Proverbs 5:3",
                    text: "Lord, give me discernment to recognize temptation, even when it appears attractive and appealing.",
                    prayer: "Lord, give me discernment to recognize temptation, even when it appears attractive and appealing."
                ),
                PrayerVerse(
                    id: "prov-5-4",
                    reference: "Proverbs 5:4",
                    text: "Jesus, protect me from paths that seem pleasant at first but lead to bitterness and pain.",
                    prayer: "Jesus, protect me from paths that seem pleasant at first but lead to bitterness and pain."
                ),
                PrayerVerse(
                    id: "prov-5-5",
                    reference: "Proverbs 5:5",
                    text: "Father, keep my feet from walking toward spiritual destruction and separation from You.",
                    prayer: "Father, keep my feet from walking toward spiritual destruction and separation from You."
                ),
                PrayerVerse(
                    id: "prov-5-6",
                    reference: "Proverbs 5:6",
                    text: "Lord, help me stay focused on Your path of life and not be led astray by confusion or deception.",
                    prayer: "Lord, help me stay focused on Your path of life and not be led astray by confusion or deception."
                ),
                PrayerVerse(
                    id: "prov-5-7",
                    reference: "Proverbs 5:7",
                    text: "Jesus, help me listen carefully to Your instruction and never turn away from Your wisdom.",
                    prayer: "Jesus, help me listen carefully to Your instruction and never turn away from Your wisdom."
                ),
                PrayerVerse(
                    id: "prov-5-8",
                    reference: "Proverbs 5:8",
                    text: "Father, keep me far from temptation and from anything that seeks to pull me away from You.",
                    prayer: "Father, keep me far from temptation and from anything that seeks to pull me away from You."
                ),
                PrayerVerse(
                    id: "prov-5-9",
                    reference: "Proverbs 5:9",
                    text: "Lord, protect my honor, strength, and years from being wasted through foolish choices.",
                    prayer: "Lord, protect my honor, strength, and years from being wasted through foolish choices."
                ),
                PrayerVerse(
                    id: "prov-5-10",
                    reference: "Proverbs 5:10",
                    text: "Jesus, help me steward my resources wisely and keep me from losing what You have entrusted to me.",
                    prayer: "Jesus, help me steward my resources wisely and keep me from losing what You have entrusted to me."
                ),
                PrayerVerse(
                    id: "prov-5-11",
                    reference: "Proverbs 5:11",
                    text: "Father, spare me from future regret and sorrow caused by sinful decisions.",
                    prayer: "Father, spare me from future regret and sorrow caused by sinful decisions."
                ),
                PrayerVerse(
                    id: "prov-5-12",
                    reference: "Proverbs 5:12",
                    text: "Lord, give me a heart that welcomes correction, instruction, and wisdom while there is still time.",
                    prayer: "Lord, give me a heart that welcomes correction, instruction, and wisdom while there is still time."
                ),
                PrayerVerse(
                    id: "prov-5-13",
                    reference: "Proverbs 5:13",
                    text: "Jesus, help me listen to godly counsel and obey wise instruction.",
                    prayer: "Jesus, help me listen to godly counsel and obey wise instruction."
                ),
                PrayerVerse(
                    id: "prov-5-14",
                    reference: "Proverbs 5:14",
                    text: "Father, protect me from public shame and the consequences of hidden sin.",
                    prayer: "Father, protect me from public shame and the consequences of hidden sin."
                ),
                PrayerVerse(
                    id: "prov-5-15",
                    reference: "Proverbs 5:15",
                    text: "Lord, teach me faithfulness and contentment in the relationships and blessings You have given me.",
                    prayer: "Lord, teach me faithfulness and contentment in the relationships and blessings You have given me."
                ),
                PrayerVerse(
                    id: "prov-5-16",
                    reference: "Proverbs 5:16",
                    text: "Jesus, help me honor Your design for love, commitment, and purity.",
                    prayer: "Jesus, help me honor Your design for love, commitment, and purity."
                ),
                PrayerVerse(
                    id: "prov-5-17",
                    reference: "Proverbs 5:17",
                    text: "Father, let my heart remain faithful and devoted to the covenant relationships You have established.",
                    prayer: "Father, let my heart remain faithful and devoted to the covenant relationships You have established."
                ),
                PrayerVerse(
                    id: "prov-5-18",
                    reference: "Proverbs 5:18",
                    text: "Lord, bless my relationships with joy, faithfulness, gratitude, and love.",
                    prayer: "Lord, bless my relationships with joy, faithfulness, gratitude, and love."
                ),
                PrayerVerse(
                    id: "prov-5-19",
                    reference: "Proverbs 5:19",
                    text: "Jesus, help me find satisfaction, delight, and contentment in the blessings You have provided.",
                    prayer: "Jesus, help me find satisfaction, delight, and contentment in the blessings You have provided."
                ),
                PrayerVerse(
                    id: "prov-5-20",
                    reference: "Proverbs 5:20",
                    text: "Father, keep my heart from wandering toward temptation and unfaithfulness.",
                    prayer: "Father, keep my heart from wandering toward temptation and unfaithfulness."
                ),
                PrayerVerse(
                    id: "prov-5-21",
                    reference: "Proverbs 5:21",
                    text: "Lord, remind me that all my ways are before Your eyes and that nothing is hidden from You.",
                    prayer: "Lord, remind me that all my ways are before Your eyes and that nothing is hidden from You."
                ),
                PrayerVerse(
                    id: "prov-5-22",
                    reference: "Proverbs 5:22",
                    text: "Jesus, keep me from becoming trapped by my own sins and foolish decisions.",
                    prayer: "Jesus, keep me from becoming trapped by my own sins and foolish decisions."
                ),
                PrayerVerse(
                    id: "prov-5-23",
                    reference: "Proverbs 5:23",
                    text: "Father, help me walk in self-control, wisdom, and obedience so I do not drift from Your path.",
                    prayer: "Father, help me walk in self-control, wisdom, and obedience so I do not drift from Your path."
                ),
                PrayerVerse(
                    id: "prov-5-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 6,
            title: "Choose Diligence",
            chapterReference: "Proverbs 6",
            summary: "Pray for diligence and freedom from destructive habits.",
            verses: [
                PrayerVerse(
                    id: "prov-6-1",
                    reference: "Proverbs 6:1",
                    text: "Dear Jesus, help me to walk in wisdom with my decisions, my words, and my commitments. Teach me not to make careless promises or place myself in harmful obligations.",
                    prayer: "Dear Jesus, help me to walk in wisdom with my decisions, my words, and my commitments. Teach me not to make careless promises or place myself in harmful obligations."
                ),
                PrayerVerse(
                    id: "prov-6-2",
                    reference: "Proverbs 6:2",
                    text: "Father, guard my mouth and my speech. Help me not to speak rashly or make promises without wisdom.",
                    prayer: "Father, guard my mouth and my speech. Help me not to speak rashly or make promises without wisdom."
                ),
                PrayerVerse(
                    id: "prov-6-3",
                    reference: "Proverbs 6:3",
                    text: "Lord, teach me humility. Help me to seek peace quickly and correct my mistakes with wisdom and honesty.",
                    prayer: "Lord, teach me humility. Help me to seek peace quickly and correct my mistakes with wisdom and honesty."
                ),
                PrayerVerse(
                    id: "prov-6-4",
                    reference: "Proverbs 6:4",
                    text: "Jesus, help me not ignore danger, sin, or foolishness in my life. Give me urgency to deal with problems wisely.",
                    prayer: "Jesus, help me not ignore danger, sin, or foolishness in my life. Give me urgency to deal with problems wisely."
                ),
                PrayerVerse(
                    id: "prov-6-5",
                    reference: "Proverbs 6:5",
                    text: "Father, rescue me from every trap of the enemy and give me wisdom to flee from danger quickly.",
                    prayer: "Father, rescue me from every trap of the enemy and give me wisdom to flee from danger quickly."
                ),
                PrayerVerse(
                    id: "prov-6-6",
                    reference: "Proverbs 6:6",
                    text: "Lord, teach me diligence, discipline, and consistency. Help me not waste my time or opportunities.",
                    prayer: "Lord, teach me diligence, discipline, and consistency. Help me not waste my time or opportunities."
                ),
                PrayerVerse(
                    id: "prov-6-7",
                    reference: "Proverbs 6:7",
                    text: "Jesus, help me develop self-control and responsibility even when nobody is watching.",
                    prayer: "Jesus, help me develop self-control and responsibility even when nobody is watching."
                ),
                PrayerVerse(
                    id: "prov-6-8",
                    reference: "Proverbs 6:8",
                    text: "Father, teach me to prepare wisely for the future and faithfully steward the resources You provide.",
                    prayer: "Father, teach me to prepare wisely for the future and faithfully steward the resources You provide."
                ),
                PrayerVerse(
                    id: "prov-6-9",
                    reference: "Proverbs 6:9",
                    text: "Lord, awaken me spiritually, mentally, and physically. Remove laziness and passivity from my life.",
                    prayer: "Lord, awaken me spiritually, mentally, and physically. Remove laziness and passivity from my life."
                ),
                PrayerVerse(
                    id: "prov-6-10",
                    reference: "Proverbs 6:10",
                    text: "Jesus, protect me from becoming comfortable in complacency or drifting away from purposeful living.",
                    prayer: "Jesus, protect me from becoming comfortable in complacency or drifting away from purposeful living."
                ),
                PrayerVerse(
                    id: "prov-6-11",
                    reference: "Proverbs 6:11",
                    text: "Father, help me understand the consequences of neglect and laziness. Teach me discipline and diligence.",
                    prayer: "Father, help me understand the consequences of neglect and laziness. Teach me discipline and diligence."
                ),
                PrayerVerse(
                    id: "prov-6-12",
                    reference: "Proverbs 6:12",
                    text: "Lord, purify my heart and my speech. Remove deceit, manipulation, and dishonesty from my life.",
                    prayer: "Lord, purify my heart and my speech. Remove deceit, manipulation, and dishonesty from my life."
                ),
                PrayerVerse(
                    id: "prov-6-13",
                    reference: "Proverbs 6:13",
                    text: "Jesus, help me walk sincerely and transparently before You and others.",
                    prayer: "Jesus, help me walk sincerely and transparently before You and others."
                ),
                PrayerVerse(
                    id: "prov-6-14",
                    reference: "Proverbs 6:14",
                    text: "Father, cleanse my heart from bitterness, division, and harmful intentions. Make me a peacemaker.",
                    prayer: "Father, cleanse my heart from bitterness, division, and harmful intentions. Make me a peacemaker."
                ),
                PrayerVerse(
                    id: "prov-6-15",
                    reference: "Proverbs 6:15",
                    text: "Lord, keep me from the path of destruction and give me a heart that listens to correction.",
                    prayer: "Lord, keep me from the path of destruction and give me a heart that listens to correction."
                ),
                PrayerVerse(
                    id: "prov-6-16",
                    reference: "Proverbs 6:16",
                    text: "Jesus, help me hate what is evil and love what is righteous and pleasing in Your sight.",
                    prayer: "Jesus, help me hate what is evil and love what is righteous and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "prov-6-17",
                    reference: "Proverbs 6:17",
                    text: "Father, remove pride, dishonesty, and cruelty from my heart. Teach me humility, truth, and compassion.",
                    prayer: "Father, remove pride, dishonesty, and cruelty from my heart. Teach me humility, truth, and compassion."
                ),
                PrayerVerse(
                    id: "prov-6-18",
                    reference: "Proverbs 6:18",
                    text: "Lord, purify my thoughts and desires. Help me run toward righteousness instead of sin.",
                    prayer: "Lord, purify my thoughts and desires. Help me run toward righteousness instead of sin."
                ),
                PrayerVerse(
                    id: "prov-6-19",
                    reference: "Proverbs 6:19",
                    text: "Jesus, help me never spread lies, gossip, or division. Let me bring peace and truth wherever I go.",
                    prayer: "Jesus, help me never spread lies, gossip, or division. Let me bring peace and truth wherever I go."
                ),
                PrayerVerse(
                    id: "prov-6-20",
                    reference: "Proverbs 6:20",
                    text: "Father, help me honor godly instruction and receive wisdom with a teachable spirit.",
                    prayer: "Father, help me honor godly instruction and receive wisdom with a teachable spirit."
                ),
                PrayerVerse(
                    id: "prov-6-21",
                    reference: "Proverbs 6:21",
                    text: "Lord, let Your Word remain close to my heart and guide my life daily.",
                    prayer: "Lord, let Your Word remain close to my heart and guide my life daily."
                ),
                PrayerVerse(
                    id: "prov-6-22",
                    reference: "Proverbs 6:22",
                    text: "Jesus, let Your wisdom guide me when I walk, watch over me when I sleep, and direct me when I rise.",
                    prayer: "Jesus, let Your wisdom guide me when I walk, watch over me when I sleep, and direct me when I rise."
                ),
                PrayerVerse(
                    id: "prov-6-23",
                    reference: "Proverbs 6:23",
                    text: "Father, thank You for Your commandments and correction. Help me receive discipline with humility.",
                    prayer: "Father, thank You for Your commandments and correction. Help me receive discipline with humility."
                ),
                PrayerVerse(
                    id: "prov-6-24",
                    reference: "Proverbs 6:24",
                    text: "Lord, protect my heart, mind, and eyes from temptation and impurity.",
                    prayer: "Lord, protect my heart, mind, and eyes from temptation and impurity."
                ),
                PrayerVerse(
                    id: "prov-6-25",
                    reference: "Proverbs 6:25",
                    text: "Jesus, guard my thoughts and desires so that lust never takes root in my heart.",
                    prayer: "Jesus, guard my thoughts and desires so that lust never takes root in my heart."
                ),
                PrayerVerse(
                    id: "prov-6-26",
                    reference: "Proverbs 6:26",
                    text: "Father, help me understand the cost and destruction that sin can bring into a life.",
                    prayer: "Father, help me understand the cost and destruction that sin can bring into a life."
                ),
                PrayerVerse(
                    id: "prov-6-27",
                    reference: "Proverbs 6:27",
                    text: "Lord, remind me that sin always carries consequences. Give me wisdom to avoid dangerous temptations.",
                    prayer: "Lord, remind me that sin always carries consequences. Give me wisdom to avoid dangerous temptations."
                ),
                PrayerVerse(
                    id: "prov-6-28",
                    reference: "Proverbs 6:28",
                    text: "Jesus, help me never believe I can play with sin without being harmed. Keep me spiritually alert.",
                    prayer: "Jesus, help me never believe I can play with sin without being harmed. Keep me spiritually alert."
                ),
                PrayerVerse(
                    id: "prov-6-29",
                    reference: "Proverbs 6:29",
                    text: "Father, help me honor purity, faithfulness, and integrity in every relationship.",
                    prayer: "Father, help me honor purity, faithfulness, and integrity in every relationship."
                ),
                PrayerVerse(
                    id: "prov-6-30",
                    reference: "Proverbs 6:30",
                    text: "Lord, give me compassion, wisdom, and understanding toward those who struggle and suffer.",
                    prayer: "Lord, give me compassion, wisdom, and understanding toward those who struggle and suffer."
                ),
                PrayerVerse(
                    id: "prov-6-31",
                    reference: "Proverbs 6:31",
                    text: "Jesus, teach me responsibility and accountability for my actions.",
                    prayer: "Jesus, teach me responsibility and accountability for my actions."
                ),
                PrayerVerse(
                    id: "prov-6-32",
                    reference: "Proverbs 6:32",
                    text: "Father, protect me from destructive desires and foolish choices that damage my soul.",
                    prayer: "Father, protect me from destructive desires and foolish choices that damage my soul."
                ),
                PrayerVerse(
                    id: "prov-6-33",
                    reference: "Proverbs 6:33",
                    text: "Lord, help me avoid paths that lead to shame, brokenness, and regret.",
                    prayer: "Lord, help me avoid paths that lead to shame, brokenness, and regret."
                ),
                PrayerVerse(
                    id: "prov-6-34",
                    reference: "Proverbs 6:34",
                    text: "Jesus, teach me the seriousness of betrayal and help me walk faithfully before You and others.",
                    prayer: "Jesus, teach me the seriousness of betrayal and help me walk faithfully before You and others."
                ),
                PrayerVerse(
                    id: "prov-6-35",
                    reference: "Proverbs 6:35",
                    text: "Father, help me live carefully, wisely, and honorably so that my life reflects Your righteousness.",
                    prayer: "Father, help me live carefully, wisely, and honorably so that my life reflects Your righteousness."
                ),
                PrayerVerse(
                    id: "prov-6-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Treasure Wisdom",
            chapterReference: "Proverbs 7",
            summary: "Seek wisdom that protects and keeps you near God's heart.",
            verses: [
                PrayerVerse(
                    id: "prov-7-1",
                    reference: "Proverbs 7:1",
                    text: "Dear Jesus, help me keep Your words and treasure Your commandments in my heart.",
                    prayer: "Dear Jesus, help me keep Your words and treasure Your commandments in my heart."
                ),
                PrayerVerse(
                    id: "prov-7-2",
                    reference: "Proverbs 7:2",
                    text: "Father, help me obey Your commands and walk in the life that comes from following Your truth.",
                    prayer: "Father, help me obey Your commands and walk in the life that comes from following Your truth."
                ),
                PrayerVerse(
                    id: "prov-7-3",
                    reference: "Proverbs 7:3",
                    text: "Lord, let Your wisdom be written upon my heart and remain before my eyes every day.",
                    prayer: "Lord, let Your wisdom be written upon my heart and remain before my eyes every day."
                ),
                PrayerVerse(
                    id: "prov-7-4",
                    reference: "Proverbs 7:4",
                    text: "Jesus, help me treat wisdom as a close friend and understanding as a beloved companion.",
                    prayer: "Jesus, help me treat wisdom as a close friend and understanding as a beloved companion."
                ),
                PrayerVerse(
                    id: "prov-7-5",
                    reference: "Proverbs 7:5",
                    text: "Father, protect me from temptation and from voices that seek to draw me away from Your ways.",
                    prayer: "Father, protect me from temptation and from voices that seek to draw me away from Your ways."
                ),
                PrayerVerse(
                    id: "prov-7-6",
                    reference: "Proverbs 7:6",
                    text: "Lord, give me discernment to recognize danger before I walk into it.",
                    prayer: "Lord, give me discernment to recognize danger before I walk into it."
                ),
                PrayerVerse(
                    id: "prov-7-7",
                    reference: "Proverbs 7:7",
                    text: "Jesus, keep me from being simple-minded or lacking understanding. Fill me with wisdom and good judgment.",
                    prayer: "Jesus, keep me from being simple-minded or lacking understanding. Fill me with wisdom and good judgment."
                ),
                PrayerVerse(
                    id: "prov-7-8",
                    reference: "Proverbs 7:8",
                    text: "Father, help me avoid places, situations, and influences that lead me toward temptation.",
                    prayer: "Father, help me avoid places, situations, and influences that lead me toward temptation."
                ),
                PrayerVerse(
                    id: "prov-7-9",
                    reference: "Proverbs 7:9",
                    text: "Lord, protect me during seasons of weakness, loneliness, and spiritual darkness.",
                    prayer: "Lord, protect me during seasons of weakness, loneliness, and spiritual darkness."
                ),
                PrayerVerse(
                    id: "prov-7-10",
                    reference: "Proverbs 7:10",
                    text: "Jesus, give me wisdom to recognize deception even when it appears attractive or harmless.",
                    prayer: "Jesus, give me wisdom to recognize deception even when it appears attractive or harmless."
                ),
                PrayerVerse(
                    id: "prov-7-11",
                    reference: "Proverbs 7:11",
                    text: "Father, help me remain humble, disciplined, and obedient to Your guidance.",
                    prayer: "Father, help me remain humble, disciplined, and obedient to Your guidance."
                ),
                PrayerVerse(
                    id: "prov-7-12",
                    reference: "Proverbs 7:12",
                    text: "Lord, teach me not to wander aimlessly into situations that can compromise my faith.",
                    prayer: "Lord, teach me not to wander aimlessly into situations that can compromise my faith."
                ),
                PrayerVerse(
                    id: "prov-7-13",
                    reference: "Proverbs 7:13",
                    text: "Jesus, help me recognize manipulation and resist every form of temptation.",
                    prayer: "Jesus, help me recognize manipulation and resist every form of temptation."
                ),
                PrayerVerse(
                    id: "prov-7-14",
                    reference: "Proverbs 7:14",
                    text: "Father, give me discernment when people use spiritual language to justify sinful behavior.",
                    prayer: "Father, give me discernment when people use spiritual language to justify sinful behavior."
                ),
                PrayerVerse(
                    id: "prov-7-15",
                    reference: "Proverbs 7:15",
                    text: "Lord, protect me from flattery and words designed to deceive my heart.",
                    prayer: "Lord, protect me from flattery and words designed to deceive my heart."
                ),
                PrayerVerse(
                    id: "prov-7-16",
                    reference: "Proverbs 7:16",
                    text: "Jesus, help me value purity over temporary pleasure and righteousness over worldly attraction.",
                    prayer: "Jesus, help me value purity over temporary pleasure and righteousness over worldly attraction."
                ),
                PrayerVerse(
                    id: "prov-7-17",
                    reference: "Proverbs 7:17",
                    text: "Father, give me wisdom to see beyond outward beauty and attractive appearances.",
                    prayer: "Father, give me wisdom to see beyond outward beauty and attractive appearances."
                ),
                PrayerVerse(
                    id: "prov-7-18",
                    reference: "Proverbs 7:18",
                    text: "Lord, help me resist invitations that lead away from Your will and Your truth.",
                    prayer: "Lord, help me resist invitations that lead away from Your will and Your truth."
                ),
                PrayerVerse(
                    id: "prov-7-19",
                    reference: "Proverbs 7:19",
                    text: "Jesus, protect me from believing that hidden sin can remain hidden from You.",
                    prayer: "Jesus, protect me from believing that hidden sin can remain hidden from You."
                ),
                PrayerVerse(
                    id: "prov-7-20",
                    reference: "Proverbs 7:20",
                    text: "Father, remind me that every action has consequences and that You see all things.",
                    prayer: "Father, remind me that every action has consequences and that You see all things."
                ),
                PrayerVerse(
                    id: "prov-7-21",
                    reference: "Proverbs 7:21",
                    text: "Lord, guard my heart from persuasive words that seek to pull me away from righteousness.",
                    prayer: "Lord, guard my heart from persuasive words that seek to pull me away from righteousness."
                ),
                PrayerVerse(
                    id: "prov-7-22",
                    reference: "Proverbs 7:22",
                    text: "Jesus, keep me from following temptation foolishly and without understanding.",
                    prayer: "Jesus, keep me from following temptation foolishly and without understanding."
                ),
                PrayerVerse(
                    id: "prov-7-23",
                    reference: "Proverbs 7:23",
                    text: "Father, help me recognize that sin ultimately wounds the soul and leads to destruction.",
                    prayer: "Father, help me recognize that sin ultimately wounds the soul and leads to destruction."
                ),
                PrayerVerse(
                    id: "prov-7-24",
                    reference: "Proverbs 7:24",
                    text: "Lord, give me ears that listen carefully to wisdom and instruction.",
                    prayer: "Lord, give me ears that listen carefully to wisdom and instruction."
                ),
                PrayerVerse(
                    id: "prov-7-25",
                    reference: "Proverbs 7:25",
                    text: "Jesus, keep my heart from wandering toward temptation or becoming captivated by sinful desires.",
                    prayer: "Jesus, keep my heart from wandering toward temptation or becoming captivated by sinful desires."
                ),
                PrayerVerse(
                    id: "prov-7-26",
                    reference: "Proverbs 7:26",
                    text: "Father, protect me from becoming another casualty of sin and spiritual compromise.",
                    prayer: "Father, protect me from becoming another casualty of sin and spiritual compromise."
                ),
                PrayerVerse(
                    id: "prov-7-27",
                    reference: "Proverbs 7:27",
                    text: "Lord, keep my feet on the path of life and away from every road that leads to destruction.",
                    prayer: "Lord, keep my feet on the path of life and away from every road that leads to destruction."
                ),
                PrayerVerse(
                    id: "prov-7-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
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

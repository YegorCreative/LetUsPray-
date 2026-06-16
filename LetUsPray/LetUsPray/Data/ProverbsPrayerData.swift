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
                    text: "Then he taught me and said to me,\n  \"Let your heart hold fast my words;\n  Keep my commandments and live;",
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
                    text: "She will place on your head a garland of grace;\n  She will present you with a crown of beauty.\"",
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
                    text: "My son, give attention to my wisdom,\n  Incline your ear to my understanding;",
                    prayer: "Dear Jesus, help me pay attention to Your wisdom and incline my heart to Your understanding."
                ),
                PrayerVerse(
                    id: "prov-5-2",
                    reference: "Proverbs 5:2",
                    text: "That you may observe discretion\n  And your lips may reserve knowledge.",
                    prayer: "Father, help me preserve discretion and let my lips speak knowledge, truth, and wisdom."
                ),
                PrayerVerse(
                    id: "prov-5-3",
                    reference: "Proverbs 5:3",
                    text: "For the lips of an adulteress drip honey\n  And smoother than oil is her speech;",
                    prayer: "Lord, give me discernment to recognize temptation, even when it appears attractive and appealing."
                ),
                PrayerVerse(
                    id: "prov-5-4",
                    reference: "Proverbs 5:4",
                    text: "But in the end she is bitter as wormwood,\n  Sharp as a two-edged sword.",
                    prayer: "Jesus, protect me from paths that seem pleasant at first but lead to bitterness and pain."
                ),
                PrayerVerse(
                    id: "prov-5-5",
                    reference: "Proverbs 5:5",
                    text: "Her feet go down to death,\n  Her steps take hold of Sheol.",
                    prayer: "Father, keep my feet from walking toward spiritual destruction and separation from You."
                ),
                PrayerVerse(
                    id: "prov-5-6",
                    reference: "Proverbs 5:6",
                    text: "She does not ponder the path of life;\n  Her ways are unstable, she does not know it.",
                    prayer: "Lord, help me stay focused on Your path of life and not be led astray by confusion or deception."
                ),
                PrayerVerse(
                    id: "prov-5-7",
                    reference: "Proverbs 5:7",
                    text: "Now then, my sons, listen to me\n  And do not depart from the words of my mouth.",
                    prayer: "Jesus, help me listen carefully to Your instruction and never turn away from Your wisdom."
                ),
                PrayerVerse(
                    id: "prov-5-8",
                    reference: "Proverbs 5:8",
                    text: "Keep your way far from her\n  And do not go near the door of her house,",
                    prayer: "Father, keep me far from temptation and from anything that seeks to pull me away from You."
                ),
                PrayerVerse(
                    id: "prov-5-9",
                    reference: "Proverbs 5:9",
                    text: "Or you will give your vigor to others\n  And your years to the cruel one;",
                    prayer: "Lord, protect my honor, strength, and years from being wasted through foolish choices."
                ),
                PrayerVerse(
                    id: "prov-5-10",
                    reference: "Proverbs 5:10",
                    text: "And strangers will be filled with your strength\n  And your hard-earned goods will go to the house of an alien;",
                    prayer: "Jesus, help me steward my resources wisely and keep me from losing what You have entrusted to me."
                ),
                PrayerVerse(
                    id: "prov-5-11",
                    reference: "Proverbs 5:11",
                    text: "And you groan at your final end,\n  When your flesh and your body are consumed;",
                    prayer: "Father, spare me from future regret and sorrow caused by sinful decisions."
                ),
                PrayerVerse(
                    id: "prov-5-12",
                    reference: "Proverbs 5:12",
                    text: "And you say, \"How I have hated instruction!\n  And my heart spurned reproof!",
                    prayer: "Lord, give me a heart that welcomes correction, instruction, and wisdom while there is still time."
                ),
                PrayerVerse(
                    id: "prov-5-13",
                    reference: "Proverbs 5:13",
                    text: "I have not listened to the voice of my teachers,\n  Nor inclined my ear to my instructors!",
                    prayer: "Jesus, help me listen to godly counsel and obey wise instruction."
                ),
                PrayerVerse(
                    id: "prov-5-14",
                    reference: "Proverbs 5:14",
                    text: "I was almost in utter ruin\n  In the midst of the assembly and congregation.\"",
                    prayer: "Father, protect me from public shame and the consequences of hidden sin."
                ),
                PrayerVerse(
                    id: "prov-5-15",
                    reference: "Proverbs 5:15",
                    text: "Drink water from your own cistern\n  And fresh water from your own well.",
                    prayer: "Lord, teach me faithfulness and contentment in the relationships and blessings You have given me."
                ),
                PrayerVerse(
                    id: "prov-5-16",
                    reference: "Proverbs 5:16",
                    text: "Should your springs be dispersed abroad,\n  Streams of water in the streets?",
                    prayer: "Jesus, help me honor Your design for love, commitment, and purity."
                ),
                PrayerVerse(
                    id: "prov-5-17",
                    reference: "Proverbs 5:17",
                    text: "Let them be yours alone\n  And not for strangers with you.",
                    prayer: "Father, let my heart remain faithful and devoted to the covenant relationships You have established."
                ),
                PrayerVerse(
                    id: "prov-5-18",
                    reference: "Proverbs 5:18",
                    text: "Let your fountain be blessed,\n  And rejoice in the wife of your youth.",
                    prayer: "Lord, bless my relationships with joy, faithfulness, gratitude, and love."
                ),
                PrayerVerse(
                    id: "prov-5-19",
                    reference: "Proverbs 5:19",
                    text: "As a loving hind and a graceful doe,\n  Let her breasts satisfy you at all times;\n  Be exhilarated always with her love.",
                    prayer: "Jesus, help me find satisfaction, delight, and contentment in the blessings You have provided."
                ),
                PrayerVerse(
                    id: "prov-5-20",
                    reference: "Proverbs 5:20",
                    text: "For why should you, my son, be exhilarated with an adulteress\n  And embrace the bosom of a foreigner?",
                    prayer: "Father, keep my heart from wandering toward temptation and unfaithfulness."
                ),
                PrayerVerse(
                    id: "prov-5-21",
                    reference: "Proverbs 5:21",
                    text: "For the ways of a man are before the eyes of the Lord,\n  And He watches all his paths.",
                    prayer: "Lord, remind me that all my ways are before Your eyes and that nothing is hidden from You."
                ),
                PrayerVerse(
                    id: "prov-5-22",
                    reference: "Proverbs 5:22",
                    text: "His own iniquities will capture the wicked,\n  And he will be held with the cords of his sin.",
                    prayer: "Jesus, keep me from becoming trapped by my own sins and foolish decisions."
                ),
                PrayerVerse(
                    id: "prov-5-23",
                    reference: "Proverbs 5:23",
                    text: "He will die for lack of instruction,\n  And in the greatness of his folly he will go astray.",
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
                    text: "My son, if you have become surety for your neighbor,\n  Have given a pledge for a stranger,",
                    prayer: "Dear Jesus, help me to walk in wisdom with my decisions, my words, and my commitments. Teach me not to make careless promises or place myself in harmful obligations."
                ),
                PrayerVerse(
                    id: "prov-6-2",
                    reference: "Proverbs 6:2",
                    text: "If you have been snared with the words of your mouth,\n  Have been caught with the words of your mouth,",
                    prayer: "Father, guard my mouth and my speech. Help me not to speak rashly or make promises without wisdom."
                ),
                PrayerVerse(
                    id: "prov-6-3",
                    reference: "Proverbs 6:3",
                    text: "Do this then, my son, and deliver yourself;\n  Since you have come into the hand of your neighbor,\n  Go, humble yourself, and importune your neighbor.",
                    prayer: "Lord, teach me humility. Help me to seek peace quickly and correct my mistakes with wisdom and honesty."
                ),
                PrayerVerse(
                    id: "prov-6-4",
                    reference: "Proverbs 6:4",
                    text: "Give no sleep to your eyes,\n  Nor slumber to your eyelids;",
                    prayer: "Jesus, help me not ignore danger, sin, or foolishness in my life. Give me urgency to deal with problems wisely."
                ),
                PrayerVerse(
                    id: "prov-6-5",
                    reference: "Proverbs 6:5",
                    text: "Deliver yourself like a gazelle from the hunter's hand\n  And like a bird from the hand of the fowler.",
                    prayer: "Father, rescue me from every trap of the enemy and give me wisdom to flee from danger quickly."
                ),
                PrayerVerse(
                    id: "prov-6-6",
                    reference: "Proverbs 6:6",
                    text: "Go to the ant, O sluggard,\n  Observe her ways and be wise,",
                    prayer: "Lord, teach me diligence, discipline, and consistency. Help me not waste my time or opportunities."
                ),
                PrayerVerse(
                    id: "prov-6-7",
                    reference: "Proverbs 6:7",
                    text: "Which, having no chief,\n  Officer or ruler,",
                    prayer: "Jesus, help me develop self-control and responsibility even when nobody is watching."
                ),
                PrayerVerse(
                    id: "prov-6-8",
                    reference: "Proverbs 6:8",
                    text: "Prepares her food in the summer\n  And gathers her provision in the harvest.",
                    prayer: "Father, teach me to prepare wisely for the future and faithfully steward the resources You provide."
                ),
                PrayerVerse(
                    id: "prov-6-9",
                    reference: "Proverbs 6:9",
                    text: "How long will you lie down, O sluggard?\n  When will you arise from your sleep?",
                    prayer: "Lord, awaken me spiritually, mentally, and physically. Remove laziness and passivity from my life."
                ),
                PrayerVerse(
                    id: "prov-6-10",
                    reference: "Proverbs 6:10",
                    text: "\"A little sleep, a little slumber,\n  A little folding of the hands to rest\"—",
                    prayer: "Jesus, protect me from becoming comfortable in complacency or drifting away from purposeful living."
                ),
                PrayerVerse(
                    id: "prov-6-11",
                    reference: "Proverbs 6:11",
                    text: "Your poverty will come in like a vagabond\n  And your need like an armed man.",
                    prayer: "Father, help me understand the consequences of neglect and laziness. Teach me discipline and diligence."
                ),
                PrayerVerse(
                    id: "prov-6-12",
                    reference: "Proverbs 6:12",
                    text: "A worthless person, a wicked man,\n  Is the one who walks with a perverse mouth,",
                    prayer: "Lord, purify my heart and my speech. Remove deceit, manipulation, and dishonesty from my life."
                ),
                PrayerVerse(
                    id: "prov-6-13",
                    reference: "Proverbs 6:13",
                    text: "Who winks with his eyes, who signals with his feet,\n  Who points with his fingers;",
                    prayer: "Jesus, help me walk sincerely and transparently before You and others."
                ),
                PrayerVerse(
                    id: "prov-6-14",
                    reference: "Proverbs 6:14",
                    text: "Who with perversity in his heart continually devises evil,\n  Who spreads strife.",
                    prayer: "Father, cleanse my heart from bitterness, division, and harmful intentions. Make me a peacemaker."
                ),
                PrayerVerse(
                    id: "prov-6-15",
                    reference: "Proverbs 6:15",
                    text: "Therefore his calamity will come suddenly;\n  Instantly he will be broken and there will be no healing.",
                    prayer: "Lord, keep me from the path of destruction and give me a heart that listens to correction."
                ),
                PrayerVerse(
                    id: "prov-6-16",
                    reference: "Proverbs 6:16",
                    text: "There are six things which the Lord hates,\n  Yes, seven which are an abomination to Him:",
                    prayer: "Jesus, help me hate what is evil and love what is righteous and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "prov-6-17",
                    reference: "Proverbs 6:17",
                    text: "Haughty eyes, a lying tongue,\n  And hands that shed innocent blood,",
                    prayer: "Father, remove pride, dishonesty, and cruelty from my heart. Teach me humility, truth, and compassion."
                ),
                PrayerVerse(
                    id: "prov-6-18",
                    reference: "Proverbs 6:18",
                    text: "A heart that devises wicked plans,\n  Feet that run rapidly to evil,",
                    prayer: "Lord, purify my thoughts and desires. Help me run toward righteousness instead of sin."
                ),
                PrayerVerse(
                    id: "prov-6-19",
                    reference: "Proverbs 6:19",
                    text: "A false witness who utters lies,\n  And one who spreads strife among brothers.",
                    prayer: "Jesus, help me never spread lies, gossip, or division. Let me bring peace and truth wherever I go."
                ),
                PrayerVerse(
                    id: "prov-6-20",
                    reference: "Proverbs 6:20",
                    text: "My son, observe the commandment of your father\n  And do not forsake the teaching of your mother;",
                    prayer: "Father, help me honor godly instruction and receive wisdom with a teachable spirit."
                ),
                PrayerVerse(
                    id: "prov-6-21",
                    reference: "Proverbs 6:21",
                    text: "Bind them continually on your heart;\n  Tie them around your neck.",
                    prayer: "Lord, let Your Word remain close to my heart and guide my life daily."
                ),
                PrayerVerse(
                    id: "prov-6-22",
                    reference: "Proverbs 6:22",
                    text: "When you walk about, they will guide you;\n  When you sleep, they will watch over you;\n  And when you awake, they will talk to you.",
                    prayer: "Jesus, let Your wisdom guide me when I walk, watch over me when I sleep, and direct me when I rise."
                ),
                PrayerVerse(
                    id: "prov-6-23",
                    reference: "Proverbs 6:23",
                    text: "For the commandment is a lamp and the teaching is light;\n  And reproofs for discipline are the way of life",
                    prayer: "Father, thank You for Your commandments and correction. Help me receive discipline with humility."
                ),
                PrayerVerse(
                    id: "prov-6-24",
                    reference: "Proverbs 6:24",
                    text: "To keep you from the evil woman,\n  From the smooth tongue of the adulteress.",
                    prayer: "Lord, protect my heart, mind, and eyes from temptation and impurity."
                ),
                PrayerVerse(
                    id: "prov-6-25",
                    reference: "Proverbs 6:25",
                    text: "Do not desire her beauty in your heart,\n  Nor let her capture you with her eyelids.",
                    prayer: "Jesus, guard my thoughts and desires so that lust never takes root in my heart."
                ),
                PrayerVerse(
                    id: "prov-6-26",
                    reference: "Proverbs 6:26",
                    text: "For on account of a harlot one is reduced to a loaf of bread,\n  And an adulteress hunts for the precious life.",
                    prayer: "Father, help me understand the cost and destruction that sin can bring into a life."
                ),
                PrayerVerse(
                    id: "prov-6-27",
                    reference: "Proverbs 6:27",
                    text: "Can a man take fire in his bosom\n  And his clothes not be burned?",
                    prayer: "Lord, remind me that sin always carries consequences. Give me wisdom to avoid dangerous temptations."
                ),
                PrayerVerse(
                    id: "prov-6-28",
                    reference: "Proverbs 6:28",
                    text: "Or can a man walk on hot coals\n  And his feet not be scorched?",
                    prayer: "Jesus, help me never believe I can play with sin without being harmed. Keep me spiritually alert."
                ),
                PrayerVerse(
                    id: "prov-6-29",
                    reference: "Proverbs 6:29",
                    text: "So is the one who goes in to his neighbor's wife;\n  Whoever touches her will not go unpunished.",
                    prayer: "Father, help me honor purity, faithfulness, and integrity in every relationship."
                ),
                PrayerVerse(
                    id: "prov-6-30",
                    reference: "Proverbs 6:30",
                    text: "Men do not despise a thief if he steals\n  To satisfy himself when he is hungry;",
                    prayer: "Lord, give me compassion, wisdom, and understanding toward those who struggle and suffer."
                ),
                PrayerVerse(
                    id: "prov-6-31",
                    reference: "Proverbs 6:31",
                    text: "But when he is found, he must repay sevenfold;\n  He must give all the substance of his house.",
                    prayer: "Jesus, teach me responsibility and accountability for my actions."
                ),
                PrayerVerse(
                    id: "prov-6-32",
                    reference: "Proverbs 6:32",
                    text: "The one who commits adultery with a woman is lacking sense;\n  He who would destroy himself does it.",
                    prayer: "Father, protect me from destructive desires and foolish choices that damage my soul."
                ),
                PrayerVerse(
                    id: "prov-6-33",
                    reference: "Proverbs 6:33",
                    text: "Wounds and disgrace he will find,\n  And his reproach will not be blotted out.",
                    prayer: "Lord, help me avoid paths that lead to shame, brokenness, and regret."
                ),
                PrayerVerse(
                    id: "prov-6-34",
                    reference: "Proverbs 6:34",
                    text: "For jealousy enrages a man,\n  And he will not spare in the day of vengeance.",
                    prayer: "Jesus, teach me the seriousness of betrayal and help me walk faithfully before You and others."
                ),
                PrayerVerse(
                    id: "prov-6-35",
                    reference: "Proverbs 6:35",
                    text: "He will not accept any ransom,\n  Nor will he be satisfied though you give many gifts.",
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
                    text: "My son, keep my words\n  And treasure my commandments within you.",
                    prayer: "Dear Jesus, help me keep Your words and treasure Your commandments in my heart."
                ),
                PrayerVerse(
                    id: "prov-7-2",
                    reference: "Proverbs 7:2",
                    text: "Keep my commandments and live,\n  And my teaching as the apple of your eye.",
                    prayer: "Father, help me obey Your commands and walk in the life that comes from following Your truth."
                ),
                PrayerVerse(
                    id: "prov-7-3",
                    reference: "Proverbs 7:3",
                    text: "Bind them on your fingers;\n  Write them on the tablet of your heart.",
                    prayer: "Lord, let Your wisdom be written upon my heart and remain before my eyes every day."
                ),
                PrayerVerse(
                    id: "prov-7-4",
                    reference: "Proverbs 7:4",
                    text: "Say to wisdom, \"You are my sister,\"\n  And call understanding your intimate friend;",
                    prayer: "Jesus, help me treat wisdom as a close friend and understanding as a beloved companion."
                ),
                PrayerVerse(
                    id: "prov-7-5",
                    reference: "Proverbs 7:5",
                    text: "That they may keep you from an adulteress,\n  From the foreigner who flatters with her words.",
                    prayer: "Father, protect me from temptation and from voices that seek to draw me away from Your ways."
                ),
                PrayerVerse(
                    id: "prov-7-6",
                    reference: "Proverbs 7:6",
                    text: "For at the window of my house\n  I looked out through my lattice,",
                    prayer: "Lord, give me discernment to recognize danger before I walk into it."
                ),
                PrayerVerse(
                    id: "prov-7-7",
                    reference: "Proverbs 7:7",
                    text: "And I saw among the naive,\n  And discerned among the youths\n  A young man lacking sense,",
                    prayer: "Jesus, keep me from being simple-minded or lacking understanding. Fill me with wisdom and good judgment."
                ),
                PrayerVerse(
                    id: "prov-7-8",
                    reference: "Proverbs 7:8",
                    text: "Passing through the street near her corner;\n  And he takes the way to her house,",
                    prayer: "Father, help me avoid places, situations, and influences that lead me toward temptation."
                ),
                PrayerVerse(
                    id: "prov-7-9",
                    reference: "Proverbs 7:9",
                    text: "In the twilight, in the evening,\n  In the middle of the night and in the darkness.",
                    prayer: "Lord, protect me during seasons of weakness, loneliness, and spiritual darkness."
                ),
                PrayerVerse(
                    id: "prov-7-10",
                    reference: "Proverbs 7:10",
                    text: "And behold, a woman comes to meet him,\n  Dressed as a harlot and cunning of heart.",
                    prayer: "Jesus, give me wisdom to recognize deception even when it appears attractive or harmless."
                ),
                PrayerVerse(
                    id: "prov-7-11",
                    reference: "Proverbs 7:11",
                    text: "She is boisterous and rebellious,\n  Her feet do not remain at home;",
                    prayer: "Father, help me remain humble, disciplined, and obedient to Your guidance."
                ),
                PrayerVerse(
                    id: "prov-7-12",
                    reference: "Proverbs 7:12",
                    text: "She is now in the streets, now in the squares,\n  And lurks by every corner.",
                    prayer: "Lord, teach me not to wander aimlessly into situations that can compromise my faith."
                ),
                PrayerVerse(
                    id: "prov-7-13",
                    reference: "Proverbs 7:13",
                    text: "So she seizes him and kisses him\n  And with a brazen face she says to him:",
                    prayer: "Jesus, help me recognize manipulation and resist every form of temptation."
                ),
                PrayerVerse(
                    id: "prov-7-14",
                    reference: "Proverbs 7:14",
                    text: "\"I was due to offer peace offerings;\n  Today I have paid my vows.",
                    prayer: "Father, give me discernment when people use spiritual language to justify sinful behavior."
                ),
                PrayerVerse(
                    id: "prov-7-15",
                    reference: "Proverbs 7:15",
                    text: "Therefore I have come out to meet you,\n  To seek your presence earnestly, and I have found you.",
                    prayer: "Lord, protect me from flattery and words designed to deceive my heart."
                ),
                PrayerVerse(
                    id: "prov-7-16",
                    reference: "Proverbs 7:16",
                    text: "I have spread my couch with coverings,\n  With colored linens of Egypt.",
                    prayer: "Jesus, help me value purity over temporary pleasure and righteousness over worldly attraction."
                ),
                PrayerVerse(
                    id: "prov-7-17",
                    reference: "Proverbs 7:17",
                    text: "I have sprinkled my bed\n  With myrrh, aloes and cinnamon.",
                    prayer: "Father, give me wisdom to see beyond outward beauty and attractive appearances."
                ),
                PrayerVerse(
                    id: "prov-7-18",
                    reference: "Proverbs 7:18",
                    text: "Come, let us drink our fill of love until morning;\n  Let us delight ourselves with caresses.",
                    prayer: "Lord, help me resist invitations that lead away from Your will and Your truth."
                ),
                PrayerVerse(
                    id: "prov-7-19",
                    reference: "Proverbs 7:19",
                    text: "For my husband is not at home,\n  He has gone on a long journey;",
                    prayer: "Jesus, protect me from believing that hidden sin can remain hidden from You."
                ),
                PrayerVerse(
                    id: "prov-7-20",
                    reference: "Proverbs 7:20",
                    text: "He has taken a bag of money with him,\n  At the full moon he will come home.\"",
                    prayer: "Father, remind me that every action has consequences and that You see all things."
                ),
                PrayerVerse(
                    id: "prov-7-21",
                    reference: "Proverbs 7:21",
                    text: "With her many persuasions she entices him;\n  With her flattering lips she seduces him.",
                    prayer: "Lord, guard my heart from persuasive words that seek to pull me away from righteousness."
                ),
                PrayerVerse(
                    id: "prov-7-22",
                    reference: "Proverbs 7:22",
                    text: "Suddenly he follows her\n  As an ox goes to the slaughter,\n  Or as one in fetters to the discipline of a fool,",
                    prayer: "Jesus, keep me from following temptation foolishly and without understanding."
                ),
                PrayerVerse(
                    id: "prov-7-23",
                    reference: "Proverbs 7:23",
                    text: "Until an arrow pierces through his liver;\n  As a bird hastens to the snare,\n  So he does not know that it will cost him his life.",
                    prayer: "Father, help me recognize that sin ultimately wounds the soul and leads to destruction."
                ),
                PrayerVerse(
                    id: "prov-7-24",
                    reference: "Proverbs 7:24",
                    text: "Now therefore, my sons, listen to me,\n  And pay attention to the words of my mouth.",
                    prayer: "Lord, give me ears that listen carefully to wisdom and instruction."
                ),
                PrayerVerse(
                    id: "prov-7-25",
                    reference: "Proverbs 7:25",
                    text: "Do not let your heart turn aside to her ways,\n  Do not stray into her paths.",
                    prayer: "Jesus, keep my heart from wandering toward temptation or becoming captivated by sinful desires."
                ),
                PrayerVerse(
                    id: "prov-7-26",
                    reference: "Proverbs 7:26",
                    text: "For many are the victims she has cast down,\n  And numerous are all her slain.",
                    prayer: "Father, protect me from becoming another casualty of sin and spiritual compromise."
                ),
                PrayerVerse(
                    id: "prov-7-27",
                    reference: "Proverbs 7:27",
                    text: "Her house is the way to Sheol,\n  Descending to the chambers of death.",
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
                    text: "Does not wisdom call,\n  And understanding lift up her voice?",
                    prayer: "Dear Jesus, help me hear the voice of wisdom and respond when You call."
                ),
                PrayerVerse(
                    id: "prov-8-2",
                    reference: "Proverbs 8:2",
                    text: "On top of the heights beside the way,\n  Where the paths meet, she takes her stand;",
                    prayer: "Father, place me on the path of understanding and help me walk in Your truth."
                ),
                PrayerVerse(
                    id: "prov-8-3",
                    reference: "Proverbs 8:3",
                    text: "Beside the gates, at the opening to the city,\n  At the entrance of the doors, she cries out:",
                    prayer: "Lord, make my heart attentive to Your instruction wherever I go."
                ),
                PrayerVerse(
                    id: "prov-8-4",
                    reference: "Proverbs 8:4",
                    text: "\"To you, O men, I call,\n  And my voice is to the sons of men.",
                    prayer: "Jesus, thank You for calling all people to wisdom. Help me answer Your call faithfully."
                ),
                PrayerVerse(
                    id: "prov-8-5",
                    reference: "Proverbs 8:5",
                    text: "O naive ones, understand prudence;\n  And, O fools, understand wisdom.",
                    prayer: "Father, give me understanding and teach me to grow in wisdom and discernment."
                ),
                PrayerVerse(
                    id: "prov-8-6",
                    reference: "Proverbs 8:6",
                    text: "Listen, for I will speak noble things;\n  And the opening of my lips will reveal right things.",
                    prayer: "Lord, help me listen carefully to noble and righteous instruction."
                ),
                PrayerVerse(
                    id: "prov-8-7",
                    reference: "Proverbs 8:7",
                    text: "For my mouth will utter truth;\n  And wickedness is an abomination to my lips.",
                    prayer: "Jesus, let my mouth speak truth and keep me far from wickedness."
                ),
                PrayerVerse(
                    id: "prov-8-8",
                    reference: "Proverbs 8:8",
 text: "All the utterances of my mouth are in righteousness;\n  There is nothing crooked or perverted in them.",
                    prayer: "Father, help my words be honest, upright, and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "prov-8-9",
                    reference: "Proverbs 8:9",
                    text: "They are all straightforward to him who understands,\n  And right to those who find knowledge.",
                    prayer: "Lord, open my understanding so I may recognize and embrace Your truth."
                ),
                PrayerVerse(
                    id: "prov-8-10",
                    reference: "Proverbs 8:10",
                    text: "Take my instruction and not silver,\n  And knowledge rather than choicest gold.",
                    prayer: "Jesus, help me choose wisdom over silver and worldly gain."
                ),
                PrayerVerse(
                    id: "prov-8-11",
                    reference: "Proverbs 8:11",
                    text: "For wisdom is better than jewels;\n  And all desirable things cannot compare with her.",
                    prayer: "Father, teach me that wisdom is more valuable than any treasure this world can offer."
                ),
                PrayerVerse(
                    id: "prov-8-12",
                    reference: "Proverbs 8:12",
                    text: "\"I, wisdom, dwell with prudence,\n  And I find knowledge and discretion.",
                    prayer: "Lord, fill me with prudence, knowledge, and sound judgment."
                ),
                PrayerVerse(
                    id: "prov-8-13",
                    reference: "Proverbs 8:13",
                    text: "The fear of the Lord is to hate evil;\n  Pride and arrogance and the evil way\n  And the perverted mouth, I hate.",
                    prayer: "Jesus, help me fear You by turning away from evil, pride, arrogance, and corruption."
                ),
                PrayerVerse(
                    id: "prov-8-14",
                    reference: "Proverbs 8:14",
                    text: "Counsel is mine and sound wisdom;\n  I am understanding, power is mine.",
                    prayer: "Father, grant me counsel, wisdom, understanding, and strength."
                ),
                PrayerVerse(
                    id: "prov-8-15",
                    reference: "Proverbs 8:15",
                    text: "By me kings reign,\n  And rulers decree justice.",
                    prayer: "Lord, guide leaders, rulers, and authorities to govern with wisdom and righteousness."
                ),
                PrayerVerse(
                    id: "prov-8-16",
                    reference: "Proverbs 8:16",
                    text: "By me princes rule, and nobles,\n  All who judge rightly.",
                    prayer: "Jesus, help those in positions of influence make decisions that honor You."
                ),
                PrayerVerse(
                    id: "prov-8-17",
                    reference: "Proverbs 8:17",
                    text: "I love those who love me;\n  And those who diligently seek me will find me.",
                    prayer: "Father, help me seek You diligently and wholeheartedly every day."
                ),
                PrayerVerse(
                    id: "prov-8-18",
                    reference: "Proverbs 8:18",
                    text: "Riches and honor are with me,\n  Enduring wealth and righteousness.",
                    prayer: "Lord, remind me that true riches, honor, and lasting blessings come from You."
                ),
                PrayerVerse(
                    id: "prov-8-19",
                    reference: "Proverbs 8:19",
                    text: "My fruit is better than gold, even pure gold,\n  And my yield better than choicest silver.",
                    prayer: "Jesus, let the fruit of wisdom in my life be greater than gold or silver."
                ),
                PrayerVerse(
                    id: "prov-8-20",
                    reference: "Proverbs 8:20",
                    text: "I walk in the way of righteousness,\n  In the midst of the paths of justice,",
                    prayer: "Father, lead me in the way of righteousness and justice."
                ),
                PrayerVerse(
                    id: "prov-8-21",
                    reference: "Proverbs 8:21",
                    text: "To endow those who love me with wealth,\n  That I may fill their treasuries.",
                    prayer: "Lord, bless me with the inheritance of wisdom that endures forever."
                ),
                PrayerVerse(
                    id: "prov-8-22",
                    reference: "Proverbs 8:22",
                    text: "\"The Lord possessed me at the beginning of His way,\n  Before His works of old.",
                    prayer: "Jesus, thank You for Your eternal wisdom that existed before the foundations of the earth."
                ),
                PrayerVerse(
                    id: "prov-8-23",
                    reference: "Proverbs 8:23",
                    text: "From everlasting I was established,\n  From the beginning, from the earliest times of the earth.",
                    prayer: "Father, remind me that Your plans and purposes have existed from everlasting."
                ),
                PrayerVerse(
                    id: "prov-8-24",
                    reference: "Proverbs 8:24",
                    text: "When there were no depths I was brought forth,\n  When there were no springs abounding with water.",
                    prayer: "Lord, thank You for Your wisdom that existed before creation itself."
                ),
                PrayerVerse(
                    id: "prov-8-25",
                    reference: "Proverbs 8:25",
                    text: "Before the mountains were settled,\n  Before the hills I was brought forth;",
                    prayer: "Jesus, help me stand firm upon the eternal foundation of Your truth."
                ),
                PrayerVerse(
                    id: "prov-8-26",
                    reference: "Proverbs 8:26",
                    text: "While He had not yet made the earth and the fields,\n  Nor the first dust of the world.",
                    prayer: "Father, thank You for creating the earth and everything in it with perfect wisdom."
                ),
                PrayerVerse(
                    id: "prov-8-27",
                    reference: "Proverbs 8:27",
                    text: "When He established the heavens, I was there,\n  When He inscribed a circle on the face of the deep,",
                    prayer: "Lord, I praise You for establishing the heavens through Your wisdom and power."
                ),
                PrayerVerse(
                    id: "prov-8-28",
                    reference: "Proverbs 8:28",
                    text: "When He made firm the skies above,\n  When the springs of the deep became fixed,",
                    prayer: "Jesus, thank You for sustaining all creation by Your mighty hand."
                ),
                PrayerVerse(
                    id: "prov-8-29",
                    reference: "Proverbs 8:29",
                    text: "When He set for the sea its boundary\n  So that the water would not transgress His command,\n  When He marked out the foundations of the earth;",
                    prayer: "Father, thank You for setting boundaries and order throughout creation."
                ),
                PrayerVerse(
                    id: "prov-8-30",
                    reference: "Proverbs 8:30",
                    text: "Then I was beside Him, as a master workman;\n  And I was daily His delight,\n  Rejoicing always before Him,",
                    prayer: "Lord, help me delight in Your wisdom and walk closely with You every day."
                ),
                PrayerVerse(
                    id: "prov-8-31",
                    reference: "Proverbs 8:31",
                    text: "Rejoicing in the world, His earth,\n  And having my delight in the sons of men.",
                    prayer: "Jesus, thank You for Your love for mankind and Your delight in Your children."
                ),
                PrayerVerse(
                    id: "prov-8-32",
                    reference: "Proverbs 8:32",
                    text: "\"Now therefore, O sons, listen to me,\n  For blessed are they who keep my ways.",
                    prayer: "Father, help me listen carefully to Your wisdom and follow Your ways."
                ),
                PrayerVerse(
                    id: "prov-8-33",
                    reference: "Proverbs 8:33",
                    text: "Heed instruction and be wise,\n  And do not neglect it.",
                    prayer: "Lord, give me a teachable spirit that gladly receives instruction."
                ),
                PrayerVerse(
                    id: "prov-8-34",
                    reference: "Proverbs 8:34",
                    text: "Blessed is the man who listens to me,\n  Watching daily at my gates,\n  Waiting at my doorposts.",
                    prayer: "Jesus, help me seek You daily and eagerly wait upon Your guidance."
                ),
                PrayerVerse(
                    id: "prov-8-35",
                    reference: "Proverbs 8:35",
                    text: "For he who finds me finds life\n  And obtains favor from the Lord.",
                    prayer: "Father, thank You that those who find wisdom find life and receive Your favor."
                ),
                PrayerVerse(
                    id: "prov-8-36",
                    reference: "Proverbs 8:36",
                    text: "But he who sins against me injures himself;\n  All those who hate me love death.\"",
                    prayer: "Lord, protect me from rejecting wisdom and choosing paths that lead to harm and destruction."
                ),
                PrayerVerse(
                    id: "prov-8-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
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
                    text: "Wisdom has built her house,\n  She has hewn out her seven pillars;",
                    prayer: "Dear Jesus, help me build my life upon the foundation of Your wisdom and truth."
                ),
                PrayerVerse(
                    id: "prov-9-2",
                    reference: "Proverbs 9:2",
                    text: "She has prepared her food, she has mixed her wine;\n  She has also set her table;",
                    prayer: "Father, thank You for preparing spiritual nourishment for those who seek You. Help me come to Your table daily."
                ),
                PrayerVerse(
                    id: "prov-9-3",
                    reference: "Proverbs 9:3",
                    text: "She has sent out her maidens, she calls\n  From the tops of the heights of the city:",
                    prayer: "Lord, let Your wisdom call clearly into my heart and draw me closer to You."
                ),
                PrayerVerse(
                    id: "prov-9-4",
                    reference: "Proverbs 9:4",
                    text: "\"Whoever is naive, let him turn in here!\"\n  To him who lacks understanding she says,",
                    prayer: "Jesus, help me humbly answer Your invitation to learn, grow, and walk in understanding."
                ),
                PrayerVerse(
                    id: "prov-9-5",
                    reference: "Proverbs 9:5",
                    text: "\"Come, eat of my food\n  And drink of the wine I have mixed.",
                    prayer: "Father, feed my soul with Your Word and satisfy me with Your truth."
                ),
                PrayerVerse(
                    id: "prov-9-6",
                    reference: "Proverbs 9:6",
                    text: "Forsake your folly and live,\n  And proceed in the way of understanding.\"",
                    prayer: "Lord, help me leave behind foolishness and walk in the way of wisdom and life."
                ),
                PrayerVerse(
                    id: "prov-9-7",
                    reference: "Proverbs 9:7",
                    text: "He who corrects a scoffer gets dishonor for himself,\n  And he who reproves a wicked man gets insults for himself.",
                    prayer: "Jesus, give me discernment to know when to speak and when to remain silent. Help me receive correction with humility."
                ),
                PrayerVerse(
                    id: "prov-9-8",
                    reference: "Proverbs 9:8",
                    text: "Do not reprove a scoffer, or he will hate you,\n  Reprove a wise man and he will love you.",
                    prayer: "Father, protect me from pride and teach me to welcome wise rebuke and instruction."
                ),
                PrayerVerse(
                    id: "prov-9-9",
                    reference: "Proverbs 9:9",
                    text: "Give instruction to a wise man and he will be still wiser,\n  Teach a righteous man and he will increase his learning.",
                    prayer: "Lord, help me continue growing in wisdom, knowledge, and understanding throughout my life."
                ),
                PrayerVerse(
                    id: "prov-9-10",
                    reference: "Proverbs 9:10",
                    text: "The fear of the Lord is the beginning of wisdom,\n  And the knowledge of the Holy One is understanding.",
                    prayer: "Jesus, teach me that the fear of the Lord is the beginning of wisdom and that knowing You is true understanding."
                ),
                PrayerVerse(
                    id: "prov-9-11",
                    reference: "Proverbs 9:11",
                    text: "For by me your days will be multiplied,\n  And years of life will be added to you.",
                    prayer: "Father, let wisdom add blessing, purpose, and fruitfulness to my life according to Your will."
                ),
                PrayerVerse(
                    id: "prov-9-12",
                    reference: "Proverbs 9:12",
                    text: "If you are wise, you are wise for yourself,\n  And if you scoff, you alone will bear it.",
                    prayer: "Lord, help me take personal responsibility for my choices and faithfully pursue wisdom."
                ),
                PrayerVerse(
                    id: "prov-9-13",
                    reference: "Proverbs 9:13",
                    text: "The woman of folly is boisterous,\n  She is naive and knows nothing.",
                    prayer: "Jesus, help me recognize foolishness and avoid voices that lead me away from Your truth."
                ),
                PrayerVerse(
                    id: "prov-9-14",
                    reference: "Proverbs 9:14",
                    text: "She sits at the doorway of her house,\n  On a seat by the high places of the city,",
                    prayer: "Father, protect me from distractions and temptations that seek to draw me off the path of righteousness."
                ),
                PrayerVerse(
                    id: "prov-9-15",
                    reference: "Proverbs 9:15",
                    text: "Calling to those who pass by,\n  Who are making their paths straight:",
                    prayer: "Lord, help me stay focused on the path You have set before me."
                ),
                PrayerVerse(
                    id: "prov-9-16",
                    reference: "Proverbs 9:16",
                    text: "\"Whoever is naive, let him turn in here,\"\n  And to him who lacks understanding she says,",
                    prayer: "Jesus, give me discernment when temptation disguises itself as something desirable or harmless."
                ),
                PrayerVerse(
                    id: "prov-9-17",
                    reference: "Proverbs 9:17",
                    text: "\"Stolen water is sweet;\n  And bread eaten in secret is pleasant.\"",
                    prayer: "Father, help me reject the false pleasures of sin and choose the lasting joy found in You."
                ),
                PrayerVerse(
                    id: "prov-9-18",
                    reference: "Proverbs 9:18",
                    text: "But he does not know that the dead are there,\n  That her guests are in the depths of Sheol.",
                    prayer: "Lord, remind me that the path of foolishness leads to destruction, but Your way leads to life everlasting."
                ),
                PrayerVerse(
                    id: "prov-9-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 10,
            title: "Speak with Grace",
            chapterReference: "Proverbs 10",
            summary: "Invite God to shape your words with grace and truth.",
            verses: [
                PrayerVerse(
                    id: "prov-10-1",
                    reference: "Proverbs 10:1",
                    text: "The proverbs of Solomon.\n  A wise son makes a father glad,\n  But a foolish son is a grief to his mother.",
                    prayer: "Dear Jesus, help me live wisely and faithfully so that my life brings joy to those who love and care for me."
                ),
                PrayerVerse(
                    id: "prov-10-2",
                    reference: "Proverbs 10:2",
                    text: "Ill-gotten gains do not profit,\n  But righteousness delivers from death.",
                    prayer: "Father, keep me from pursuing dishonest gain. Help me value righteousness above earthly wealth."
                ),
                PrayerVerse(
                    id: "prov-10-3",
                    reference: "Proverbs 10:3",
                    text: "The Lord will not allow the righteous to hunger,\n  But He will reject the craving of the wicked.",
                    prayer: "Lord, thank You for providing for the righteous. Help me trust You as my provider every day."
                ),
                PrayerVerse(
                    id: "prov-10-4",
                    reference: "Proverbs 10:4",
                    text: "Poor is he who works with a negligent hand,\n  But the hand of the diligent makes rich.",
                    prayer: "Jesus, remove laziness from my life and teach me diligence, responsibility, and faithful work."
                ),
                PrayerVerse(
                    id: "prov-10-5",
                    reference: "Proverbs 10:5",
                    text: "He who gathers in summer is a son who acts wisely,\n  But he who sleeps in harvest is a son who acts shamefully.",
                    prayer: "Father, help me recognize opportunities and use each season wisely for Your glory."
                ),
                PrayerVerse(
                    id: "prov-10-6",
                    reference: "Proverbs 10:6",
                    text: "Blessings are on the head of the righteous,\n  But the mouth of the wicked conceals violence.",
                    prayer: "Lord, let Your blessings rest upon my life as I walk in righteousness and obedience."
                ),
                PrayerVerse(
                    id: "prov-10-7",
                    reference: "Proverbs 10:7",
                    text: "The memory of the righteous is blessed,\n  But the name of the wicked will rot.",
                    prayer: "Jesus, help me leave behind a godly legacy that honors You and blesses others."
                ),
                PrayerVerse(
                    id: "prov-10-8",
                    reference: "Proverbs 10:8",
                    text: "The wise of heart will receive commands,\n  But a babbling fool will be ruined.",
                    prayer: "Father, give me a teachable heart that gladly receives wisdom and instruction."
                ),
                PrayerVerse(
                    id: "prov-10-9",
                    reference: "Proverbs 10:9",
                    text: "He who walks in integrity walks securely,\n  But he who perverts his ways will be found out.",
                    prayer: "Lord, help me walk in integrity so that I may live securely and confidently before You."
                ),
                PrayerVerse(
                    id: "prov-10-10",
                    reference: "Proverbs 10:10",
                    text: "He who winks the eye causes trouble,\n  And a babbling fool will be ruined.",
                    prayer: "Jesus, guard me from deceitful behavior and foolish speech that causes harm."
                ),
                PrayerVerse(
                    id: "prov-10-11",
                    reference: "Proverbs 10:11",
                    text: "The mouth of the righteous is a fountain of life,\n  But the mouth of the wicked conceals violence.",
                    prayer: "Father, let my words become a fountain of life, encouragement, and truth."
                ),
                PrayerVerse(
                    id: "prov-10-12",
                    reference: "Proverbs 10:12",
                    text: "Hatred stirs up strife,\n  But love covers all transgressions.",
                    prayer: "Lord, remove hatred from my heart and fill me with love that covers offenses and promotes peace."
                ),
                PrayerVerse(
                    id: "prov-10-13",
                    reference: "Proverbs 10:13",
                    text: "On the lips of the discerning, wisdom is found,\n  But a rod is for the back of him who lacks understanding.",
                    prayer: "Jesus, place wisdom upon my lips and understanding within my heart."
                ),
                PrayerVerse(
                    id: "prov-10-14",
                    reference: "Proverbs 10:14",
                    text: "Wise men store up knowledge,\n  But with the mouth of the foolish, ruin is at hand.",
                    prayer: "Father, help me store up knowledge and use it wisely for the benefit of others."
                ),
                PrayerVerse(
                    id: "prov-10-15",
                    reference: "Proverbs 10:15",
                    text: "The rich man's wealth is his fortress,\n  The ruin of the poor is their poverty.",
                    prayer: "Lord, teach me not to trust in wealth but in You alone."
                ),
                PrayerVerse(
                    id: "prov-10-16",
                    reference: "Proverbs 10:16",
                    text: "The wages of the righteous is life,\n  The income of the wicked, punishment.",
                    prayer: "Jesus, let the work of my hands produce righteousness and honor You."
                ),
                PrayerVerse(
                    id: "prov-10-17",
                    reference: "Proverbs 10:17",
                    text: "He is on the path of life who heeds instruction,\n  But he who ignores reproof goes astray.",
                    prayer: "Father, help me remain on the path of life by accepting correction and instruction."
                ),
                PrayerVerse(
                    id: "prov-10-18",
                    reference: "Proverbs 10:18",
                    text: "He who conceals hatred has lying lips,\n  And he who spreads slander is a fool.",
                    prayer: "Lord, keep me from lying, slander, gossip, and hidden hatred."
                ),
                PrayerVerse(
                    id: "prov-10-19",
                    reference: "Proverbs 10:19",
                    text: "When there are many words, transgression is unavoidable,\n  But he who restrains his lips is wise.",
                    prayer: "Jesus, teach me restraint and wisdom in my speech. Help me speak only what is helpful and true."
                ),
                PrayerVerse(
                    id: "prov-10-20",
                    reference: "Proverbs 10:20",
                    text: "The tongue of the righteous is as choice silver,\n  The heart of the wicked is worth little.",
                    prayer: "Father, let my words be valuable, pure, and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "prov-10-21",
                    reference: "Proverbs 10:21",
                    text: "The lips of the righteous feed many,\n  But fools die for lack of understanding.",
                    prayer: "Lord, use my life and words to nourish, encourage, and strengthen others."
                ),
                PrayerVerse(
                    id: "prov-10-22",
                    reference: "Proverbs 10:22",
                    text: "It is the blessing of the Lord that makes rich,\n  And He adds no sorrow to it.",
                    prayer: "Jesus, thank You for the blessings You give. Help me enjoy them with gratitude and humility."
                ),
                PrayerVerse(
                    id: "prov-10-23",
                    reference: "Proverbs 10:23",
                    text: "Doing wickedness is like sport to a fool,\n  And so is wisdom to a man of understanding.",
                    prayer: "Father, help me delight in wisdom rather than foolishness or sinful pleasures."
                ),
                PrayerVerse(
                    id: "prov-10-24",
                    reference: "Proverbs 10:24",
                    text: "What the wicked fears will come upon him,\n  But the desire of the righteous will be granted.",
                    prayer: "Lord, protect me from fear and help me trust in Your promises."
                ),
                PrayerVerse(
                    id: "prov-10-25",
                    reference: "Proverbs 10:25",
                    text: "When the whirlwind passes, the wicked is no more,\n  But the righteous has an everlasting foundation.",
                    prayer: "Jesus, establish my life upon a foundation that remains firm through every storm."
                ),
                PrayerVerse(
                    id: "prov-10-26",
                    reference: "Proverbs 10:26",
                    text: "Like vinegar to the teeth and smoke to the eyes,\n  So is the lazy one to those who send him.",
                    prayer: "Father, help me be reliable, trustworthy, and diligent in every responsibility."
                ),
                PrayerVerse(
                    id: "prov-10-27",
                    reference: "Proverbs 10:27",
                    text: "The fear of the Lord prolongs life,\n  But the years of the wicked will be shortened.",
                    prayer: "Lord, teach me to fear You and walk faithfully before You all my days."
                ),
                PrayerVerse(
                    id: "prov-10-28",
                    reference: "Proverbs 10:28",
                    text: "The hope of the righteous is gladness,\n  But the expectation of the wicked perishes.",
                    prayer: "Jesus, fill my heart with the joy and hope that come from righteousness."
                ),
                PrayerVerse(
                    id: "prov-10-29",
                    reference: "Proverbs 10:29",
                    text: "The way of the Lord is a stronghold to the upright,\n  But ruin to the workers of iniquity.",
                    prayer: "Father, let Your way be my refuge, strength, and protection."
                ),
                PrayerVerse(
                    id: "prov-10-30",
                    reference: "Proverbs 10:30",
                    text: "The righteous will never be shaken,\n  But the wicked will not dwell in the land.",
                    prayer: "Lord, establish me firmly in righteousness so that I remain faithful to You."
                ),
                PrayerVerse(
                    id: "prov-10-31",
                    reference: "Proverbs 10:31",
                    text: "The mouth of the righteous flows with wisdom,\n  But the perverted tongue will be cut out.",
                    prayer: "Jesus, let wisdom continually flow from my life and speech."
                ),
                PrayerVerse(
                    id: "prov-10-32",
                    reference: "Proverbs 10:32",
                    text: "The lips of the righteous bring forth what is acceptable,\n  But the mouth of the wicked what is perverted.",
                    prayer: "Father, help my words bring grace, truth, encouragement, and blessing to everyone I encounter."
                ),
                PrayerVerse(
                    id: "prov-10-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 11,
            title: "Live Honestly",
            chapterReference: "Proverbs 11",
            summary: "Pray for integrity in every hidden place.",
            verses: [
                PrayerVerse(
                    id: "prov-11-1",
                    reference: "Proverbs 11:1",
                    text: "A false balance is an abomination to the Lord,\n  But a just weight is His delight.",
                    prayer: "Dear Jesus, help me walk in honesty and integrity. Let me never deceive others, but live truthfully and fairly in all that I do."
                ),
                PrayerVerse(
                    id: "prov-11-2",
                    reference: "Proverbs 11:2",
                    text: "When pride comes, then comes dishonor,\n  But with the humble is wisdom.",
                    prayer: "Father, remove pride from my heart and teach me humility. Help me walk in wisdom and depend on You instead of myself."
                ),
                PrayerVerse(
                    id: "prov-11-3",
                    reference: "Proverbs 11:3",
                    text: "The integrity of the upright will guide them,\n  But the crookedness of the treacherous will destroy them.",
                    prayer: "Lord, let integrity guide my life. Keep me faithful and upright in every decision I make."
                ),
                PrayerVerse(
                    id: "prov-11-4",
                    reference: "Proverbs 11:4",
                    text: "Riches do not profit in the day of wrath,\n  But righteousness delivers from death.",
                    prayer: "Jesus, remind me that riches cannot save the soul. Help me value righteousness and eternal things above worldly wealth."
                ),
                PrayerVerse(
                    id: "prov-11-5",
                    reference: "Proverbs 11:5",
                    text: "The righteousness of the blameless will smooth his way,\n  But the wicked will fall by his own wickedness.",
                    prayer: "Father, make my path straight through righteousness. Keep me from falling because of wickedness or compromise."
                ),
                PrayerVerse(
                    id: "prov-11-6",
                    reference: "Proverbs 11:6",
                    text: "The righteousness of the upright will deliver them,\n  But the treacherous will be caught by their own greed.",
                    prayer: "Lord, deliver me through righteousness and protect me from being trapped by sinful desires."
                ),
                PrayerVerse(
                    id: "prov-11-7",
                    reference: "Proverbs 11:7",
                    text: "When a wicked man dies, his expectation will perish,\n  And the hope of strong men perishes.",
                    prayer: "Jesus, help me place my hope in You alone and not in temporary things that fade away."
                ),
                PrayerVerse(
                    id: "prov-11-8",
                    reference: "Proverbs 11:8",
                    text: "The righteous is delivered from trouble,\n  But the wicked takes his place.",
                    prayer: "Father, rescue me from trouble and help me remain faithful during difficult times."
                ),
                PrayerVerse(
                    id: "prov-11-9",
                    reference: "Proverbs 11:9",
                    text: "With his mouth the godless man destroys his neighbor,\n  But through knowledge the righteous will be delivered.",
                    prayer: "Lord, guard my mouth from destructive speech. Let my words bring wisdom, healing, and truth."
                ),
                PrayerVerse(
                    id: "prov-11-10",
                    reference: "Proverbs 11:10",
                    text: "When it goes well with the righteous, the city rejoices,\n  And when the wicked perish, there is joyful shouting.",
                    prayer: "Jesus, let righteousness bring joy and peace to my community and the people around me."
                ),
                PrayerVerse(
                    id: "prov-11-11",
                    reference: "Proverbs 11:11",
                    text: "By the blessing of the upright a city is exalted,\n  But by the mouth of the wicked it is torn down.",
                    prayer: "Father, help me use my words to build others up instead of tearing them down."
                ),
                PrayerVerse(
                    id: "prov-11-12",
                    reference: "Proverbs 11:12",
                    text: "He who despises his neighbor lacks sense,\n  But a man of understanding keeps silent.",
                    prayer: "Lord, give me understanding and self-control so I do not despise or dishonor others."
                ),
                PrayerVerse(
                    id: "prov-11-13",
                    reference: "Proverbs 11:13",
                    text: "He who goes about as a talebearer reveals secrets,\n  But he who is trustworthy conceals a matter.",
                    prayer: "Jesus, help me be trustworthy and faithful with every secret and responsibility given to me."
                ),
                PrayerVerse(
                    id: "prov-11-14",
                    reference: "Proverbs 11:14",
                    text: "Where there is no guidance the people fall,\n  But in abundance of counselors there is victory.",
                    prayer: "Father, surround me with wise counsel and teach me to seek godly advice before making decisions."
                ),
                PrayerVerse(
                    id: "prov-11-15",
                    reference: "Proverbs 11:15",
                    text: "He who is guarantor for a stranger will surely suffer for it,\n  But he who hates being a guarantor is secure.",
                    prayer: "Lord, give me wisdom and discernment in financial commitments and relationships."
                ),
                PrayerVerse(
                    id: "prov-11-16",
                    reference: "Proverbs 11:16",
                    text: "A gracious woman attains honor,\n  And ruthless men attain riches.",
                    prayer: "Jesus, help me value grace, kindness, and godly character more than power or riches."
                ),
                PrayerVerse(
                    id: "prov-11-17",
                    reference: "Proverbs 11:17",
                    text: "The merciful man does himself good,\n  But the cruel man does himself harm.",
                    prayer: "Father, teach me mercy and compassion. Let kindness flow from my life toward others."
                ),
                PrayerVerse(
                    id: "prov-11-18",
                    reference: "Proverbs 11:18",
                    text: "The wicked earns deceptive wages,\n  But he who sows righteousness gets a true reward.",
                    prayer: "Lord, help me sow righteousness faithfully so I may reap lasting and eternal rewards."
                ),
                PrayerVerse(
                    id: "prov-11-19",
                    reference: "Proverbs 11:19",
                    text: "He who is steadfast in righteousness will attain to life,\n  And he who pursues evil will bring about his own death.",
                    prayer: "Jesus, lead me in righteousness and life. Keep me far from paths that lead to destruction."
                ),
                PrayerVerse(
                    id: "prov-11-20",
                    reference: "Proverbs 11:20",
                    text: "The perverse in heart are an abomination to the Lord,\n  But the blameless in their walk are His delight.",
                    prayer: "Father, let my heart and ways be pleasing before You. Purify my motives and intentions."
                ),
                PrayerVerse(
                    id: "prov-11-21",
                    reference: "Proverbs 11:21",
                    text: "Assuredly, the evil man will not go unpunished,\n  But the descendants of the righteous will be delivered.",
                    prayer: "Lord, remind me that evil will not go unpunished. Help me remain faithful and upright before You."
                ),
                PrayerVerse(
                    id: "prov-11-22",
                    reference: "Proverbs 11:22",
                    text: "As a ring of gold in a swine's snout\n  So is a beautiful woman who lacks discretion.",
                    prayer: "Jesus, teach me that true beauty comes from wisdom, purity, and godly character."
                ),
                PrayerVerse(
                    id: "prov-11-23",
                    reference: "Proverbs 11:23",
                    text: "The desire of the righteous is only good,\n  But the expectation of the wicked is wrath.",
                    prayer: "Father, let my desires be good, pure, and pleasing in Your sight."
                ),
                PrayerVerse(
                    id: "prov-11-24",
                    reference: "Proverbs 11:24",
                    text: "There is one who scatters, and yet increases all the more,\n  And there is one who withholds what is justly due, and yet it results only in want.",
                    prayer: "Lord, teach me generosity and trust. Help me give freely and bless others joyfully."
                ),
                PrayerVerse(
                    id: "prov-11-25",
                    reference: "Proverbs 11:25",
                    text: "The generous man will be prosperous,\n  And he who waters will himself be watered.",
                    prayer: "Jesus, make me a blessing to others, and refresh my soul as I refresh those around me."
                ),
                PrayerVerse(
                    id: "prov-11-26",
                    reference: "Proverbs 11:26",
                    text: "He who withholds grain, the people will curse him,\n  But blessing will be on the head of him who sells it.",
                    prayer: "Father, help me not withhold good from others selfishly, but share with wisdom and kindness."
                ),
                PrayerVerse(
                    id: "prov-11-27",
                    reference: "Proverbs 11:27",
                    text: "He who diligently seeks good seeks favor,\n  But he who seeks evil, evil will come to him.",
                    prayer: "Lord, help me diligently seek what is good and pleasing before You every day."
                ),
                PrayerVerse(
                    id: "prov-11-28",
                    reference: "Proverbs 11:28",
                    text: "He who trusts in his riches will fall,\n  But the righteous will flourish like the green leaf.",
                    prayer: "Jesus, keep me from trusting in riches or material things. Let my confidence rest in You alone."
                ),
                PrayerVerse(
                    id: "prov-11-29",
                    reference: "Proverbs 11:29",
                    text: "He who troubles his own house will inherit wind,\n  And the foolish will be servant to the wisehearted.",
                    prayer: "Father, help me bring peace and wisdom into my home and relationships."
                ),
                PrayerVerse(
                    id: "prov-11-30",
                    reference: "Proverbs 11:30",
                    text: "The fruit of the righteous is a tree of life,\n  And he who is wise wins souls.",
                    prayer: "Lord, let my life bear righteous fruit that draws others closer to You."
                ),
                PrayerVerse(
                    id: "prov-11-31",
                    reference: "Proverbs 11:31",
                    text: "If the righteous will be rewarded in the earth,\n  How much more the wicked and the sinner!",
                    prayer: "Jesus, remind me that righteousness matters deeply and that every action has eternal value. Help me walk faithfully before You always."
                ),
                PrayerVerse(
                    id: "prov-11-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 12,
            title: "Love Correction",
            chapterReference: "Proverbs 12",
            summary: "Ask for a teachable spirit that embraces growth.",
            verses: [
                PrayerVerse(
                    id: "prov-12-1",
                    reference: "Proverbs 12:1",
                    text: "Whoever loves discipline loves knowledge,
  But he who hates reproof is stupid.",
                    prayer: "Dear Jesus, help me love correction and wisdom. Teach me to receive discipline with humility and a willing heart."
                ),
                PrayerVerse(
                    id: "prov-12-2",
                    reference: "Proverbs 12:2",
                    text: "A good man will obtain favor from the Lord,
  But He will condemn a man who devises evil.",
                    prayer: "Father, let my life find favor in Your sight through goodness, honesty, and faithfulness."
                ),
                PrayerVerse(
                    id: "prov-12-3",
                    reference: "Proverbs 12:3",
                    text: "A man will not be established by wickedness,
  But the root of the righteous will not be moved.",
                    prayer: "Lord, establish my life on righteousness so that I may remain strong and unshaken."
                ),
                PrayerVerse(
                    id: "prov-12-4",
                    reference: "Proverbs 12:4",
                    text: "An excellent wife is the crown of her husband,
  But she who shames him is like rottenness in his bones.",
                    prayer: "Jesus, help me become a person of noble character who brings honor, encouragement, and peace to others."
                ),
                PrayerVerse(
                    id: "prov-12-5",
                    reference: "Proverbs 12:5",
                    text: "The thoughts of the righteous are just,
  But the counsels of the wicked are deceitful.",
                    prayer: "Father, purify my thoughts and intentions. Let my plans be righteous, honest, and wise."
                ),
                PrayerVerse(
                    id: "prov-12-6",
                    reference: "Proverbs 12:6",
                    text: "The words of the wicked lie in wait for blood,
  But the mouth of the upright will deliver them.",
                    prayer: "Lord, protect me from harmful and deceitful words. Help my speech bring deliverance, truth, and life."
                ),
                PrayerVerse(
                    id: "prov-12-7",
                    reference: "Proverbs 12:7",
                    text: "The wicked are overthrown and are no more,
  But the house of the righteous will stand.",
                    prayer: "Jesus, keep my house and my life rooted firmly in righteousness so they may endure."
                ),
                PrayerVerse(
                    id: "prov-12-8",
                    reference: "Proverbs 12:8",
                    text: "A man will be praised according to his insight,
  But one of perverse mind will be despised.",
                    prayer: "Father, give me wisdom and understanding so my life reflects good judgment and discernment."
                ),
                PrayerVerse(
                    id: "prov-12-9",
                    reference: "Proverbs 12:9",
                    text: "Better is he who is lightly esteemed and has a servant
  Than he who honors himself and lacks bread.",
                    prayer: "Lord, teach me humility and contentment. Help me value honest work over pride and appearances."
                ),
                PrayerVerse(
                    id: "prov-12-10",
                    reference: "Proverbs 12:10",
                    text: "A righteous man has regard for the life of his animal,
  But even the compassion of the wicked is cruel.",
                    prayer: "Jesus, make me compassionate and caring toward every living thing. Fill my heart with mercy and kindness."
                ),
                PrayerVerse(
                    id: "prov-12-11",
                    reference: "Proverbs 12:11",
                    text: "He who tills his land will have plenty of bread,
  But he who pursues worthless things lacks sense.",
                    prayer: "Father, help me work diligently and faithfully instead of wasting my life on worthless pursuits."
                ),
                PrayerVerse(
                    id: "prov-12-12",
                    reference: "Proverbs 12:12",
                    text: "The wicked man desires the booty of evil men,
  But the root of the righteous yields fruit.",
                    prayer: "Lord, let my life bear good and lasting fruit through righteousness and integrity."
                ),
                PrayerVerse(
                    id: "prov-12-13",
                    reference: "Proverbs 12:13",
                    text: "An evil man is ensnared by the transgression of his lips,
  But the righteous will escape from trouble.",
                    prayer: "Jesus, guard my mouth from sinful speech and deliver me from traps created by careless words."
                ),
                PrayerVerse(
                    id: "prov-12-14",
                    reference: "Proverbs 12:14",
                    text: "A man will be satisfied with good by the fruit of his words,
  And the deeds of a man’s hands will return to him.",
                    prayer: "Father, let the words of my mouth and the work of my hands produce goodness and blessing."
                ),
                PrayerVerse(
                    id: "prov-12-15",
                    reference: "Proverbs 12:15",
                    text: "The way of a fool is right in his own eyes,
  But a wise man is he who listens to counsel.",
                    prayer: "Lord, give me a teachable spirit that listens to wisdom and correction instead of relying only on myself."
                ),
                PrayerVerse(
                    id: "prov-12-16",
                    reference: "Proverbs 12:16",
                    text: "A fool’s anger is known at once,
  But a prudent man conceals dishonor.",
                    prayer: "Jesus, help me respond with patience and self-control instead of anger or offense."
                ),
                PrayerVerse(
                    id: "prov-12-17",
                    reference: "Proverbs 12:17",
                    text: "He who speaks truth tells what is right,
  But a false witness, deceit.",
                    prayer: "Father, let me always speak truthfully and honestly in every situation."
                ),
                PrayerVerse(
                    id: "prov-12-18",
                    reference: "Proverbs 12:18",
                    text: "There is one who speaks rashly like the thrusts of a sword,
  But the tongue of the wise brings healing.",
                    prayer: "Lord, make my words healing and gentle instead of reckless or destructive."
                ),
                PrayerVerse(
                    id: "prov-12-19",
                    reference: "Proverbs 12:19",
                    text: "Truthful lips will be established forever,
  But a lying tongue is only for a moment.",
                    prayer: "Jesus, establish truth in my life and remove every form of deception from my heart and lips."
                ),
                PrayerVerse(
                    id: "prov-12-20",
                    reference: "Proverbs 12:20",
                    text: "Deceit is in the heart of those who devise evil,
  But counselors of peace have joy.",
                    prayer: "Father, fill my heart with peace and righteousness instead of evil intentions or deceit."
                ),
                PrayerVerse(
                    id: "prov-12-21",
                    reference: "Proverbs 12:21",
                    text: "No harm befalls the righteous,
  But the wicked are filled with trouble.",
                    prayer: "Lord, protect me from harm and help me remain faithful even during difficult times."
                ),
                PrayerVerse(
                    id: "prov-12-22",
                    reference: "Proverbs 12:22",
                    text: "Lying lips are an abomination to the Lord,
  But those who deal faithfully are His delight.",
                    prayer: "Jesus, let my life be marked by honesty and faithfulness because truthful living pleases You."
                ),
                PrayerVerse(
                    id: "prov-12-23",
                    reference: "Proverbs 12:23",
                    text: "A prudent man conceals knowledge,
  But the heart of fools proclaims folly.",
                    prayer: "Father, give me wisdom and humility so I do not speak foolishly or boastfully."
                ),
                PrayerVerse(
                    id: "prov-12-24",
                    reference: "Proverbs 12:24",
                    text: "The hand of the diligent will rule,
  But the slack hand will be put to forced labor.",
                    prayer: "Lord, teach me diligence, responsibility, and discipline in all my work."
                ),
                PrayerVerse(
                    id: "prov-12-25",
                    reference: "Proverbs 12:25",
                    text: "Anxiety in a man’s heart weighs it down,
  But a good word makes it glad.",
                    prayer: "Jesus, lift anxiety and heaviness from my heart. Surround me with encouraging and life-giving words."
                ),
                PrayerVerse(
                    id: "prov-12-26",
                    reference: "Proverbs 12:26",
                    text: "The righteous is a guide to his neighbor,
  But the way of the wicked leads them astray.",
                    prayer: "Father, help me choose wise and godly friendships that lead me closer to You."
                ),
                PrayerVerse(
                    id: "prov-12-27",
                    reference: "Proverbs 12:27",
                    text: "A lazy man does not roast his prey,
  But the precious possession of a man is diligence.",
                    prayer: "Lord, remove laziness from my life and help me value the blessings and opportunities You give me."
                ),
                PrayerVerse(
                    id: "prov-12-28",
                    reference: "Proverbs 12:28",
                    text: "In the way of righteousness is life,
  And in its pathway there is no death.",
                    prayer: "Jesus, lead me in the path of righteousness and everlasting life. Keep my steps aligned with Your truth always."
                ),
                PrayerVerse(
                    id: "prov-12-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
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

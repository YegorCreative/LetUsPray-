import Foundation

enum LordsPrayerData {
    static let plan = PrayerPlan(
        id: "lords-prayer",
        title: "The Lord's Prayer",
        subtitle: "A simple pattern for a faithful life",
        description: "A seven-day journey through the Lord's Prayer, taking one line at a time to pray the pattern Jesus gave His disciples.",
        category: .gospel,
        durationDays: 7,
        accentColorName: "gratitude",
        coverIcon: "hands.sparkles.fill",
        days: days
    )

    private static let days: [PrayerDay] = [
        PrayerDay(
            dayNumber: 1,
            title: "Our Father in Heaven",
            chapterReference: "Matthew 6:9",
            summary: "Begin by remembering who you are praying to, and hold His name as holy.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-1-1",
                    reference: "Matthew 6:9",
                    text: "After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name.",
                    prayer: "Father, thank You that I can come to You not as a stranger but as Your child. Teach me to hold Your name as holy in my thoughts, my words, and the way I live today."
                ),
                PrayerVerse(
                    id: "lords-prayer-1-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 2,
            title: "Your Kingdom, Your Will",
            chapterReference: "Matthew 6:10",
            summary: "Surrender your plans today and ask for God's kingdom and will above your own.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-2-1",
                    reference: "Matthew 6:10",
                    text: "Thy kingdom come. Thy will be done in earth, as it is in heaven.",
                    prayer: "Lord, I lay down my own agenda for today. Let Your kingdom come and Your will be done in my home, my work, and my heart, just as it is in heaven."
                ),
                PrayerVerse(
                    id: "lords-prayer-2-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 3,
            title: "Daily Bread",
            chapterReference: "Matthew 6:11",
            summary: "Bring today's needs honestly to God and trust Him for provision one day at a time.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-3-1",
                    reference: "Matthew 6:11",
                    text: "Give us this day our daily bread.",
                    prayer: "Father, I trust You for what I need today—not tomorrow's worries, just today's bread. Thank You for Your faithful provision, and help me hold what I have with open hands."
                ),
                PrayerVerse(
                    id: "lords-prayer-3-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 4,
            title: "Forgiveness",
            chapterReference: "Matthew 6:12",
            summary: "Receive God's forgiveness, and let it shape how freely you forgive others.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-4-1",
                    reference: "Matthew 6:12",
                    text: "And forgive us our debts, as we forgive our debtors.",
                    prayer: "Lord, forgive me where I have fallen short today. Bring to mind anyone I am holding a grudge against, and give me the grace to forgive them as freely as You have forgiven me."
                ),
                PrayerVerse(
                    id: "lords-prayer-4-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 5,
            title: "Deliverance from Evil",
            chapterReference: "Matthew 6:13",
            summary: "Ask for protection from temptation and rescue from what would harm your faith.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-5-1",
                    reference: "Matthew 6:13",
                    text: "And lead us not into temptation, but deliver us from evil.",
                    prayer: "Father, keep me from the paths that would pull me away from You. Where I am weak, be my strength, and deliver me from every scheme of the enemy."
                ),
                PrayerVerse(
                    id: "lords-prayer-5-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 6,
            title: "The Kingdom, the Power, the Glory",
            chapterReference: "Matthew 6:13",
            summary: "End where you began—not with your own strength, but with worship of God's eternal reign.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-6-1",
                    reference: "Matthew 6:13",
                    text: "For thine is the kingdom, and the power, and the glory, for ever. Amen.",
                    prayer: "Lord, every answer to this prayer belongs to You, not to me. The kingdom, the power, and the glory are Yours alone, today and always."
                ),
                PrayerVerse(
                    id: "lords-prayer-6-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),
        PrayerDay(
            dayNumber: 7,
            title: "Praying It All Together",
            chapterReference: "Matthew 6:9-13",
            summary: "Pray the whole pattern in one breath, letting each line carry the week you've spent with it.",
            verses: [
                PrayerVerse(
                    id: "lords-prayer-7-1",
                    reference: "Matthew 6:9-13",
                    text: "Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done in earth, as it is in heaven. Give us this day our daily bread. And forgive us our debts, as we forgive our debtors. And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.",
                    prayer: "Father, I have prayed this pattern one line at a time this week. Today I pray it whole—as my worship, my trust, my request, and my surrender, all held together in the words Jesus gave me."
                ),
                PrayerVerse(
                    id: "lords-prayer-7-closing",
                    reference: "Closing",
                    text: "In Jesus' name, Amen. 🙏🏻",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        )
    ]
}

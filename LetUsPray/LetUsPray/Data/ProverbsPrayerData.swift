import Foundation

enum ProverbsPrayerData {
    static let plan = PrayerPlan(
        id: "30-days-in-proverbs",
        title: "30 Days in Proverbs",
        subtitle: "Pray Through Scripture One Verse at a Time",
        description: "A gentle guided journey through Proverbs, helping you pray for wisdom, humility, trust, and steady obedience.",
        duration: 30,
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
                    reference: "Proverbs 1:7",
                    text: "A holy awe of the Lord is where wisdom first takes root.",
                    prayer: "Lord, make my heart tender before You. Let reverence for You shape my choices, words, and desires today."
                ),
                PrayerVerse(
                    id: "prov-1-2",
                    reference: "Proverbs 1:5",
                    text: "The wise keep listening and continue to grow in understanding.",
                    prayer: "Father, keep me teachable. Quiet my pride so I can hear Your correction and welcome Your guidance."
                ),
                PrayerVerse(
                    id: "prov-1-3",
                    reference: "Proverbs 1:10",
                    text: "When sinners entice, wisdom teaches us not to follow their path.",
                    prayer: "Give me courage to turn away from what pulls me from You. Strengthen me to walk the path of peace and integrity."
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
                    reference: "Proverbs 2:1-2",
                    text: "Receive God's words deeply and incline your heart toward wisdom.",
                    prayer: "Lord, help me welcome Your truth instead of rushing past it. Bend my heart toward wisdom and deeper understanding."
                ),
                PrayerVerse(
                    id: "prov-2-2",
                    reference: "Proverbs 2:3-5",
                    text: "Those who cry out for insight and search for it earnestly begin to understand the fear of the Lord.",
                    prayer: "I ask You for discernment today. Train me to seek Your wisdom like a treasure worth pursuing above every distraction."
                ),
                PrayerVerse(
                    id: "prov-2-3",
                    reference: "Proverbs 2:6",
                    text: "The Lord gives wisdom, and from His mouth come knowledge and understanding.",
                    prayer: "You are the source of wisdom, God. Speak into my thoughts, and let Your truth become the voice I trust most."
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
        PrayerDay(dayNumber: 8, title: "Answer Wisdom's Call", chapterReference: "Proverbs 8", summary: "Open your life to the voice of wisdom.", verses: []),
        PrayerDay(dayNumber: 9, title: "Walk the Way of Insight", chapterReference: "Proverbs 9", summary: "Pray for humility that welcomes wise instruction.", verses: []),
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

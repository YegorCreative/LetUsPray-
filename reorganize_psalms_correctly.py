#!/usr/bin/env python3

# This script will properly organize 150 Psalms into 10 collections of 15 each

output = '''import Foundation

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

'''

# All 150 Psalms data
psalms_info = [
    ("Blessed is the One", "Psalm 1", "Pray for delight in God's Word and fruitfulness in life."),
    ("The Lord's Anointed", "Psalm 2", "Pray for submission to God's sovereignty and trust in His Son."),
    ("Shield Around Me", "Psalm 3", "Pray for peace and protection in times of trouble."),
    ("Answer When I Call", "Psalm 4", "Pray for confidence in God's faithfulness."),
    ("Morning Prayer", "Psalm 5", "Pray for guidance and protection at the start of each day."),
    ("Have Mercy", "Psalm 6", "Pray for healing and God's compassion in distress."),
    ("Refuge in You", "Psalm 7", "Pray for vindication and trust in God's justice."),
    ("How Majestic", "Psalm 8", "Pray in awe of God's majesty and care for humanity."),
    ("I Will Give Thanks", "Psalm 9", "Pray with thanksgiving for God's righteous judgment."),
    ("Why Stand Far Off?", "Psalm 10", "Pray for God's intervention against injustice."),
    ("In the Lord I Take Refuge", "Psalm 11", "Pray for courage and trust when foundations are shaken."),
    ("Help, Lord", "Psalm 12", "Pray for truth and protection from deceit."),
    ("How Long?", "Psalm 13", "Pray through seasons of waiting and darkness."),
    ("The Fool Says", "Psalm 14", "Pray for wisdom and righteous living."),
    ("Who May Dwell?", "Psalm 15", "Pray for integrity and blameless living."),
    ("You Are My Lord", "Psalm 16", "Pray for joy and security in God alone."),
    ("Hear a Just Cause", "Psalm 17", "Pray for vindication and protection."),
    ("I Love You, Lord", "Psalm 18", "Pray in gratitude for God's deliverance and strength."),
    ("The Heavens Declare", "Psalm 19", "Pray in awe of God's creation and Word."),
    ("May the Lord Answer", "Psalm 20", "Pray for trust in God's name and strength."),
    ("The King Rejoices", "Psalm 21", "Pray with gratitude for God's blessings and faithfulness."),
    ("My God, My God", "Psalm 22", "Pray through suffering with hope in God's deliverance."),
    ("The Lord is My Shepherd", "Psalm 23", "Pray for peace and trust in God's provision."),
    ("Lift Up Your Heads", "Psalm 24", "Pray in worship of the King of glory."),
    ("To You, O Lord", "Psalm 25", "Pray for guidance and forgiveness."),
    ("Vindicate Me", "Psalm 26", "Pray for integrity and faithfulness."),
    ("The Lord is My Light", "Psalm 27", "Pray for courage and confidence in God's presence."),
    ("To You I Call", "Psalm 28", "Pray for God to hear and deliver."),
    ("Ascribe to the Lord", "Psalm 29", "Pray in worship of God's powerful voice."),
    ("You Lifted Me Up", "Psalm 30", "Pray in thanksgiving for God's healing and restoration."),
    ("Into Your Hands", "Psalm 31", "Pray for trust and refuge in times of distress."),
    ("Blessed is the Forgiven", "Psalm 32", "Pray for confession and forgiveness."),
    ("Sing Joyfully", "Psalm 33", "Pray in praise of God's faithfulness and creation."),
    ("Taste and See", "Psalm 34", "Pray for trust in God's goodness and deliverance."),
    ("Contend for Me", "Psalm 35", "Pray for God's defense and vindication."),
    ("Your Love Reaches", "Psalm 36", "Pray in awe of God's unfailing love."),
    ("Do Not Fret", "Psalm 37", "Pray for patience and trust in God's timing."),
    ("Do Not Forsake Me", "Psalm 38", "Pray for healing and God's presence in suffering."),
    ("Show Me My End", "Psalm 39", "Pray for perspective and hope."),
    ("I Waited Patiently", "Psalm 40", "Pray with gratitude for answered prayer."),
    ("Blessed is He Who Cares", "Psalm 41", "Pray for compassion and healing."),
    ("As the Deer Pants", "Psalm 42", "Pray for deep longing and hope in God."),
    ("Send Your Light", "Psalm 43", "Pray for guidance and vindication."),
    ("In God We Make Our Boast", "Psalm 44", "Pray for trust in God despite difficulties."),
    ("My Heart Overflows", "Psalm 45", "Pray in worship of the King."),
    ("God is Our Refuge", "Psalm 46", "Pray for strength and peace in chaos."),
    ("Clap Your Hands", "Psalm 47", "Pray in joyful worship of God's kingship."),
    ("Great is the Lord", "Psalm 48", "Pray in praise of God's greatness."),
    ("Why Should I Fear?", "Psalm 49", "Pray for wisdom about wealth and eternity."),
    ("The Mighty One Speaks", "Psalm 50", "Pray for true worship and gratitude."),
    ("Create in Me a Clean Heart", "Psalm 51", "Pray for repentance and restoration."),
    ("God Will Bring You Down", "Psalm 52", "Pray for trust in God's justice."),
    ("Who Will Bring Salvation?", "Psalm 53", "Pray for God's deliverance."),
    ("Save Me by Your Name", "Psalm 54", "Pray for God's powerful help."),
    ("Cast Your Cares", "Psalm 55", "Pray for peace in betrayal and pain."),
    ("When I Am Afraid", "Psalm 56", "Pray for trust over fear."),
    ("My Heart is Steadfast", "Psalm 57", "Pray for confidence in God's mercy."),
    ("Do You Judge Uprightly?", "Psalm 58", "Pray for God's righteous judgment."),
    ("Deliver Me from Enemies", "Psalm 59", "Pray for protection and deliverance."),
    ("You Have Rejected Us", "Psalm 60", "Pray for restoration and victory."),
    ("Hear My Cry", "Psalm 61", "Pray for refuge and security in God."),
    ("My Soul Finds Rest", "Psalm 62", "Pray for quiet trust in God alone."),
    ("You Are My God", "Psalm 63", "Pray for earnest seeking after God."),
    ("Protect Me from the Wicked", "Psalm 64", "Pray for God's shield against evil."),
    ("Praise Awaits You", "Psalm 65", "Pray in gratitude for God's provision."),
    ("Shout for Joy", "Psalm 66", "Pray in celebration of God's awesome deeds."),
    ("May God Be Gracious", "Psalm 67", "Pray for God's blessing and salvation for all."),
    ("Let God Arise", "Psalm 68", "Pray in worship of God's mighty power."),
    ("Save Me, O God", "Psalm 69", "Pray for deliverance in overwhelming distress."),
    ("Hasten to Help Me", "Psalm 70", "Pray for urgent help from God."),
    ("You Are My Hope", "Psalm 71", "Pray for lifelong trust in God."),
    ("Endow the King", "Psalm 72", "Pray for righteous leadership and justice."),
    ("Who Have I But You?", "Psalm 73", "Pray for perspective when the wicked prosper."),
    ("Remember Your Congregation", "Psalm 74", "Pray for God's intervention and restoration."),
    ("We Give Thanks", "Psalm 75", "Pray in gratitude for God's judgment."),
    ("You Are Resplendent", "Psalm 76", "Pray in awe of God's majesty."),
    ("I Cried to God", "Psalm 77", "Pray for remembrance of God's faithfulness."),
    ("Tell the Next Generation", "Psalm 78", "Pray for faithfulness in teaching God's ways."),
    ("Help Us, O God", "Psalm 79", "Pray for mercy and deliverance."),
    ("Restore Us", "Psalm 80", "Pray for renewal and God's favor."),
    ("Sing for Joy", "Psalm 81", "Pray for obedience and celebration."),
    ("Defend the Weak", "Psalm 82", "Pray for justice and righteousness."),
    ("Do Not Keep Silent", "Psalm 83", "Pray for God to act against enemies."),
    ("How Lovely is Your Dwelling", "Psalm 84", "Pray for love of God's presence."),
    ("Show Us Your Mercy", "Psalm 85", "Pray for revival and God's favor."),
    ("Teach Me Your Way", "Psalm 86", "Pray for guidance and a undivided heart."),
    ("Glorious Things", "Psalm 87", "Pray in celebration of God's city."),
    ("Darkness is My Friend", "Psalm 88", "Pray honestly through deep despair."),
    ("I Will Sing of Your Love", "Psalm 89", "Pray for trust in God's covenant faithfulness."),
    ("Teach Us to Number Our Days", "Psalm 90", "Pray for wisdom about the brevity of life."),
    ("Under His Wings", "Psalm 91", "Pray for protection and refuge."),
    ("It is Good to Praise", "Psalm 92", "Pray in thanksgiving for God's works."),
    ("The Lord Reigns", "Psalm 93", "Pray in worship of God's sovereign rule."),
    ("God of Vengeance", "Psalm 94", "Pray for God's justice and discipline."),
    ("Come, Let Us Worship", "Psalm 95", "Pray with a heart of worship and obedience."),
    ("Sing to the Lord", "Psalm 96", "Pray in joyful praise of God's glory."),
    ("The Lord Reigns, Let the Earth Rejoice", "Psalm 97", "Pray in celebration of God's righteous reign."),
    ("A New Song", "Psalm 98", "Pray with joy for God's salvation."),
    ("Holy is He", "Psalm 99", "Pray in reverence of God's holiness."),
    ("Shout for Joy", "Psalm 100", "Pray with thanksgiving and gladness."),
    ("I Will Walk in Integrity", "Psalm 101", "Pray for blameless living."),
    ("Hear My Prayer", "Psalm 102", "Pray for comfort in affliction."),
    ("Praise the Lord, O My Soul", "Psalm 103", "Pray in gratitude for God's benefits and compassion."),
    ("How Many Are Your Works", "Psalm 104", "Pray in awe of God's creation."),
    ("Give Thanks to the Lord", "Psalm 105", "Pray with remembrance of God's faithfulness."),
    ("We Have Sinned", "Psalm 106", "Pray in confession and repentance."),
    ("Give Thanks for His Unfailing Love", "Psalm 107", "Pray in gratitude for God's deliverance."),
    ("My Heart is Steadfast", "Psalm 108", "Pray with confidence in God's help."),
    ("God of My Praise", "Psalm 109", "Pray for God's vindication."),
    ("Sit at My Right Hand", "Psalm 110", "Pray in worship of the Messianic King."),
    ("Great Are His Works", "Psalm 111", "Pray in praise of God's deeds."),
    ("Blessed is the One Who Fears", "Psalm 112", "Pray for righteousness and generosity."),
    ("Who is Like the Lord?", "Psalm 113", "Pray in worship of God's incomparable nature."),
    ("When Israel Came Out", "Psalm 114", "Pray in remembrance of God's mighty deliverance."),
    ("Not to Us", "Psalm 115", "Pray for God's glory alone."),
    ("I Love the Lord", "Psalm 116", "Pray in gratitude for answered prayer."),
    ("Praise the Lord, All Nations", "Psalm 117", "Pray for universal praise of God."),
    ("His Love Endures Forever", "Psalm 118", "Pray in thanksgiving for God's steadfast love."),
    ("Your Word is a Lamp", "Psalm 119", "Pray for love of God's Word and obedience."),
    ("I Call on the Lord", "Psalm 120", "Pray for deliverance from deceit."),
    ("I Lift Up My Eyes", "Psalm 121", "Pray for God's watchful protection."),
    ("I Rejoiced", "Psalm 122", "Pray for love of God's house and peace."),
    ("To You I Lift My Eyes", "Psalm 123", "Pray for mercy and relief from contempt."),
    ("If the Lord Had Not Been", "Psalm 124", "Pray in gratitude for God's deliverance."),
    ("Those Who Trust", "Psalm 125", "Pray for steadfast trust in God."),
    ("Restore Our Fortunes", "Psalm 126", "Pray for restoration and joy."),
    ("Unless the Lord Builds", "Psalm 127", "Pray for dependence on God in all endeavors."),
    ("Blessed Are All Who Fear", "Psalm 128", "Pray for blessing in family and work."),
    ("Often They Have Afflicted Me", "Psalm 129", "Pray for endurance through persecution."),
    ("Out of the Depths", "Psalm 130", "Pray for forgiveness and hope."),
    ("My Heart is Not Proud", "Psalm 131", "Pray for humility and quiet trust."),
    ("Remember David", "Psalm 132", "Pray for God's presence and promises."),
    ("How Good and Pleasant", "Psalm 133", "Pray for unity among believers."),
    ("Praise the Lord at Night", "Psalm 134", "Pray with nighttime worship and blessing."),
    ("Praise the Name of the Lord", "Psalm 135", "Pray in praise of God's greatness."),
    ("His Love Endures Forever", "Psalm 136", "Pray in thanksgiving for God's enduring love."),
    ("By the Rivers of Babylon", "Psalm 137", "Pray with longing for home and restoration."),
    ("I Will Praise You", "Psalm 138", "Pray with wholehearted thanksgiving."),
    ("You Have Searched Me", "Psalm 139", "Pray in awe of God's intimate knowledge."),
    ("Rescue Me from Evil", "Psalm 140", "Pray for protection from the wicked."),
    ("Set a Guard", "Psalm 141", "Pray for control over words and actions."),
    ("I Cry Aloud", "Psalm 142", "Pray for refuge when overwhelmed."),
    ("Do Not Bring to Judgment", "Psalm 143", "Pray for mercy and guidance."),
    ("Praise to the Rock", "Psalm 144", "Pray for God's strength in battle."),
    ("Great is the Lord", "Psalm 145", "Pray in exaltation of God's greatness."),
    ("Praise the Lord, My Soul", "Psalm 146", "Pray with trust in God's help."),
    ("He Heals the Brokenhearted", "Psalm 147", "Pray in praise of God's care and power."),
    ("Praise from Heaven and Earth", "Psalm 148", "Pray in cosmic worship of the Creator."),
    ("Sing a New Song", "Psalm 149", "Pray with joyful praise and celebration."),
    ("Let Everything That Has Breath", "Psalm 150", "Pray in final, resounding praise of God."),
]

# Generate 10 collections
for coll_idx in range(0, 10):
    start_psalm = coll_idx * 15
    end_psalm = start_psalm + 15
    coll_name = f"psalms{start_psalm+1}to{end_psalm}"
    
    output += f'''    // MARK: - Psalms {start_psalm+1}-{end_psalm}
    private static let {coll_name}: [PrayerDay] = [
'''
    
    for day_idx in range(15):
        psalm_idx = start_psalm + day_idx
        title, chapter_ref, summary = psalms_info[psalm_idx]
        
        output += f'''        PrayerDay(
            dayNumber: {day_idx + 1},
            title: "{title}",
            chapterReference: "{chapter_ref}",
            summary: "{summary}",
            verses: []
        )'''
        
        if day_idx < 14:
            output += ','
        output += '\n'
    
    output += '    ]\n\n'

output += '}\n'

# Write to file
with open('/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'w') as f:
    f.write(output)

print("✅ Successfully organized all 150 Psalms into 10 collections of 15!")
print("Each collection has exactly 15 Psalms with dayNumbers 1-15.")

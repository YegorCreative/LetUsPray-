#!/usr/bin/env python3
import re

# Read the original file
with open('/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'r') as f:
    content = f.read()

# Extract all PrayerDay entries
pattern = r'PrayerDay\(\s*dayNumber: (\d+),\s*title: "(.*?)",\s*chapterReference: "(Psalm \d+)",\s*summary: "(.*?)",\s*verses: \[\]\s*\)'
matches = re.findall(pattern, content, re.DOTALL)

# Organize into collections of 15
collections = {}
for i in range(0, 150, 15):
    start = i + 1
    end = min(i + 15, 150)
    key = f"psalms{start}to{end}"
    collections[key] = []
    
    for j, match in enumerate(matches[i:i+15]):
        title, chapter_ref, summary = match
        collections[key].append({
            'dayNumber': j + 1,  # Renumber within collection
            'title': title,
            'chapterReference': chapter_ref,
            'summary': summary
        })

# Generate the new file content
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

# Generate each collection
for coll_name, psalms in collections.items():
    start_num = int(coll_name.split('to')[0].replace('psalms', ''))
    end_num = int(coll_name.split('to')[1])
    
    output += f'''    // MARK: - Psalms {start_num}-{end_num}
    private static let {coll_name}: [PrayerDay] = [
'''
    
    for psalm in psalms:
        output += f'''        PrayerDay(
            dayNumber: {psalm['dayNumber']},
            title: "{psalm['title']}",
            chapterReference: "{psalm['chapterReference']}",
            summary: "{psalm['summary']}",
            verses: []
        ),
'''
    
    # Remove last comma
    output = output.rstrip(',\n') + '\n    ]\n\n'

output += '}\n'

# Write the new file
with open('/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'w') as f:
    f.write(output)

print("File reorganized successfully!")
print(f"Total collections: {len(collections)}")
for name, psalms in collections.items():
    print(f"{name}: {len(psalms)} psalms")

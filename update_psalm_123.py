#!/usr/bin/env python3
import re

# Read the file
with open('LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'r') as f:
    content = f.read()

# Pattern to find Psalm 123 with empty verses[]
pattern = r'''(        PrayerDay\(
            dayNumber: 123,
            title: "To You I Lift My Eyes",
            chapterReference: "Psalm 123",
            summary: "Pray for mercy and relief from contempt\.",
            verses: \[\]
        \))'''

replacement = '''        PrayerDay(
            dayNumber: 123,
            title: "To You I Lift My Eyes",
            chapterReference: "Psalm 123",
            summary: "Pray for mercy and relief from contempt.",
            // JSON resource: psalm_123_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-123-1",
                    reference: "Psalm 123:1",
                    text: "To You I lift up my eyes,\\n  O You who are enthroned in the heavens!",
                    prayer: "Lord, I lift my eyes to You, the One enthroned in heaven. Help me look to You first in every need."
                ),
                PrayerVerse(
                    id: "psalm-123-2",
                    reference: "Psalm 123:2",
                    text: "Behold, as the eyes of servants look to the hand of their master,\\n  As the eyes of a maid to the hand of her mistress,\\n  So our eyes look to the Lord our God,\\n  Until He is gracious to us.",
                    prayer: "Father, as a servant looks to the hand of a master, help my heart wait on You with humility, trust, and dependence."
                ),
                PrayerVerse(
                    id: "psalm-123-3",
                    reference: "Psalm 123:3",
                    text: "Be gracious to us, O Lord, be gracious to us,\\n  For we are greatly filled with contempt.",
                    prayer: "Lord, be gracious to me when I feel worn down, discouraged, or overwhelmed by contempt."
                ),
                PrayerVerse(
                    id: "psalm-123-4",
                    reference: "Psalm 123:4",
                    text: "Our soul is greatly filled\\n  With the scoffing of those who are at ease,\\n  And with the contempt of the proud.",
                    prayer: "Father, when pride, mockery, or disrespect surrounds me, keep my heart steady in Your mercy and truth."
                ),
                PrayerVerse(
                    id: "psalm-123-closing",
                    reference: "Closing",
                    text: "Lord, thank You that I can lift my eyes to You in every season. Teach me to wait on Your mercy with humility, patience, and trust. When discouragement, contempt, or prideful voices surround me, keep my heart anchored in Your grace. May my hope remain fixed on You, my faithful God in heaven.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        )'''

# Replace all occurrences
new_content = re.sub(pattern, replacement, content)

# Write back
with open('LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'w') as f:
    f.write(new_content)

print(f"✅ Updated Psalm 123 entries")
print(f"Replacements made: {content.count('dayNumber: 123,')}")

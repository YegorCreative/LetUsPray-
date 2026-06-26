#!/usr/bin/env python3
"""
Update both occurrences of Psalm 124 in PsalmsPrayerData.swift
"""

swift_file_path = 'LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift'

# Read the file
with open(swift_file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Define the old pattern to replace (Psalm 124 with empty verses)
old_pattern = '''        PrayerDay(
            dayNumber: 124,
            title: "If the Lord Had Not Been",
            chapterReference: "Psalm 124",
            summary: "Pray in gratitude for God's deliverance.",
            verses: []
        ),'''

# Define the new content with all verses and prayers
new_content = '''        PrayerDay(
            dayNumber: 124,
            title: "If the Lord Had Not Been",
            chapterReference: "Psalm 124",
            summary: "Pray in gratitude for God's deliverance.",
            // JSON resource: psalm_124_verses.json
            verses: [
                PrayerVerse(
                    id: "psalm-124-1",
                    reference: "Psalm 124:1",
                    text: ""Had it not been the Lord who was on our side,"\\n  Let Israel now say,",
                    prayer: "Lord, thank You for being on my side. Help me recognize Your protection and give You praise for every rescue."
                ),
                PrayerVerse(
                    id: "psalm-124-2",
                    reference: "Psalm 124:2",
                    text: ""Had it not been the Lord who was on our side\\n  When men rose up against us,",
                    prayer: "Father, when trouble rises against me, remind me that You stand with Your people."
                ),
                PrayerVerse(
                    id: "psalm-124-3",
                    reference: "Psalm 124:3",
                    text: "Then they would have swallowed us alive,\\n  When their anger was kindled against us;",
                    prayer: "Lord, when circumstances feel overwhelming, protect me from being consumed by fear or danger."
                ),
                PrayerVerse(
                    id: "psalm-124-4",
                    reference: "Psalm 124:4",
                    text: "Then the waters would have engulfed us,\\n  The stream would have swept over our soul;",
                    prayer: "Father, when the waters of trouble rise, keep me secure in Your faithful care."
                ),
                PrayerVerse(
                    id: "psalm-124-5",
                    reference: "Psalm 124:5",
                    text: "Then the raging waters would have swept over our soul."",
                    prayer: "Lord, when life feels like a raging flood, lift me above despair and anchor me in Your strength."
                ),
                PrayerVerse(
                    id: "psalm-124-6",
                    reference: "Psalm 124:6",
                    text: "Blessed be the Lord,\\n  Who has not given us to be torn by their teeth.",
                    prayer: "Father, blessed be Your name for not giving me over to what seeks to harm me."
                ),
                PrayerVerse(
                    id: "psalm-124-7",
                    reference: "Psalm 124:7",
                    text: "Our soul has escaped as a bird out of the snare of the trapper;\\n  The snare is broken and we have escaped.",
                    prayer: "Lord, thank You for breaking the trap and setting my soul free."
                ),
                PrayerVerse(
                    id: "psalm-124-8",
                    reference: "Psalm 124:8",
                    text: "Our help is in the name of the Lord,\\n  Who made heaven and earth.",
                    prayer: "Father, my help is in Your name, the Maker of heaven and earth. Teach me to trust You completely."
                ),
                PrayerVerse(
                    id: "psalm-124-closing",
                    reference: "Closing",
                    text: "Lord, thank You for being my help, protector, and deliverer. When trouble rises, floods overwhelm, or traps surround me, remind me that You are on my side. Break every snare, guard my soul, and teach me to trust in Your name. May my confidence always rest in You, the Maker of heaven and earth.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )
            ]
        ),'''

# Count occurrences before replacement
count_before = content.count(old_pattern)
print(f"Found {count_before} occurrences of Psalm 124 pattern")

if count_before == 0:
    print("⚠️  Warning: No matching pattern found. Checking for variations...")
    # Check if it's already updated
    if 'psalm-124-1' in content:
        print("✓ Psalm 124 already appears to be updated")
        exit(0)
    else:
        print("✗ Could not find Psalm 124 entry to update")
        exit(1)

# Replace all occurrences
updated_content = content.replace(old_pattern, new_content)

# Count occurrences after replacement (should be 0)
count_after = updated_content.count(old_pattern)
print(f"Remaining occurrences after replacement: {count_after}")

# Count new pattern occurrences
count_new = updated_content.count('id: "psalm-124-1"')
print(f"New psalm-124 entries found: {count_new}")

# Write the updated content back to the file
with open(swift_file_path, 'w', encoding='utf-8') as f:
    f.write(updated_content)

print(f"\n✅ Successfully updated {swift_file_path}")
print(f"   - Updated {count_before} Psalm 124 entries")
print(f"   - Added 9 prayer entries (8 verses + 1 closing)")
print(f"   - Total psalm-124 IDs in file: {count_new * 9}")

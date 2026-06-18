#!/usr/bin/env python3
import re

print("Reading file...")
with open('LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'r') as f:
    content = f.read()

print("Finding psalms16to30 section...")

# Find the psalms16to30 section
pattern = r'(// MARK: - Psalms 16-30\s+private static let psalms16to30: \[PrayerDay\] = \[)(.*?)(\n    \]\n})'
match = re.search(pattern, content, re.DOTALL)

if not match:
    print("ERROR: Could not find psalms16t30 section")
    exit(1)

before_section = content[:match.start(1)]
psalms_content = match.group(2)
after_section = match.group(3)

print("Extracting psalm entries...")
psalm_entries = re.findall(r'(        PrayerDay\(.*?\n        \))', psalms_content, re.DOTALL)
print(f"Found {len(psalm_entries)} psalms")

# Update dayNumbers (should be 1-15 repeating)
updated_entries = []
for i, entry in enumerate(psalm_entries):
    day_in_collection = (i % 15) + 1
    updated_entry = re.sub(r'dayNumber: \d+,', f'dayNumber: {day_in_collection},', entry)
    updated_entries.append(updated_entry)

# Build 9 collections
collections = [
    ('psalms16to30', 16, 30),
    ('psalms31to45', 31, 45),
    ('psalms46to60', 46, 60),
    ('psalms61to75', 61, 75),
    ('psalms76to90', 76, 90),
    ('psalms91to105', 91, 105),
    ('psalms106to120', 106, 120),
    ('psalms121to135', 121, 135),
    ('psalms136to150', 136, 150),
]

new_collections_text = ""
for idx, (name, start, end) in enumerate(collections):
    start_idx = idx * 15
    end_idx = start_idx + 15
    collection_entries = updated_entries[start_idx:end_idx]
    
    new_collections_text += f"    // MARK: - Psalms {start}-{end}\n"
    new_collections_text += f"    private static let {name}: [PrayerDay] = [\n"
    new_collections_text += ',\n'.join(collection_entries)
    new_collections_text += "\n    ]\n"
    if idx < len(collections) - 1:
        new_collections_text += "\n"

final_content = before_section + new_collections_text + "\n}"

print("Writing updated file...")
with open('LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'w') as f:
    f.write(final_content)

print("✅ SUCCESS!")
print(f"   Split into {len(collections)} collections")
print(f"   Each collection has 15 psalms with dayNumbers 1-15")

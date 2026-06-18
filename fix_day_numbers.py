#!/usr/bin/env python3
import re

# Read the current file
with open('/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'r') as f:
    content = f.read()

# For each collection, fix the dayNumbers
collections = [
    ("psalms1to15", list(range(1, 16))),
    ("psalms16to30", list(range(16, 31))),
    ("psalms31to45", list(range(31, 46))),
    ("psalms46to60", list(range(46, 61))),
    ("psalms61to75", list(range(61, 76))),
    ("psalms76to90", list(range(76, 91))),
    ("psalms91to105", list(range(91, 106))),
    ("psalms106to120", list(range(106, 121))),
    ("psalms121to135", list(range(121, 136))),
    ("psalms136to150", list(range(136, 151)))
]

for coll_name, psalm_range in collections:
    # Find the start of this collection
    pattern = f"private static let {coll_name}: \\[PrayerDay\\] = \\["
    match = re.search(pattern, content)
    
    if match:
        start_pos = match.end()
        # Find all dayNumber entries for this collection
        collection_text = content[start_pos:]
        next_collection = re.search(r"private static let psalms\d+to\d+: \[PrayerDay\] = \[", collection_text)
        if next_collection:
            end_pos = start_pos + next_collection.start()
            collection_section = content[start_pos:end_pos]
        else:
            # Last collection
            end_marker = content.find("}", start_pos)
            collection_section = content[start_pos:end_marker]
        
        # Replace dayNumbers in this section
        new_section = collection_section
        for idx, psalm_num in enumerate(psalm_range):
            # Replace dayNumber: psalm_num with dayNumber: idx+1
            old_pattern = f"dayNumber: {psalm_num},"
            new_pattern = f"dayNumber: {idx + 1},"
            new_section = new_section.replace(old_pattern, new_pattern, 1)
        
        # Replace in the full content
        content = content[:start_pos] + new_section + content[end_pos if next_collection else end_marker:]

# Write back
with open('/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift', 'w') as f:
    f.write(content)

print("✅ Fixed all dayNumbers to be 1-15 within each collection!")

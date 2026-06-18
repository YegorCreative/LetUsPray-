#!/usr/bin/env python3
import re

# Read the file
file_path = 'LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift'
with open(file_path, 'r') as f:
    lines = f.readlines()

# Track which collection we're in
output_lines = []
current_day_number = 0
in_collection = False

for line in lines:
    # Check if starting a new collection
    if re.match(r'\s*private static let psalms\d+to\d+:', line):
        current_day_number = 0
        in_collection = True
        output_lines.append(line)
    # Check if this is a dayNumber line
    elif re.match(r'\s*dayNumber:\s*\d+,', line) and in_collection:
        current_day_number += 1
        indent = len(line) - len(line.lstrip())
        output_lines.append(' ' * indent + f'dayNumber: {current_day_number},\n')
    else:
        output_lines.append(line)

# Write the fixed content
with open(file_path, 'w') as f:
    f.writelines(output_lines)

print("✅ Fixed all dayNumber values!")
print("Each collection now has dayNumbers 1-15")

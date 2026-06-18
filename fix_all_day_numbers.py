#!/usr/bin/env python3
import re
import sys

input_file = 'LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift'

print("Reading file...")
with open(input_file, 'r') as f:
    lines = f.readlines()

print(f"Processing {len(lines)} lines...")

output = []
day_num = 0
collections = 0
total_days_fixed = 0

for i, line in enumerate(lines):
    # Check if starting a new collection
    if 'private static let psalms' in line and ': [PrayerDay] = [' in line:
        day_num = 0
        collections += 1
        output.append(line)
        print(f"  Collection {collections} found at line {i+1}")
    # Check if this is a dayNumber line
    elif re.match(r'^\s*dayNumber:\s*\d+,\s*$', line):
        old_num = int(re.search(r'\d+', line).group())
        day_num += 1
        indent = len(line) - len(line.lstrip())
        new_line = ' ' * indent + f'dayNumber: {day_num},\n'
        output.append(new_line)
        total_days_fixed += 1
        if day_num == 1 or day_num == 15:
            print(f"    Day {old_num} -> {day_num}")
    else:
        output.append(line)

print(f"\nWriting file...")
with open(input_file, 'w') as f:
    f.writelines(output)

print(f"\n✅ COMPLETE!")
print(f"   Collections: {collections}")
print(f"   Days fixed: {total_days_fixed}")
print(f"   Each collection now has dayNumbers 1-15")

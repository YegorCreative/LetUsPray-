#!/usr/bin/env python3
"""
Simple Psalm Integration Script (No API dependencies)
This works with existing JSON files or creates templates
"""

import json
import os
import re
import sys

SWIFT_FILE = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift'
RESOURCES_DIR = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Resources/Bible/Psalms'

def read_json_file(psalm_number):
    """Read the JSON file for a psalm"""
    json_file = os.path.join(RESOURCES_DIR, f'psalm_{psalm_number}_verses.json')
    
    if not os.path.exists(json_file):
        print(f"❌ JSON file not found: {json_file}")
        print(f"💡 Please create this file first with your psalm data")
        return None
    
    print(f"📖 Reading {json_file}...")
    with open(json_file, 'r') as f:
        return json.load(f)

def find_psalm_entry(swift_content, psalm_number):
    """Find the psalm entry in Swift file"""
    # Try to find the pattern with verses: []
    pattern = rf'(PrayerDay\(\s+dayNumber: {psalm_number},\s+title: "[^"]+",\s+chapterReference: "Psalm {psalm_number}",\s+summary: "[^"]+",\s+verses: \[)\]'
    match = re.search(pattern, swift_content, re.MULTILINE | re.DOTALL)
    
    if match:
        return match
    
    # Try alternative pattern
    pattern2 = rf'PrayerDay\([^)]*dayNumber: {psalm_number}[^)]*verses: \[\]'
    match2 = re.search(pattern2, swift_content, re.DOTALL)
    return match2

def generate_verse_prayer_swift(psalm_number, verse_data):
    """Generate a single PrayerVerse in Swift"""
    verse_num = verse_data.get('verse', 0)
    reference = verse_data.get('reference', f'Psalm {psalm_number}:{verse_num}')
    
    # The existing JSON has prayers in the 'text' field
    # We need to fetch actual verse text separately or use what we have
    text = verse_data.get('text', 'Bible verse text here')
    
    # For now, use the prayer as both text and prayer if it looks like a prayer
    if text.startswith('Lord') or text.startswith('Father') or text.startswith('God'):
        prayer = text
        text = f"[Psalm {psalm_number}:{verse_num} - verse text to be added]"
    else:
        prayer = text
    
    # Escape for Swift
    text_clean = text.replace('"', '\\"').replace('\n', '\\n  ')
    prayer_clean = prayer.replace('"', '\\"').replace('\n', '\\n  ')
    
    return f'''                PrayerVerse(
                    id: "psalm-{psalm_number}-{verse_num}",
                    reference: "{reference}",
                    text: "{text_clean}",
                    prayer: "{prayer_clean}"
                )'''

def integrate_psalm(psalm_number):
    """Integrate a psalm into the Swift file"""
    print(f"🚀 Integrating Psalm {psalm_number}...\n")
    
    # Read JSON
    verses_data = read_json_file(psalm_number)
    if not verses_data:
        return False
    
    print(f"✅ Found {len(verses_data)} verses\n")
    
    # Read Swift file
    print(f"📖 Reading Swift file...")
    with open(SWIFT_FILE, 'r') as f:
        swift_content = f.read()
    
    # Find psalm location
    print(f"🔍 Locating Psalm {psalm_number} in Swift file...")
    match = find_psalm_entry(swift_content, psalm_number)
    
    if not match:
        print(f"❌ Could not find Psalm {psalm_number} entry")
        print(f"💡 Make sure the psalm exists with: verses: []")
        return False
    
    print(f"✅ Found Psalm {psalm_number} entry\n")
    
    # Generate verses Swift code
    print(f"🔨 Generating Swift code...")
    verses_swift = []
    for verse_data in verses_data:
        verses_swift.append(generate_verse_prayer_swift(psalm_number, verse_data))
    
    # Add closing prayer
    closing = f'''                PrayerVerse(
                    id: "psalm-{psalm_number}-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the truths of Psalm {psalm_number}. Help me trust in Your justice and live a life that honors You.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )'''
    verses_swift.append(closing)
    
    verses_code = ',\n'.join(verses_swift)
    
    # Find the exact text to replace
    # Get the full PrayerDay block
    start_pos = match.start()
    # Find the opening of PrayerDay
    day_start = swift_content.rfind('PrayerDay(', 0, start_pos + 100)
    # Find the closing with verses: []
    verses_pos = swift_content.find('verses: []', day_start)
    end_bracket_pos = swift_content.find(')', verses_pos)
    
    # Extract the full PrayerDay declaration
    old_block = swift_content[day_start:end_bracket_pos+1]
    
    # Parse details from old block
    title_match = re.search(r'title: "([^"]+)"', old_block)
    summary_match = re.search(r'summary: "([^"]+)"', old_block)
    
    title = title_match.group(1) if title_match else "Untitled"
    summary = summary_match.group(1) if summary_match else "No summary"
    
    # Create new block
    new_block = f'''PrayerDay(
            dayNumber: {psalm_number},
            title: "{title}",
            chapterReference: "Psalm {psalm_number}",
            summary: "{summary}",
            verses: [
{verses_code}
            ]
        )'''
    
    # Replace
    updated_content = swift_content[:day_start] + new_block + swift_content[end_bracket_pos+1:]
    
    # Write back
    print(f"💾 Writing updated Swift file...")
    with open(SWIFT_FILE, 'w') as f:
        f.write(updated_content)
    
    print(f"✅ Successfully integrated Psalm {psalm_number}!\n")
    print(f"📱 The data is now in your app's Swift file")
    print(f"💡 Build and run in Xcode to see the changes\n")
    return True

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 simple_integrate_psalm.py <psalm_number>")
        print("Example: python3 simple_integrate_psalm.py 52")
        sys.exit(1)
    
    psalm_number = int(sys.argv[1])
    success = integrate_psalm(psalm_number)
    
    if not success:
        sys.exit(1)

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
Automated Psalm Integration Script
This script reads psalm JSON data and integrates it directly into PsalmsPrayerData.swift
No manual Xcode operations needed!
"""

import json
import os
import re
import sys

# File paths
SWIFT_FILE = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift'
RESOURCES_DIR = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Resources/Bible/Psalms'

def read_swift_file():
    """Read the current Swift file contents"""
    with open(SWIFT_FILE, 'r') as f:
        return f.read()

def write_swift_file(content):
    """Write updated content to Swift file"""
    with open(SWIFT_FILE, 'w') as f:
        f.write(content)

def find_psalm_entry(swift_content, psalm_number):
    """Find the psalm entry in the Swift file and return its position"""
    # Pattern: PrayerDay with chapterReference: "Psalm XX"
    pattern = rf'PrayerDay\(\s+dayNumber: {psalm_number},\s+title: "([^"]+)",\s+chapterReference: "Psalm {psalm_number}",\s+summary: "([^"]+)",\s+verses: \[\]'
    match = re.search(pattern, swift_content, re.MULTILINE)
    return match

def generate_prayer_verses(psalm_number, verses_data):
    """Generate PrayerVerse Swift code from JSON data"""
    verses_code = []
    
    for verse_data in verses_data:
        verse_num = verse_data['verse']
        reference = verse_data['reference']
        text = verse_data.get('text', '')
        prayer = verse_data.get('prayer', text)  # If no prayer, use text
        
        # Escape quotes and newlines
        text_escaped = text.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')
        prayer_escaped = prayer.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')
        
        verse_code = f'''                PrayerVerse(
                    id: "psalm-{psalm_number}-{verse_num}",
                    reference: "{reference}",
                    text: "{text_escaped}",
                    prayer: "{prayer_escaped}"
                )'''
        verses_code.append(verse_code)
    
    # Add closing prayer
    closing_prayer = f'''                PrayerVerse(
                    id: "psalm-{psalm_number}-closing",
                    reference: "Closing",
                    text: "Lord, thank You for the truths and prayers of Psalm {psalm_number}. Help me trust in Your justice, remain rooted in Your love, and live a life that honors You.",
                    prayer: "In Jesus' name, Amen. 🙏🏻"
                )'''
    verses_code.append(closing_prayer)
    
    return ',\n'.join(verses_code)

def update_psalm_in_swift(psalm_number, json_file_path=None):
    """Update a specific psalm in the Swift file"""
    
    # Determine JSON file path
    if json_file_path is None:
        json_file_path = os.path.join(RESOURCES_DIR, f'psalm_{psalm_number}_verses.json')
    
    # Check if JSON file exists
    if not os.path.exists(json_file_path):
        print(f"❌ JSON file not found: {json_file_path}")
        return False
    
    # Read JSON data
    print(f"📖 Reading {json_file_path}...")
    with open(json_file_path, 'r') as f:
        verses_data = json.load(f)
    
    if not verses_data:
        print(f"❌ No verse data found in JSON file")
        return False
    
    print(f"✅ Found {len(verses_data)} verses")
    
    # Read Swift file
    print(f"📖 Reading Swift file...")
    swift_content = read_swift_file()
    
    # Find the psalm entry
    match = find_psalm_entry(swift_content, psalm_number)
    if not match:
        print(f"❌ Could not find Psalm {psalm_number} entry in Swift file")
        return False
    
    print(f"✅ Found Psalm {psalm_number} entry in Swift file")
    
    # Generate new verses code
    print(f"🔨 Generating Swift code...")
    verses_code = generate_prayer_verses(psalm_number, verses_data)
    
    # Create the replacement
    old_text = match.group(0)
    new_text = f'''PrayerDay(
            dayNumber: {psalm_number},
            title: "{match.group(1)}",
            chapterReference: "Psalm {psalm_number}",
            summary: "{match.group(2)}",
            verses: [
{verses_code}
            ]'''
    
    # Replace in Swift file
    updated_content = swift_content.replace(old_text, new_text)
    
    # Write back to file
    print(f"💾 Writing updated Swift file...")
    write_swift_file(updated_content)
    
    print(f"✅ Successfully integrated Psalm {psalm_number} into Swift file!")
    print(f"📱 No Xcode operations needed - data is now in the app!")
    return True

def main():
    """Main function"""
    if len(sys.argv) < 2:
        print("Usage: python3 update_psalm_in_swift.py <psalm_number> [json_file_path]")
        print("Example: python3 update_psalm_in_swift.py 52")
        print("Example: python3 update_psalm_in_swift.py 52 /path/to/psalm_52_verses.json")
        sys.exit(1)
    
    psalm_number = int(sys.argv[1])
    json_file_path = sys.argv[2] if len(sys.argv) > 2 else None
    
    print(f"🚀 Starting Psalm {psalm_number} integration...")
    success = update_psalm_in_swift(psalm_number, json_file_path)
    
    if success:
        print(f"\n🎉 All done! Psalm {psalm_number} is now integrated into your app!")
        print(f"💡 Next steps:")
        print(f"   1. Build and run your app in Xcode")
        print(f"   2. Navigate to Psalm {psalm_number} to see the verses")
    else:
        print(f"\n❌ Integration failed. Please check the error messages above.")
        sys.exit(1)

if __name__ == "__main__":
    main()

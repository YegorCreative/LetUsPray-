#!/usr/bin/env python3
"""
Complete Psalm Fetching and Integration Script
This script:
1. Fetches the actual Bible verses from API.Bible
2. Combines them with existing prayers (if any)
3. Integrates directly into PsalmsPrayerData.swift
No manual Xcode work required!
"""

import json
import os
import re
import sys
import requests

# Configuration
API_KEY = "f8ebd19231a1f4421038dbec20fcdc70"
BIBLE_ID = "01b29f4b342acc35-01"  # NASB 1995
SWIFT_FILE = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift'
RESOURCES_DIR = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/LetUsPray/LetUsPray/Resources/Bible/Psalms'

def fetch_psalm_verses(psalm_number):
    """Fetch psalm verses from API.Bible"""
    print(f"📡 Fetching Psalm {psalm_number} from API.Bible...")
    
    # API endpoint
    chapter_id = f"PSA.{psalm_number}"
    url = f"https://api.scripture.api.bible/v1/bibles/{BIBLE_ID}/chapters/{chapter_id}/verses"
    
    headers = {
        "api-key": API_KEY
    }
    
    params = {
        "include-chapter-numbers": "false",
        "include-verse-numbers": "false"
    }
    
    try:
        response = requests.get(url, headers=headers, params=params)
        response.raise_for_status()
        data = response.json()
        
        verses = []
        for verse_data in data.get('data', []):
            verse_id = verse_data.get('id', '')
            verse_num_match = re.search(r'PSA\.{}\.(\d+)'.format(psalm_number), verse_id)
            
            if verse_num_match:
                verse_num = int(verse_num_match.group(1))
                reference = verse_data.get('reference', f'Psalm {psalm_number}:{verse_num}')
                
                # Get verse content
                verse_url = f"https://api.scripture.api.bible/v1/bibles/{BIBLE_ID}/verses/{verse_id}"
                verse_response = requests.get(verse_url, headers=headers, params={"content-type": "text"})
                verse_response.raise_for_status()
                verse_content = verse_response.json()
                
                # Clean the text
                text = verse_content.get('data', {}).get('content', '').strip()
                text = re.sub(r'<[^>]+>', '', text)  # Remove HTML tags
                text = text.replace('\\n', '\n').strip()
                
                if text:
                    verses.append({
                        'verse': verse_num,
                        'reference': reference,
                        'text': text
                    })
        
        print(f"✅ Fetched {len(verses)} verses")
        return verses
        
    except requests.exceptions.RequestException as e:
        print(f"❌ API request failed: {e}")
        return None

def load_existing_prayers(psalm_number):
    """Load existing prayers from JSON file if it exists"""
    json_file = os.path.join(RESOURCES_DIR, f'psalm_{psalm_number}_verses.json')
    
    if os.path.exists(json_file):
        print(f"📖 Found existing prayers file: {json_file}")
        with open(json_file, 'r') as f:
            try:
                data = json.load(f)
                prayers_dict = {item['verse']: item.get('text', item.get('prayer', '')) for item in data}
                print(f"✅ Loaded {len(prayers_dict)} existing prayers")
                return prayers_dict
            except json.JSONDecodeError:
                print(f"⚠️  Could not parse existing prayers file")
    
    return {}

def generate_default_prayer(verse_text):
    """Generate a simple default prayer based on the verse"""
    # This is a fallback - ideally prayers should be pre-written
    return f"Lord, help me apply the truth of this verse to my life and walk in Your ways."

def combine_verses_and_prayers(verses, prayers_dict):
    """Combine verse texts with prayers"""
    combined = []
    
    for verse in verses:
        verse_num = verse['verse']
        verse_entry = {
            'verse': verse_num,
            'reference': verse['reference'],
            'text': verse['text'],
            'prayer': prayers_dict.get(verse_num, generate_default_prayer(verse['text']))
        }
        combined.append(verse_entry)
    
    return combined

def save_combined_json(psalm_number, combined_data):
    """Save the combined data to JSON file"""
    os.makedirs(RESOURCES_DIR, exist_ok=True)
    json_file = os.path.join(RESOURCES_DIR, f'psalm_{psalm_number}_verses.json')
    
    print(f"💾 Saving combined data to {json_file}...")
    with open(json_file, 'w') as f:
        json.dump(combined_data, f, indent=2)
    
    print(f"✅ Saved combined JSON file")
    return json_file

def find_psalm_entry(swift_content, psalm_number):
    """Find the psalm entry in the Swift file"""
    pattern = rf'PrayerDay\(\s+dayNumber: {psalm_number},\s+title: "([^"]+)",\s+chapterReference: "Psalm {psalm_number}",\s+summary: "([^"]+)",\s+verses: \[\]'
    match = re.search(pattern, swift_content, re.MULTILINE)
    return match

def generate_prayer_verses_swift(psalm_number, verses_data):
    """Generate PrayerVerse Swift code"""
    verses_code = []
    
    for verse_data in verses_data:
        verse_num = verse_data['verse']
        reference = verse_data['reference']
        text = verse_data['text']
        prayer = verse_data['prayer']
        
        # Escape special characters for Swift
        text_escaped = text.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n  ')
        prayer_escaped = prayer.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n  ')
        
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

def update_swift_file(psalm_number, verses_data):
    """Update the Swift file with the verses"""
    print(f"📖 Reading Swift file...")
    with open(SWIFT_FILE, 'r') as f:
        swift_content = f.read()
    
    # Find psalm entry
    match = find_psalm_entry(swift_content, psalm_number)
    if not match:
        print(f"❌ Could not find Psalm {psalm_number} in Swift file")
        return False
    
    print(f"✅ Found Psalm {psalm_number} entry")
    
    # Generate Swift code
    print(f"🔨 Generating Swift code...")
    verses_code = generate_prayer_verses_swift(psalm_number, verses_data)
    
    # Create replacement
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
    
    # Write back
    print(f"💾 Writing updated Swift file...")
    with open(SWIFT_FILE, 'w') as f:
        f.write(updated_content)
    
    print(f"✅ Successfully updated Swift file!")
    return True

def main():
    """Main function"""
    if len(sys.argv) < 2:
        print("Usage: python3 fetch_and_integrate_psalm.py <psalm_number>")
        print("Example: python3 fetch_and_integrate_psalm.py 52")
        sys.exit(1)
    
    psalm_number = int(sys.argv[1])
    
    print(f"🚀 Starting complete integration for Psalm {psalm_number}...\n")
    
    # Step 1: Fetch verses from API
    verses = fetch_psalm_verses(psalm_number)
    if not verses:
        print("❌ Failed to fetch verses from API")
        sys.exit(1)
    
    # Step 2: Load existing prayers
    prayers_dict = load_existing_prayers(psalm_number)
    
    # Step 3: Combine verses and prayers
    print(f"🔨 Combining verses and prayers...")
    combined_data = combine_verses_and_prayers(verses, prayers_dict)
    
    # Step 4: Save combined JSON
    json_file = save_combined_json(psalm_number, combined_data)
    
    # Step 5: Update Swift file
    success = update_swift_file(psalm_number, combined_data)
    
    if success:
        print(f"\n🎉 SUCCESS! Psalm {psalm_number} is fully integrated!")
        print(f"\n📋 Summary:")
        print(f"   ✅ Fetched {len(verses)} verses from API")
        print(f"   ✅ Combined with prayers")
        print(f"   ✅ Saved to: {json_file}")
        print(f"   ✅ Updated Swift file: {SWIFT_FILE}")
        print(f"\n💡 Next steps:")
        print(f"   1. Build and run in Xcode")
        print(f"   2. Navigate to Psalm {psalm_number}")
        print(f"\n🔁 For the next psalm, just run:")
        print(f"   python3 fetch_and_integrate_psalm.py {psalm_number + 1}")
    else:
        print(f"\n❌ Integration failed")
        sys.exit(1)

if __name__ == "__main__":
    main()

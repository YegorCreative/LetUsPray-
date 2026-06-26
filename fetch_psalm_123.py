#!/usr/bin/env python3
import json
import requests
import os

# Load API configuration
with open('APIConfig.json', 'r') as f:
    config = json.load(f)

api_key = config['apiBible']['apiKey']
bible_id = config['apiBible']['nasb1995']['bibleId']
base_url = config['apiBible']['baseURL']

headers = {
    'api-key': api_key
}

# Fetch Psalm 123 verses
verses_data = []

for verse_num in range(1, 5):  # Verses 1-4
    verse_id = f"PSA.123.{verse_num}"
    url = f"{base_url}/bibles/{bible_id}/verses/{verse_id}"
    params = {
        'content-type': 'text',
        'include-notes': 'false',
        'include-titles': 'false',
        'include-verse-numbers': 'false'
    }
    
    print(f"Fetching Psalm 123:{verse_num}...")
    response = requests.get(url, headers=headers, params=params)
    
    if response.status_code == 200:
        data = response.json()
        verse_text = data['data']['content'].strip()
        verses_data.append({
            'verse': verse_num,
            'reference': f"Psalm 123:{verse_num}",
            'text': verse_text
        })
        print(f"✓ Psalm 123:{verse_num}")
    else:
        print(f"✗ Error fetching Psalm 123:{verse_num}: {response.status_code}")
        print(f"Response: {response.text}")

# Save to JSON in proper location
output_dir = 'LetUsPray/LetUsPray/Resources/Bible/Psalms'
os.makedirs(output_dir, exist_ok=True)
output_file = os.path.join(output_dir, 'psalm_123_verses.json')

with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(verses_data, f, indent=2, ensure_ascii=False)

print(f"\n✅ Saved {len(verses_data)} verses to {output_file}")

# Print verses for verification
print("\n" + "="*80)
print("PSALM 123 VERSES (NASB1995)")
print("="*80)
for v in verses_data:
    print(f"\n{v['reference']}:")
    print(f"{v['text']}")

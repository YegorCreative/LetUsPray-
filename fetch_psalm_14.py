#!/usr/bin/env python3
import json
import urllib.request
import sys

api_key = "V2_JestO7i5GDkYeZBy52"
bible_id = "b8ee27bcd1cae43a-01"
base_url = "https://api.scripture.api.bible/v1"

verses_data = []

print("Fetching Psalm 14 verses from API Bible (NASB1995)...")
print("=" * 50)

for verse_num in range(1, 8):  # Verses 1-7
    verse_id = f"PSA.14.{verse_num}"
    url = f"{base_url}/bibles/{bible_id}/verses/{verse_id}"
    params = "?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
    full_url = url + params
    
    try:
        req = urllib.request.Request(full_url, headers={'api-key': api_key})
        with urllib.request.urlopen(req) as response:
            data = json.loads(response.read().decode())
            verse_text = data['data']['content'].strip()
            verses_data.append({
                'verse': verse_num,
                'reference': f"Psalm 14:{verse_num}",
                'text': verse_text
            })
            print(f"✓ Psalm 14:{verse_num}")
    except Exception as e:
        print(f"✗ Error fetching Psalm 14:{verse_num}: {e}", file=sys.stderr)

# Save to JSON
with open('psalm_14_verses.json', 'w', encoding='utf-8') as f:
    json.dump(verses_data, f, indent=2, ensure_ascii=False)

print(f"\n✅ Saved {len(verses_data)} verses to psalm_14_verses.json")
print("\n" + "=" * 50)
print("PSALM 14 VERSES (NASB1995)")
print("=" * 50)
for v in verses_data:
    print(f"\n{v['reference']}:")
    print(f"{v['text']}")

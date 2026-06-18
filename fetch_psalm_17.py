#!/usr/bin/env python3
import json
import requests

# API Configuration
API_KEY = "V2_JestO7i5GDkYeZBy52"
BIBLE_ID = "b8ee27bcd1cae43a-01"
BOOK_ID = "PSA"
HEADERS = {"api-key": API_KEY}

# Fetch verses 1-15
verses_data = []
for verse_num in range(1, 16):
    url = f"https://api.scripture.api.bible/v1/bibles/{BIBLE_ID}/verses/{BOOK_ID}.17.{verse_num}?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
    
    print(f"Fetching Psalm 17:{verse_num}...")
    response = requests.get(url, headers=HEADERS)
    
    if response.status_code == 200:
        data = response.json()
        verse_text = data["data"]["content"].strip()
        verses_data.append({
            "verse": verse_num,
            "reference": f"Psalm 17:{verse_num}",
            "text": verse_text
        })
        print(f"✓ Psalm 17:{verse_num} fetched")
    else:
        print(f"✗ Error fetching Psalm 17:{verse_num}: {response.status_code}")

# Save to JSON file
output_file = "/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/psalm_17_verses.json"
with open(output_file, "w") as f:
    json.dump(verses_data, f, indent=2)

print(f"\n✅ All verses saved to {output_file}")
print(f"Total verses fetched: {len(verses_data)}")

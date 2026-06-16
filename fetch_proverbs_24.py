#!/usr/bin/env python3
import json
import requests
import sys

# Load API configuration
with open('APIConfig.json', 'r') as f:
    config = json.load(f)

api_key = config['apiBible']['apiKey']
bible_id = config['apiBible']['nasb1995']['bibleId']
base_url = config['apiBible']['baseURL']

headers = {
    'api-key': api_key
}

verses_data = {}

# Fetch verses 1-34
for verse_num in range(1, 35):
    verse_id = f"PRO.24.{verse_num}"
    url = f"{base_url}/bibles/{bible_id}/verses/{verse_id}?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
    
    print(f"Fetching Proverbs 24:{verse_num}...", file=sys.stderr)
    
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        data = response.json()
        
        verse_text = data['data']['content'].strip()
        verses_data[verse_num] = verse_text
        
        print(f"✓ Proverbs 24:{verse_num}", file=sys.stderr)
        
    except requests.exceptions.RequestException as e:
        print(f"✗ Error fetching Proverbs 24:{verse_num}: {e}", file=sys.stderr)
        verses_data[verse_num] = None

# Output JSON
print(json.dumps(verses_data, indent=2))

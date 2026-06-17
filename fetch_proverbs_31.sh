#!/bin/bash

# Fetch Proverbs 31 verses from API.Bible (NASB1995)
# Bible ID: b8ee27bcd1cae43a-01

API_KEY="V2_JestO7i5GDkYeZBy52"
BIBLE_ID="b8ee27bcd1cae43a-01"
BASE_URL="https://api.scripture.api.bible/v1"

OUTPUT_FILE="proverbs_31_verses.json"

echo "{" > "$OUTPUT_FILE"
echo "  \"verses\": [" >> "$OUTPUT_FILE"

for verse in {1..31}; do
  VERSE_ID="PRO.31.$verse"
  URL="$BASE_URL/bibles/$BIBLE_ID/verses/$VERSE_ID?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
  
  echo "Fetching Proverbs 31:$verse..."
  
  RESPONSE=$(curl -s -X GET "$URL" -H "api-key: $API_KEY")
  
  CONTENT=$(echo "$RESPONSE" | python3 -c "import sys, json; data=json.load(sys.stdin); print(data.get('data', {}).get('content', '').strip())" 2>/dev/null)
  
  if [ ! -z "$CONTENT" ]; then
    echo "    {" >> "$OUTPUT_FILE"
    echo "      \"verse\": $verse," >> "$OUTPUT_FILE"
    echo "      \"reference\": \"Proverbs 31:$verse\"," >> "$OUTPUT_FILE"
    echo "      \"text\": \"$CONTENT\"" >> "$OUTPUT_FILE"
    
    if [ $verse -eq 31 ]; then
      echo "    }" >> "$OUTPUT_FILE"
    else
      echo "    }," >> "$OUTPUT_FILE"
    fi
    
    sleep 0.5
  else
    echo "Failed to fetch verse $verse"
  fi
done

echo "  ]" >> "$OUTPUT_FILE"
echo "}" >> "$OUTPUT_FILE"

echo "Done! Verses saved to $OUTPUT_FILE"

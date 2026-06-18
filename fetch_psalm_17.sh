#!/bin/bash

API_KEY="V2_JestO7i5GDkYeZBy52"
BIBLE_ID="b8ee27bcd1cae43a-01"
BOOK_ID="PSA"
OUTPUT_FILE="/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-/psalm_17_verses.json"

echo "[" > "$OUTPUT_FILE"

for i in {1..15}; do
    echo "Fetching Psalm 17:$i..."
    
    RESPONSE=$(curl -s -H "api-key: $API_KEY" \
        "https://api.scripture.api.bible/v1/bibles/$BIBLE_ID/verses/$BOOK_ID.17.$i?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false")
    
    TEXT=$(echo "$RESPONSE" | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['data']['content'].strip())" 2>/dev/null)
    
    if [ $? -eq 0 ] && [ -n "$TEXT" ]; then
        echo "  {" >> "$OUTPUT_FILE"
        echo "    \"verse\": $i," >> "$OUTPUT_FILE"
        echo "    \"reference\": \"Psalm 17:$i\"," >> "$OUTPUT_FILE"
        echo -n "    \"text\": " >> "$OUTPUT_FILE"
        echo "$TEXT" | python3 -c "import sys, json; print(json.dumps(sys.stdin.read().strip()))" >> "$OUTPUT_FILE"
        
        if [ $i -lt 15 ]; then
            echo "  }," >> "$OUTPUT_FILE"
        else
            echo "  }" >> "$OUTPUT_FILE"
        fi
        
        echo "✓ Fetched Psalm 17:$i"
    else
        echo "✗ Error fetching Psalm 17:$i"
    fi
    
    sleep 0.2
done

echo "]" >> "$OUTPUT_FILE"

echo ""
echo "✅ All verses saved to $OUTPUT_FILE"

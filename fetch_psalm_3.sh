#!/bin/bash

API_KEY="V2_JestO7i5GDkYeZBy52"
BIBLE_ID="b8ee27bcd1cae43a-01"
BASE_URL="https://api.scripture.api.bible/v1"

echo "Fetching Psalm 3 verses from API Bible (NASB1995)..."
echo "=========================================="
echo ""

# Create JSON array
echo "[" > psalm_3_verses.json

for verse in {1..8}; do
    echo "Fetching Psalm 3:$verse..."
    
    VERSE_ID="PSA.3.$verse"
    URL="$BASE_URL/bibles/$BIBLE_ID/verses/$VERSE_ID?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
    
    response=$(curl -s -H "api-key: $API_KEY" "$URL")
    
    # Extract the verse text
    verse_text=$(echo "$response" | python3 -c "import sys, json; data = json.load(sys.stdin); print(data['data']['content'].strip())" 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        echo "✓ Psalm 3:$verse"
        
        # Add comma if not the first verse
        if [ $verse -gt 1 ]; then
            echo "," >> psalm_3_verses.json
        fi
        
        # Escape the text properly for JSON
        escaped_text=$(echo "$verse_text" | python3 -c "import sys, json; print(json.dumps(sys.stdin.read().strip()))")
        
        cat >> psalm_3_verses.json << EOF
  {
    "verse": $verse,
    "reference": "Psalm 3:$verse",
    "text": $escaped_text
  }
EOF
    else
        echo "✗ Error fetching Psalm 3:$verse"
    fi
done

echo "" >> psalm_3_verses.json
echo "]" >> psalm_3_verses.json

echo ""
echo "✅ Saved verses to psalm_3_verses.json"
echo ""
echo "=========================================="
echo "PSALM 3 VERSES (NASB1995)"
echo "=========================================="
cat psalm_3_verses.json | python3 -m json.tool

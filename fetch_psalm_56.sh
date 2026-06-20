#!/bin/bash

# Read API key from config
API_KEY=$(grep -o '"apiKey": "[^"]*' APIConfig.json | cut -d'"' -f4)
BIBLE_ID="b8ee27bcd1cae43a-01"
BASE_URL="https://api.scripture.api.bible/v1"

echo "Fetching Psalm 56 verses from API Bible (NASB1995)..."
echo "=========================================="
echo ""

# Create JSON array
echo "[" > psalm_56_verses.json

# Psalm 56 has 13 verses (1-13)
for verse in {1..13}; do
    echo "Fetching Psalm 56:$verse..."
    
    VERSE_ID="PSA.56.$verse"
    URL="$BASE_URL/bibles/$BIBLE_ID/verses/$VERSE_ID?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
    
    response=$(curl -s -H "api-key: $API_KEY" "$URL")
    
    # Extract the verse text
    verse_text=$(echo "$response" | grep -o '"content":"[^"]*"' | cut -d'"' -f4 | sed 's/\\n/\\n/g')
    
    if [ ! -z "$verse_text" ]; then
        echo "✓ Psalm 56:$verse"
        
        # Add comma if not the first verse
        if [ $verse -gt 1 ]; then
            echo "," >> psalm_56_verses.json
        fi
        
        # Add verse to JSON (properly escaped)
        escaped_text=$(echo "$verse_text" | sed 's/\\/\\\\/g; s/"/\\"/g')
        echo "  {" >> psalm_56_verses.json
        echo "    \"verse\": $verse," >> psalm_56_verses.json
        echo "    \"reference\": \"Psalm 56:$verse\"," >> psalm_56_verses.json
        echo "    \"text\": \"$escaped_text\"" >> psalm_56_verses.json
        echo "  }" >> psalm_56_verses.json
    else
        echo "✗ Error fetching Psalm 56:$verse"
    fi
    
    # Small delay to be nice to the API
    sleep 0.3
done

echo "" >> psalm_56_verses.json
echo "]" >> psalm_56_verses.json

echo ""
echo "✅ Saved verses to psalm_56_verses.json"
echo ""
echo "=========================================="
echo "PSALM 56 VERSES (NASB1995)"
echo "=========================================="
cat psalm_56_verses.json | python3 -m json.tool

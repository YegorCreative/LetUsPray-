#!/bin/bash

# Read API key from config
API_KEY=$(grep -o '"apiKey": "[^"]*' APIConfig.json | cut -d'"' -f4)
BIBLE_ID="b8ee27bcd1cae43a-01"
BASE_URL="https://api.scripture.api.bible/v1"

echo "{"

for i in $(seq 1 28); do
    VERSE_ID="PRO.26.$i"
    URL="${BASE_URL}/bibles/${BIBLE_ID}/verses/${VERSE_ID}?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"
    
    echo "Fetching Proverbs 26:$i..." >&2
    
    RESPONSE=$(curl -s -H "api-key: ${API_KEY}" "${URL}")
    
    # Extract the content field from JSON response
    VERSE_TEXT=$(echo "$RESPONSE" | grep -o '"content":"[^"]*"' | cut -d'"' -f4 | sed 's/\\n/\\n/g')
    
    # Add comma if not last item
    if [ $i -lt 28 ]; then
        echo "  \"$i\": \"$VERSE_TEXT\","
    else
        echo "  \"$i\": \"$VERSE_TEXT\""
    fi
    
    echo "✓ Proverbs 26:$i" >&2
    
    # Small delay to be nice to the API
    sleep 0.3
done

echo "}"

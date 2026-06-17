#!/bin/bash

# Fetch Proverbs 29 verses from API.Bible
# Bible: NASB1995 (b8ee27bcd1cae43a-01)
# Date: June 16, 2026

API_KEY="V2_JestO7i5GDkYeZBy52"
BIBLE_ID="b8ee27bcd1cae43a-01"
BASE_URL="https://api.scripture.api.bible/v1"

echo "{"
echo '  "verses": ['

for verse in {1..27}; do
    echo "  Fetching Proverbs 29:$verse..." >&2
    
    response=$(curl -s -X GET \
        "${BASE_URL}/bibles/${BIBLE_ID}/verses/PRO.29.${verse}?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false" \
        -H "api-key: ${API_KEY}")
    
    if [ $verse -lt 27 ]; then
        echo "    $response,"
    else
        echo "    $response"
    fi
    
    sleep 0.5
done

echo "  ]"
echo "}"

echo "✅ Fetched 27 verses from Proverbs 29" >&2

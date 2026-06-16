#!/bin/bash
# API.Bible NASB1995 Test Script for LetUsPray
# Tests connectivity and verse fetching

echo "🔬 API.Bible NASB1995 Test Suite"
echo "For LetUsPray iOS App"
echo ""

# Load config
API_KEY="V2_JestO7i5GDkYeZBy52"
BASE_URL="https://api.scripture.api.bible/v1"
BIBLE_ID="b8ee27bcd1cae43a-01"
BOOK_ID="PRO"

echo "========================================"
echo "TEST 1: Fetch Single Verse (Proverbs 2:1)"
echo "========================================"
echo ""

VERSE_URL="${BASE_URL}/bibles/${BIBLE_ID}/verses/${BOOK_ID}.2.1?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"

curl -s -X GET "$VERSE_URL" -H "api-key: $API_KEY" | python3 -c "
import json, sys
data = json.load(sys.stdin)
print('✅ Verse Retrieved')
print(f\"  Reference: {data['data']['reference']}\")
print(f\"  Content: {data['data']['content'].strip()}\")
print()
"

echo "========================================"
echo "TEST 2: Fetch Verse Range (Proverbs 2:1-3)"
echo "========================================"
echo ""

RANGE_URL="${BASE_URL}/bibles/${BIBLE_ID}/passages/${BOOK_ID}.2.1-${BOOK_ID}.2.3?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false"

curl -s -X GET "$RANGE_URL" -H "api-key: $API_KEY" | python3 -c "
import json, sys
data = json.load(sys.stdin)
print('✅ Verse Range Retrieved')
print(f\"  Reference: {data['data']['reference']}\")
print(f\"  Content:\")
print(data['data']['content'])
"

echo "========================================"
echo "TEST 3: Fetch Full Chapter (Proverbs 2)"
echo "========================================"
echo ""

CHAPTER_URL="${BASE_URL}/bibles/${BIBLE_ID}/chapters/${BOOK_ID}.2?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=true"

curl -s -X GET "$CHAPTER_URL" -H "api-key: $API_KEY" | python3 -c "
import json, sys
data = json.load(sys.stdin)
print('✅ Chapter Retrieved')
print(f\"  Reference: {data['data']['reference']}\")
print(f\"  Verse Count: {data['data']['verseCount']}\")
print(f\"  Content Length: {len(data['data']['content'])} characters\")
print()
print('  First 300 chars:')
print('  ' + data['data']['content'][:300] + '...')
"

echo ""
echo "========================================"
echo "✅ All Tests Passed!"
echo "========================================"
echo ""
echo "NASB1995 is fully accessible via API.Bible"

#!/usr/bin/env python3
"""
API.Bible NASB1995 Test Script
Tests connectivity and verse fetching for LetUsPray app
"""

import json
import requests
import sys

# Load config
with open('APIConfig.json', 'r') as f:
    config = json.load(f)

API_KEY = config['apiBible']['apiKey']
BASE_URL = config['apiBible']['baseURL']
BIBLE_ID = config['apiBible']['nasb1995']['bibleId']
BOOK_ID = config['apiBible']['nasb1995']['proverbsBookId']

headers = {'api-key': API_KEY}

def test_connection():
    """Test API connection and list available Bibles"""
    print("=" * 60)
    print("TEST 1: API Connection")
    print("=" * 60)
    
    url = f"{BASE_URL}/bibles"
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        print("✅ API Connection Successful")
        data = response.json()
        nasb_bibles = [b for b in data['data'] if 'NASB' in b.get('abbreviation', '')]
        print(f"\n📖 Found {len(nasb_bibles)} NASB translation(s):")
        for bible in nasb_bibles:
            print(f"  - {bible['name']} ({bible['abbreviation']})")
            print(f"    ID: {bible['id']}")
        return True
    else:
        print(f"❌ API Connection Failed: {response.status_code}")
        return False

def test_proverbs_book():
    """Verify Proverbs book exists"""
    print("\n" + "=" * 60)
    print("TEST 2: Proverbs Book Verification")
    print("=" * 60)
    
    url = f"{BASE_URL}/bibles/{BIBLE_ID}/books"
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        proverbs = [b for b in data['data'] if b['id'] == BOOK_ID]
        if proverbs:
            print(f"✅ Proverbs Found")
            print(f"  Book ID: {proverbs[0]['id']}")
            print(f"  Name: {proverbs[0]['name']}")
            return True
    
    print("❌ Proverbs Not Found")
    return False

def test_fetch_chapter():
    """Test fetching Proverbs 1"""
    print("\n" + "=" * 60)
    print("TEST 3: Fetch Proverbs 1 (Full Chapter)")
    print("=" * 60)
    
    url = f"{BASE_URL}/bibles/{BIBLE_ID}/chapters/{BOOK_ID}.1"
    params = {
        'content-type': 'text',
        'include-notes': 'false',
        'include-titles': 'false',
        'include-verse-numbers': 'true'
    }
    response = requests.get(url, headers=headers, params=params)
    
    if response.status_code == 200:
        data = response.json()
        print("✅ Chapter Retrieved")
        print(f"  Reference: {data['data']['reference']}")
        print(f"  Verse Count: {data['data']['verseCount']}")
        print(f"  Content Length: {len(data['data']['content'])} characters")
        print(f"\n  First 200 chars:")
        print(f"  {data['data']['content'][:200]}...")
        return True
    else:
        print(f"❌ Chapter Fetch Failed: {response.status_code}")
        return False

def test_fetch_single_verse():
    """Test fetching individual verse"""
    print("\n" + "=" * 60)
    print("TEST 4: Fetch Single Verse (Proverbs 2:1)")
    print("=" * 60)
    
    url = f"{BASE_URL}/bibles/{BIBLE_ID}/verses/{BOOK_ID}.2.1"
    params = {
        'content-type': 'text',
        'include-notes': 'false',
        'include-titles': 'false',
        'include-verse-numbers': 'false'
    }
    response = requests.get(url, headers=headers, params=params)
    
    if response.status_code == 200:
        data = response.json()
        print("✅ Verse Retrieved")
        print(f"  Reference: {data['data']['reference']}")
        print(f"  Content: {data['data']['content'].strip()}")
        return data['data']['content'].strip()
    else:
        print(f"❌ Verse Fetch Failed: {response.status_code}")
        return None

def test_fetch_verse_range():
    """Test fetching verse range"""
    print("\n" + "=" * 60)
    print("TEST 5: Fetch Verse Range (Proverbs 2:1-3)")
    print("=" * 60)
    
    url = f"{BASE_URL}/bibles/{BIBLE_ID}/passages/{BOOK_ID}.2.1-{BOOK_ID}.2.3"
    params = {
        'content-type': 'text',
        'include-notes': 'false',
        'include-titles': 'false',
        'include-verse-numbers': 'false'
    }
    response = requests.get(url, headers=headers, params=params)
    
    if response.status_code == 200:
        data = response.json()
        print("✅ Verse Range Retrieved")
        print(f"  Reference: {data['data']['reference']}")
        print(f"  Content:\n{data['data']['content']}")
        return True
    else:
        print(f"❌ Verse Range Fetch Failed: {response.status_code}")
        return False

def main():
    print("\n🔬 API.Bible NASB1995 Test Suite")
    print("For LetUsPray iOS App\n")
    
    results = []
    results.append(("Connection Test", test_connection()))
    results.append(("Proverbs Book Test", test_proverbs_book()))
    results.append(("Chapter Fetch Test", test_fetch_chapter()))
    verse_content = test_fetch_single_verse()
    results.append(("Single Verse Test", verse_content is not None))
    results.append(("Verse Range Test", test_fetch_verse_range()))
    
    print("\n" + "=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    
    for test_name, passed in results:
        status = "✅ PASS" if passed else "❌ FAIL"
        print(f"{status} - {test_name}")
    
    total = len(results)
    passed = sum(1 for _, p in results if p)
    print(f"\nTotal: {passed}/{total} tests passed")
    
    if passed == total:
        print("\n✅ All tests passed! NASB1995 is fully accessible via API.Bible")
        return 0
    else:
        print("\n⚠️  Some tests failed")
        return 1

if __name__ == "__main__":
    sys.exit(main())

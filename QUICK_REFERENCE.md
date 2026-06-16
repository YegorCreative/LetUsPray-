# Quick Reference: API.Bible NASB1995 Integration

## ✅ CONFIRMED AVAILABLE

**Translation:** NASB1995 (New American Standard Bible 1995)  
**Bible ID:** `b8ee27bcd1cae43a-01`  
**Proverbs Book ID:** `PRO`

---

## 🔑 ENDPOINTS

### Single Verse (Recommended for prayers)
```
GET https://api.scripture.api.bible/v1/bibles/b8ee27bcd1cae43a-01/verses/PRO.{chapter}.{verse}
?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=false
```

**Examples:**
- Proverbs 1:1 → `PRO.1.1`
- Proverbs 2:1 → `PRO.2.1`
- Proverbs 31:10 → `PRO.31.10`

### Full Chapter
```
GET https://api.scripture.api.bible/v1/bibles/b8ee27bcd1cae43a-01/chapters/PRO.{chapter}
?content-type=text&include-notes=false&include-titles=false&include-verse-numbers=true
```

**Examples:**
- Proverbs 1 → `PRO.1`
- Proverbs 2 → `PRO.2`

### Authentication
```bash
Header: api-key: V2_JestO7i5GDkYeZBy52
```

---

## 📦 RESPONSE FORMAT

**Example Response (Proverbs 2:1):**
```json
{
  "data": {
    "id": "PRO.2.1",
    "reference": "Proverbs 2:1",
    "content": "My son, if you will receive my words\nAnd treasure my commandments within you,",
    "verseCount": 1,
    "copyright": "NEW AMERICAN STANDARD BIBLE® NASB® Copyright © 1960,1962,1963,1968,1971,1972,1973,1975,1977,1995 by The Lockman Foundation..."
  }
}
```

✅ **Full verse text included** in `content` field  
✅ **Clean text format** with `content-type=text`  
✅ **Reference included** in `reference` field

---

## 💾 CACHING RULES

✅ **Allowed:** Cache up to 500 consecutive verses  
⚠️ **Required:** Refresh cache every 30 days  
✅ **Use Case:** Perfect for all 31 Proverbs chapters (~930 verses total)

---

## 💰 LICENSING FOR APP STORE

**Required for Commercial Distribution:**
- **Plan:** Pro Plan ($29+/month)
- **License:** NASB1995 from Lockman Foundation (additional $10-50+/month)
- **Attribution:** Must display copyright in app

**Free Alternative:**
- Use Starter Plan (FREE) with public domain Bibles (KJV, ASV, BBE)
- No licensing fees for non-copyrighted translations

---

## 🚀 NEXT STEPS

1. **Decision:** Choose NASB1995 (paid) vs. public domain (free)
2. **If NASB1995:** Upgrade to Pro Plan + obtain Lockman licensing
3. **Build:** Create Swift APIService class
4. **Cache:** Implement local storage with 30-day refresh
5. **Display:** Add copyright notices to UI

---

## 🧪 TEST SCRIPT

Run the test script to verify connectivity:
```bash
./test_api_bible.sh
```

---

## 📁 CONFIG FILES

**API Configuration:** `APIConfig.json` (excluded from Git)  
**Security:** `.gitignore` configured to protect API keys

---

**Status:** ✅ API tested and working  
**Ready:** Yes - can fetch all Proverbs verses immediately  
**Blocker:** Licensing decision needed for App Store release

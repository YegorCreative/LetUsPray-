# API.Bible NASB1995 Integration Report
**Project:** LetUsPray  
**Date:** June 15, 2026  
**Purpose:** Test API.Bible connectivity for NASB1995 Scripture fetching  

---

## ✅ FINDINGS SUMMARY

### 1. NASB1995 Availability
**Status:** ✅ **CONFIRMED AVAILABLE**

- **Translation:** New American Standard Bible 1995
- **Abbreviation:** NASB1995
- **Bible ID:** `b8ee27bcd1cae43a-01`
- **Copyright:** © 1960-1995 The Lockman Foundation
- **Language:** English (eng)
- **Type:** Text

### 2. Bible ID
**Primary Identifier:** `b8ee27bcd1cae43a-01`

### 3. API Endpoints for Proverbs

#### Book ID for Proverbs
```
PRO
```

#### Endpoint Structure

**Single Verse:**
```
GET https://api.scripture.api.bible/v1/bibles/{bibleId}/verses/{bookId}.{chapter}.{verse}
```

**Example - Proverbs 2:1:**
```
GET https://api.scripture.api.bible/v1/bibles/b8ee27bcd1cae43a-01/verses/PRO.2.1
```

**Verse Range:**
```
GET https://api.scripture.api.bible/v1/bibles/{bibleId}/passages/{bookId}.{chapter}.{startVerse}-{bookId}.{chapter}.{endVerse}
```

**Example - Proverbs 2:1-3:**
```
GET https://api.scripture.api.bible/v1/bibles/b8ee27bcd1cae43a-01/passages/PRO.2.1-PRO.2.3
```

**Full Chapter:**
```
GET https://api.scripture.api.bible/v1/bibles/{bibleId}/chapters/{bookId}.{chapter}
```

**Example - Proverbs 1:**
```
GET https://api.scripture.api.bible/v1/bibles/b8ee27bcd1cae43a-01/chapters/PRO.1
```

#### All Proverbs Chapters
```
PRO.1  through  PRO.31
```

### 4. Verse Text Inclusion

**Status:** ✅ **YES - Full verse text is included**

#### Sample Response (Proverbs 2:1)
```json
{
  "data": {
    "id": "PRO.2.1",
    "reference": "Proverbs 2:1",
    "content": "My son, if you will receive my words\nAnd treasure my commandments within you,",
    "verseCount": 1
  }
}
```

#### Response Format Options

The API supports customizable response formatting via query parameters:

| Parameter | Description | Recommended Value |
|-----------|-------------|-------------------|
| `content-type` | Format: `html`, `json`, or `text` | `text` (cleanest) |
| `include-notes` | Include study notes | `false` |
| `include-titles` | Include section titles | `false` |
| `include-chapter-numbers` | Include chapter numbers | `false` |
| `include-verse-numbers` | Include verse numbers | `false` |
| `include-verse-spans` | Include verse span markers | `false` |

**Recommended Query String for Clean Text:**
```
?content-type=text&include-notes=false&include-titles=false&include-chapter-numbers=false&include-verse-numbers=false&include-verse-spans=false
```

### 5. Local Caching & Storage Permissions

**Status:** ✅ **ALLOWED WITH RESTRICTIONS**

#### Caching Rules (from API.Bible Terms of Service)
- **Maximum:** Cache up to 500 consecutive verses at a time
- **Refresh:** Must refresh cached content every 30 days
- **Purpose:** Caching allowed for performance optimization
- **Restriction:** Cannot create standalone Bible database

#### Recommendation for LetUsPray
- ✅ Cache individual Proverbs chapters (31 chapters × ~30 verses avg = ~930 verses total)
- ✅ Implement 30-day refresh mechanism
- ✅ Store verses temporarily in UserDefaults or local database
- ❌ Do NOT bundle entire NASB1995 Bible in app

### 6. Licensing Requirements for App Store

**Status:** ⚠️ **REQUIRES COMMERCIAL LICENSE**

#### Plan Tiers

| Plan | Cost | Usage | Commercial? | Rate Limit |
|------|------|-------|-------------|------------|
| **Starter** | FREE | Non-commercial only | ❌ No | 5,000 calls/month |
| **Pro** | $29+/month | Commercial permitted | ✅ Yes | 150,000 calls/month |

#### Commercial Use Requirements

For **App Store distribution** (commercial use):

1. **Required Plan:** Pro Plan ($29+/month minimum)
2. **Translation Licensing:** Additional per-Bible licensing fees
   - NASB1995 is copyrighted by The Lockman Foundation
   - Estimated: $10-50+/month per translation (varies by publisher)
3. **Attribution:** Must display copyright notice:
   ```
   NEW AMERICAN STANDARD BIBLE® NASB®
   Copyright © 1960,1962,1963,1968,1971,1972,1973,1975,1977,1995
   by The Lockman Foundation
   A Corporation Not for Profit La Habra, CA
   All Rights Reserved
   www.lockman.org
   ```

#### Free Alternatives

For no-cost development/testing:
- **Starter Plan:** Use during development with non-commercial builds
- **Public Domain Bibles:** Use translations like ASV, KJV, BBE (no licensing fees)
- **Creative Commons:** Use CC-licensed translations (varies)

---

## 🔧 TECHNICAL RECOMMENDATIONS

### Authentication
**Method:** API Key in HTTP Header

```bash
curl -H "api-key: YOUR_API_KEY_HERE" https://api.scripture.api.bible/v1/...
```

### Swift Implementation Approach

1. **Create APIService class** to handle requests
2. **Store API key** in secure location (Keychain or config file excluded from Git)
3. **Implement caching layer** with 30-day expiration
4. **Handle rate limits** (150K calls/month = ~5K/day)
5. **Display copyright notice** in app Settings and Scripture views

### Estimated Monthly Costs

**Proverbs-Only App:**
- Users: 1,000 active users
- Avg usage: 3 chapters/user/month = 3,000 chapter fetches
- API calls: ~3,000-4,000/month (well under 150K limit)
- **Cost:** $29-79/month (Pro plan + NASB licensing)

---

## 📋 NEXT STEPS

### Immediate Actions
1. ✅ API connectivity confirmed
2. ✅ Safe config files created (`APIConfig.json`)
3. ✅ `.gitignore` configured to exclude secrets
4. ⏳ **Pending:** Decide on licensing (Pro plan vs. public domain alternatives)
5. ⏳ **Pending:** Build Swift API service layer

### Development Workflow

**Option A: Use NASB1995 via API.Bible**
- Sign up for Pro Plan ($29+/month)
- Obtain Lockman Foundation licensing
- Implement API integration
- Add caching with 30-day refresh
- Display copyright notices

**Option B: Use Public Domain Translation**
- Stay on Starter Plan (FREE)
- Switch to KJV, ASV, or BBE
- No licensing fees
- Fewer restrictions
- Less modern language

### For Immediate Testing
- Current API key works for development testing
- Can fetch all Proverbs chapters (1-31)
- No code changes needed yet
- Test scripts provided: `test_api_bible.sh`

---

## 📁 FILES CREATED

| File | Purpose | Git Tracking |
|------|---------|--------------|
| `.gitignore` | Excludes secrets from Git | ✅ Track |
| `APIConfig.json` | Stores API credentials | ❌ **EXCLUDED** |
| `test_api_bible.sh` | Test script for API endpoints | ✅ Track |
| `test_api_bible.py` | Python test suite (optional) | ✅ Track |
| `API_BIBLE_REPORT.md` | This report | ✅ Track |

---

## 🔗 USEFUL LINKS

- **API Documentation:** https://scripture.api.bible/livedocs
- **API.Bible Pricing:** https://scripture.api.bible/pricing
- **Lockman Foundation:** https://www.lockman.org
- **Terms of Service:** https://api.bible/terms-and-conditions
- **Support:** https://scripture.api.bible/support

---

## ✅ CONCLUSION

**NASB1995 is fully available** via API.Bible and can be integrated into LetUsPray for premium Scripture+prayer experience. 

**Key Decision Point:** Choose between:
- **Commercial (Pro Plan):** NASB1995 with modern translation quality
- **Free (Starter Plan):** Public domain translations for no-cost distribution

All technical requirements are met. API testing successful. Ready to proceed with integration once licensing decision is made.

---

*Report generated via API testing on June 15, 2026*

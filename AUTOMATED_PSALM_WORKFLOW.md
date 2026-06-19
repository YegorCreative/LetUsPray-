# 📖 Automated Psalm Integration Workflow

## Overview
This document explains the **automated workflow** for adding new Psalm chapters to the LetUsPray app. **NO manual Xcode operations required!**

## 🎯 The Problem (Before)
- Psalm data is hardcoded in `PsalmsPrayerData.swift`
- JSON files were scattered in multiple locations
- Had to manually add files to Xcode project
- Had to manually edit Swift files

## ✅ The Solution (Now)
One simple command integrates everything automatically!

## 🚀 Quick Start

### For Any New Psalm (e.g., Psalm 52, 53, etc.):

```bash
python3 fetch_and_integrate_psalm.py 52
```

That's it! This single command will:
1. ✅ Fetch the actual Bible verses from API.Bible
2. ✅ Look for existing prayers (if you pre-wrote them)
3. ✅ Combine verses + prayers
4. ✅ Save to JSON file (for reference)
5. ✅ **Automatically update the Swift file**
6. ✅ No Xcode operations needed!

## 📁 Project Structure

```
LetUsPray/
├── LetUsPray/LetUsPray/
│   ├── Data/
│   │   └── PsalmsPrayerData.swift          ← App reads from here
│   └── Resources/Bible/Psalms/
│       ├── psalm_52_verses.json            ← Reference only (not loaded by app)
│       └── psalm_53_verses.json            
├── fetch_and_integrate_psalm.py            ← USE THIS SCRIPT
└── update_psalm_in_swift.py                ← Alternative (if JSON already complete)
```

## 🔄 Complete Workflow

### Method 1: Fully Automated (Recommended)

**Use this when you want to add a new psalm and optionally have pre-written prayers:**

```bash
# Step 1: (Optional) Create prayers file first
# File: LetUsPray/LetUsPray/Resources/Bible/Psalms/psalm_52_verses.json
[
  {
    "verse": 1,
    "reference": "Psalm 52:1",
    "text": "Your prayer here..."
  },
  ...
]

# Step 2: Run the integration script
python3 fetch_and_integrate_psalm.py 52

# Done! Build and run in Xcode
```

**What happens:**
- Script fetches actual verse text from API
- If you created prayers JSON, it uses those prayers
- If not, it generates default prayers
- Combines everything
- Updates `PsalmsPrayerData.swift` automatically
- Saves combined data to JSON for reference

### Method 2: From Complete JSON

**Use this if you already have a complete JSON file with both texts and prayers:**

```bash
python3 update_psalm_in_swift.py 52
# or
python3 update_psalm_in_swift.py 52 /path/to/psalm_52_verses.json
```

### Method 3: Batch Processing Multiple Psalms

```bash
# Add Psalms 52-60 in one go
for i in {52..60}; do
  python3 fetch_and_integrate_psalm.py $i
  sleep 1  # Be nice to the API
done
```

## 📄 JSON File Format

### Option A: Just Prayers (API will fetch verse texts)
```json
[
  {
    "verse": 1,
    "reference": "Psalm 52:1",
    "text": "Your prayer based on this verse..."
  },
  {
    "verse": 2,
    "reference": "Psalm 52:2",
    "text": "Your prayer for verse 2..."
  }
]
```

### Option B: Complete (Verse Text + Prayer)
```json
[
  {
    "verse": 1,
    "reference": "Psalm 52:1",
    "text": "Why do you boast in evil, O mighty man?...",
    "prayer": "Lord, help me never boast in wrongdoing..."
  }
]
```

## 🔧 Scripts Reference

### `fetch_and_integrate_psalm.py` (Recommended)
**Purpose:** Complete automation - fetches verses from API, combines with prayers, updates Swift

**Usage:**
```bash
python3 fetch_and_integrate_psalm.py <psalm_number>
```

**Features:**
- Fetches verse text from API.Bible
- Loads existing prayers if available
- Generates default prayers if needed
- Saves combined JSON
- Updates Swift file automatically

### `update_psalm_in_swift.py`
**Purpose:** Updates Swift from existing complete JSON file

**Usage:**
```bash
python3 update_psalm_in_swift.py <psalm_number> [json_path]
```

**Use when:**
- You already have complete JSON with texts and prayers
- You're updating an existing psalm

## 🎨 How the App Works

### Runtime Behavior:
1. App loads data from `PsalmsPrayerData.swift` (hardcoded)
2. JSON files are **NOT loaded at runtime**
3. JSON files serve as **reference/backup only**

### Data Structure in Swift:
```swift
PrayerDay(
    dayNumber: 52,
    title: "God Will Bring You Down",
    chapterReference: "Psalm 52",
    summary: "Pray for trust in God's justice.",
    verses: [
        PrayerVerse(
            id: "psalm-52-1",
            reference: "Psalm 52:1",
            text: "Bible verse text here...",
            prayer: "Prayer based on this verse..."
        ),
        // ... more verses
    ]
)
```

## ✅ Verification Checklist

After running the integration script:

1. ✅ Check console output - should say "SUCCESS!"
2. ✅ Open `PsalmsPrayerData.swift` in Xcode
3. ✅ Search for `Psalm <number>` - should see verses array populated
4. ✅ Build the project (Cmd+B) - should compile without errors
5. ✅ Run the app and navigate to the psalm - should display verses

## 🐛 Troubleshooting

### "Could not find Psalm X in Swift file"
- Check that the psalm entry exists in `PsalmsPrayerData.swift`
- The script looks for: `chapterReference: "Psalm X"`

### "API request failed"
- Check internet connection
- Verify API key is valid
- Check if API rate limit hit (wait a minute)

### "JSON file not found"
- Normal if using `fetch_and_integrate_psalm.py` - it creates the JSON
- If using `update_psalm_in_swift.py`, make sure JSON exists

### Build errors after integration
- Run `get_errors` tool to see specific issues
- Usually caused by unescaped quotes or special characters
- Re-run the script (it's idempotent)

## 📊 Progress Tracking

### Current Status:
- Psalms 1-51: ✅ Complete (have verses)
- Psalm 52: 🔄 Ready to integrate
- Psalms 53-150: 📝 Need integration

### To complete all remaining psalms:
```bash
for i in {52..150}; do
  echo "Processing Psalm $i..."
  python3 fetch_and_integrate_psalm.py $i
  sleep 2  # Rate limiting
done
```

## 🎯 Benefits of This Workflow

✅ **No manual Xcode operations** - everything automated
✅ **No manual Swift editing** - script handles it
✅ **Consistent formatting** - same structure every time
✅ **Version controlled** - JSON files backed up separately  
✅ **Idempotent** - can re-run safely if something fails
✅ **Scalable** - can batch process multiple psalms

## 📝 Notes

1. **The app does NOT load JSON files at runtime** - data is compiled into the app from the Swift file
2. **JSON files are for reference and workflow only** - they help with the integration process
3. **Always build and test after integration** - verify the psalm displays correctly
4. **Scattered JSON files in repo root can be ignored** - they're from old workflow

## 🔮 Future Improvements

- [ ] Add prayer quality checking
- [ ] Auto-generate better default prayers using AI
- [ ] Add validation for verse completeness
- [ ] Create UI tool for prayer writing
- [ ] Add undo/rollback functionality

## 📞 Support

If you encounter issues:
1. Check the console output from the script
2. Verify file paths are correct
3. Check Swift file syntax with Xcode
4. Review this documentation

---

**Last Updated:** June 19, 2026  
**Maintained by:** Yegor Hamburyan

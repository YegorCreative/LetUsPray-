# ⚡️ QUICK START: Adding Psalms to Your App

## 🎯 One Command to Rule Them All

```bash
python3 simple_integrate_psalm.py 52
```

That's it! Everything is automated. ✨

## 📋 Prerequisites

1. Create your psalm JSON file at:
   ```
   LetUsPray/LetUsPray/Resources/Bible/Psalms/psalm_XX_verses.json
   ```

2. JSON format (prayers only - verse text can be added later):
   ```json
   [
     {
       "verse": 1,
       "reference": "Psalm 52:1",
       "text": "Your prayer here..."
     },
     {
       "verse": 2,
       "reference": "Psalm 52:2",
       "text": "Your prayer here..."
     }
   ]
   ```

## 🚀 Complete Workflow

### Adding Psalm 53 (example):

```bash
# 1. Create the JSON file (use your text editor)
nano "LetUsPray/LetUsPray/Resources/Bible/Psalms/psalm_53_verses.json"

# 2. Run the integration script
python3 simple_integrate_psalm.py 53

# 3. Build and run in Xcode
# That's all!
```

## ✅ What the Script Does

1. ✅ Reads your JSON file with prayers
2. ✅ Finds Psalm entry in PsalmsPrayerData.swift  
3. ✅ Generates proper Swift code
4. ✅ Updates the Swift file automatically
5. ✅ No manual Xcode operations needed!

## 📱 The App Structure

```
App loads from: PsalmsPrayerData.swift (hardcoded)
                      ↑
                   Updates from
                      ↓ 
          simple_integrate_psalm.py
                      ↑
                   Reads from
                      ↓
          psalm_XX_verses.json (reference)
```

**Key Point:** The app does NOT load JSON files at runtime. All data is compiled into the Swift file.

## 🔥 Batch Processing

Add multiple psalms at once:

```bash
# Add Psalms 52-60
for i in {52..60}; do
  python3 simple_integrate_psalm.py $i
done
```

## ❌ Troubleshooting

### "JSON file not found"
→ Create the JSON file first in the Resources/Bible/Psalms directory

### "Could not find Psalm X entry"  
→ The psalm must already exist as a placeholder in PsalmsPrayerData.swift

### Build errors in Xcode
→ Rare, but if it happens, check for unescaped quotes in your JSON prayers

## 📊 Current Status (as of June 19, 2026)

- ✅ Psalm 52: **INTEGRATED!** (9 verses + closing prayer)
- 📝 Psalms 53-150: Ready to integrate (run the script for each)

## 💡 Pro Tips

1. **Write better prayers**: The JSON file is where you craft your prayers. Take time to make them meaningful.

2. **Add verse text later**: The script marks verse text as `[Psalm X:Y - verse text to be added]` as a placeholder. You can add actual Bible verses later.

3. **Batch process**: Once you have multiple JSON files, batch process them all at once.

4. **No Xcode needed**: You never need to drag files into Xcode or manually edit the Swift file.

## 🎉 Success Indicators

After running the script, you should see:
```
🚀 Integrating Psalm 52...
✅ Found 9 verses
✅ Found Psalm 52 entry
🔨 Generating Swift code...
💾 Writing updated Swift file...
✅ Successfully integrated Psalm 52!
```

Then in Xcode:
- Build succeeds (Cmd+B)
- Run the app
- Navigate to Psalm 52
- See your verses and prayers!

---

**Last Updated:** June 19, 2026  
**Script:** `simple_integrate_psalm.py`  
**Status:** ✅ Tested and working!

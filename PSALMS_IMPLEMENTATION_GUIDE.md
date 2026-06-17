# Psalms Implementation Guide - 150 Days

## ✅ What's Been Done

1. **Created `PsalmsPrayerData.swift`** - Complete structure for all 150 Psalms
2. **Updated duration** from 21 days to **150 days**
3. **Updated description** to reflect "all 150 Psalms" instead of "selected Psalms"
4. **Organized by Books**:
   - Book I: Psalms 1-41 (Days 1-41)
   - Book II: Psalms 42-72 (Days 42-72)
   - Book III: Psalms 73-89 (Days 73-89)
   - Book IV: Psalms 90-106 (Days 90-106)
   - Book V: Psalms 107-150 (Days 107-150)

## 📝 Adding Prayers to Each Psalm

Each Psalm day is ready for you to add prayers. Here's the structure:

```swift
PrayerDay(
    dayNumber: 1,
    title: "Blessed is the One",
    chapterReference: "Psalm 1",
    summary: "Pray for delight in God's Word and fruitfulness in life.",
    verses: [
        // Add PrayerVerse entries here
        PrayerVerse(
            id: "psalm-1-1",
            reference: "Psalm 1:1",
            text: "Blessed is the man who does not walk in the counsel of the wicked...",
            prayer: "Lord, help me find my delight in Your Word and turn away from ungodly counsel."
        ),
        // ... more verses
    ]
)
```

## 🎯 Example: Adding Prayers to Psalm 1

To add prayers to a specific Psalm, locate it in `PsalmsPrayerData.swift` and fill in the `verses` array:

```swift
PrayerDay(
    dayNumber: 1,
    title: "Blessed is the One",
    chapterReference: "Psalm 1",
    summary: "Pray for delight in God's Word and fruitfulness in life.",
    verses: [
        PrayerVerse(
            id: "psalm-1-1",
            reference: "Psalm 1:1-2",
            text: "Blessed is the man who does not walk in the counsel of the wicked\n  or stand in the way of sinners\n  or sit in the seat of mockers.\n  But his delight is in the law of the Lord,\n  and on his law he meditates day and night.",
            prayer: "Lord, guard my steps from ungodly influences. Help me find true joy in Your Word and meditate on it continually."
        ),
        PrayerVerse(
            id: "psalm-1-3",
            reference: "Psalm 1:3",
            text: "He is like a tree planted by streams of water,\n  which yields its fruit in season\n  and whose leaf does not wither.\n  Whatever he does prospers.",
            prayer: "Jesus, root me deeply in You. Make me fruitful and flourishing in every season of life."
        ),
        PrayerVerse(
            id: "psalm-1-4-6",
            reference: "Psalm 1:4-6",
            text: "Not so the wicked!\n  They are like chaff that the wind blows away.\n  Therefore the wicked will not stand in the judgment,\n  nor sinners in the assembly of the righteous.\n  For the Lord watches over the way of the righteous,\n  but the way of the wicked will perish.",
            prayer: "Father, keep me on the path of righteousness. Thank You for Your watchful care over my life."
        ),
        PrayerVerse(
            id: "psalm-1-closing",
            reference: "Closing",
            text: "In Jesus' name, Amen. 🙏🏻",
            prayer: "In Jesus' name, Amen. 🙏🏻"
        )
    ]
)
```

## 📖 All 150 Psalms Ready for Content

The structure includes:
- ✅ All 150 Psalm days with meaningful titles
- ✅ Chapter references (Psalm 1 - Psalm 150)
- ✅ Summary descriptions for each Psalm's theme
- ✅ Empty `verses` arrays ready for your prayers
- ✅ Organized by the traditional five books of Psalms

## 🚀 Next Steps

1. **Start with popular Psalms** (Psalm 1, 23, 51, 91, 103, 121, 139, etc.)
2. **Use the same format** as Proverbs:
   - `id`: "psalm-X-Y" (psalm number, verse/section number)
   - `reference`: "Psalm X:Y" or "Psalm X:Y-Z"
   - `text`: The actual verse from NASB1995 or your preferred translation
   - `prayer`: Verse-specific prayer application
   - Always include a closing prayer with id ending in "-closing"

3. **Build gradually**:
   - Phase 1: Add prayers to Psalms 1-50
   - Phase 2: Add prayers to Psalms 51-100
   - Phase 3: Add prayers to Psalms 101-150

## 🎨 Special Psalm Themes to Consider

- **Praise Psalms**: 8, 19, 29, 33, 100, 103, 104, 145-150
- **Lament Psalms**: 3, 6, 13, 22, 42-43, 88, 130
- **Thanksgiving Psalms**: 30, 65, 75, 116, 138
- **Wisdom Psalms**: 1, 37, 49, 73, 112, 127, 128
- **Trust Psalms**: 23, 27, 46, 62, 91, 121
- **Penitential Psalms**: 6, 32, 38, 51, 102, 130, 143
- **Royal/Messianic Psalms**: 2, 45, 72, 89, 110

## 💡 Tips for Writing Psalm Prayers

1. **Match the tone**: Psalms express raw emotion - your prayers should too
2. **Use inclusive language**: "Let us..." when appropriate
3. **Apply personally**: "Help me..." and "Teach me..."
4. **Reflect the Psalm's journey**: From lament to praise, doubt to trust
5. **Keep it conversational**: Pray as you would speak to God

---

**Ready to begin!** The structure is complete and waiting for your prayers. Each Psalm is a unique opportunity to guide users into deeper conversation with God through Scripture.

# Swift Array Templates - Copy & Use

**Use these verified templates when generating Swift arrays**

---

## Template 1: Simple Array

```swift
let arrayName: [Type] = [
    element1,
    element2,
    element3,
]
```

**Note:** Trailing comma after last element is OPTIONAL but RECOMMENDED.

---

## Template 2: Complex Object Array (like PrayerDay)

```swift
let arrayName: [ObjectType] = [
    ObjectType(
        property1: value1,
        property2: value2,
        property3: value3
    ),  // ← COMMA REQUIRED
    ObjectType(
        property1: value1,
        property2: value2,
        property3: value3
    ),  // ← COMMA REQUIRED
    ObjectType(
        property1: value1,
        property2: value2,
        property3: value3
    ),  // ← Optional trailing comma
]
```

---

## Template 3: PrayerDay Specific

```swift
let psalmsArray: [PrayerDay] = [
    PrayerDay(
        dayNumber: 1,
        psalm: "Psalm 1",
        title: "Title Here",
        verseText: """
        Verse text here
        """,
        prayer: """
        Prayer text here
        """,
        reflection: "Reflection here"
    ),  // ✅ COMMA AFTER CLOSING PARENTHESIS
    PrayerDay(
        dayNumber: 2,
        psalm: "Psalm 2",
        title: "Title Here",
        verseText: """
        Verse text here
        """,
        prayer: """
        Prayer text here
        """,
        reflection: "Reflection here"
    ),  // ✅ COMMA AFTER CLOSING PARENTHESIS
]
```

---

## Template 4: Adding to Existing Array

When adding a NEW element to an existing array:

**Step 1:** Find the LAST element (currently without comma or with trailing comma)

**Step 2:** Ensure it has a comma

**Step 3:** Add your new element

```swift
// BEFORE (last element):
    PrayerDay(
        ...
    )  // ← No comma or has comma
]

// AFTER (adding new element):
    PrayerDay(
        ...
    ),  // ← Ensure comma is here
    PrayerDay(  // ← New element
        ...
    ),  // ← Add comma for consistency
]
```

---

## Common Mistakes to Avoid

### ❌ WRONG: Missing comma
```swift
let array = [
    Object1()
    Object2()  // Build error!
]
```

### ✅ CORRECT: Comma present
```swift
let array = [
    Object1(),
    Object2()
]
```

---

### ❌ WRONG: Comma before closing parenthesis
```swift
let array = [
    Object(
        prop: value,  // This comma is for properties
    ,)  // ❌ WRONG position
]
```

### ✅ CORRECT: Comma after closing parenthesis
```swift
let array = [
    Object(
        prop: value
    ),  // ✅ CORRECT position
]
```

---

## Copy-Paste Generation Pattern

For generating multiple similar elements:

1. **Copy the template**
2. **Verify commas are in template**
3. **Paste N times**
4. **Modify values**
5. **Visual scan: every element has comma**
6. **Build to confirm**

---

## Verification Regex Patterns

Search for these patterns to find missing commas:

**Pattern 1:** Closing paren followed by word
```regex
\)\s+\w+Day\(
```
If found → Missing comma!

**Pattern 2:** Closing paren at EOL followed by new PrayerDay
```regex
\)\s*\n\s*PrayerDay\(
```
If found → Missing comma!

---

## Quick Reference Card

```
📝 REMEMBER:

Swift Array = [element1, element2, element3]
                      ↑        ↑
                   COMMA    COMMA

Multi-line:
[
    Element(...)  ,  ← COMMA HERE
    Element(...)  ,  ← COMMA HERE  
    Element(...)     ← Optional
]
```

---

**Always use these templates as starting points to ensure correct syntax from the beginning.**

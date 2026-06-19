# AI Coding - One-Page Reference Card 📄

**Print this. Keep it visible. Reference it often.**

---

## ⚠️ THE #1 RULE

### Swift Arrays Need Commas Between Elements

```swift
// ❌ WRONG
let array = [Element1() Element2()]

// ✅ RIGHT  
let array = [Element1(), Element2()]
```

**Multi-line:**
```swift
let array = [
    Element1(),  ← Comma AFTER closing )
    Element2(),  ← Comma AFTER closing )
]
```

---

## ⚡ Quick Checklist

Before saying "Done":

- [ ] All array elements have commas (except last)
- [ ] Code builds without errors
- [ ] Syntax verified visually
- [ ] No red flags present

---

## 🚩 Red Flags

STOP if you see:
- "Expected ',' separator"
- Build fails after code generation
- `)` followed by element name (no comma)
- AI says "Done" without verification

---

## ✅ Verification Statement

AI must say:
> "✅ Verified syntax and build successful"

NOT:
> "Done!" or "Should work!"

---

## 📝 Templates

**Simple Array:**
```swift
[item1, item2, item3]
```

**Complex Array:**
```swift
[
    Object(prop: val),
    Object(prop: val),
]
```

**PrayerDay:**
```swift
[
    PrayerDay(...),  ← Comma!
    PrayerDay(...),  ← Comma!
]
```

---

## 🔄 Workflow

```
1. Generate code
   ↓
2. Check commas
   ↓
3. Build to verify
   ↓
4. Fix if needed
   ↓
5. THEN complete
```

**Never skip steps 2-4!**

---

## 📚 Full Docs

- **AI_WORKFLOW_INDEX.md** - Start here
- **AI_QUICK_CHECKLIST.md** - Full checklist
- **SWIFT_ARRAY_TEMPLATES.md** - More templates
- **AI_SESSION_PROMPT.md** - Session setup

---

## 💡 Remember

> "If it's an array, check the commas."

**Simple. Essential. Non-negotiable.**

---

## 🎯 Success Formula

```
Templates + Verification + Build = Quality Code
```

---

**🔖 Bookmark AI_WORKFLOW_INDEX.md for complete documentation**

---

*v1.0 | June 19, 2026 | LetUsPray Project*

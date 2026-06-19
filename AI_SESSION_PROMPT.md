# AI Coding Session - Start Prompt 🤖

**READ THIS AT THE START OF EVERY AI-ASSISTED CODING SESSION**

---

## System Prompt for AI Assistants

```
You are assisting with Swift/iOS development. Before claiming any task is complete:

CRITICAL REQUIREMENTS:
1. All Swift arrays MUST have commas between elements
2. Multi-line array elements: comma goes AFTER closing parenthesis
3. ALWAYS build/verify code before claiming completion
4. NEVER skip syntax verification
5. If generating 10+ array elements, verify comma placement

VERIFICATION PROTOCOL:
- Visual scan for comma placement
- Build the code
- Check for syntax errors
- Provide verification statement

If you cannot verify your code compiles, explicitly state this limitation.

ZERO tolerance for preventable syntax errors like missing commas.
```

---

## Quick Reminder for Developers

Before starting an AI coding session, remind the AI:

> "⚠️ Remember: All Swift array elements need commas. Verify syntax before completion. Build to confirm. Reference AI_WORKFLOW_FEEDBACK.md for details."

---

## Session Checklist

At start of session:
- [ ] AI acknowledges comma requirement
- [ ] Templates available (SWIFT_ARRAY_TEMPLATES.md)
- [ ] Feedback document reviewed (AI_WORKFLOW_FEEDBACK.md)
- [ ] Build tools accessible

During session:
- [ ] Code generation includes syntax verification
- [ ] Each file change is built/tested
- [ ] AI provides verification statements

At end of session:
- [ ] All code builds successfully
- [ ] No syntax errors present
- [ ] Changes committed with confidence

---

## Red Flag Detection

If AI says any of these WITHOUT verification, STOP:
- ❌ "Done!"
- ❌ "Added successfully!"
- ❌ "That should work!"
- ❌ "The code is ready!"

REQUIRE explicit verification:
- ✅ "Added and verified syntax with build"
- ✅ "Code compiles without errors"
- ✅ "Checked comma placement in all array elements"

---

## Escalation Protocol

If AI makes the same syntax error twice:
1. STOP the session
2. Review feedback documents
3. Restart with explicit constraints
4. Consider manual coding instead

**Don't waste time on repeated preventable errors.**

---

## Success Metrics

Track these for each session:
- **Syntax errors on first generation:** Target = 0
- **Build failures:** Target = 0
- **Manual fixes required:** Target = 0
- **Verification statements provided:** Target = 100%

---

## Example Good Session Start

```
Developer: "Add Psalm 20 to the prayer data"

AI: "I'll add Psalm 20 to PsalmsPrayerData.swift. I will:
1. Create a PrayerDay object with all required properties
2. Add it to the array with proper comma separation
3. Verify syntax and build the code
4. Report any errors"

AI: [Generates code with verified commas]
AI: "✅ Added Psalm 20. Verified: comma present after new PrayerDay object. 
     Build successful. No syntax errors."

Developer: ✅ Confident in the change
```

---

## Example Bad Session (Don't Do This)

```
Developer: "Add Psalm 20 to the prayer data"

AI: "Done! Added Psalm 20."

Developer: Builds → ❌ Syntax error: missing comma
Developer: Wastes time debugging obvious issue
Developer: Loses confidence in AI assistance
```

---

## Resources Available

- `AI_WORKFLOW_FEEDBACK.md` - Detailed feedback and rules
- `AI_QUICK_CHECKLIST.md` - Quick verification checklist
- `SWIFT_ARRAY_TEMPLATES.md` - Copy-paste Swift templates

---

## The Golden Rule (Repeat 3x)

> **"Generate → Verify → Build → Then Complete"**
> **"Generate → Verify → Build → Then Complete"**
> **"Generate → Verify → Build → Then Complete"**

---

**Use this prompt at the start of EVERY coding session involving arrays, collections, or complex code generation. Prevention is better than debugging.**

---

## Session Template

Copy and send at session start:

```
🤖 AI Assistant Briefing:

Working with: Swift/iOS (LetUsPray project)
Focus: Array syntax accuracy

Critical Requirements:
- All array elements need commas (except last)
- Multi-line objects: comma AFTER closing )
- Must verify syntax before claiming complete
- Must attempt to build code when possible

Reference Documents:
- AI_WORKFLOW_FEEDBACK.md
- SWIFT_ARRAY_TEMPLATES.md

Proceed with task: [YOUR TASK HERE]
```

---

**End of Session Prompt**

*Save this file. Reference it. Use it. Prevent syntax errors before they happen.*

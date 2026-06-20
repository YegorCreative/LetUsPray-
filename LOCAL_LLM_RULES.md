LETUSPRAY LOCAL LLM MASTER GUARDRAILS

PROJECT: LetUsPray

You are operating inside a local repository through Codex CLI, Ollama, or another local coding agent.

Your job is to complete the requested task and nothing else.

⸻

PRIMARY RULES

* Do not audit the project.
* Do not inspect unrelated files.
* Do not redesign architecture.
* Do not refactor unrelated code.
* Do not rename files.
* Do not move files.
* Do not add dependencies.
* Do not introduce new patterns.
* Follow the existing project architecture exactly.

Always follow the pattern used by the most recently completed Psalm.

⸻

TASK SCOPE RULE

When updating a Psalm:

Update ONLY the requested Psalm.

Do not modify:

* Previous Psalms
* Future Psalms
* Unrelated Swift files
* Unrelated resources
* Unrelated models
* Unrelated UI

Read only the minimum files required.

⸻

DATA LOCATION RULE

Never guess where Psalm data belongs.

Before editing:

1. Find the pattern used by the previous completed Psalm.
2. Determine exactly where:
    * JSON verse content is stored
    * Prayer content is stored
    * Day definitions are stored
    * IDs are stored

Update those exact locations only.

Do not:

* Create duplicate data
* Create alternate implementations
* Create temporary solutions
* Leave disconnected data

⸻

PSALM RESOURCE RULE

This project uses Xcode synchronized folders.

Psalm JSON files belong in:

LetUsPray/LetUsPray/Resources/Bible/Psalms/

Do not:

* Tell the user to drag files into Xcode
* Tell the user to add files to targets
* Tell the user to modify Build Phases
* Leave manual Xcode resource steps

Verify inclusion automatically.

Expected report:

Xcode Resource Inclusion Verified: Yes

Remaining Manual Steps: None

⸻

NO MANUAL XCODE WORK

If project configuration must be verified:

Inspect only:

LetUsPray.xcodeproj/project.pbxproj

Determine how existing Psalm files are included.

If synchronized folders are used:

Report:

Xcode Resource Inclusion Verified: Yes

Do not leave manual work.

⸻

NO BACKUP FILE RULE

Do not create:

* *.backup
* *.bak
* *.old
* Temporary copies

Use git for recovery.

Create backup files only if explicitly requested.

⸻

FILE MODIFICATION RULE

Never claim a file was modified unless verification proves it.

Required verification:

* git diff
    OR
* Search output showing the new content exists

If verification fails:

* Report failure
* Continue fixing
* Do not mark task complete

⸻

COMPLETION RULE

Do not report success until ALL required updates are complete.

A Psalm task is complete only when:

1. Psalm JSON exists.
2. Psalm prayer data exists.
3. Psalm day definition exists.
4. No placeholder content remains.
5. No empty verse arrays remain.
6. Resource inclusion is verified.
7. Verification proves file changes occurred.

⸻

EDITING RULE

Avoid multiline sed replacements.

Prefer:

* Direct file editing
* Python scripts
* Targeted replacements

Do not use fragile commands that can silently fail.

⸻

VERIFICATION RULE

After every Psalm:

Verify:

1. JSON file exists.
2. Psalm entry exists in PsalmsPrayerData.swift.
3. No empty verses arrays remain.
4. Verse count is correct.
5. git diff confirms changes.

Required commands:

git diff

and

grep/search verification for the Psalm being updated.

⸻

REPORT RULE

Final report must contain:

Files Read:

Files Modified:

Changes Made:

Verification Performed:

Xcode Resource Inclusion Verified:
Yes / No

Build Status:

Remaining Manual Steps:
None

⸻

FAILURE RULE

If something fails:

Do not claim success.

Explain:

* What failed
* Why it failed
* What still needs to be fixed

Continue working until the requested task is actually complete.

⸻

LETUSPRAY PSALM RULE

For every Psalm:

Create:

LetUsPray/LetUsPray/Resources/Bible/Psalms/psalm__verses.json

Update:

LetUsPray/LetUsPray/Data/PsalmsPrayerData.swift

Follow the exact structure used by the previous completed Psalm.

Do not create additional files.

Do not redesign the data model.

Do not leave manual steps.

Task completion requires:

* JSON created
* Swift updated
* Verification completed
* Remaining Manual Steps = None

# LetUsPray — Community & Spiritual Growth Platform Architecture

**Status:** Planning only. No code written. Not started.
**Source:** `LPOS/LetUsPray_Growth_Platform_OS.pdf`
**Purpose:** Architectural blueprint for evolving LetUsPray from a guided prayer app into a full spiritual growth platform, to be broken into implementation phases later.

---

## 0. Grounding in the Existing Application

Before proposing anything new, here is what already exists and what each new module should build on rather than duplicate:

| New module (from vision doc) | Existing equivalent | Verdict |
|---|---|---|
| Faith Milestones | `Models/Achievement.swift` — `Achievement`, `AchievementID`, `AchievementProgress`, plus `Services/AchievementService.swift` | **Extend, don't replace.** Already has id/title/description/icon/unlock date/progress. Missing: category, associated Bible verse, and IDs for community-linked milestones (those need Community to exist first). |
| Personal Prayer Journal | `PrayerJournalEntry` (in `ViewModels/PrayerPlanViewModel.swift`) — `prayerText`/`reflectionText`, keyed per plan+day, stored via `PrayerStorageKeys.prayerJournalEntries` | **Extend, don't replace.** Currently only exists *attached to a specific verse/day*. Needs a second, standalone entry type (freeform, dated, with mood/tags) alongside the existing per-verse one. |
| Faith Profile → prayer streak | `Models/PrayerStreak.swift`, `Services/StreakService.swift` | Reuse directly. |
| Faith Profile → journeys completed / scriptures read | `PrayerPlanProgress`, `analytics.completedDaysByPlan` | Reuse directly. |
| Prayer Wall, Answered Prayers, Testimonies, Community Feed, Church Communities, Encouragement | Nothing exists | **Genuinely new.** See §6 — these require a backend that does not exist today. |

Everything below is written with this distinction in mind: **local-only extensions** (can build entirely on today's `UserDefaults` + `AppStorage` pattern) vs. **networked/social features** (cannot — see the scalability section for why, and what's needed first).

---

## 1. Information Architecture

The vision doc proposes a 5-area IA: **Home / Prayer / Community / Growth / Profile.** Today's app is 5 tabs: **Today / Plans / Saved / Search / Settings.**

**Navigation/tab-bar changes are TBD** — not decided here. What follows is a description of feature groupings and how the new capabilities conceptually relate to what exists today, not a proposed tab structure.

| Conceptual area (vision doc) | New capabilities it contains | Closest existing surface today |
|---|---|---|
| Home | Continue Journey, Prayer Calendar, Discover Next (all exist) + Prayer Wall preview, Featured Testimony, Faith Milestone highlight (new) | `TodayView` |
| Prayer | Journeys, Calendar (both exist) + Journal (currently exists only as fields attached to a verse, not its own destination) | `PlansView` / `PrayerCollectionsView` |
| Community | Prayer Wall, Answered Prayers, Testimonies, Churches, Groups — entirely new | No current equivalent |
| Growth | Faith Milestones (extends `Achievement`), Insights (exists as `PrayerInsightsView`), Statistics | Currently split across the Today stats row and Settings |
| Profile | Saved (exists), Activity, Milestones, Testimonies, Settings | `SavedView` / `SettingsView` |
| Search | Journey/content search (exists) | `SearchView` |

Whether this becomes additional tabs, a restructure of the existing five, or something else (e.g., `.searchable()` folded into other areas instead of its own tab) is an open navigation decision, not addressed by this document. It should be made and approved on its own before any implementation phase begins.

---

## 2. Navigation

Given `ContentView.swift`'s current structure (a single `TabView` with 5 `NavigationStack`s, each independently owning its own push stack), each new area follows the same pattern already established:

- **Community tab** — own `NavigationStack`. Root: `CommunityFeedView` (Prayer Wall + Answered Prayers + Testimonies interleaved, matching "Community Feed" from the vision doc). Pushes: `PrayerRequestDetailView`, `TestimonyDetailView`, `ChurchDetailView`, `GroupDetailView`, `NewPrayerRequestView` / `NewTestimonyView` (presented as sheets, matching the existing pattern of `JourneyFilterSheet` being sheet-presented rather than pushed).
- **Growth tab** — own `NavigationStack`. Root: `FaithMilestonesView` (extends today's presumed `AchievementsView`). Pushes into `PrayerInsightsView` (already exists, would move here from being reachable via the Today stats row) and a new `FaithProfileView`.
- **Profile tab** — merges `SavedView` (exists) with a new profile summary and `SettingsView` (exists) as a push destination rather than the tab root.
- Deep-linkable content (a shared prayer request, a testimony) should use the same `NavigationPath`/`.navigationDestination(item:)` pattern already used for `selectedTodayDay` / `selectedHomePlan` in `ContentView.swift` — no new navigation paradigm needed.

---

## 3. Data Model (high-level — no code)

All new models follow the existing project convention: a plain `Identifiable`/`Codable` struct per concept, no ORM, no inheritance hierarchies.

### 3.1 User
Today's app has **no user/account concept at all** — everything is anonymous, on-device, per-installation. Every social feature requires this to exist first.
- id (stable, server-assigned)
- displayName
- avatar (optional)
- isAnonymousByDefault (a per-user preference, distinct from per-post anonymity)
- churchMemberships: [ChurchMembership]
- faithProfile: FaithProfile (see below)

### 3.2 FaithMilestone (extends existing `Achievement`)
- id, title, description, systemImage *(all exist today)*
- **+ category** (Prayer, Journey, Community, Scripture, Testimony)
- **+ scriptureReference** (an associated verse — reuses the existing `PrayerVerse`-style reference/text pair, doesn't need a new verse model)
- unlockDate *(exists today)*
- progress: current/target (extends existing `AchievementProgress`)

### 3.3 PrayerRequest
- id, authorID (nullable if anonymous), text, category
- visibility: Public / Church / Group / Anonymous *(see §5)*
- prayerCount (count of "🙏 I Prayed" reactions)
- createdDate
- status: Open / Answered
- linkedAnsweredPrayer: AnsweredPrayer? (nil until marked answered)

### 3.4 AnsweredPrayer
- id, linkedPrayerRequestID (the full timeline: request → prayed-for → answered, as the vision doc specifies)
- testimonyText
- answeredDate
- visibility (inherits from the original request by default, can be widened, never narrowed silently)

### 3.5 Testimony
- id, authorID (nullable if anonymous), title, story, scriptureReference
- media: [MediaAsset] (optional — images only for V1, matches "images optional" from the vision doc, no video scope creep)
- category, visibility, createdDate

### 3.6 JournalEntry (new, standalone — alongside the existing per-verse `PrayerJournalEntry`)
- id, date, prayerText, reflectionText, scriptureReference (optional), mood (enum, small fixed set), tags: [String]
- Always private — journal entries are never part of any visibility model in §5.

### 3.7 FaithProfile
- Composed, not stored — a read-only aggregation view over: `PrayerStreak` (exists), completed journeys (exists), scriptures read (derivable from existing `completedDaysByPlan`), unlocked `FaithMilestone`s, authored `Testimony` count, `AnsweredPrayer` count.
- This mirrors how `PrayerInsights` already works today (`PrayerInsightsService.make(...)` composes existing data rather than storing a duplicate copy) — same pattern, not a new one.

### 3.8 ChurchCommunity / Group
- id, name, type (Church / Small Group / Ministry / Family), description, coverImage
- members: [User] (via membership records, not embedded)
- own PrayerRequest feed, own Testimony feed (both filtered views over 3.3/3.5, not separate storage)
- groupPrayerStatistics: aggregated count of prayers offered by members (a read-only rollup, same "compose, don't duplicate" principle as FaithProfile)

### 3.9 Reaction (Encouragement)
- id, targetID (a PrayerRequest, AnsweredPrayer, or Testimony), userID, kind: iPrayed / amen / praiseGod
- One reaction per (user, target, kind) — explicitly *not* a generic "like," matching "encourage, never gamify."

---

## 4. Relationships

```
User ──authors──> PrayerRequest ──1:1 (once answered)──> AnsweredPrayer
User ──authors──> Testimony
User ──belongs to──> ChurchMembership ──> ChurchCommunity / Group
User ──earns──> FaithMilestone (via progress against PrayerStreak, journeys, Testimony/PrayerRequest counts)
User ──writes──> JournalEntry (private, no relationship to Community objects)
User ──reacts──> Reaction ──targets──> PrayerRequest | AnsweredPrayer | Testimony
ChurchCommunity ──has many──> PrayerRequest, Testimony (via visibility scoping, not ownership — a request is still owned by its User)
PrayerJourney (existing) ──unrelated to Community──  (a journey's prayer content stays fully local/offline; only *completion events* feed FaithMilestone progress)
```

Key relationship principle: **Community objects reference Users and each other; they never reference `PrayerJourney`/`PrayerPlan` content directly.** The existing prayer-journey catalog stays a closed, local, content-owned system (per the standing rule that engineering and content are separate) — Community only observes *events* from it (a journey was completed, a streak hit 7 days), never its text.

---

## 5. Permissions

| Visibility | Who sees it | Applies to |
|---|---|---|
| **Public** | Any user of the app | PrayerRequest, Testimony, AnsweredPrayer |
| **Church** | Members of the author's church only | PrayerRequest, Testimony |
| **Group** | Members of a specific small group/ministry/family group only | PrayerRequest, Testimony |
| **Friends** | Mutuals only (requires a follow/friend model not otherwise in this doc — flagged as **undecided**, see below) | Optional future scope |
| **Anonymous** | A *per-post* flag, orthogonal to the above — content is visible per its Public/Church/Group scope, but author identity is hidden | PrayerRequest, Testimony |
| **Private** | Author only | JournalEntry always; PrayerRequest/Testimony can be saved as a draft in this state before publishing |

**Undecided, needs a product decision before Phase 1 of Community:** does V1 need a "Friends" graph at all, or is Church/Group membership sufficient for V1's social scope? Recommend deferring Friends entirely — Church + Group covers the vision doc's stated scope without needing to design a follow/friend system now.

---

## 6. Future Scalability — Capability Requirements

**Authentication provider, backend/data platform, and sync technology are all TBD** — this section describes what capabilities Community features require, not which technology provides them. Implementation technology will be selected separately.

**Today, LetUsPray has zero networking, zero authentication, and zero server-side storage.** Every existing model persists as JSON inside `UserDefaults` on a single device (`PrayerStorageCodec` + `PrayerStorageKeys`, used throughout `ContentView.swift`). This has worked because prayer journeys, streaks, and journal entries are fundamentally single-user, single-device concepts.

**Prayer Wall, Community Feed, Church Communities, and Encouragement reactions cannot work this way** — by definition, they require one user's action (a prayer request) to be visible to other users, on other devices, in close to real time. That requires, as capabilities (not products):

1. **Identity** — some way to distinguish one user from another, stable across their devices.
2. **Shared, networked storage** — a store reachable by more than one device/user, replacing the current single-device `UserDefaults` model for Community objects specifically (local-only models like `PrayerStreak` and journeys are unaffected).
3. **Sync/query** — a way for the app to read and write that shared store, including scoped queries matching the Public/Church/Group/Anonymous/Private visibility model in §5.
4. **Cross-platform reach** — whatever is chosen needs to serve iPhone, iPadOS, and macOS from one implementation, per the project's stated reusability goal.

Selecting the specific authentication provider and backend platform that satisfy these four capabilities is a separate decision, to be made when implementation begins — not part of this architecture document.

---

## 7. UI Flow

**Praying for someone (core loop):**
Community tab → Prayer Wall → tap a request → read it → tap "🙏 I Prayed" → prayerCount increments, reaction recorded → (optionally) tap through to the author's other public requests.

**Sharing a prayer request:**
Community tab → "+" → choose Public/Church/Group/Anonymous → write request → category → submit → appears in the relevant feed(s) immediately.

**A prayer gets answered:**
Author returns to their own request (via Profile → Activity, or the original feed post) → "Mark as Answered" → prompted to add a testimony (optional but encouraged, matching the vision doc's "Prayer Request → People Prayed → Prayer Answered" timeline) → becomes an `AnsweredPrayer`, visible per its inherited visibility.

**Faith Milestones (mostly passive):**
Milestones unlock automatically from existing app events (a streak hits 7 days, a journey completes, a testimony is posted) — surfaced via a non-intrusive moment (matches the existing `PrayerDetailView` completion-celebration pattern), then browsable anytime via Growth tab → Faith Milestones.

**Journal (private, unchanged in spirit from today):**
Prayer tab → Journal → either continue the existing per-verse journal entries (during a prayer session, as today) or start a new standalone dated entry with mood/tags — both live side by side, neither replaces the other.

**Church Communities (onboarding-adjacent):**
Community tab → Churches/Groups → join or create → once joined, that group's Prayer Wall and Testimonies become visible in a "Church" filter on the main Community feed, and the group's aggregate prayer statistics appear in its detail view.

---

## Suggested Phasing (for later approval — not started, not scheduled)

1. **Phase 1 — Foundation:** Authentication (provider TBD) + backend schema (platform TBD) + FaithMilestone extension (local-only, no networking needed) + standalone Journal entries (local-only). Ships value with zero social surface area yet.
2. **Phase 2 — Personal-to-Community bridge:** PrayerRequest + AnsweredPrayer + Reactions, Public/Private visibility only (no Church/Group yet).
3. **Phase 3 — Testimonies + Community Feed** (aggregates Phase 2 content + Testimonies).
4. **Phase 4 — Church Communities:** Church/Group model, membership, scoped visibility, group statistics.
5. **Phase 5 — Faith Profile + Growth tab consolidation**, tying together Insights (exists) + Milestones (extended) + community activity into one profile surface.

Each phase is independently shippable and doesn't require the ones after it — Phase 1 alone is a complete, useful release even if Community never ships.

---

# Non-Negotiable Product Principles

This section defines permanent product rules that every future Community feature must follow. These are architectural principles, not implementation details.

- Prayer is always the primary purpose of LetUsPray.
- Scripture always takes precedence over community content.
- Community exists to support spiritual growth, never replace personal prayer.
- LetUsPray never uses "Likes."
- Community interactions are faith-centered:
  - 🙏 I Prayed
  - ❤️ Amen
  - 🙌 Praise God
- Avoid engagement-driven mechanics such as:
  - follower counts
  - popularity rankings
  - trending feeds
  - endless scrolling
  - vanity metrics
- Privacy is the default.
- Sharing is always intentional.
- Every feature must support iPhone first while naturally scaling to iPadOS and macOS.
- Accessibility is a first-class requirement.
- The design language remains calm, distraction-free, elegant, and Apple-quality.
- Features should encourage believers to pray more, trust God more, and grow spiritually.
- Technology decisions must never compromise the mission of the application.

This section is the permanent foundation for every future Community feature.

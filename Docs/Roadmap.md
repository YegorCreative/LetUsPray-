# LetUsPray Roadmap

## Phase X — Design System Refresh

**Status:** Planned

### Purpose

Refine LetUsPray's visual design system to achieve a calmer, more elegant Apple-inspired appearance while preserving the existing architecture.

### Goals

- Refactor `BrandGradients.swift`
- Replace bold multi-color gradients with extremely subtle monochromatic gradients
- Update reusable design tokens
- Standardize gradient usage throughout the application
- Improve visual consistency across iPhone, iPadOS, and macOS
- Preserve existing layouts and architecture
- Validate accessibility after the redesign

### Design Philosophy

Minimal gradients.
Maximum elegance.

Users should notice the content before they notice the interface.

## Community Platform

**Status:** Architecture locked — see [CommunityPlatform-Architecture.md](CommunityPlatform-Architecture.md). Implementation not yet started.

### Approved implementation order

1. Faith Milestones
2. Prayer Wall
3. Answered Prayers
4. Testimonies
5. Personal Prayer Journal
6. Faith Profile
7. Community Feed
8. Church Communities

### Purpose

Expand LetUsPray from a guided prayer application into a complete Christian spiritual growth platform — Faith Milestones, Prayer Wall, Answered Prayers, Testimonies, Personal Prayer Journal (standalone), Faith Profile, Community Feed, Church Communities, and faith-centered Encouragement reactions — while keeping Scripture and prayer at the center of the app.

### Key open decisions (all TBD, to be selected separately)

- Authentication provider: **TBD**
- Backend/data platform: **TBD**
- Navigation/tab-bar changes: **TBD**

Capability requirements (identity, shared storage, sync, scoped visibility) are described in the architecture doc's §1 and §6. No implementation technology has been selected.

### Suggested sub-phases

1. Foundation — authentication + backend schema (both TBD) + local-only Faith Milestone/Journal extensions
2. Personal-to-Community bridge — Prayer Wall, Answered Prayers, Reactions (Public/Private only)
3. Testimonies + Community Feed
4. Church Communities (membership, scoped visibility, group statistics)
5. Faith Profile + Growth area consolidation

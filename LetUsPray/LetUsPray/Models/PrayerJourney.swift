import Foundation

struct PrayerJourneyPlatformMetadata: Hashable, Codable {
    let platformVersion: String
    let schemaVersion: Int
    let modelVersion: Int
    let migrationVersion: Int
    let documentationVersion: String
    let apiCompatibilityVersion: String
    let minimumSupportedAppVersion: String
}

enum PrayerJourneyDeveloperDocumentation {
    static let metadata = PrayerJourneyPlatformMetadata(platformVersion: "1.0", schemaVersion: 1, modelVersion: 1, migrationVersion: 1, documentationVersion: "1.0", apiCompatibilityVersion: "1.x", minimumSupportedAppVersion: "1.0")
    static let architectureOverview = "Catalog metadata drives collections, authoring, localization, assets, QA, release, and publishing without duplicating prayer content."
    static let dataModelSummary = "PrayerJourney composes PrayerPlan content with immutable catalog metadata and derived progress."
    static let schemaSummary = "Versioned metadata supports workflow, localization, assets, QA, release, and publishing lifecycles."
}

enum PrayerJourneyContentState: String, CaseIterable, Codable, Hashable {
    case available = "Available"
    case comingSoon = "Coming Soon"
    case inDevelopment = "In Development"
    case seasonal = "Seasonal"
    case locked = "Locked"
}

enum PrayerJourneyReviewStatus: String, CaseIterable, Codable, Hashable {
    case notStarted = "Not Started"
    case inReview = "In Review"
    case approved = "Approved"
}

enum PrayerJourneyWorkflowStage: String, CaseIterable, Codable, Hashable {
    case idea = "Idea"
    case planning = "Planning"
    case writing = "Writing"
    case scriptureReview = "Scripture Review"
    case theologyReview = "Theology Review"
    case editorialReview = "Editorial Review"
    case artwork = "Artwork"
    case readyForQA = "Ready for QA"
    case qaApproved = "QA Approved"
    case readyForRelease = "Ready for Release"
    case released = "Released"
    case archived = "Archived"

    var order: Int { Self.allCases.firstIndex(of: self) ?? 0 }
}

enum PrayerJourneyTranslationStatus: String, CaseIterable, Codable, Hashable {
    case notStarted = "Not Started"
    case inTranslation = "In Translation"
    case underReview = "Under Review"
    case readyForQA = "Ready for QA"
    case published = "Published"
}

enum PrayerJourneyAssetStatus: String, CaseIterable, Codable, Hashable {
    case missing = "Missing"
    case placeholder = "Placeholder"
    case inDesign = "In Design"
    case underReview = "Under Review"
    case approved = "Approved"
    case published = "Published"
    case archived = "Archived"
}

enum PrayerJourneyQAStatus: String, CaseIterable, Codable, Hashable {
    case notStarted = "Not Started"
    case inProgress = "In Progress"
    case readyForReview = "Ready for Review"
    case approved = "Approved"
    case failed = "Failed"
    case blocked = "Blocked"
}

enum PrayerJourneyReleaseChannel: String, CaseIterable, Codable, Hashable {
    case development = "Development"
    case beta = "Beta"
    case releaseCandidate = "RC"
    case production = "Production"
}

enum PrayerJourneyReleaseStatus: String, CaseIterable, Codable, Hashable {
    case planned = "Planned"
    case scheduled = "Scheduled"
    case releaseCandidate = "In Release Candidate"
    case released = "Released"
    case hotfix = "Hotfix"
    case deprecated = "Deprecated"
    case archived = "Archived"
}

enum PrayerJourneyMilestone: String, CaseIterable, Codable, Hashable {
    case version1 = "Version 1.0"
    case version11 = "Version 1.1"
    case version2 = "Version 2.0"
    case future = "Future"
}

enum PrayerJourneyPublishingState: String, CaseIterable, Codable, Hashable {
    case draft = "Draft"
    case readyForImport = "Ready for Import"
    case imported = "Imported"
    case readyToPublish = "Ready to Publish"
    case published = "Published"
    case rolledBack = "Rolled Back"
    case archived = "Archived"
}

struct PrayerJourneyPublicationMetadata: Hashable, Codable {
    let state: PrayerJourneyPublishingState
    let publishedVersion: String?
    let draftVersion: String?
    let publishedDate: String?
    let publishedBy: String?
    let importSource: String?
    let importChecksum: String?
    let contentIntegrityStatus: String
    let publicationHistory: [String]
    let rollbackVersion: String?
}

struct PrayerJourneyReleaseMetadata: Hashable, Codable {
    let releaseID: String
    let version: String
    let name: String
    let channel: PrayerJourneyReleaseChannel
    let milestone: PrayerJourneyMilestone
    let targetDate: String?
    let actualDate: String?
    let owner: String
    let releaseNotes: String?
    let rollbackVersion: String?
    let status: PrayerJourneyReleaseStatus
}

enum PrayerJourneyQACategory: String, CaseIterable, Codable, Hashable {
    case metadata = "Metadata Validation"
    case scripture = "Scripture Validation"
    case prayer = "Prayer Validation"
    case navigation = "Navigation Validation"
    case accessibility = "Accessibility Validation"
    case localization = "Localization Validation"
    case assets = "Asset Validation"
    case performance = "Performance Validation"
    case visual = "Visual Validation"
}

struct PrayerJourneyQAMetadata: Hashable, Codable {
    let status: PrayerJourneyQAStatus
    let owner: String
    let startedDate: String?
    let completedDate: String?
    let approvalDate: String?
    let releaseBlocker: Bool
    let criticalIssues: Int
    let majorIssues: Int
    let minorIssues: Int
    let knownIssues: String?
    let notes: String?
    let completedCategories: Set<PrayerJourneyQACategory>
}

struct PrayerJourneyAssetMetadata: Identifiable, Hashable, Codable {
    let id: String
    let kind: String
    let reference: String?
    let darkModeReference: String?
    let lightModeReference: String?
    let localizedReferences: [String: String]
    let version: Int
    let author: String
    let status: PrayerJourneyAssetStatus
    let updatedDate: String
}

struct PrayerJourneyLocalizationMetadata: Identifiable, Hashable, Codable {
    let id: String
    let languageCode: String
    let localizedTitle: String
    let localizedSubtitle: String
    let localizedDescription: String
    let localizedHeroImageName: String?
    let localizedCollectionTitle: String?
    let status: PrayerJourneyTranslationStatus
    let completionPercentage: Int
    let translator: String
    let reviewer: String
    let lastUpdated: String
    let publishedVersion: String?
}

enum PrayerJourneyDifficulty: String, Codable, CaseIterable, Hashable {
    case gentle = "Gentle"
    case steady = "Steady"
    case deep = "Deep"
}

struct PrayerJourneyMetadata: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let collection: PrayerCollectionID
    let category: String
    let estimatedDurationDays: Int
    let estimatedPrayerMinutes: Int
    let difficulty: PrayerJourneyDifficulty
    let heroImageName: String
    let accentColorName: String
    let isFeatured: Bool
    let isRecommended: Bool
    let isSeasonal: Bool
    let isPremiumReady: Bool
    let sortOrder: Int
    let planID: String?
    let contentState: PrayerJourneyContentState
    let version: Int
    let contentCompletionPercentage: Int
    let lastUpdated: String
    let author: String
    let estimatedRelease: String?
    let featuredPriority: Int
    let launchPriority: Int
    let reviewer: String
    let reviewStatus: PrayerJourneyReviewStatus
    let createdDate: String
    let updatedDate: String
    let publishDate: String?
    let estimatedCompletion: String?
    let requiredSessionCount: Int
    let requiredPrayerCount: Int
    let requiredScriptureCount: Int
    let workflowStage: PrayerJourneyWorkflowStage
    let previousWorkflowStage: PrayerJourneyWorkflowStage?
    let assignedAuthor: String
    let assignedReviewer: String
    let assignedEditor: String
    let stageCompletionDate: String?
    let qaApprovalDate: String?
    let releaseVersion: String?
    let releaseNotes: String?
    let blockingIssuesCount: Int
    let reviewComments: String?
    let sourceLanguage: String
    let supportedLanguages: [String]
    let localizations: [PrayerJourneyLocalizationMetadata]
    let assets: [PrayerJourneyAssetMetadata]
    let qa: PrayerJourneyQAMetadata
    let release: PrayerJourneyReleaseMetadata?
    let publication: PrayerJourneyPublicationMetadata
}

struct PrayerJourneyProgressRecord: Codable, Hashable {
    var currentSession: Int
    var lastOpenedDate: Date?
    var lastCompletedDate: Date?
}

enum PrayerJourneyProgressStore {
    static func record(for planID: String) -> PrayerJourneyProgressRecord? {
        records()[planID]
    }

    static func markOpened(planID: String, session: Int) {
        var all = records()
        var record = all[planID] ?? PrayerJourneyProgressRecord(currentSession: session, lastOpenedDate: nil, lastCompletedDate: nil)
        record.currentSession = max(session, 1)
        record.lastOpenedDate = Date()
        all[planID] = record
        save(all)
    }

    static func markCompleted(planID: String, session: Int) {
        var all = records()
        var record = all[planID] ?? PrayerJourneyProgressRecord(currentSession: session, lastOpenedDate: nil, lastCompletedDate: nil)
        record.currentSession = max(session, 1)
        record.lastCompletedDate = Date()
        all[planID] = record
        save(all)
    }

    static func restart(planID: String) {
        var all = records()
        all[planID] = PrayerJourneyProgressRecord(currentSession: 1, lastOpenedDate: Date(), lastCompletedDate: nil)
        save(all)
    }

    private static func records() -> [String: PrayerJourneyProgressRecord] {
        let rawValue = UserDefaults.standard.string(forKey: PrayerStorageKeys.journeyProgress) ?? "{}"
        guard let data = rawValue.data(using: .utf8),
              let decoded = try? JSONDecoder().decode([String: PrayerJourneyProgressRecord].self, from: data) else {
            return [:]
        }
        return decoded
    }

    private static func save(_ records: [String: PrayerJourneyProgressRecord]) {
        guard let data = try? JSONEncoder().encode(records),
              let rawValue = String(data: data, encoding: .utf8) else { return }
        UserDefaults.standard.set(rawValue, forKey: PrayerStorageKeys.journeyProgress)
    }
}

/// Presentation metadata for a journey. Prayer text remains owned by `PrayerPlan`.
struct PrayerJourney: Identifiable, Hashable {
    let plan: PrayerPlan
    let metadata: PrayerJourneyMetadata

    var id: String { metadata.id }
    var title: String { metadata.title }
    var subtitle: String { metadata.subtitle }
    var description: String { metadata.description }
    var category: PrayerPlanCategory { plan.category }
    var categoryName: String { metadata.category }
    var collection: PrayerCollectionID { metadata.collection }
    var heroImageName: String { metadata.heroImageName }
    var estimatedPrayerMinutes: Int { metadata.estimatedPrayerMinutes }
    var difficulty: PrayerJourneyDifficulty { metadata.difficulty }
    var isFeatured: Bool { metadata.isFeatured }
    var isRecommended: Bool { metadata.isRecommended }
    var isSeasonal: Bool { metadata.isSeasonal }
    var isPremiumReady: Bool { metadata.isPremiumReady }
    var sortOrder: Int { metadata.sortOrder }
    var accentColorName: String { metadata.accentColorName }
    var sessionCount: Int { plan.days.isEmpty ? metadata.estimatedDurationDays : plan.days.count }
    var estimatedDurationDays: Int { metadata.estimatedDurationDays }
    var contentState: PrayerJourneyContentState { metadata.contentState }
    var isLaunchReady: Bool { contentState == .available || contentState == .seasonal }

    /// Progress is derived from the user's existing completion store, never duplicated in catalog data.
    func progress(completedSessionNumbers: Set<Int>) -> PrayerPlanProgress {
        PrayerPlanProgress(
            completedDays: completedSessionNumbers.intersection(Set(plan.days.map(\.dayNumber))).count,
            totalDays: sessionCount
        )
    }
}

struct JourneyCollection: Identifiable, Hashable {
    let id: PrayerCollectionID
    let title: String
    let description: String
    let iconName: String
    let sortOrder: Int
}

enum PrayerCollectionID: String, Codable, CaseIterable, Hashable, Identifiable {
    case scripture
    case family
    case church
    case missions
    case healing
    case christianLiving = "christian-living"
    case life
    case seasonal
    case devotionals
    case personal

    var id: Self { self }

    var title: String {
        switch self {
        case .scripture: "Scripture"
        case .family: "Family & Relationships"
        case .church: "Church"
        case .missions: "Missions"
        case .healing: "Healing"
        case .christianLiving: "Christian Living"
        case .life: "Life"
        case .seasonal: "Seasonal"
        case .devotionals: "Devotionals"
        case .personal: "Personal"
        }
    }

    var iconName: String {
        switch self {
        case .scripture: "book.closed.fill"
        case .family: "figure.2.and.child.holdinghands"
        case .church: "building.columns.fill"
        case .missions: "globe.americas.fill"
        case .healing: "heart.text.square.fill"
        case .christianLiving: "leaf.fill"
        case .life: "sun.max.fill"
        case .seasonal: "calendar"
        case .devotionals: "sparkles"
        case .personal: "person.crop.circle.fill"
        }
    }
}

enum PrayerJourneyCatalog {
    static let platform = PrayerJourneyDeveloperDocumentation.metadata
    static let collections: [JourneyCollection] = [
        .init(id: .scripture, title: "Scripture", description: "Pray through the words and stories that shape faith.", iconName: "book.closed.fill", sortOrder: 0),
        .init(id: .family, title: "Family & Relationships", description: "Bring the people you love into a quieter rhythm of prayer.", iconName: "figure.2.and.child.holdinghands", sortOrder: 1),
        .init(id: .church, title: "Church", description: "Pray for the people and communities serving together.", iconName: "building.columns.fill", sortOrder: 2),
        .init(id: .missions, title: "Missions", description: "Pray for God's work in your community and around the world.", iconName: "globe.americas.fill", sortOrder: 3),
        .init(id: .healing, title: "Healing", description: "Make room for honest prayer, comfort, and restoration.", iconName: "heart.text.square.fill", sortOrder: 4),
        .init(id: .christianLiving, title: "Christian Living", description: "Grow in the everyday practices of a faithful life.", iconName: "leaf.fill", sortOrder: 5),
        .init(id: .life, title: "Life", description: "Pray through the places, work, and responsibilities of life.", iconName: "sun.max.fill", sortOrder: 6),
        .init(id: .seasonal, title: "Seasonal", description: "Journeys for the changing seasons of the church year.", iconName: "calendar", sortOrder: 7),
        .init(id: .devotionals, title: "Devotionals", description: "Thoughtful, focused journeys for a season of growth.", iconName: "sparkles", sortOrder: 8),
        .init(id: .personal, title: "Personal", description: "Keep space for the prayers closest to your own story.", iconName: "person.crop.circle.fill", sortOrder: 9)
    ]

    static func collectionID(for plan: PrayerPlan) -> PrayerCollectionID {
        switch plan.category {
        case .psalms, .wisdom, .gospel: .scripture
        case .family: .family
        case .gratitude: .devotionals
        case .encouragement: .healing
        }
    }

    static func journeys(in collection: PrayerCollectionID, plans: [PrayerPlan]) -> [PrayerJourney] {
        let plansByID = Dictionary(uniqueKeysWithValues: plans.map { ($0.id, $0) })
        return metadata
            .filter { $0.collection == collection }
            .map { entry in
                PrayerJourney(
                    plan: plansByID[entry.planID ?? ""] ?? placeholderPlan(for: entry),
                    metadata: entry
                )
            }
            .sorted { $0.sortOrder == $1.sortOrder ? $0.title < $1.title : $0.sortOrder < $1.sortOrder }
    }

    struct ValidationReport: Hashable {
        let duplicateIDs: [String]
        let duplicateTitles: [String]
        let missingCollections: [String]
        let invalidSortOrders: [String]
        let incompleteMetadata: [String]
        let missingArtwork: [String]
        let missingRequirements: [String]
        let invalidWorkflowTransitions: [String]
        let missingWorkflowMetadata: [String]
        let localizationIssues: [String]
        let assetIssues: [String]
        let qaIssues: [String]
        let releaseIssues: [String]
        let publicationIssues: [String]
        let documentationIssues: [String]
        let platformIssues: [String]

        var isValid: Bool {
            duplicateIDs.isEmpty && duplicateTitles.isEmpty && missingCollections.isEmpty && invalidSortOrders.isEmpty && incompleteMetadata.isEmpty && missingArtwork.isEmpty && missingRequirements.isEmpty && invalidWorkflowTransitions.isEmpty && missingWorkflowMetadata.isEmpty && localizationIssues.isEmpty && assetIssues.isEmpty && qaIssues.isEmpty && releaseIssues.isEmpty && publicationIssues.isEmpty && documentationIssues.isEmpty && platformIssues.isEmpty
        }
    }

    static var validationReport: ValidationReport {
        let ids = Dictionary(grouping: metadata, by: \.id).filter { $0.value.count > 1 }.map(\.key).sorted()
        let titles = Dictionary(grouping: metadata, by: { $0.title.lowercased() }).filter { $0.value.count > 1 }.map { $0.value[0].title }.sorted()
        let collectionValues = Set(PrayerCollectionID.allCases)
        let missingCollections = metadata.filter { !collectionValues.contains($0.collection) }.map(\.id).sorted()
        let invalidSortOrders = metadata.filter { $0.sortOrder < 0 }.map(\.id).sorted()
        let incompleteMetadata = metadata.filter {
            $0.id.isEmpty || $0.title.isEmpty || $0.category.isEmpty || $0.heroImageName.isEmpty || $0.accentColorName.isEmpty || $0.version < 1
        }.map(\.id).sorted()
        let missingArtwork = metadata.filter { $0.heroImageName.isEmpty || $0.accentColorName.isEmpty }.map(\.id).sorted()
        let missingRequirements = metadata.filter {
            $0.requiredSessionCount < 0 || $0.requiredPrayerCount < 0 || $0.requiredScriptureCount < 0
        }.map(\.id).sorted()
        let invalidWorkflowTransitions = metadata.filter {
            guard let previous = $0.previousWorkflowStage else { return false }
            return $0.workflowStage.order < previous.order && $0.workflowStage != .archived
        }.map(\.id).sorted()
        let missingWorkflowMetadata = metadata.filter {
            switch $0.workflowStage {
            case .readyForQA, .qaApproved, .readyForRelease, .released:
                return $0.assignedAuthor.isEmpty || $0.assignedReviewer.isEmpty || $0.releaseVersion == nil
            default:
                return false
            }
        }.map(\.id).sorted()
        let localizationIssues = metadata.filter { item in
            let codes = item.localizations.map(\.languageCode)
            let duplicateCodes = Set(codes).count != codes.count
            let validCodes = codes.allSatisfy { code in
                code.range(of: "^[a-z]{2,3}(-[A-Z]{2})?$", options: .regularExpression) != nil
            }
            let sourceMissing = !codes.contains(item.sourceLanguage)
            let publishedIncomplete = item.localizations.contains {
                $0.status == .published && ($0.completionPercentage < 100 || $0.localizedTitle.isEmpty || $0.localizedSubtitle.isEmpty || $0.localizedDescription.isEmpty || $0.publishedVersion == nil)
            }
            return duplicateCodes || !validCodes || sourceMissing || publishedIncomplete || item.supportedLanguages.isEmpty
        }.map(\.id).sorted()
        let assetIssues = metadata.filter { item in
            let assets = item.assets
            let ids = assets.map(\.id)
            let duplicateIDs = Set(ids).count != ids.count
            let validAssets = assets.allSatisfy { asset in
                !asset.id.isEmpty && (asset.reference != nil || asset.status == .missing || asset.status == .placeholder) && asset.version > 0
            }
            let missingVariants = assets.contains { asset in
                asset.status == .published && (asset.darkModeReference == nil || asset.lightModeReference == nil)
            }
            let missingLocalized = item.localizations.contains { localization in
                localization.status == .published && assets.contains { $0.localizedReferences[localization.languageCode] == nil }
            }
            return assets.isEmpty || duplicateIDs || !validAssets || missingVariants || missingLocalized
        }.map(\.id).sorted()
        let qaIssues = metadata.filter { item in
            let qa = item.qa
            let released = item.workflowStage == .released || item.contentState == .available
            let incompleteCategories = qa.completedCategories.count != PrayerJourneyQACategory.allCases.count
            return qa.owner.isEmpty || qa.releaseBlocker || qa.criticalIssues > 0 || (released && (qa.status != .approved || qa.approvalDate == nil || incompleteCategories)) || (qa.status == .failed && released)
        }.map(\.id).sorted()
        let releaseIDs = metadata.compactMap { $0.release?.releaseID }
        let duplicateReleaseIDs = Set(releaseIDs).count != releaseIDs.count
        let releaseIssues = metadata.filter { item in
            guard let release = item.release else { return false }
            let isReleased = release.status == .released || release.status == .hotfix
            let assetsApproved = item.assets.allSatisfy { $0.status == .approved || $0.status == .published }
            let localizationReady = item.localizations.allSatisfy { $0.status == .published && $0.completionPercentage >= 100 }
            let workflowReady = item.workflowStage == .released || item.workflowStage == .readyForRelease
            return release.releaseID.isEmpty || release.version.isEmpty || release.owner.isEmpty || (isReleased && (item.qa.status != .approved || item.qa.approvalDate == nil || !assetsApproved || !localizationReady || !workflowReady))
        }.map(\.id).sorted() + (duplicateReleaseIDs ? ["duplicate-release-id"] : [])
        let publicationIDs = metadata.compactMap { $0.publication.publishedVersion == nil ? nil : $0.id }
        let duplicatePublicationIDs = Set(publicationIDs).count != publicationIDs.count
        let publicationIssues = metadata.filter { item in
            let publication = item.publication
            let published = publication.state == .published
            let contentExists = item.planID == nil || item.planID == "psalms-journey-overview" || item.requiredPrayerCount > 0 || item.requiredSessionCount == 0
            let referencesReady = item.localizations.allSatisfy { $0.status == .published }
            let assetsReady = item.assets.allSatisfy { $0.status == .approved || $0.status == .published }
            let approved = item.qa.status == .approved && item.release?.status == .released
            return publication.contentIntegrityStatus.isEmpty || (published && (publication.publishedVersion == nil || publication.publishedBy == nil || publication.importChecksum == nil || !contentExists || !referencesReady || !assetsReady || !approved))
        }.map(\.id) + (duplicatePublicationIDs ? ["duplicate-publication-id"] : [])
        let platform = PrayerJourneyDeveloperDocumentation.metadata
        let documentationIssues: [String] = [
            platform.platformVersion.isEmpty ? "platform-version" : nil,
            platform.schemaVersion < 1 ? "schema-version" : nil,
            platform.modelVersion < 1 ? "model-version" : nil,
            platform.migrationVersion < 1 ? "migration-version" : nil,
            platform.documentationVersion.isEmpty ? "documentation-version" : nil,
            platform.minimumSupportedAppVersion.isEmpty ? "minimum-app-version" : nil
        ].compactMap { $0 }
        let platformIssues = metadata.flatMap { item -> [String] in
            var issues: [String] = []
            if item.id.range(of: "^[a-z0-9]+(?:-[a-z0-9]+)*$", options: .regularExpression) == nil { issues.append("\(item.id):invalid-id") }
            if !PrayerCollectionID.allCases.contains(item.collection) { issues.append("\(item.id):invalid-collection") }
            if item.category.isEmpty || item.difficulty.rawValue.isEmpty || item.estimatedDurationDays < 0 || item.estimatedPrayerMinutes <= 0 { issues.append("\(item.id):incomplete-core-metadata") }
            if item.assets.contains(where: { $0.reference == nil && $0.status != .missing && $0.status != .placeholder }) { issues.append("\(item.id):invalid-asset-reference") }
            if item.localizations.contains(where: { !item.supportedLanguages.contains($0.languageCode) }) { issues.append("\(item.id):invalid-localization-reference") }
            if let release = item.release, release.releaseID.isEmpty || release.version.isEmpty { issues.append("\(item.id):invalid-release-reference") }
            return issues
        }.sorted()
        return ValidationReport(duplicateIDs: ids, duplicateTitles: titles, missingCollections: missingCollections, invalidSortOrders: invalidSortOrders, incompleteMetadata: incompleteMetadata, missingArtwork: missingArtwork, missingRequirements: missingRequirements, invalidWorkflowTransitions: invalidWorkflowTransitions, missingWorkflowMetadata: missingWorkflowMetadata, localizationIssues: localizationIssues, assetIssues: assetIssues, qaIssues: qaIssues, releaseIssues: releaseIssues, publicationIssues: publicationIssues.sorted(), documentationIssues: documentationIssues, platformIssues: platformIssues)
    }

    static func platformIntegrityReport(plans: [PrayerPlan]) -> [String] {
        let planIDs = Set(plans.map(\.id))
        return metadata.compactMap { item in
            guard let planID = item.planID, !planIDs.contains(planID), planID != "psalms-journey-overview" else { return nil }
            return "\(item.id):orphaned-plan-reference"
        }.sorted()
    }

    static func journey(for plan: PrayerPlan) -> PrayerJourney {
        let entry = metadata.first(where: { $0.planID == plan.id })
            ?? metadataEntry(for: plan)
        return PrayerJourney(plan: plan, metadata: entry)
    }

    static let metadata: [PrayerJourneyMetadata] = [
        entry("proverbs", "Proverbs", "A daily rhythm of wisdom", .scripture, "Scripture", 31, 8, .steady, "book.closed.fill", "wisdom", true, true, false, "proverbs-journey"),
        entry("psalms", "Psalms", "A journey through songs of the soul", .scripture, "Scripture", 150, 10, .gentle, "music.note.list", "psalms", true, false, false, "psalms-journey-overview"),
        entry("song-of-songs", "Song of Songs", "Pray through love, beauty, and devotion", .scripture, "Scripture", 14, 8, .deep, "heart.fill", "gospel", false, false, false),
        entry("prayers-of-jesus", "Prayers of Jesus", "Learn from the prayers of Christ", .scripture, "Scripture", 21, 8, .deep, "cross.fill", "gospel", false, false, false),
        entry("lords-prayer", "Lord's Prayer", "A simple pattern for a faithful life", .scripture, "Scripture", 7, 6, .gentle, "hands.sparkles.fill", "gratitude", false, true, false),
        entry("biblical-prayers", "Biblical Prayers", "Pray with the people of Scripture", .scripture, "Scripture", 30, 9, .steady, "scroll.fill", "wisdom", false, false, false),
        entry("prayer-through-the-gospels", "Prayer Through the Gospels", "Meet Jesus in the Gospel story", .scripture, "Scripture", 40, 10, .steady, "sparkles.tv", "gospel", true, false, false, "gospel-of-john"),

        entry("pray-for-your-family", "Pray for Your Family", "Hold your family in steady prayer", .family, "Family & Relationships", 14, 7, .gentle, "figure.2.and.child.holdinghands", "family", false, false, false),
        entry("pray-for-your-marriage", "Pray for Your Marriage", "Pray for a covenant of patience and love", .family, "Family & Relationships", 21, 8, .steady, "heart.fill", "family", false, false, false),
        entry("pray-for-your-children", "Pray for Your Children", "Entrust each season of parenting to God", .family, "Family & Relationships", 14, 7, .gentle, "figure.2.and.child.holdinghands", "family", false, false, false),
        entry("pray-for-your-parents", "Pray for Your Parents", "Give thanks and care through prayer", .family, "Family & Relationships", 14, 7, .gentle, "figure.2.fill", "family", false, false, false),
        entry("pray-for-friendships", "Pray for Friendships", "Nurture friendship with grace and gratitude", .family, "Family & Relationships", 10, 7, .gentle, "person.2.fill", "family", false, false, false),

        entry("pray-for-your-pastor", "Pray for Your Pastor", "Support faithful leaders in prayer", .church, "Church", 14, 7, .gentle, "building.columns.fill", "gospel", false, false, false),
        entry("pray-for-church-leaders", "Pray for Church Leaders", "Pray for wisdom, humility, and courage", .church, "Church", 14, 7, .steady, "person.3.fill", "gospel", false, false, false),
        entry("pray-for-your-church", "Pray for Your Church", "Pray for a healthy and welcoming church", .church, "Church", 21, 8, .steady, "building.2.fill", "gospel", false, false, false),
        entry("pray-for-unity", "Pray for Unity", "Seek peace across the body of Christ", .church, "Church", 14, 7, .steady, "arrow.triangle.branch", "gospel", false, false, false),

        entry("pray-for-missions", "Pray for Missions", "Join God's work around the world", .missions, "Missions", 21, 8, .steady, "globe.americas.fill", "encouragement", false, false, false),
        entry("pray-for-missionaries", "Pray for Missionaries", "Support those serving far from home", .missions, "Missions", 14, 7, .gentle, "airplane", "encouragement", false, false, false),
        entry("pray-for-evangelism", "Pray for Evangelism", "Pray for courage to share good news", .missions, "Missions", 14, 8, .steady, "megaphone.fill", "encouragement", false, false, false),
        entry("pray-for-the-nations", "Pray for the Nations", "Lift the world and its people to God", .missions, "Missions", 30, 8, .steady, "globe", "encouragement", false, false, false),
        entry("pray-for-your-community", "Pray for Your Community", "Seek the good of the place you call home", .missions, "Missions", 14, 7, .gentle, "house.2.fill", "encouragement", false, true, false),

        entry("healing", "Healing", "Make room for comfort and restoration", .healing, "Healing", 21, 8, .gentle, "heart.text.square.fill", "encouragement", true, false, false),
        entry("depression", "Depression", "A gentle place for honest prayer", .healing, "Healing", 14, 7, .gentle, "cloud.rain.fill", "encouragement", false, false, false),
        entry("anxiety-and-peace", "Anxiety & Peace", "Scripture prayers for rest and trust", .healing, "Healing", 14, 7, .gentle, "leaf.fill", "encouragement", true, true, false, "anxiety-and-peace"),
        entry("emotional-healing", "Emotional Healing", "Bring wounded places into God's care", .healing, "Healing", 21, 8, .gentle, "heart.circle.fill", "encouragement", false, false, false),
        entry("forgiveness", "Forgiveness", "Practice release, mercy, and freedom", .healing, "Healing", 14, 7, .steady, "arrow.uturn.left.circle.fill", "encouragement", false, false, false),
        entry("freedom", "Freedom", "Pray toward wholeness and new life", .healing, "Healing", 21, 8, .steady, "lock.open.fill", "encouragement", false, false, false),

        entry("wisdom", "Wisdom", "Ask for wisdom in every decision", .christianLiving, "Christian Living", 14, 7, .steady, "lightbulb.fill", "wisdom", false, true, false),
        entry("courage", "Courage", "Stand faithfully in difficult moments", .christianLiving, "Christian Living", 14, 7, .steady, "shield.fill", "wisdom", false, false, false),
        entry("faith-during-hard-times", "Faith During Hard Times", "Keep trusting through uncertainty", .christianLiving, "Christian Living", 21, 8, .deep, "mountain.2.fill", "wisdom", false, false, false),
        entry("purity", "Purity", "Pray for an undivided heart", .christianLiving, "Christian Living", 14, 7, .steady, "sparkle", "wisdom", false, false, false),
        entry("gratitude", "Gratitude", "Notice grace in the everyday", .christianLiving, "Christian Living", 21, 7, .gentle, "hands.sparkles.fill", "gratitude", true, true, false),
        entry("joy", "Joy", "Receive the quiet joy of God's presence", .christianLiving, "Christian Living", 14, 7, .gentle, "sun.max.fill", "gratitude", false, false, false),
        entry("happiness", "Happiness", "Pray with hope for a lighter heart", .christianLiving, "Christian Living", 14, 7, .gentle, "face.smiling.fill", "gratitude", false, false, false),
        entry("peace", "Peace", "Practice stillness and trust", .christianLiving, "Christian Living", 14, 7, .gentle, "water.waves", "encouragement", false, false, false),
        entry("hope", "Hope", "Look toward God's promises", .christianLiving, "Christian Living", 14, 7, .gentle, "sunrise.fill", "encouragement", false, false, false),
        entry("strength", "Strength", "Find strength for the next step", .christianLiving, "Christian Living", 14, 7, .steady, "bolt.fill", "encouragement", false, false, false),
        entry("patience", "Patience", "Make space for God's timing", .christianLiving, "Christian Living", 14, 7, .steady, "hourglass", "wisdom", false, false, false),
        entry("humility", "Humility", "Walk gently and faithfully", .christianLiving, "Christian Living", 14, 7, .steady, "arrow.down.to.line", "wisdom", false, false, false),

        entry("students", "Students", "Pray through learning and growth", .life, "Life", 14, 7, .gentle, "graduationcap.fill", "encouragement", false, false, false),
        entry("work-and-career", "Work & Career", "Bring your work and calling to God", .life, "Life", 14, 7, .steady, "briefcase.fill", "wisdom", false, false, false),
        entry("government-leaders", "Government Leaders", "Pray for justice and wise leadership", .life, "Life", 14, 7, .steady, "building.columns.fill", "gospel", false, false, false),
        entry("medical-workers", "Medical Workers", "Support caregivers with prayer", .life, "Life", 14, 7, .gentle, "cross.case.fill", "encouragement", false, false, false),
        entry("teachers", "Teachers", "Pray for those shaping the next generation", .life, "Life", 14, 7, .gentle, "book.fill", "wisdom", false, false, false),
        entry("military", "Military", "Pray for service members and their families", .life, "Life", 14, 7, .steady, "shield.lefthalf.filled", "encouragement", false, false, false),
        entry("first-responders", "First Responders", "Pray for courage and protection", .life, "Life", 14, 7, .steady, "staroflife.fill", "encouragement", false, false, false),

        entry("advent", "Advent", "Prepare your heart for Christ's coming", .seasonal, "Seasonal", 25, 8, .gentle, "sparkles", "gospel", false, false, true),
        entry("lent", "Lent", "Make room for reflection and renewal", .seasonal, "Seasonal", 40, 8, .deep, "cross.fill", "gospel", false, false, true),
        entry("easter", "Easter", "Pray into resurrection hope", .seasonal, "Seasonal", 14, 8, .gentle, "sunrise.fill", "gospel", true, false, true),
        entry("christmas", "Christmas", "Receive the wonder of Emmanuel", .seasonal, "Seasonal", 14, 8, .gentle, "gift.fill", "gospel", false, false, true),

        entry("30-days-in-proverbs", "30 Days in Proverbs", "A month of practical wisdom", .devotionals, "Devotionals", 30, 8, .steady, "book.closed.fill", "wisdom", true, true, false, ProverbsPrayerData.plan.id),
        entry("31-days-in-psalms", "31 Days in Psalms", "A month of honest worship and prayer", .devotionals, "Devotionals", 31, 8, .gentle, "music.note.list", "psalms", true, false, false, "psalms-journey-overview"),
        entry("21-days-of-gratitude", "21 Days of Gratitude", "A focused practice of thanksgiving", .devotionals, "Devotionals", 21, 7, .gentle, "hands.sparkles.fill", "gratitude", false, false, false, "gratitude-challenge"),
        entry("names-of-god", "Names of God", "Pray through the names that reveal God's character", .devotionals, "Devotionals", 30, 8, .deep, "text.book.closed.fill", "gospel", false, false, false),
        entry("wisdom-for-men", "Wisdom for Men", "A grounded journey in faithful living", .devotionals, "Devotionals", 21, 8, .steady, "person.fill", "wisdom", false, false, false),
        entry("wisdom-for-women", "Wisdom for Women", "A grounded journey in faithful living", .devotionals, "Devotionals", 21, 8, .steady, "person.fill", "wisdom", false, false, false),

        entry("prayer-journal", "Prayer Journal", "Keep your own prayers close", .personal, "Personal", 0, 5, .gentle, "book.pages.fill", "encouragement", false, false, false),
        entry("personal-notes", "Personal Notes", "Make space for reflection", .personal, "Personal", 0, 5, .gentle, "note.text", "encouragement", false, false, false),
        entry("prayer-calendar", "Prayer Calendar", "Build a rhythm that fits your days", .personal, "Personal", 0, 5, .gentle, "calendar", "encouragement", false, false, false),
        entry("answered-prayers", "Answered Prayers", "Remember where you've seen God's faithfulness", .personal, "Personal", 0, 5, .gentle, "checkmark.seal.fill", "gratitude", false, false, false),
        entry("shared-prayers", "Shared Prayers", "Hold shared hopes and needs together", .personal, "Personal", 0, 5, .gentle, "person.2.wave.2.fill", "encouragement", false, false, false)
    ]

    private static func entry(
        _ id: String, _ title: String, _ subtitle: String, _ collection: PrayerCollectionID,
        _ category: String, _ duration: Int, _ minutes: Int, _ difficulty: PrayerJourneyDifficulty,
        _ hero: String, _ accent: String, _ featured: Bool, _ recommended: Bool, _ seasonal: Bool,
        _ planID: String? = nil
    ) -> PrayerJourneyMetadata {
        PrayerJourneyMetadata(
            id: id, title: title, subtitle: subtitle,
            description: subtitle, collection: collection, category: category,
            estimatedDurationDays: duration, estimatedPrayerMinutes: minutes,
            difficulty: difficulty, heroImageName: hero, accentColorName: accent,
            isFeatured: featured, isRecommended: recommended, isSeasonal: seasonal,
            isPremiumReady: true, sortOrder: 0, planID: planID
            , contentState: seasonal ? .seasonal : (planID == nil ? .comingSoon : .available)
            , version: 1, contentCompletionPercentage: planID == nil ? 0 : 100
            , lastUpdated: "2026-07-31", author: "LetUsPray Editorial"
            , estimatedRelease: planID == nil ? "Planned" : nil
            , featuredPriority: featured ? 1 : 0, launchPriority: planID == nil ? 0 : 1
            , reviewer: "Unassigned", reviewStatus: planID == nil ? .notStarted : .approved
            , createdDate: "2026-07-31", updatedDate: "2026-07-31"
            , publishDate: planID == nil ? nil : "2026-07-31"
            , estimatedCompletion: planID == nil ? "Planned" : nil
            , requiredSessionCount: max(duration, 0), requiredPrayerCount: max(duration, 0)
            , requiredScriptureCount: max(duration, 0)
            , workflowStage: planID == nil ? .planning : (seasonal ? .readyForQA : .released)
            , previousWorkflowStage: nil, assignedAuthor: "Unassigned", assignedReviewer: "Unassigned", assignedEditor: "Unassigned"
            , stageCompletionDate: planID == nil ? nil : "2026-07-31", qaApprovalDate: planID == nil ? nil : "2026-07-31"
            , releaseVersion: planID == nil ? nil : "1.0", releaseNotes: nil, blockingIssuesCount: 0, reviewComments: nil
            , sourceLanguage: "en", supportedLanguages: ["en"]
            , localizations: [PrayerJourneyLocalizationMetadata(id: "en", languageCode: "en", localizedTitle: title, localizedSubtitle: subtitle, localizedDescription: subtitle, localizedHeroImageName: hero, localizedCollectionTitle: collection.title, status: planID == nil ? .notStarted : .published, completionPercentage: planID == nil ? 0 : 100, translator: "Source", reviewer: "Unassigned", lastUpdated: "2026-07-31", publishedVersion: planID == nil ? nil : "1.0")]
            , assets: [PrayerJourneyAssetMetadata(id: "\(id)-hero", kind: "Hero", reference: hero, darkModeReference: hero, lightModeReference: hero, localizedReferences: ["en": hero], version: 1, author: "LetUsPray Editorial", status: planID == nil ? .placeholder : .published, updatedDate: "2026-07-31")]
            , qa: PrayerJourneyQAMetadata(status: planID == nil ? .notStarted : .approved, owner: "Unassigned", startedDate: planID == nil ? nil : "2026-07-31", completedDate: planID == nil ? nil : "2026-07-31", approvalDate: planID == nil ? nil : "2026-07-31", releaseBlocker: false, criticalIssues: 0, majorIssues: 0, minorIssues: 0, knownIssues: nil, notes: nil, completedCategories: planID == nil ? [] : Set(PrayerJourneyQACategory.allCases))
            , release: planID == nil ? nil : PrayerJourneyReleaseMetadata(releaseID: "release-\(id)-1.0", version: "1.0", name: "LetUsPray Version 1.0", channel: .production, milestone: .version1, targetDate: "2026-07-31", actualDate: "2026-07-31", owner: "Unassigned", releaseNotes: nil, rollbackVersion: nil, status: .released)
            , publication: PrayerJourneyPublicationMetadata(state: planID == nil ? .draft : .published, publishedVersion: planID == nil ? nil : "1.0", draftVersion: nil, publishedDate: planID == nil ? nil : "2026-07-31", publishedBy: planID == nil ? nil : "LetUsPray Editorial", importSource: planID == nil ? nil : "catalog", importChecksum: planID == nil ? nil : "catalog-\(id)-v1", contentIntegrityStatus: planID == nil ? "Not Imported" : "Verified", publicationHistory: planID == nil ? [] : ["1.0 · 2026-07-31"], rollbackVersion: nil)
        )
    }

    private static func metadataEntry(for plan: PrayerPlan) -> PrayerJourneyMetadata {
        PrayerJourneyMetadata(
            id: plan.id, title: plan.title, subtitle: plan.subtitle, description: plan.description,
            collection: collectionID(for: plan), category: plan.category.displayTitle,
            estimatedDurationDays: plan.durationDays, estimatedPrayerMinutes: max(5, min(15, plan.durationDays / 2)),
            difficulty: .gentle, heroImageName: plan.coverIcon, accentColorName: plan.accentColorName,
            isFeatured: plan.category == .psalms, isRecommended: false, isSeasonal: false,
            isPremiumReady: true, sortOrder: 0, planID: plan.id
            , contentState: .available, version: 1, contentCompletionPercentage: 100
            , lastUpdated: "2026-07-31", author: "LetUsPray Editorial", estimatedRelease: nil
            , featuredPriority: plan.category == .psalms ? 1 : 0, launchPriority: 1
            , reviewer: "Unassigned", reviewStatus: .approved
            , createdDate: "2026-07-31", updatedDate: "2026-07-31", publishDate: "2026-07-31"
            , estimatedCompletion: nil, requiredSessionCount: plan.durationDays
            , requiredPrayerCount: plan.days.count, requiredScriptureCount: plan.days.count
            , workflowStage: .released, previousWorkflowStage: nil, assignedAuthor: "Unassigned", assignedReviewer: "Unassigned", assignedEditor: "Unassigned"
            , stageCompletionDate: "2026-07-31", qaApprovalDate: "2026-07-31", releaseVersion: "1.0", releaseNotes: nil
            , blockingIssuesCount: 0, reviewComments: nil
            , sourceLanguage: "en", supportedLanguages: ["en"]
            , localizations: [PrayerJourneyLocalizationMetadata(id: "en", languageCode: "en", localizedTitle: plan.title, localizedSubtitle: plan.subtitle, localizedDescription: plan.description, localizedHeroImageName: plan.coverIcon, localizedCollectionTitle: collectionID(for: plan).title, status: .published, completionPercentage: 100, translator: "Source", reviewer: "Unassigned", lastUpdated: "2026-07-31", publishedVersion: "1.0")]
            , assets: [PrayerJourneyAssetMetadata(id: "\(plan.id)-hero", kind: "Hero", reference: plan.coverIcon, darkModeReference: plan.coverIcon, lightModeReference: plan.coverIcon, localizedReferences: ["en": plan.coverIcon], version: 1, author: "LetUsPray Editorial", status: .published, updatedDate: "2026-07-31")]
            , qa: PrayerJourneyQAMetadata(status: .approved, owner: "Unassigned", startedDate: "2026-07-31", completedDate: "2026-07-31", approvalDate: "2026-07-31", releaseBlocker: false, criticalIssues: 0, majorIssues: 0, minorIssues: 0, knownIssues: nil, notes: nil, completedCategories: Set(PrayerJourneyQACategory.allCases))
            , release: PrayerJourneyReleaseMetadata(releaseID: "release-\(plan.id)-1.0", version: "1.0", name: "LetUsPray Version 1.0", channel: .production, milestone: .version1, targetDate: "2026-07-31", actualDate: "2026-07-31", owner: "Unassigned", releaseNotes: nil, rollbackVersion: nil, status: .released)
            , publication: PrayerJourneyPublicationMetadata(state: .published, publishedVersion: "1.0", draftVersion: nil, publishedDate: "2026-07-31", publishedBy: "LetUsPray Editorial", importSource: "catalog", importChecksum: "catalog-\(plan.id)-v1", contentIntegrityStatus: "Verified", publicationHistory: ["1.0 · 2026-07-31"], rollbackVersion: nil)
        )
    }

    private static func placeholderPlan(for metadata: PrayerJourneyMetadata) -> PrayerPlan {
        PrayerPlan(
            id: metadata.id, title: metadata.title, subtitle: metadata.subtitle,
            description: metadata.description, category: placeholderCategory(for: metadata.collection),
            durationDays: metadata.estimatedDurationDays, accentColorName: metadata.accentColorName,
            coverIcon: metadata.heroImageName, days: []
        )
    }

    private static func placeholderCategory(for collection: PrayerCollectionID) -> PrayerPlanCategory {
        switch collection {
        case .scripture: .wisdom
        case .family: .family
        case .devotionals: .gratitude
        default: .encouragement
        }
    }
}

import Foundation

enum PrayerJourneyDifficulty: String, Codable, CaseIterable, Hashable {
    case gentle = "Gentle"
    case steady = "Steady"
    case deep = "Deep"
}

/// Presentation and catalog metadata for a journey. Prayer text remains owned by `PrayerPlan`.
struct PrayerJourney: Identifiable, Hashable {
    let plan: PrayerPlan
    let heroImageName: String
    let estimatedPrayerMinutes: Int
    let difficulty: PrayerJourneyDifficulty
    let isFeatured: Bool
    let isRecommended: Bool
    let isSeasonal: Bool
    let isPremiumReady: Bool
    let sortOrder: Int

    var id: String { plan.id }
    var title: String { plan.title }
    var subtitle: String { plan.subtitle }
    var description: String { plan.description }
    var category: PrayerPlanCategory { plan.category }
    var collection: PrayerCollectionID { PrayerJourneyCatalog.collectionID(for: plan) }
    var accentColorName: String { plan.accentColorName }
    var sessionCount: Int { plan.days.count > 0 ? plan.days.count : plan.durationDays }
    var estimatedDurationDays: Int { plan.durationDays }

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
}

enum PrayerJourneyCatalog {
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
        plans
            .filter { collectionID(for: $0) == collection }
            .map { journey(for: $0) }
            .sorted { $0.sortOrder == $1.sortOrder ? $0.title < $1.title : $0.sortOrder < $1.sortOrder }
    }

    static func journey(for plan: PrayerPlan) -> PrayerJourney {
        let isProverbs = plan.id == ProverbsPrayerData.plan.id
        return PrayerJourney(
            plan: plan,
            heroImageName: plan.coverIcon,
            estimatedPrayerMinutes: max(5, min(15, plan.durationDays / 2)),
            difficulty: isProverbs ? .steady : .gentle,
            isFeatured: isProverbs || plan.category == .psalms,
            isRecommended: isProverbs,
            isSeasonal: false,
            isPremiumReady: true,
            sortOrder: isProverbs ? 0 : 1
        )
    }
}

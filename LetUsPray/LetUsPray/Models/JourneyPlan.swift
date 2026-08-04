import Foundation

struct JourneyPlan: Identifiable, Hashable, Codable {
    let metadata: PrayerPlan
    let days: [JourneyDay]

    var id: String { metadata.id }
    var title: String { metadata.title }
    var subtitle: String { metadata.subtitle }
    var description: String { metadata.description }
    var category: PrayerPlanCategory { metadata.category }
    var durationDays: Int { metadata.durationDays }
    var accentColorName: String { metadata.accentColorName }
    var coverIcon: String { metadata.coverIcon }
}

struct JourneyDay: Identifiable, Hashable, Codable {
    let dayNumber: Int
    let title: String
    let chapterReference: String
    let summary: String
    let primaryScripture: JourneyScripture
    let devotional: String
    let reflections: [JourneyReflection]
    let closingPrayer: String

    var id: Int { dayNumber }
}

struct JourneyScripture: Hashable, Codable {
    let reference: String
    let text: String
}

struct JourneyReflection: Identifiable, Hashable, Codable {
    let id: String
    let scripture: JourneyScripture
    let prayer: String
}

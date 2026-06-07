import Foundation

struct PrayerPlan: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let category: PrayerPlanCategory
    let durationDays: Int
    let accentColorName: String
    let coverIcon: String
    let days: [PrayerDay]

    var duration: Int { durationDays }
    var supportsJourneyStart: Bool { !days.isEmpty }
    var isPreviewPlaceholder: Bool { days.isEmpty }
}

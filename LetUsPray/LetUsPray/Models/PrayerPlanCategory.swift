import Foundation

enum PrayerPlanCategory: String, Codable, Hashable, CaseIterable {
    case wisdom
    case psalms
    case gospel
    case gratitude
    case family
    case encouragement

    var displayTitle: String {
        switch self {
        case .wisdom:
            return "Wisdom"
        case .psalms:
            return "Psalms"
        case .gospel:
            return "Gospel"
        case .gratitude:
            return "Gratitude"
        case .family:
            return "Family"
        case .encouragement:
            return "Encouragement"
        }
    }
}

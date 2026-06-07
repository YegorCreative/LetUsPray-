import Foundation

struct PrayerPlan: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let duration: Int
    let days: [PrayerDay]
}

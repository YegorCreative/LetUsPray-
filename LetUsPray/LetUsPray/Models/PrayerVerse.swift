import Foundation

struct PrayerVerse: Identifiable, Hashable, Codable {
    let id: String
    let reference: String
    let text: String
    let prayer: String
}

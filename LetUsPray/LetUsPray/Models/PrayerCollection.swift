import Foundation

struct PrayerCollection: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let psalmsRange: String
    let days: [PrayerDay]
    
    var durationDays: Int {
        days.count
    }
}

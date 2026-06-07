import Foundation

struct PrayerDay: Identifiable, Hashable, Codable {
    let dayNumber: Int
    let title: String
    let chapterReference: String
    let summary: String
    let verses: [PrayerVerse]

    var id: Int { dayNumber }
    var isPlaceholder: Bool { verses.isEmpty }
}

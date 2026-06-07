import SwiftUI

enum AppColors {
    static let prayerBlue = Color(red: 0.23, green: 0.51, blue: 0.96)
    static let faithTurquoise = Color(red: 0.08, green: 0.72, blue: 0.65)
    static let deepMaroon = Color(red: 0.50, green: 0.11, blue: 0.23)
    static let warmCream = Color(red: 0.97, green: 0.96, blue: 0.95)
    static let softIvory = Color(red: 1.00, green: 0.99, blue: 0.97)
    static let goldAccent = Color(red: 0.83, green: 0.66, blue: 0.31)

    static let midnight = Color(red: 0.12, green: 0.16, blue: 0.25)
    static let twilight = Color(red: 0.18, green: 0.25, blue: 0.38)
    static let dawn = prayerBlue.opacity(0.78)
    static let pearl = warmCream
    static let mist = softIvory.opacity(0.86)
    static let accent = faithTurquoise
    static let accentStrong = prayerBlue
    static let secondaryAccent = deepMaroon
    static let psalmsAccent = prayerBlue
    static let gospelAccent = goldAccent
    static let gratitudeAccent = deepMaroon
    static let familyAccent = faithTurquoise
    static let encouragementAccent = prayerBlue
    static let prayerGold = goldAccent
    static let success = faithTurquoise
    static let textPrimary = softIvory.opacity(0.97)
    static let textSecondary = softIvory.opacity(0.74)
    static let textTertiary = warmCream.opacity(0.54)
    static let glassFill = softIvory.opacity(0.13)
    static let glassStroke = softIvory.opacity(0.22)
    static let glassHighlight = softIvory.opacity(0.18)
    static let shadow = deepMaroon.opacity(0.24)

    static func planAccent(named name: String) -> Color {
        switch name {
        case "wisdom":
            return faithTurquoise
        case "psalms":
            return prayerBlue
        case "gospel":
            return goldAccent
        case "gratitude":
            return deepMaroon
        case "family":
            return faithTurquoise
        case "encouragement":
            return prayerBlue
        default:
            return faithTurquoise
        }
    }
}

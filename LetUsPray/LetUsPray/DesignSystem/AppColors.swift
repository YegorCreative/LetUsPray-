import SwiftUI

enum AppColors {
    static let voltLime = Color(red: 0.72, green: 1.00, blue: 0.00)
    static let activityPink = Color(red: 1.00, green: 0.18, blue: 0.33)
    static let electricCyan = Color(red: 0.00, green: 0.85, blue: 1.00)
    static let premiumGold = Color(red: 0.83, green: 0.69, blue: 0.22)
    static let deepGraphite = Color(red: 0.07, green: 0.07, blue: 0.09)
    static let cardDarkSurface = Color(red: 0.11, green: 0.11, blue: 0.12)

    // Compatibility aliases retained for existing call sites. These now map to the bold Activity-inspired identity.
    static let prayerBlue = electricCyan
    static let faithTurquoise = voltLime
    static let deepMaroon = activityPink
    static let warmCream = cardDarkSurface
    static let softIvory = Color.white
    static let goldAccent = premiumGold

    static let midnight = deepGraphite
    static let twilight = cardDarkSurface
    static let dawn = electricCyan.opacity(0.78)
    static let pearl = cardDarkSurface
    static let mist = Color.white.opacity(0.82)
    static let accent = voltLime
    static let accentStrong = activityPink
    static let secondaryAccent = electricCyan
    static let psalmsAccent = electricCyan
    static let gospelAccent = premiumGold
    static let gratitudeAccent = activityPink
    static let familyAccent = electricCyan
    static let encouragementAccent = voltLime
    static let prayerGold = premiumGold
    static let success = voltLime
    static let textPrimary = Color.white.opacity(0.96)
    static let textSecondary = Color.white.opacity(0.70)
    static let textTertiary = Color.white.opacity(0.48)
    static let brightTextOnAccent = Color(red: 0.03, green: 0.03, blue: 0.04)
    static let glassFill = cardDarkSurface.opacity(0.58)
    static let glassStroke = Color.white.opacity(0.13)
    static let glassHighlight = Color.white.opacity(0.10)
    static let shadow = Color.black.opacity(0.36)

    static func planAccent(named name: String) -> Color {
        switch name {
        case "wisdom":
            return voltLime
        case "psalms":
            return electricCyan
        case "gospel":
            return premiumGold
        case "gratitude":
            return activityPink
        case "family":
            return electricCyan
        case "encouragement":
            return voltLime
        default:
            return voltLime
        }
    }
}

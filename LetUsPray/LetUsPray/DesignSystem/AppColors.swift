import SwiftUI
import UIKit

/// Semantic colors for the product. Every color adapts to the system appearance.
enum AppColors {
    static let background = adaptive(light: UIColor(red: 0.94, green: 0.97, blue: 0.95, alpha: 1), dark: UIColor(red: 0.035, green: 0.075, blue: 0.07, alpha: 1))
    static let secondaryBackground = adaptive(light: UIColor(red: 0.87, green: 0.94, blue: 0.91, alpha: 1), dark: UIColor(red: 0.055, green: 0.13, blue: 0.12, alpha: 1))
    static let surface = adaptive(light: UIColor(red: 0.985, green: 0.995, blue: 0.99, alpha: 1), dark: UIColor(red: 0.075, green: 0.16, blue: 0.145, alpha: 1))
    static let elevatedSurface = adaptive(light: UIColor(red: 1.0, green: 1.0, blue: 0.995, alpha: 1), dark: UIColor(red: 0.10, green: 0.21, blue: 0.19, alpha: 1))
    static let primaryText = adaptive(light: UIColor(red: 0.055, green: 0.16, blue: 0.12, alpha: 1), dark: UIColor(red: 0.94, green: 0.985, blue: 0.96, alpha: 1))
    static let secondaryText = adaptive(light: UIColor(red: 0.22, green: 0.34, blue: 0.29, alpha: 1), dark: UIColor(red: 0.73, green: 0.86, blue: 0.79, alpha: 1))
    static let tertiaryText = adaptive(light: UIColor(red: 0.34, green: 0.46, blue: 0.40, alpha: 1), dark: UIColor(red: 0.56, green: 0.72, blue: 0.65, alpha: 1))
    static let textPrimary = primaryText
    static let textSecondary = secondaryText
    static let textTertiary = tertiaryText
    static let accent = adaptive(light: UIColor(red: 0.07, green: 0.43, blue: 0.29, alpha: 1), dark: UIColor(red: 0.42, green: 0.82, blue: 0.62, alpha: 1))
    static let success = adaptive(light: UIColor(red: 0.06, green: 0.40, blue: 0.23, alpha: 1), dark: UIColor(red: 0.34, green: 0.80, blue: 0.52, alpha: 1))
    static let warning = adaptive(light: UIColor(red: 0.58, green: 0.34, blue: 0.02, alpha: 1), dark: UIColor(red: 1.00, green: 0.72, blue: 0.27, alpha: 1))
    static let error = adaptive(light: UIColor(red: 0.72, green: 0.12, blue: 0.13, alpha: 1), dark: UIColor(red: 1.00, green: 0.42, blue: 0.43, alpha: 1))
    static let separator = adaptive(light: UIColor.black.withAlphaComponent(0.12), dark: UIColor.white.withAlphaComponent(0.16))

    // Named accents remain available to existing screens and now use an accessible palette.
    static let voltLime = accent
    static let activityPink = adaptive(light: UIColor(red: 0.72, green: 0.25, blue: 0.34, alpha: 1), dark: UIColor(red: 0.96, green: 0.48, blue: 0.58, alpha: 1))
    static let electricCyan = adaptive(light: UIColor(red: 0.05, green: 0.35, blue: 0.68, alpha: 1), dark: UIColor(red: 0.40, green: 0.70, blue: 0.98, alpha: 1))
    static let premiumGold = adaptive(light: UIColor(red: 0.57, green: 0.36, blue: 0.02, alpha: 1), dark: UIColor(red: 1.00, green: 0.78, blue: 0.32, alpha: 1))
    static let deepGraphite = background
    static let cardDarkSurface = surface

    // Compatibility aliases retained for existing call sites.
    static let prayerBlue = electricCyan
    static let faithTurquoise = accent
    static let deepMaroon = activityPink
    static let warmCream = surface
    static let softIvory = primaryText
    static let goldAccent = premiumGold
    static let midnight = background
    static let twilight = secondaryBackground
    static let dawn = electricCyan
    static let pearl = surface
    static let mist = secondaryText
    static let accentStrong = activityPink
    static let secondaryAccent = electricCyan
    static let psalmsAccent = electricCyan
    static let gospelAccent = premiumGold
    static let gratitudeAccent = activityPink
    static let familyAccent = electricCyan
    static let encouragementAccent = accent
    static let prayerGold = premiumGold
    static let brightTextOnAccent = adaptive(light: .white, dark: UIColor(red: 0.04, green: 0.07, blue: 0.12, alpha: 1))
    static let glassFill = elevatedSurface.opacity(0.92)
    static let glassStroke = separator
    static let glassHighlight = Color.white.opacity(0.10)
    static let shadow = Color.black.opacity(0.16)

    static func planAccent(named name: String) -> Color {
        switch name {
        case "wisdom": return accent
        case "psalms": return electricCyan
        case "gospel": return premiumGold
        case "gratitude": return activityPink
        case "family": return electricCyan
        case "encouragement": return accent
        default: return accent
        }
    }

    private static func adaptive(light: UIColor, dark: UIColor) -> Color {
        Color(uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark ? dark : light
        })
    }
}

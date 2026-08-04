import SwiftUI
import UIKit

/// Semantic colors for the product, matching the LetUsPray Brand Guide v1.1.
/// Dark values are the locked brand palette; light values are the guide's approved proposal.
/// Every color adapts to the system appearance.
enum AppColors {
    // Background & Surfaces — Guide §3–§4
    static let background = adaptive(light: UIColor(red: 0.9804, green: 0.9804, blue: 0.9725, alpha: 1), dark: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)) // #FAFAF8 / #000000 — true black, no tint
    static let secondaryBackground = adaptive(light: UIColor(red: 0.9412, green: 0.9373, blue: 0.9176, alpha: 1), dark: UIColor(red: 0.0667, green: 0.0667, blue: 0.0667, alpha: 1)) // #F0EFEA / #111111
    static let surface = secondaryBackground
    static let elevatedSurface = adaptive(light: UIColor(red: 1, green: 1, blue: 1, alpha: 1), dark: UIColor(red: 0.1020, green: 0.1020, blue: 0.1020, alpha: 1)) // #FFFFFF / #1A1A1A
    static let primaryBackground = background
    static let prayerSurface = surface
    static let glassSurface = surface
    static let heroSurface = elevatedSurface
    static let cardSurface = surface
    static let overlaySurface = elevatedSurface

    // Text — Guide §8
    static let primaryText = adaptive(light: UIColor(red: 0.0667, green: 0.0667, blue: 0.0667, alpha: 1), dark: UIColor(red: 1, green: 1, blue: 1, alpha: 1)) // #111111 / #FFFFFF
    static let secondaryText = adaptive(light: UIColor(red: 0.2745, green: 0.2745, blue: 0.2902, alpha: 1), dark: UIColor(red: 0.7216, green: 0.7216, blue: 0.7216, alpha: 1)) // #46464A / #B8B8B8
    static let tertiaryText = adaptive(light: UIColor(red: 0.5569, green: 0.5569, blue: 0.5765, alpha: 1), dark: UIColor(red: 0.5569, green: 0.5569, blue: 0.5765, alpha: 1)) // #8E8E93 both
    static let textPrimary = primaryText
    static let textSecondary = secondaryText
    static let textTertiary = tertiaryText

    // Primary Brand — Guide §1 (locked)
    static let accent = adaptive(light: UIColor(red: 0.4863, green: 0.6431, blue: 0.0, alpha: 1), dark: UIColor(red: 0.7294, green: 0.9922, blue: 0.3098, alpha: 1)) // #7CA400 / #BAFD4F — Primary Green
    static let primaryGreen = accent
    static let primaryBlue = adaptive(light: UIColor(red: 0.0, green: 0.4784, blue: 1.0, alpha: 1), dark: UIColor(red: 0.0392, green: 0.5176, blue: 1.0, alpha: 1)) // #007AFF / #0A84FF

    // Secondary — Guide §2 (Secondary Green retired with this revision; use accent at reduced opacity instead)
    static let secondaryBlue = adaptive(light: UIColor(red: 0.2000, green: 0.6157, blue: 1.0, alpha: 1), dark: UIColor(red: 0.3922, green: 0.8235, blue: 1.0, alpha: 1)) // derived / #64D2FF

    // Accent & Celebration — Guide §6
    // `electricCyan` keeps the "general informational blue" role it already carried across the app
    // (Search, Collection links, Read Aloud controls) and now resolves to Primary Blue.
    static let electricCyan = primaryBlue
    // `accentCyan` is the guide's true Accent Cyan — reserved exclusively for the Guided Prayer
    // surface and the Read Aloud speed control. It must not be used anywhere else.
    static let accentCyan = adaptive(light: UIColor(red: 0.1961, green: 0.6784, blue: 0.9020, alpha: 1), dark: UIColor(red: 0.3529, green: 0.7843, blue: 0.9804, alpha: 1)) // #32ADE6 / #5AC8FA
    // Celebration Accent — achievements, streak milestones, featured CTAs only. Never a background or large fill.
    static let celebrationAccent = adaptive(light: UIColor(red: 0.6627, green: 0.7451, blue: 0.0, alpha: 1), dark: UIColor(red: 0.8667, green: 0.9961, blue: 0.0, alpha: 1)) // #A9BE00 / #DDFE00

    // Status — Guide §7 (Success is the same value as Primary Green — completion is progress finished, not a separate feeling)
    static let success = accent
    static let warning = adaptive(light: UIColor(red: 0.5608, green: 0.4353, blue: 0.0, alpha: 1), dark: UIColor(red: 1.0, green: 0.8392, blue: 0.0392, alpha: 1)) // #8F6F00 / #FFD60A
    static let error = adaptive(light: UIColor(red: 0.7176, green: 0.1412, blue: 0.1216, alpha: 1), dark: UIColor(red: 1.0, green: 0.2706, blue: 0.2275, alpha: 1)) // #B7241F / #FF453A
    static let separator = adaptive(light: UIColor.black.withAlphaComponent(0.12), dark: UIColor.white.withAlphaComponent(0.16))

    // Retired hues — repointed rather than deleted, so every existing call site inherits the
    // locked palette automatically. Per Guide §13, gold and pink no longer exist as brand hues.
    static let voltLime = accent
    static let premiumGold = celebrationAccent  // "Featured" / achievement role is now the Celebration Accent.
    static let activityPink = celebrationAccent // The palette's other former "vivid" hue shares that role now.
    static let deepGraphite = background
    static let cardDarkSurface = surface

    // Compatibility aliases retained for existing call sites.
    static let prayerBlue = primaryBlue
    static let faithTurquoise = accent
    static let deepMaroon = celebrationAccent
    static let warmCream = surface
    static let softIvory = primaryText
    static let goldAccent = celebrationAccent
    static let midnight = background
    static let twilight = secondaryBackground
    static let dawn = primaryBlue
    static let pearl = surface
    static let mist = secondaryText
    static let accentStrong = celebrationAccent
    static let secondaryAccent = primaryBlue
    // Guide §13 category remap: Wisdom & Gospel → Green · Psalms & Family → Blue · Gratitude & Encouragement → Cyan
    static let psalmsAccent = primaryBlue
    static let gospelAccent = accent
    static let gratitudeAccent = accentCyan
    static let familyAccent = primaryBlue
    static let encouragementAccent = accentCyan
    static let prayerGold = celebrationAccent
    static let brightTextOnAccent = adaptive(light: UIColor(red: 0.04, green: 0.09, blue: 0.02, alpha: 1), dark: UIColor(red: 0.04, green: 0.09, blue: 0.02, alpha: 1))
    static let glassFill = surface
    static let glassStroke = adaptive(light: UIColor(red: 0.4863, green: 0.6431, blue: 0.0, alpha: 0.20), dark: UIColor(red: 0.7294, green: 0.9922, blue: 0.3098, alpha: 0.22))
    static let glassHighlight = LinearGradient(
        colors: [Color.white.opacity(0.18), primaryBlue.opacity(0.07), accent.opacity(0.08), .clear],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let shadow = Color.black.opacity(0.22)

    /// Guide §13 category → hue remap: Wisdom & Gospel → Green · Psalms & Family → Blue · Gratitude & Encouragement → Cyan
    static func planAccent(named name: String) -> Color {
        switch name {
        case "wisdom": return accent
        case "psalms": return primaryBlue
        case "gospel": return accent
        case "gratitude": return accentCyan
        case "family": return primaryBlue
        case "encouragement": return accentCyan
        default: return accent
        }
    }

    nonisolated private static func adaptive(light: UIColor, dark: UIColor) -> Color {
        Color(uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark ? dark : light
        })
    }
}

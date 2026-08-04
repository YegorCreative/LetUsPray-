import SwiftUI

/// Theme Rule: every former gradient is now a solid color — the dominant/first stop of the
/// original blend, at that stop's original opacity. No blending, no invented colors.
enum BrandGradients {
    /// Formerly the canonical diagonal Hero fill (Green → Cyan → Blue); solid Primary Green.
    static let activityHero: Color = AppColors.primaryGreen

    /// Formerly the angular counterpart of `activityHero` for progress rings; solid Primary Green.
    static let ringGradient: Color = AppColors.primaryGreen

    /// Formerly Celebration Accent → Primary Green; solid Celebration Accent.
    static let celebration: Color = AppColors.celebrationAccent

    static let prayerProgress: Color = AppColors.voltLime.opacity(0.90)

    static let streakGlow: Color = AppColors.celebrationAccent.opacity(0.86)

    static let savedPrayer: Color = AppColors.premiumGold.opacity(0.80)

    static let planCard: Color = AppColors.electricCyan.opacity(0.72)

    // Former first stop (deepGraphite = page background) is degenerate as a card fill — it would
    // render the onboarding hero invisible against its own background. Using the gradient's next
    // stop instead, still an existing color from the same blend, no new color invented.
    static let onboardingCard: Color = AppColors.electricCyan.opacity(0.54)

    static let launchScreen: Color = AppColors.deepGraphite

    static let primaryHero = activityHero
    static let progressCard = prayerProgress
    static let streakCard = streakGlow

    /// Guide §13 category remap: Wisdom & Gospel → Green · Psalms & Family → Blue · Gratitude & Encouragement → Cyan.
    /// Formerly a 2-stop gradient per category; now solid, using the dominant (first) stop's color and opacity.
    static func planGradient(for category: PrayerPlanCategory) -> Color {
        switch category {
        case .wisdom:
            return AppColors.primaryGreen.opacity(0.92)
        case .psalms:
            return AppColors.primaryBlue.opacity(0.88)
        case .gospel:
            return AppColors.primaryGreen.opacity(0.90)
        case .gratitude:
            return AppColors.accentCyan.opacity(0.92)
        case .family:
            return AppColors.primaryBlue.opacity(0.88)
        case .encouragement:
            return AppColors.accentCyan.opacity(0.90)
        }
    }
}

extension PrayerPlanCategory {
    var brandIcon: String {
        switch self {
        case .wisdom:
            return "sparkles"
        case .psalms:
            return "music.note.list"
        case .gospel:
            return "cross.fill"
        case .gratitude:
            return "hands.sparkles.fill"
        case .family:
            return "figure.2.and.child.holdinghands"
        case .encouragement:
            return "heart.text.square.fill"
        }
    }

    /// Guide §13 category remap: Wisdom & Gospel → Green · Psalms & Family → Blue · Gratitude & Encouragement → Cyan.
    var brandAccent: Color {
        switch self {
        case .wisdom:
            return AppColors.primaryGreen
        case .psalms:
            return AppColors.primaryBlue
        case .gospel:
            return AppColors.primaryGreen
        case .gratitude:
            return AppColors.accentCyan
        case .family:
            return AppColors.primaryBlue
        case .encouragement:
            return AppColors.accentCyan
        }
    }

    var brandGradient: Color {
        BrandGradients.planGradient(for: self)
    }
}

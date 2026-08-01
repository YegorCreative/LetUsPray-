import SwiftUI

enum BrandGradients {
    /// Guide §12 — the single canonical Hero fill: Green → Cyan → Blue, green's stop pulled in to
    /// 38% of the diagonal so it reads as a bright accent at the leading corner, not half the surface.
    static let activityHero = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: AppColors.primaryGreen, location: 0.0),
            .init(color: AppColors.accentCyan, location: 0.38),
            .init(color: AppColors.primaryBlue, location: 1.0)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    /// Angular counterpart to `activityHero` for circular progress rings — same locked stops
    /// (Green → Cyan → Blue), swept around the circle instead of run diagonally across a card.
    static let ringGradient = AngularGradient(
        gradient: Gradient(stops: [
            .init(color: AppColors.primaryGreen, location: 0.0),
            .init(color: AppColors.accentCyan, location: 0.5),
            .init(color: AppColors.primaryBlue, location: 1.0)
        ]),
        center: .center,
        startAngle: .degrees(0),
        endAngle: .degrees(360)
    )

    /// Guide §6 — Celebration Accent paired with Primary Green, reserved for streak/achievement moments only.
    static let celebration = LinearGradient(
        colors: [AppColors.celebrationAccent, AppColors.primaryGreen],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let prayerProgress = LinearGradient(
        colors: [
            AppColors.voltLime.opacity(0.90),
            AppColors.electricCyan.opacity(0.72),
            AppColors.cardDarkSurface.opacity(0.26)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let streakGlow = LinearGradient(
        colors: [
            AppColors.celebrationAccent.opacity(0.86),
            AppColors.primaryGreen.opacity(0.42)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let savedPrayer = LinearGradient(
        colors: [
            AppColors.premiumGold.opacity(0.80),
            AppColors.electricCyan.opacity(0.54),
            AppColors.voltLime.opacity(0.24)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let planCard = LinearGradient(
        colors: [
            AppColors.electricCyan.opacity(0.72),
            AppColors.voltLime.opacity(0.62),
            AppColors.premiumGold.opacity(0.28)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let onboardingCard = LinearGradient(
        colors: [
            AppColors.deepGraphite.opacity(0.66),
            AppColors.electricCyan.opacity(0.54),
            AppColors.voltLime.opacity(0.44),
            AppColors.premiumGold.opacity(0.22)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let launchScreen = LinearGradient(
        colors: [
            AppColors.deepGraphite,
            AppColors.cardDarkSurface,
            AppColors.electricCyan.opacity(0.26),
            AppColors.voltLime.opacity(0.16)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let primaryHero = activityHero
    static let progressCard = prayerProgress
    static let streakCard = streakGlow

    /// Guide §13 category remap: Wisdom & Gospel → Green · Psalms & Family → Blue · Gratitude & Encouragement → Cyan.
    /// Categories sharing a hue are differentiated by their secondary stop rather than a different family.
    static func planGradient(for category: PrayerPlanCategory) -> LinearGradient {
        switch category {
        case .wisdom:
            return LinearGradient(
                colors: [AppColors.primaryGreen.opacity(0.92), AppColors.primaryBlue.opacity(0.26)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .psalms:
            return LinearGradient(
                colors: [AppColors.primaryBlue.opacity(0.88), AppColors.primaryGreen.opacity(0.22)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gospel:
            return LinearGradient(
                colors: [AppColors.primaryGreen.opacity(0.90), AppColors.accentCyan.opacity(0.26)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gratitude:
            return LinearGradient(
                colors: [AppColors.accentCyan.opacity(0.92), AppColors.primaryBlue.opacity(0.28)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .family:
            return LinearGradient(
                colors: [AppColors.primaryBlue.opacity(0.88), AppColors.accentCyan.opacity(0.30)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .encouragement:
            return LinearGradient(
                colors: [AppColors.accentCyan.opacity(0.90), AppColors.primaryGreen.opacity(0.24)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
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

    var brandGradient: LinearGradient {
        BrandGradients.planGradient(for: self)
    }
}

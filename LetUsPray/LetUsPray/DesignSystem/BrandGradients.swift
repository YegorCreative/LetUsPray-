import SwiftUI

enum BrandGradients {
    static let activityHero = LinearGradient(
        colors: [
            AppColors.voltLime.opacity(0.95),
            AppColors.electricCyan.opacity(0.82),
            AppColors.activityPink.opacity(0.70)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let prayerProgress = LinearGradient(
        colors: [
            AppColors.voltLime.opacity(0.92),
            AppColors.electricCyan.opacity(0.78),
            AppColors.cardDarkSurface.opacity(0.22)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let streakGlow = LinearGradient(
        colors: [
            AppColors.activityPink.opacity(0.92),
            AppColors.premiumGold.opacity(0.82),
            AppColors.voltLime.opacity(0.40)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let savedPrayer = LinearGradient(
        colors: [
            AppColors.premiumGold.opacity(0.82),
            AppColors.activityPink.opacity(0.62),
            AppColors.electricCyan.opacity(0.30)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let planCard = LinearGradient(
        colors: [
            AppColors.electricCyan.opacity(0.70),
            AppColors.voltLime.opacity(0.50),
            AppColors.activityPink.opacity(0.42)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let onboardingCard = LinearGradient(
        colors: [
            AppColors.deepGraphite.opacity(0.70),
            AppColors.electricCyan.opacity(0.58),
            AppColors.voltLime.opacity(0.42),
            AppColors.activityPink.opacity(0.32)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let launchScreen = LinearGradient(
        colors: [
            AppColors.deepGraphite,
            AppColors.cardDarkSurface,
            AppColors.electricCyan.opacity(0.22),
            AppColors.activityPink.opacity(0.18)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let primaryHero = activityHero
    static let progressCard = prayerProgress
    static let streakCard = streakGlow

    static func planGradient(for category: PrayerPlanCategory) -> LinearGradient {
        switch category {
        case .wisdom:
            return LinearGradient(
                colors: [AppColors.voltLime.opacity(0.92), AppColors.electricCyan.opacity(0.30)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .psalms:
            return LinearGradient(
                colors: [AppColors.electricCyan.opacity(0.88), AppColors.voltLime.opacity(0.22)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gospel:
            return LinearGradient(
                colors: [AppColors.premiumGold.opacity(0.90), AppColors.voltLime.opacity(0.26)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gratitude:
            return LinearGradient(
                colors: [AppColors.activityPink.opacity(0.92), AppColors.premiumGold.opacity(0.28)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .family:
            return LinearGradient(
                colors: [AppColors.electricCyan.opacity(0.88), AppColors.premiumGold.opacity(0.58)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .encouragement:
            return LinearGradient(
                colors: [AppColors.voltLime.opacity(0.88), AppColors.activityPink.opacity(0.62)],
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

    var brandAccent: Color {
        switch self {
        case .wisdom:
            return AppColors.voltLime
        case .psalms:
            return AppColors.electricCyan
        case .gospel:
            return AppColors.premiumGold
        case .gratitude:
            return AppColors.activityPink
        case .family:
            return AppColors.electricCyan
        case .encouragement:
            return AppColors.voltLime
        }
    }

    var brandGradient: LinearGradient {
        BrandGradients.planGradient(for: self)
    }
}

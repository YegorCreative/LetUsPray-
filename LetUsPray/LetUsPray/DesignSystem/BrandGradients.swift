import SwiftUI

enum BrandGradients {
    static let primaryHero = LinearGradient(
        colors: [
            AppColors.prayerBlue.opacity(0.72),
            AppColors.faithTurquoise.opacity(0.58),
            AppColors.goldAccent.opacity(0.34)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let progressCard = LinearGradient(
        colors: [
            AppColors.faithTurquoise.opacity(0.62),
            AppColors.prayerBlue.opacity(0.50),
            AppColors.softIvory.opacity(0.16)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let streakCard = LinearGradient(
        colors: [
            AppColors.deepMaroon.opacity(0.62),
            AppColors.goldAccent.opacity(0.44),
            AppColors.prayerBlue.opacity(0.22)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let planCard = LinearGradient(
        colors: [
            AppColors.prayerBlue.opacity(0.44),
            AppColors.faithTurquoise.opacity(0.34),
            AppColors.deepMaroon.opacity(0.18)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let onboardingCard = LinearGradient(
        colors: [
            AppColors.softIvory.opacity(0.24),
            AppColors.warmCream.opacity(0.14),
            AppColors.goldAccent.opacity(0.24)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static func planGradient(for category: PrayerPlanCategory) -> LinearGradient {
        switch category {
        case .wisdom:
            return LinearGradient(
                colors: [AppColors.faithTurquoise.opacity(0.70), AppColors.prayerBlue.opacity(0.28)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .psalms:
            return LinearGradient(
                colors: [AppColors.prayerBlue.opacity(0.68), AppColors.softIvory.opacity(0.16)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gospel:
            return LinearGradient(
                colors: [AppColors.goldAccent.opacity(0.70), AppColors.warmCream.opacity(0.20)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gratitude:
            return LinearGradient(
                colors: [AppColors.deepMaroon.opacity(0.70), AppColors.goldAccent.opacity(0.26)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .family:
            return LinearGradient(
                colors: [AppColors.faithTurquoise.opacity(0.68), AppColors.goldAccent.opacity(0.34)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .encouragement:
            return LinearGradient(
                colors: [AppColors.prayerBlue.opacity(0.68), AppColors.deepMaroon.opacity(0.34)],
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
            return AppColors.faithTurquoise
        case .psalms:
            return AppColors.prayerBlue
        case .gospel:
            return AppColors.goldAccent
        case .gratitude:
            return AppColors.deepMaroon
        case .family:
            return AppColors.faithTurquoise
        case .encouragement:
            return AppColors.prayerBlue
        }
    }

    var brandGradient: LinearGradient {
        BrandGradients.planGradient(for: self)
    }
}

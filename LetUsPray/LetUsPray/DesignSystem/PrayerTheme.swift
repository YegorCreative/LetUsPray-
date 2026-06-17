import SwiftUI

enum PrayerTheme {
    static let pageGradient = LinearGradient(
        colors: [
            AppColors.deepGraphite,
            AppColors.cardDarkSurface,
            AppColors.deepGraphite.opacity(0.96)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let heroGradient = BrandGradients.activityHero

    static let buttonGradient = LinearGradient(
        colors: [AppColors.voltLime, AppColors.voltLime],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct PrayerBackground: View {
    var body: some View {
        ZStack {
            PrayerTheme.pageGradient
                .ignoresSafeArea()

            AppColors.deepGraphite.opacity(0.42)
                .ignoresSafeArea()

            Circle()
                .fill(AppColors.voltLime.opacity(0.20))
                .frame(width: 320, height: 320)
                .blur(radius: 54)
                .offset(x: -120, y: -260)

            Circle()
                .fill(AppColors.electricCyan.opacity(0.18))
                .frame(width: 280, height: 280)
                .blur(radius: 56)
                .offset(x: 150, y: 260)

            Circle()
                .fill(AppColors.activityPink.opacity(0.18))
                .frame(width: 220, height: 220)
                .blur(radius: 42)
                .offset(x: 120, y: -120)

            Circle()
                .fill(AppColors.premiumGold.opacity(0.13))
                .frame(width: 250, height: 250)
                .blur(radius: 52)
                .offset(x: -150, y: 240)
        }
        .allowsHitTesting(false)
    }
}

struct PrayerSurfaceModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .background(
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .fill(AppColors.glassFill)
                    )
                    .overlay {
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.10),
                                        AppColors.electricCyan.opacity(0.07),
                                        AppColors.voltLime.opacity(0.04),
                                        .clear
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .stroke(AppColors.glassStroke, lineWidth: 1)
                    }
                    .shadow(color: AppColors.shadow, radius: 26, x: 0, y: 16)
                    .shadow(color: AppColors.electricCyan.opacity(0.10), radius: 20, x: 0, y: 10)
                    .shadow(color: AppColors.voltLime.opacity(0.06), radius: 16, x: 0, y: 6)
            )
    }
}

extension View {
    func prayerSurface() -> some View {
        modifier(PrayerSurfaceModifier())
    }
}

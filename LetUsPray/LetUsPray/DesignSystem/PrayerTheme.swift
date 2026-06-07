import SwiftUI

enum PrayerTheme {
    static let pageGradient = LinearGradient(
        colors: [
            AppColors.twilight,
            AppColors.deepMaroon.opacity(0.72),
            AppColors.prayerBlue.opacity(0.70),
            AppColors.faithTurquoise.opacity(0.50)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let heroGradient = BrandGradients.primaryHero

    static let buttonGradient = LinearGradient(
        colors: [AppColors.prayerBlue, AppColors.faithTurquoise, AppColors.goldAccent.opacity(0.86)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct PrayerBackground: View {
    var body: some View {
        ZStack {
            PrayerTheme.pageGradient
                .ignoresSafeArea()

            AppColors.warmCream.opacity(0.06)
                .ignoresSafeArea()

            Circle()
                .fill(AppColors.faithTurquoise.opacity(0.20))
                .frame(width: 320, height: 320)
                .blur(radius: 40)
                .offset(x: -120, y: -260)

            Circle()
                .fill(AppColors.prayerBlue.opacity(0.18))
                .frame(width: 280, height: 280)
                .blur(radius: 44)
                .offset(x: 150, y: 260)

            Circle()
                .fill(AppColors.goldAccent.opacity(0.16))
                .frame(width: 220, height: 220)
                .blur(radius: 32)
                .offset(x: 120, y: -120)

            Circle()
                .fill(AppColors.deepMaroon.opacity(0.18))
                .frame(width: 250, height: 250)
                .blur(radius: 48)
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
                                        AppColors.softIvory.opacity(0.20),
                                        AppColors.faithTurquoise.opacity(0.06),
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
                    .shadow(color: AppColors.prayerBlue.opacity(0.08), radius: 18, x: 0, y: 8)
            )
    }
}

extension View {
    func prayerSurface() -> some View {
        modifier(PrayerSurfaceModifier())
    }
}

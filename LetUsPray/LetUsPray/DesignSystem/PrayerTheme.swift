import SwiftUI

enum PrayerTheme {
    static let pageGradient = LinearGradient(
        colors: [
            AppColors.midnight,
            AppColors.twilight,
            AppColors.dawn.opacity(0.88)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let heroGradient = LinearGradient(
        colors: [
            AppColors.accent.opacity(0.46),
            AppColors.secondaryAccent.opacity(0.30),
            AppColors.prayerGold.opacity(0.22)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let buttonGradient = LinearGradient(
        colors: [AppColors.accentStrong, AppColors.secondaryAccent],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct PrayerBackground: View {
    var body: some View {
        ZStack {
            PrayerTheme.pageGradient
                .ignoresSafeArea()

            Circle()
                .fill(AppColors.accent.opacity(0.16))
                .frame(width: 320, height: 320)
                .blur(radius: 40)
                .offset(x: -120, y: -260)

            Circle()
                .fill(AppColors.secondaryAccent.opacity(0.14))
                .frame(width: 280, height: 280)
                .blur(radius: 44)
                .offset(x: 150, y: 260)

            Circle()
                .fill(AppColors.prayerGold.opacity(0.12))
                .frame(width: 220, height: 220)
                .blur(radius: 32)
                .offset(x: 120, y: -120)
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
                    .overlay {
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [AppColors.glassHighlight, .clear],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .stroke(AppColors.glassStroke, lineWidth: 1)
                    }
                    .shadow(color: AppColors.shadow, radius: 22, x: 0, y: 14)
            )
    }
}

extension View {
    func prayerSurface() -> some View {
        modifier(PrayerSurfaceModifier())
    }
}

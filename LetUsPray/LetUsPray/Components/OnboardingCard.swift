import SwiftUI

struct OnboardingCard: View {
    let title: String
    let subtitle: String?
    let description: String
    let systemImage: String
    let gradient: LinearGradient
    let isActive: Bool

    var body: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                ZStack {
                    Circle()
                        .fill(gradient)
                        .frame(width: 86, height: 86)
                        .shadow(color: AppColors.shadow.opacity(0.22), radius: 18, x: 0, y: 12)

                    Image(systemName: systemImage)
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                }
                .scaleEffect(isActive ? 1 : 0.94)
                .animation(.spring(response: 0.48, dampingFraction: 0.82), value: isActive)

                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    Text(title)
                        .font(AppTypography.title())
                        .foregroundStyle(AppColors.textPrimary)
                        .fixedSize(horizontal: false, vertical: true)

                    if let subtitle {
                        Text(subtitle)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.goldAccent)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Text(description)
                        .font(AppTypography.body())
                        .foregroundStyle(AppColors.textSecondary)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 360, alignment: .leading)
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(gradient.opacity(0.18))
                .blur(radius: 20)
        )
    }
}

#Preview {
    OnboardingCard(
        title: "Welcome to LetUsPray",
        subtitle: AppMetadata.tagline,
        description: "Discover guided prayer journeys inspired by God's Word.",
        systemImage: "hands.sparkles.fill",
        gradient: BrandGradients.primaryHero,
        isActive: true
    )
    .padding()
    .background(PrayerBackground())
}

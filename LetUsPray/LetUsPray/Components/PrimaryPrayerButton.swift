import SwiftUI

struct PrimaryPrayerButton: View {
    let title: String
    let systemImage: String
    var isSecondary: Bool = false

    var body: some View {
        HStack(spacing: AppSpacing.small) {
            Image(systemName: systemImage)
                .font(.system(size: 16, weight: .semibold))

            Text(title)
                .font(AppTypography.callout())
        }
        .foregroundStyle(AppColors.textPrimary)
        .frame(maxWidth: .infinity)
        .padding(.vertical, AppSpacing.medium)
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous)
                .stroke(AppColors.glassStroke.opacity(isSecondary ? 1 : 0.4), lineWidth: 1)
        }
        .shadow(color: AppColors.shadow.opacity(isSecondary ? 0.18 : 0.26), radius: 16, x: 0, y: 12)
    }

    @ViewBuilder
    private var background: some View {
        if isSecondary {
            RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous)
                .fill(.thinMaterial)
        } else {
            RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous)
                .fill(PrayerTheme.buttonGradient)
        }
    }
}

import SwiftUI

struct EmptyStateView: View {
    let title: String
    let message: String
    let systemImage: String

    var body: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .center, spacing: AppSpacing.medium) {
                Image(systemName: systemImage)
                    .font(.system(size: 34, weight: .medium))
                    .foregroundStyle(AppColors.textSecondary)

                Text(title)
                    .font(AppTypography.title2())
                    .foregroundStyle(AppColors.textPrimary)

                Text(message)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppSpacing.xxLarge)
        }
    }
}

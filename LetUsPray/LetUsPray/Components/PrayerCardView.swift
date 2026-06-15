import SwiftUI

struct PrayerCardView: View {
    let verse: PrayerVerse
    let isSaved: Bool
    let onToggleSaved: () -> Void

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(verse.reference)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.accent)

                        Text("Verse")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                            .textCase(.uppercase)

                        Text(verse.text)
                            .font(AppTypography.body())
                            .foregroundStyle(AppColors.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(4)
                    }

                    Spacer(minLength: AppSpacing.medium)

                    Button(action: onToggleSaved) {
                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(isSaved ? AppColors.prayerGold : AppColors.textSecondary)
                            .padding(10)
                            .background(.thinMaterial, in: Circle())
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(isSaved ? "Remove saved prayer" : "Save prayer")
                }

                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text("Prayer")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                        .textCase(.uppercase)

                    Text(verse.prayer)
                        .font(AppTypography.body())
                        .foregroundStyle(AppColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(4)
                }
            }
        }
    }
}

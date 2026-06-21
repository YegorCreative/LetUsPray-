import SwiftUI

struct PrayerCardView: View {
    let verse: PrayerVerse
    let isSaved: Bool
    let onToggleSaved: () -> Void
    
    private var isClosingPrayer: Bool {
        verse.id.hasSuffix("-closing") || verse.reference.lowercased() == "closing"
    }
    
    private var closingText: String {
        // Remove emoji from the prayer text
        verse.prayer
            .replacingOccurrences(of: "🙏🏻", with: "")
            .replacingOccurrences(of: "🙏", with: "")
            .trimmingCharacters(in: .whitespaces)
    }

    var body: some View {
        GlassCard {
            if isClosingPrayer {
                // Simplified layout for closing prayers
                VStack(alignment: .center, spacing: AppSpacing.medium) {
                    Text(verse.reference)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.accent)
                        .textCase(.uppercase)
                    
                    VStack(spacing: AppSpacing.small) {
                        Text(closingText)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundStyle(AppColors.textPrimary)
                            .multilineTextAlignment(.center)
                        
                        // Use SF Symbol for praying hands that can be styled
                        Image(systemName: "hands.sparkles.fill")
                            .font(.system(size: 32, weight: .medium))
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .frame(maxWidth: .infinity)
                }
            } else {
                // Normal layout for regular prayers
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
                        .contentShape(Rectangle())
                        .accessibilityLabel(isSaved ? "Remove saved prayer" : "Save prayer")
                    }

                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text("Prayer")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                            .textCase(.uppercase)

                        Text(verse.prayer)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundStyle(AppColors.textPrimary)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(5)
                    }
                }
            }
        }
    }
}

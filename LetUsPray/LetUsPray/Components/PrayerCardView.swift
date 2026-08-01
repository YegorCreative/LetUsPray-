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

    /// A single Scripture reading, editorial in style and free of per-verse card chrome —
    /// callers group several of these inside one shared reading surface.
    var body: some View {
        if isClosingPrayer {
            VStack(spacing: AppSpacing.small) {
                Text(verse.reference)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.accent)
                    .textCase(.uppercase)

                Text(closingText)
                    .font(.system(.title3, design: .serif, weight: .medium))
                    .foregroundStyle(AppColors.primaryText)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)

                Image(systemName: "hands.sparkles.fill")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(AppColors.accent)
            }
            .frame(maxWidth: .infinity)
        } else {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack(alignment: .firstTextBaseline) {
                    Text(verse.reference)
                        .font(AppTypography.sectionHeader())
                        .foregroundStyle(AppColors.accent)

                    Spacer(minLength: AppSpacing.medium)

                    Button(action: onToggleSaved) {
                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(isSaved ? AppColors.prayerGold : AppColors.secondaryText)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                    .accessibilityLabel(isSaved ? "Remove saved prayer" : "Save prayer")
                }

                Text(verse.text)
                    .font(.system(.title3, design: .serif))
                    .foregroundStyle(AppColors.primaryText)
                    .lineSpacing(9)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

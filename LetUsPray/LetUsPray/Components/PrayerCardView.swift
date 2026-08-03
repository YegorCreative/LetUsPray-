import SwiftUI

struct PrayerCardView: View {
    let verse: PrayerVerse
    let isSaved: Bool
    let onToggleSaved: () -> Void

    @State private var didCopy = false

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

    private var shareText: String {
        if isClosingPrayer {
            return closingText
        }
        return """
        \(verse.reference)

        “\(verse.text)”

        Prayer

        “\(verse.prayer)”
        """
    }

    private func copyToClipboard() {
        UIPasteboard.general.string = shareText
        withAnimation(.easeInOut(duration: 0.2)) { didCopy = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 0.2)) { didCopy = false }
        }
    }

    private var cardActions: some View {
        HStack(spacing: AppSpacing.small) {
            Button(action: copyToClipboard) {
                Image(systemName: didCopy ? "checkmark" : "doc.on.doc")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(didCopy ? AppColors.success : AppColors.secondaryText)
            }
            .buttonStyle(.plain)
            .contentShape(Rectangle())
            .accessibilityLabel(didCopy ? "Copied" : "Copy verse and prayer")

            ShareLink(item: shareText) {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(AppColors.secondaryText)
            }
            .accessibilityLabel("Share verse and prayer")

            Button(action: onToggleSaved) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(isSaved ? AppColors.prayerGold : AppColors.secondaryText)
            }
            .buttonStyle(.plain)
            .contentShape(Rectangle())
            .accessibilityLabel(isSaved ? "Remove saved prayer" : "Save prayer")
        }
    }

    /// A single Scripture reading with its own prayer — callers wrap each instance in its own card.
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

                    cardActions
                }

                Text(verse.text)
                    .font(.system(.title3, design: .serif))
                    .foregroundStyle(AppColors.primaryText)
                    .lineSpacing(9)
                    .fixedSize(horizontal: false, vertical: true)

                Divider()
                    .opacity(0.5)
                    .padding(.top, AppSpacing.xs)

                // A quiet, low-contrast inset — Scripture stays the loudest thing on the
                // card; Prayer reads as a response held slightly apart, not a second verse.
                VStack(alignment: .leading, spacing: 6) {
                    Text("Prayer")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                        .textCase(.uppercase)

                    Text(verse.prayer)
                        .font(AppTypography.body())
                        .fontWeight(.medium)
                        .foregroundStyle(AppColors.secondaryText)
                        .lineSpacing(7)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(AppSpacing.small)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: AppSpacing.compactCornerRadius, style: .continuous)
                                .fill(Color.primary.opacity(0.05))
                        )
                }
            }
        }
    }
}

import SwiftUI

/// A compact row for a prayer request — calm and quiet, not a social-media post. No author
/// avatar/name (anonymous or not, V1 has no profile system to show one from), no like count.
struct PrayerRequestCard: View {
    let request: PrayerRequest

    var body: some View {
        HStack(alignment: .top, spacing: AppSpacing.medium) {
            Image(systemName: request.category.systemImage)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.accent)
                .frame(width: 40, height: 40)
                .background(AppColors.accent.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(request.category.displayTitle.uppercased())
                        .font(.system(size: 9, weight: .bold))
                        .foregroundStyle(AppColors.tertiaryText)
                    if request.visibility == .private {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundStyle(AppColors.tertiaryText)
                    }
                }

                Text(request.title)
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.primaryText)
                    .lineLimit(2)

                Text(request.description)
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    Text("🙏")
                    Text("\(request.prayerCount) prayed")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                }
                .padding(.top, 2)
            }

            Spacer(minLength: 0)
        }
        .padding(.vertical, AppSpacing.small)
        .accessibilityElement(children: .combine)
    }
}

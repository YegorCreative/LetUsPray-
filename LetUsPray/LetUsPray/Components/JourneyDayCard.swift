import SwiftUI

struct JourneyDayCard: View {
    let day: PrayerDay
    let isCompleted: Bool

    var body: some View {
        GlassCard {
            HStack(alignment: .center, spacing: AppSpacing.medium) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: isCompleted
                                    ? [AppColors.voltLime.opacity(0.92), AppColors.electricCyan.opacity(0.78)]
                                    : [AppColors.glassFill, Color.white.opacity(0.08)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 54, height: 54)

                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(AppColors.textPrimary)
                    } else {
                        Text("\(day.dayNumber)")
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Day \(day.dayNumber)")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.voltLime)

                    Text(day.title)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)

                    Text(day.chapterReference)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)

                    Text(day.summary)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textTertiary)
                        .lineLimit(2)
                }

                Spacer(minLength: AppSpacing.small)

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(AppColors.textTertiary)
            }
        }
    }
}

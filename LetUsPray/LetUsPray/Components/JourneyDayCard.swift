import SwiftUI

struct JourneyDayCard: View {
    let day: PrayerDay
    let isCompleted: Bool

    var body: some View {
        HStack(alignment: .center, spacing: AppSpacing.medium) {
            ZStack {
                Circle()
                    .fill(isCompleted ? AppColors.voltLime.opacity(0.92) : AppColors.glassFill)
                    .frame(width: 46, height: 46)

                if isCompleted {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(AppColors.textPrimary)
                } else {
                    Text("\(day.dayNumber)")
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Day \(day.dayNumber)")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.voltLime)

                Text(day.title)
                    .font(AppTypography.cardTitle())
                    .foregroundStyle(AppColors.textPrimary)
                    .lineLimit(1)

                Text(day.chapterReference)
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineLimit(1)
            }

            Spacer(minLength: AppSpacing.small)

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(AppColors.textTertiary)
        }
    }
}

import SwiftUI

struct JourneyProgressCard: View {
    let planTitle: String
    let completedDays: Int
    let totalDays: Int
    var accent: Color = AppColors.faithTurquoise
    var gradient: LinearGradient = BrandGradients.progressCard

    private var progress: Double {
        guard totalDays > 0 else { return 0 }
        return min(max(Double(completedDays) / Double(totalDays), 0), 1)
    }

    private var percentageLabel: String {
        "\(Int((progress * 100).rounded()))%"
    }

    var body: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Journey Progress")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.goldAccent)
                            .textCase(.uppercase)

                        Text(planTitle)
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                    }

                    Spacer()

                    Text(percentageLabel)
                        .font(AppTypography.title2())
                        .foregroundStyle(accent)
                }

                Text("\(completedDays) of \(totalDays) Days Completed")
                    .font(AppTypography.callout())
                    .foregroundStyle(AppColors.textSecondary)

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(AppColors.glassFill)
                            .frame(height: 10)

                        Capsule()
                            .fill(gradient)
                            .frame(width: max(22, geometry.size.width * progress), height: 10)
                    }
                }
                .frame(height: 10)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(gradient.opacity(0.20))
                .blur(radius: 18)
        )
    }
}

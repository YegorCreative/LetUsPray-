import SwiftUI

struct PlansView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                planHeader

                ForEach(viewModel.plan.days) { day in
                    NavigationLink {
                        PrayerDetailView(day: day, savedVerseIDs: $savedVerseIDs)
                    } label: {
                        JourneyDayCard(day: day, isCompleted: completedDayNumbers.contains(day.dayNumber))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var planHeader: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text("Prayer Plans")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.prayerGold)
                    .textCase(.uppercase)

                Text(viewModel.plan.title)
                    .font(AppTypography.title())
                    .foregroundStyle(AppColors.textPrimary)

                Text(viewModel.plan.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                HStack(spacing: AppSpacing.small) {
                    Label("30 Days", systemImage: "calendar")
                    Label("Wisdom Journey", systemImage: "sparkles")
                }
                .font(AppTypography.footnote())
                .foregroundStyle(AppColors.textSecondary)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PlansView(
            viewModel: PrayerPlanViewModel(),
            completedDayNumbers: .constant([]),
            savedVerseIDs: .constant([])
        )
    }
}

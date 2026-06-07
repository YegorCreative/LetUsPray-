import SwiftUI

struct PlansView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                featuredSection
                browseSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Featured Plan")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            ForEach(viewModel.featuredPlans) { plan in
                NavigationLink {
                    PlanDetailView(
                        plan: plan,
                        isActive: activePlanID == plan.id,
                        onStartJourney: {
                            activePlanID = plan.id
                            viewModel.setActivePlan(id: plan.id)
                        }
                    )
                } label: {
                    planCard(for: plan, isFeatured: true)
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var browseSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Browse Plans")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            ForEach(viewModel.allPlans) { plan in
                NavigationLink {
                    PlanDetailView(
                        plan: plan,
                        isActive: activePlanID == plan.id,
                        onStartJourney: {
                            activePlanID = plan.id
                            viewModel.setActivePlan(id: plan.id)
                        }
                    )
                } label: {
                    planCard(for: plan, isFeatured: false)
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func planCard(for plan: PrayerPlan, isFeatured: Bool) -> some View {
        let accent = plan.category.brandAccent
        let gradient = plan.category.brandGradient

        return GlassCard(padding: isFeatured ? AppSpacing.heroPadding : AppSpacing.large) {
            HStack(alignment: .center, spacing: AppSpacing.medium) {
                ZStack {
                    RoundedRectangle(cornerRadius: isFeatured ? 22 : 18, style: .continuous)
                        .fill(gradient)
                        .frame(width: isFeatured ? 64 : 54, height: isFeatured ? 64 : 54)

                    Image(systemName: plan.category.brandIcon)
                        .font(.system(size: isFeatured ? 26 : 20, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                }

                VStack(alignment: .leading, spacing: 7) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(plan.title)
                            .font(isFeatured ? AppTypography.title2() : AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)

                        if activePlanID == plan.id {
                            Text("Active")
                                .font(AppTypography.caption())
                                .foregroundStyle(accent)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(AppColors.softIvory.opacity(0.12), in: Capsule())
                                .overlay {
                                    Capsule()
                                        .stroke(accent.opacity(0.34), lineWidth: 1)
                                }
                        }
                    }

                    Text(plan.subtitle)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)

                    HStack(spacing: AppSpacing.small) {
                        Label("\(plan.durationDays) Days", systemImage: "calendar")
                        Label(plan.category.displayTitle, systemImage: plan.category.brandIcon)
                    }
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textTertiary)
                }

                Spacer(minLength: AppSpacing.small)

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(accent.opacity(0.86))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(gradient.opacity(isFeatured ? 0.24 : 0.14))
                .blur(radius: isFeatured ? 18 : 14)
        )
    }

}

#Preview {
    NavigationStack {
        PlansView(
            viewModel: PrayerPlanViewModel(),
            activePlanID: .constant(ProverbsPrayerData.plan.id),
            completedDayNumbers: .constant([]),
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

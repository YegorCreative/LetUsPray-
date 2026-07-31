import SwiftUI

struct PlansView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    
    @State private var showPsalmsOverview = false
    
    private func isPsalmsCollection(_ plan: PrayerPlan) -> Bool {
        plan.category == .psalms
    }

    private func progress(for plan: PrayerPlan, showAsOverview: Bool) -> PrayerPlanProgress {
        let completedDays: Int

        if showAsOverview {
            completedDays = analytics.completedDaysByPlan
                .filter { $0.key.hasPrefix("psalms-") }
                .values
                .reduce(0, +)
        } else if activePlanID == plan.id {
            completedDays = completedDayNumbers
                .intersection(Set(plan.days.map(\.dayNumber)))
                .count
        } else {
            completedDays = analytics.completedDaysByPlan[plan.id] ?? 0
        }

        return PrayerPlanProgress(
            completedDays: completedDays,
            totalDays: plan.durationDays
        )
    }

    var body: some View {
        PrayerCollectionsView(
            viewModel: viewModel,
            activePlanID: $activePlanID,
            completedDayNumbers: $completedDayNumbers,
            completedDayNumbersForPlan: completedDayNumbersForPlan,
            savedVerseIDs: $savedVerseIDs,
            analytics: $analytics
        )
    }

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Featured Plan")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            ForEach(viewModel.featuredPlans) { plan in
                if isPsalmsCollection(plan) {
                    // Show special Psalms overview for any Psalms collection
                    Button {
                        showPsalmsOverview = true
                    } label: {
                        planCard(for: plan, isFeatured: true, showAsOverview: true)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                } else {
                    NavigationLink {
                        PlanDetailView(
                            plan: plan,
                            isActive: activePlanID == plan.id,
                            completedDayNumbers: $completedDayNumbers,
                            savedVerseIDs: $savedVerseIDs,
                            analytics: $analytics,
                            onStartJourney: {
                                activePlanID = plan.id
                                viewModel.setActivePlan(id: plan.id)
                            }
                        )
                    } label: {
                        planCard(for: plan, isFeatured: true, showAsOverview: false)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                }
            }
        }
    }

    private var browseSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Browse Plans")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            ForEach(viewModel.allPlans) { plan in
                if isPsalmsCollection(plan) {
                    // Show special Psalms overview for any Psalms collection
                    Button {
                        showPsalmsOverview = true
                    } label: {
                        planCard(for: plan, isFeatured: false, showAsOverview: true)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                } else {
                    NavigationLink {
                        PlanDetailView(
                            plan: plan,
                            isActive: activePlanID == plan.id,
                            completedDayNumbers: $completedDayNumbers,
                            savedVerseIDs: $savedVerseIDs,
                            analytics: $analytics,
                            onStartJourney: {
                                activePlanID = plan.id
                                viewModel.setActivePlan(id: plan.id)
                            }
                        )
                    } label: {
                        planCard(for: plan, isFeatured: false, showAsOverview: false)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                }
            }
        }
    }

    private func planCard(for plan: PrayerPlan, isFeatured: Bool, showAsOverview: Bool = false) -> some View {
        let accent = plan.category.brandAccent
        let gradient = plan.category.brandGradient
        let planProgress = progress(for: plan, showAsOverview: showAsOverview)
        
        // For Psalms overview, show special title
        let displayTitle = showAsOverview ? "Psalms Journey" : plan.title
        let displaySubtitle = showAsOverview ? "Explore 10 collections of worship and prayer" : plan.subtitle
        let displayDays = showAsOverview ? "150 Psalms" : "\(plan.durationDays) Days"
        let progressUnit = showAsOverview ? "Psalms" : "Days"
        let isPreviewCard = plan.isPreviewPlaceholder && !showAsOverview
        let displayStatus = isPreviewCard ? "Preview" : planProgress.status.rawValue
        let accessibilityProgress = isPreviewCard ? "" : ", \(planProgress.percentage) percent complete"

        return GlassCard(padding: isFeatured ? AppSpacing.heroPadding : AppSpacing.large) {
            HStack(alignment: .center, spacing: AppSpacing.medium) {
                ZStack {
                    RoundedRectangle(cornerRadius: isFeatured ? 22 : 18, style: .continuous)
                        .fill(gradient)
                        .frame(width: isFeatured ? 64 : 54, height: isFeatured ? 64 : 54)

                    Image(systemName: plan.id == ProverbsPrayerData.plan.id ? plan.coverIcon : plan.category.brandIcon)
                        .font(.system(size: isFeatured ? 26 : 20, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                }

                VStack(alignment: .leading, spacing: 7) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(displayTitle)
                            .font(isFeatured ? AppTypography.title2() : AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(displayStatus)
                            .font(AppTypography.caption())
                            .foregroundStyle(planProgress.status == .completed ? AppColors.prayerGold : accent)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(AppColors.cardDarkSurface.opacity(0.72), in: Capsule())
                            .overlay {
                                Capsule()
                                    .stroke(accent.opacity(0.34), lineWidth: 1)
                            }
                    }

                    if !showAsOverview && activePlanID == plan.id {
                        Text("Active Journey")
                            .font(AppTypography.caption())
                            .foregroundStyle(accent)
                    }

                    Text(displaySubtitle)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)

                    HStack(spacing: AppSpacing.small) {
                        Label(displayDays, systemImage: "calendar")
                        Label(plan.category.displayTitle, systemImage: plan.category.brandIcon)
                    }
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textTertiary)

                    if !isPreviewCard {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("\(planProgress.completedDays) of \(planProgress.totalDays) \(progressUnit)")
                                    .font(AppTypography.caption())
                                    .foregroundStyle(AppColors.textTertiary)

                                Spacer(minLength: AppSpacing.small)

                                Text("\(planProgress.percentage)%")
                                    .font(AppTypography.caption())
                                    .foregroundStyle(accent)
                            }

                            ProgressView(value: planProgress.fractionCompleted)
                                .tint(accent)
                        }
                    }
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
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "\(displayTitle), \(displaySubtitle), \(plan.category.displayTitle), \(displayDays), \(displayStatus)\(accessibilityProgress)"
        )
        .accessibilityHint(showAsOverview ? "Opens the Psalms collections." : "Opens plan details.")
    }

}

#Preview {
    NavigationStack {
        PlansView(
            viewModel: PrayerPlanViewModel(),
            activePlanID: .constant(ProverbsPrayerData.plan.id),
            completedDayNumbers: .constant([]),
            completedDayNumbersForPlan: { _ in .constant([]) },
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

import SwiftUI

struct PlanDetailView: View {
    let plan: PrayerPlan
    let isActive: Bool
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    let onStartJourney: () -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                coverSection
                metadataSection
                if !plan.isPreviewPlaceholder {
                    progressSection
                }
                actionSection
                if !plan.days.isEmpty {
                    journeyDaysSection
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var planAccent: Color {
        plan.category.brandAccent
    }

    private var planProgress: PrayerPlanProgress {
        let activeCompletedDays = completedDayNumbers
            .intersection(Set(plan.days.map(\.dayNumber)))
            .count

        return PrayerPlanProgress(
            completedDays: isActive
                ? activeCompletedDays
                : analytics.completedDaysByPlan[plan.id] ?? 0,
            totalDays: plan.durationDays
        )
    }

    private var nextJourneyDay: PrayerDay? {
        plan.days.first(where: { !completedDayNumbers.contains($0.dayNumber) })
            ?? plan.days.last
    }

    private var displayStatus: String {
        if plan.isPreviewPlaceholder {
            return "Preview"
        }
        if planProgress.status == .completed {
            return PrayerPlanProgress.Status.completed.rawValue
        }
        if isActive {
            return "Active · \(planProgress.status.rawValue)"
        }
        return planProgress.status.rawValue
    }

    private var coverSection: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius + 6, style: .continuous)
                .fill(plan.category.brandGradient)
                .overlay {
                    RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius + 6, style: .continuous)
                        .fill(BrandGradients.onboardingCard.opacity(0.28))
                }
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(AppColors.voltLime.opacity(0.24))
                        .frame(width: 150, height: 150)
                        .blur(radius: 24)
                        .offset(x: 46, y: -54)
                }
                .shadow(color: planAccent.opacity(0.24), radius: 28, x: 0, y: 18)

            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(plan.category.displayTitle)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textPrimary.opacity(0.86))
                            .textCase(.uppercase)

                        Text(plan.title)
                            .font(AppTypography.title())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(plan.subtitle)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Spacer()

                    Image(systemName: plan.id == ProverbsPrayerData.plan.id ? plan.coverIcon : plan.category.brandIcon)
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                        .frame(width: 78, height: 78)
                        .background(AppColors.cardDarkSurface.opacity(0.36), in: Circle())
                        .overlay {
                            Circle()
                                .stroke(AppColors.glassStroke, lineWidth: 1)
                        }
                }

                HStack(spacing: AppSpacing.medium) {
                    metadataPill(title: "Status", value: displayStatus)
                    metadataPill(title: "Focus", value: plan.category.displayTitle)
                }
            }
            .padding(AppSpacing.heroPadding)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .stroke(AppColors.glassStroke, lineWidth: 1)
            }
            .padding(AppSpacing.small)
        }
    }


    private var metadataSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text(plan.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                HStack(spacing: AppSpacing.medium) {
                    metadataPill(title: "Category", value: plan.category.displayTitle)
                    metadataPill(title: "Duration", value: "\(plan.durationDays) Days")
                }
            }
        }
    }

    private var progressSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack {
                    Text("Journey Progress")
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)

                    Spacer()

                    Text("\(planProgress.percentage)%")
                        .font(AppTypography.headline())
                        .foregroundStyle(planAccent)
                }

                ProgressView(value: planProgress.fractionCompleted)
                    .tint(planAccent)
                    .accessibilityLabel("Journey progress")
                    .accessibilityValue("\(planProgress.percentage) percent complete")

                ViewThatFits(in: .horizontal) {
                    HStack(spacing: AppSpacing.medium) {
                        metadataPill(title: "Total", value: "\(planProgress.totalDays) Days")
                        metadataPill(title: "Progress", value: "\(planProgress.completedDays) Days")
                        metadataPill(title: "Remaining", value: "\(planProgress.remainingDays) Days")
                    }

                    VStack(spacing: AppSpacing.small) {
                        metadataPill(title: "Total", value: "\(planProgress.totalDays) Days")
                        metadataPill(title: "Progress", value: "\(planProgress.completedDays) Days")
                        metadataPill(title: "Remaining", value: "\(planProgress.remainingDays) Days")
                    }
                }

                if planProgress.status == .notStarted {
                    Text("Your journey is ready when you are. Begin with the first prayer and move at a peaceful pace.")
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }

    private var actionSection: some View {
        VStack(spacing: AppSpacing.medium) {
            if plan.days.isEmpty {
                EmptyStateView(
                    title: "Coming Soon",
                    message: "This prayer journey is being prepared with the same premium guided experience. You’ll be able to begin it in a future release.",
                    systemImage: "sparkles"
                )
            } else if planProgress.status == .completed {
                PrimaryPrayerButton(
                    title: "Journey Completed",
                    systemImage: "checkmark.circle.fill",
                    isSecondary: true
                )
                .accessibilityLabel("Journey completed")
            } else if isActive, let nextJourneyDay {
                NavigationLink {
                    PrayerDetailView(
                        plan: plan,
                        day: nextJourneyDay,
                        completedDayNumbers: $completedDayNumbers,
                        savedVerseIDs: $savedVerseIDs,
                        analytics: $analytics
                    )
                } label: {
                    PrimaryPrayerButton(
                        title: "Continue Journey",
                        systemImage: "arrow.right.circle.fill"
                    )
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                .accessibilityHint("Opens the next prayer in this journey.")
            } else {
                Button(action: onStartJourney) {
                    PrimaryPrayerButton(
                        title: planProgress.status == .notStarted ? "Start Journey" : "Continue Journey",
                        systemImage: planProgress.status == .notStarted ? "play.circle.fill" : "arrow.right.circle.fill"
                    )
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                .accessibilityHint("Sets this as your active prayer journey.")
            }
        }
    }

    private var journeyDaysSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Journey Days")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            ForEach(plan.days) { day in
                NavigationLink {
                    PrayerDetailView(
                        plan: plan,
                        day: day,
                        completedDayNumbers: $completedDayNumbers,
                        savedVerseIDs: $savedVerseIDs,
                        analytics: $analytics
                    )
                } label: {
                    JourneyDayCard(day: day, isCompleted: completedDayNumbers.contains(day.dayNumber))
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
            }
        }
    }

    private func metadataPill(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)
            Text(value)
                .font(AppTypography.footnote())
                .foregroundStyle(AppColors.textPrimary)
        }
        .padding(.vertical, AppSpacing.small)
        .padding(.horizontal, AppSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(AppColors.glassStroke, lineWidth: 1)
        }
    }
}

#Preview {
    NavigationStack {
        PlanDetailView(
            plan: ProverbsPrayerData.plan,
            isActive: true,
            completedDayNumbers: .constant([]),
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:])),
            onStartJourney: {}
        )
    }
}

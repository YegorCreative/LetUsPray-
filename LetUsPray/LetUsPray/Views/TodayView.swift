import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var prayerStreak: PrayerStreak
    @Binding var analytics: PrayerAnalyticsSnapshot
    let latestCompletedPrayer: HomePrayerActivity?
    let latestSavedPrayer: HomePrayerActivity?
    let latestStartedJourney: HomeJourneyActivity?
    let prayerCompletionDates: [Date]
    let onOpenDay: (PrayerDay) -> Void
    let onStartJourney: (PrayerPlan) -> Void
    let onOpenPlan: (PrayerPlan) -> Void
    let onOpenPlans: () -> Void
    let onOpenSaved: () -> Void
    let onOpenSearch: () -> Void
    @AppStorage(PrayerStorageKeys.savedJourneyIDs) private var savedJourneyIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.favoriteJourneyIDs) private var favoriteJourneyIDsRawValue = ""

    private var activePlan: PrayerPlan { viewModel.activePlan }
    private var planAccent: Color { activePlan.category.brandAccent }
    private var savedJourneyIDs: Set<String> { PrayerStorageCodec.decodeStringSet(savedJourneyIDsRawValue) }
    private var favoriteJourneyIDs: Set<String> { PrayerStorageCodec.decodeStringSet(favoriteJourneyIDsRawValue) }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.xLarge) {
                greetingSection

                if activePlan.supportsJourneyStart {
                    let nextDay = viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers, in: activePlan)
                    continuePrayerCard(for: nextDay)
                    progressSummary
                    streakSection
                } else {
                    EmptyStateView(
                        title: "A prayer journey is on its way",
                        message: "(activePlan.title) is available as a preview and will become prayer-ready in a future release.",
                        systemImage: activePlan.coverIcon
                    )
                }

                recommendationsSection
                recentActivitySection
                quickActionsSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var greetingSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(viewModel.greeting())
                .font(AppTypography.screenTitle())
                .foregroundStyle(AppColors.primaryText)

            Text(Date.now.formatted(date: .complete, time: .omitted))
                .font(AppTypography.metadata())
                .foregroundStyle(AppColors.tertiaryText)

            Text(dailyEncouragement)
                .font(AppTypography.secondaryBody())
                .foregroundStyle(AppColors.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, AppSpacing.small)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(viewModel.greeting()). \(Date.now.formatted(date: .complete, time: .omitted)). \(dailyEncouragement)")
    }

    private var dailyEncouragement: String {
        prayerStreak.currentStreak > 0
            ? "You’re on a (prayerStreak.currentStreak)-day prayer journey."
            : "Today is a gentle place to begin your prayer journey."
    }

    private func continuePrayerCard(for day: PrayerDay) -> some View {
        let completed = viewModel.completedCount(completedDayNumbers: completedDayNumbers, in: activePlan)
        let total = max(activePlan.days.count, activePlan.durationDays)
        let remaining = max(0, total - completed)
        let minutes = remaining * max(5, min(15, activePlan.durationDays / 2))
        let isStarted = completed > 0

        return GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                        Text(isStarted ? "Continue Journey" : "Today's Prayer")
                            .font(AppTypography.caption())
                            .foregroundStyle(planAccent)
                            .textCase(.uppercase)

                        Text(day.title)
                            .font(AppTypography.screenTitle())
                            .foregroundStyle(AppColors.primaryText)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(activePlan.title)
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.secondaryText)
                    }

                    Spacer(minLength: AppSpacing.small)

                    Image(systemName: activePlan.coverIcon)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 54, height: 54)
                        .background(activePlan.category.brandGradient, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .accessibilityHidden(true)
                }

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: AppSpacing.medium) {
                    homeStat("Session", value: "\(min(completed + 1, total)) of \(total)")
                    homeStat("Remaining", value: "\(minutes) min")
                    if let latestStartedJourney {
                        homeStat("Last opened", value: latestStartedJourney.date.formatted(date: .abbreviated, time: .omitted))
                    }
                }

                Button { onOpenDay(day) } label: {
                    PrimaryPrayerButton(
                        title: isStarted ? "Continue Prayer" : "Start Today's Prayer",
                        systemImage: "arrow.right.circle.fill"
                    )
                }
                .buttonStyle(.plain)
                .accessibilityHint(isStarted ? "Resumes your current prayer journey." : "Opens today's prayer.")
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(activePlan.category.brandGradient.opacity(0.12))
        )
        .accessibilityElement(children: .contain)
    }

    private var progressSummary: some View {
        let journeyPlans = viewModel.availableJourneyPlans.filter { !$0.days.isEmpty }
        let completedJourneys = journeyPlans.filter {
            PrayerPlanProgress(completedDays: analytics.completedDaysByPlan[$0.id] ?? 0, totalDays: $0.days.count).status == .completed
        }.count
        let completion = journeyPlans.isEmpty ? 0 : Int((Double(completedJourneys) / Double(journeyPlans.count) * 100).rounded())
        let activeTitle = activePlan.title

        return GlassCard(padding: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack {
                    Text("Your Prayer Progress")
                        .font(AppTypography.sectionHeader())
                        .foregroundStyle(AppColors.primaryText)
                    Spacer()
                    Text("\(completion)%")
                        .font(AppTypography.cardTitle())
                        .foregroundStyle(AppColors.accent)
                }

                ProgressView(value: Double(completion), total: 100)
                    .tint(AppColors.accent)

                HStack(spacing: AppSpacing.small) {
                    homeStat("Streak", value: "\(prayerStreak.currentStreak) days")
                    homeStat("Completed", value: "\(completedJourneys)")
                    homeStat("Active", value: activeTitle)
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Prayer progress, (completion) percent complete. (prayerStreak.currentStreak) day streak. (completedJourneys) journeys completed. Active journey (activeTitle).")
    }

    private var streakSection: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: "flame.fill")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(AppColors.warning)
                .frame(width: 44, height: 44)
                .background(AppColors.warning.opacity(0.14), in: Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(prayerStreak.badgeText)
                    .font(AppTypography.cardTitle())
                    .foregroundStyle(AppColors.primaryText)
                Text(prayerStreak.encouragementText)
                    .font(AppTypography.metadata())
                    .foregroundStyle(AppColors.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer()
        }
        .padding(AppSpacing.medium)
        .background(AppColors.surface, in: RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous))
        .overlay { RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous).stroke(AppColors.separator, lineWidth: 1) }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Prayer streak. (prayerStreak.currentStreak) days. (prayerStreak.encouragementText)")
    }

    private var allJourneys: [PrayerJourney] {
        PrayerJourneyCatalog.collections.flatMap { PrayerJourneyCatalog.journeys(in: $0.id, plans: viewModel.allPlans) }
    }

    private var recommendationSections: PrayerJourneyRecommendationSections {
        PrayerJourneyRecommendationService.sections(
            journeys: allJourneys,
            completedDaysByPlan: analytics.completedDaysByPlan,
            activePlanID: analytics.activePlanID
        )
    }

    private var recommendationsSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            if let recommended = recommendationSections.recommended.first {
                sectionHeader("Recommended Journey")
                journeyCard(recommended, actionTitle: "Explore")
            }

            if let seasonal = recommendationSections.seasonal.first,
               seasonal.id != recommendationSections.recommended.first?.id {
                sectionHeader("Seasonal Journey")
                journeyCard(seasonal, actionTitle: "Explore")
            }
        }
    }

    private func journeyCard(_ journey: PrayerJourney, actionTitle: String) -> some View {
        let accent = AppColors.planAccent(named: journey.accentColorName)
        return Button { onOpenPlan(journey.plan) } label: {
            GlassCard(padding: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    Image(systemName: journey.heroImageName)
                        .foregroundStyle(accent)
                        .frame(width: 44, height: 44)
                        .background(accent.opacity(0.13), in: RoundedRectangle(cornerRadius: 14, style: .continuous))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(journey.title)
                            .font(AppTypography.cardTitle())
                            .foregroundStyle(AppColors.primaryText)
                        Text(journey.subtitle)
                            .font(AppTypography.metadata())
                            .foregroundStyle(AppColors.secondaryText)
                            .lineLimit(2)
                    }

                    Spacer(minLength: AppSpacing.small)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(accent)
                        .accessibilityHidden(true)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("(journey.title), (journey.subtitle)")
        .accessibilityHint("(actionTitle)s this journey.")
    }

    private var prayerInsights: PrayerInsights {
        PrayerInsightsService.make(
            journeys: allJourneys,
            completedDaysByPlan: analytics.completedDaysByPlan,
            streak: prayerStreak,
            completedPrayerCount: analytics.completedPrayersCount,
            savedJourneyIDs: savedJourneyIDs,
            favoriteJourneyIDs: favoriteJourneyIDs,
            prayerCompletionDates: prayerCompletionDates,
            latestCompletedPrayer: latestCompletedPrayer,
            latestStartedJourney: latestStartedJourney
        )
    }

    private var recentActivitySection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            sectionHeader("Recent Activity")
            if recentActivities.isEmpty {
                EmptyStateView(
                    title: "Your prayer story begins here",
                    message: "Complete a prayer or begin a journey to see your recent activity.",
                    systemImage: "clock.arrow.circlepath"
                )
            } else {
                GlassCard(padding: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        ForEach(recentActivities) { activity in
                            HStack(spacing: AppSpacing.medium) {
                                Image(systemName: activity.systemImage)
                                    .foregroundStyle(AppColors.accent)
                                    .frame(width: 34, height: 34)
                                    .background(AppColors.accent.opacity(0.12), in: Circle())
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(activity.title)
                                        .font(AppTypography.metadata())
                                        .foregroundStyle(AppColors.primaryText)
                                    Text(activity.detail)
                                        .font(AppTypography.caption())
                                        .foregroundStyle(AppColors.secondaryText)
                                }
                                Spacer(minLength: 0)
                            }
                        }
                    }
                }
            }
        }
    }

    private var recentActivities: [HomeActivityItem] {
        var items: [HomeActivityItem] = []
        if let activity = latestCompletedPrayer {
            items.append(.init(id: "completed", title: "Prayer completed", detail: "(activity.scriptureReference) · (activity.journeyName)", date: activity.date, systemImage: "checkmark.circle.fill"))
        }
        if let activity = latestSavedPrayer {
            items.append(.init(id: "saved", title: "Prayer saved", detail: "(activity.scriptureReference) · (activity.journeyName)", date: activity.date, systemImage: "bookmark.fill"))
        }
        if let activity = latestStartedJourney {
            items.append(.init(id: "started", title: "Journey opened", detail: activity.journeyName, date: activity.date, systemImage: "book.pages.fill"))
        }
        return items.sorted { $0.date > $1.date }.prefix(3).map { $0 }
    }

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            sectionHeader("Quick Actions")
            HStack(spacing: AppSpacing.small) {
                quickAction("Browse Plans", systemImage: "books.vertical.fill", action: onOpenPlans)
                quickAction("Search", systemImage: "magnifyingglass", action: onOpenSearch)
                quickAction("Library", systemImage: "bookmark.fill", action: onOpenSaved)
                NavigationLink { PrayerInsightsView(insights: prayerInsights) } label: {
                    quickActionLabel("Insights", systemImage: "chart.xyaxis.line")
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func quickAction(_ title: String, systemImage: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            quickActionLabel(title, systemImage: systemImage)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
    }

    private func quickActionLabel(_ title: String, systemImage: String) -> some View {
        VStack(spacing: AppSpacing.xSmall) {
            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(AppColors.accent)
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.primaryText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, minHeight: 68)
        .padding(.vertical, AppSpacing.small)
        .background(AppColors.surface, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay { RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(AppColors.separator, lineWidth: 1) }
    }

    private func continueJourney() {
        guard activePlan.supportsJourneyStart else { onOpenPlans(); return }
        onOpenDay(viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers, in: activePlan))
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(AppTypography.sectionHeader())
            .foregroundStyle(AppColors.primaryText)
    }

    private func homeStat(_ title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
            Text(value)
                .font(AppTypography.metadata())
                .foregroundStyle(AppColors.primaryText)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct HomeActivityItem: Identifiable {
    let id: String
    let title: String
    let detail: String
    let date: Date
    let systemImage: String
}

#Preview {
    TodayView(
        viewModel: PrayerPlanViewModel(),
        completedDayNumbers: .constant([]),
        savedVerseIDs: .constant([]),
        prayerStreak: .constant(.empty),
        analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:])),
        latestCompletedPrayer: nil,
        latestSavedPrayer: nil,
        latestStartedJourney: nil,
        prayerCompletionDates: [],
        onOpenDay: { _ in },
        onStartJourney: { _ in },
        onOpenPlan: { _ in },
        onOpenPlans: {},
        onOpenSaved: {},
        onOpenSearch: {}
    )
}

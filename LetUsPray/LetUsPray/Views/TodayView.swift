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
    @AppStorage(PrayerStorageKeys.achievementUnlockDates) private var achievementUnlockDatesRawValue = "{}"

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
                    statsStrip
                } else {
                    EmptyStateView(
                        title: "A prayer journey is on its way",
                        message: "\(activePlan.title) is available as a preview and will become prayer-ready in a future release.",
                        systemImage: activePlan.coverIcon
                    )
                }

                compactPrayerCalendarSection
                faithMilestoneSection
                recommendationsSection
                recentActivitySection
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
            ? "You’re on a \(prayerStreak.currentStreak)-day prayer journey."
            : "Today is a gentle place to begin your prayer journey."
    }

    private func continuePrayerCard(for day: PrayerDay) -> some View {
        let completed = viewModel.completedCount(completedDayNumbers: completedDayNumbers, in: activePlan)
        let total = max(activePlan.days.count, activePlan.durationDays)
        let remaining = max(0, total - completed)
        let minutes = remaining * max(5, min(15, activePlan.durationDays / 2))
        let isStarted = completed > 0

        // A "nice green card," not a "nice gradient": one flat color, no hue transition.
        // Replaces the previous green→blue diagonal `category.brandGradient` locally,
        // without touching the shared `BrandGradients.swift` (Phase X scope).
        return HeroCard(gradient: AppColors.accent) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                        Text(isStarted ? "Continue Journey" : "Today's Prayer")
                            .font(AppTypography.caption())
                            .fontWeight(.bold)
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
                            .textCase(.uppercase)

                        Text(day.title)
                            .font(AppTypography.largeDisplay())
                            .foregroundStyle(AppColors.brightTextOnAccent)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(activePlan.title)
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
                    }

                    Spacer(minLength: AppSpacing.small)

                    Image(systemName: activePlan.coverIcon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 46, height: 46)
                        .background(Color.white.opacity(0.18), in: Circle())
                        .accessibilityHidden(true)
                }

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.92))
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)

                HStack(spacing: AppSpacing.xLarge) {
                    heroStat("Session", value: "\(min(completed + 1, total)) of \(total)")
                    heroStat("Remaining", value: "\(minutes) min")
                    Spacer(minLength: 0)
                }

                Button { onOpenDay(day) } label: {
                    HStack(spacing: AppSpacing.small) {
                        Text(isStarted ? "Continue Prayer" : "Start Today's Prayer")
                            .font(AppTypography.callout())
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 14, weight: .bold))
                    }
                    .foregroundStyle(AppColors.accent)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, AppSpacing.medium)
                    .background(AppColors.elevatedSurface, in: RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous))
                }
                .buttonStyle(.plain)
                .accessibilityHint(isStarted ? "Resumes your current prayer journey." : "Opens today's prayer.")
            }
        }
        .accessibilityElement(children: .contain)
    }

    private func heroStat(_ title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.68))
            Text(value)
                .font(AppTypography.cardTitle())
                .foregroundStyle(AppColors.brightTextOnAccent)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
    }

    private var statsStrip: some View {
        let journeyPlans = viewModel.availableJourneyPlans.filter { !$0.days.isEmpty }
        let completedJourneys = journeyPlans.filter {
            PrayerPlanProgress(completedDays: analytics.completedDaysByPlan[$0.id] ?? 0, totalDays: $0.days.count).status == .completed
        }.count
        let completion = journeyPlans.isEmpty ? 0 : Int((Double(completedJourneys) / Double(journeyPlans.count) * 100).rounded())

        return GroupedCard {
            NavigationLink {
                PrayerInsightsView(insights: prayerInsights)
            } label: {
                GroupedRow {
                    HStack(alignment: .center, spacing: AppSpacing.medium) {
                        progressRingIcon("chart.line.uptrend.xyaxis", progress: Double(completion) / 100)
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("Prayer Progress")
                                    .font(AppTypography.cardTitle())
                                    .foregroundStyle(AppColors.primaryText)
                                Spacer()
                                Text("\(completion)%")
                                    .font(AppTypography.cardTitle())
                                    .foregroundStyle(AppColors.accent)
                            }
                            ProgressView(value: Double(completion), total: 100)
                                .tint(AppColors.accent)
                        }
                    }
                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Prayer Progress, \(completion) percent complete")
            .accessibilityHint("Opens prayer insights.")

            GroupedRow(showsDivider: false) {
                HStack(alignment: .center, spacing: AppSpacing.medium) {
                    statIcon("flame.fill", tint: AppColors.warning)
                    VStack(alignment: .leading, spacing: 3) {
                        Text(prayerStreak.badgeText)
                            .font(AppTypography.cardTitle())
                            .foregroundStyle(AppColors.primaryText)
                        Text(prayerStreak.encouragementText)
                            .font(AppTypography.metadata())
                            .foregroundStyle(AppColors.secondaryText)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(2)
                    }
                    Spacer(minLength: AppSpacing.small)
                    Text("\(completedJourneys)")
                        .font(AppTypography.screenTitle())
                        .foregroundStyle(AppColors.tertiaryText)
                    Text("done")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("\(prayerStreak.currentStreak) day streak. \(completedJourneys) journeys completed.")
            }
        }
    }

    private var achievementProgress: AchievementProgress {
        let journeyPlans = viewModel.availableJourneyPlans.filter { !$0.days.isEmpty }
        let completedJourneyCount = journeyPlans.filter {
            PrayerPlanProgress(completedDays: analytics.completedDaysByPlan[$0.id] ?? 0, totalDays: $0.days.count).status == .completed
        }.count

        return AchievementProgress(
            completedPrayerCount: analytics.completedDaysByPlan.values.reduce(0, +),
            longestStreak: prayerStreak.longestStreak,
            completedJourneyCount: completedJourneyCount,
            savedPrayerCount: savedVerseIDs.count
        )
    }

    private var faithMilestones: [Achievement] {
        let unlockDates = PrayerStorageCodec.decodeValue([String: Date].self, from: achievementUnlockDatesRawValue) ?? [:]
        return AchievementService().achievements(unlockDates: unlockDates, progress: achievementProgress)
    }

    /// Most recently earned Faith Milestone if one exists; otherwise the nearest one still ahead.
    @ViewBuilder
    private var faithMilestoneSection: some View {
        if let mostRecent = faithMilestones.filter(\.isUnlocked).max(by: { ($0.unlockDate ?? .distantPast) < ($1.unlockDate ?? .distantPast) }) {
            faithMilestoneCard(mostRecent, isEarned: true)
        } else if let nearest = faithMilestones.filter({ !$0.isUnlocked }).max(by: { $0.fractionComplete < $1.fractionComplete }) {
            faithMilestoneCard(nearest, isEarned: false)
        }
    }

    private func faithMilestoneCard(_ milestone: Achievement, isEarned: Bool) -> some View {
        NavigationLink {
            FaithMilestonesView()
        } label: {
            GroupedCard {
                GroupedRow(showsDivider: false) {
                    HStack(alignment: .center, spacing: AppSpacing.medium) {
                        statIcon(milestone.systemImage, tint: AppColors.accent)
                        VStack(alignment: .leading, spacing: 3) {
                            Text(isEarned ? "Faith Milestone Earned" : "Next Faith Milestone")
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.tertiaryText)
                                .textCase(.uppercase)
                            Text(milestone.title)
                                .font(AppTypography.cardTitle())
                                .foregroundStyle(AppColors.primaryText)
                            if isEarned {
                                Text(milestone.description)
                                    .font(AppTypography.metadata())
                                    .foregroundStyle(AppColors.secondaryText)
                                    .lineLimit(2)
                            } else {
                                ProgressView(value: milestone.fractionComplete)
                                    .tint(AppColors.accent)
                                Text("\(milestone.progress) of \(milestone.target)")
                                    .font(AppTypography.caption())
                                    .foregroundStyle(AppColors.tertiaryText)
                            }
                        }
                        Spacer(minLength: 0)
                    }
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(isEarned ? "Faith Milestone earned: \(milestone.title)" : "Next Faith Milestone: \(milestone.title), \(milestone.progress) of \(milestone.target)")
        .accessibilityHint("Opens Faith Milestones.")
    }

    private var compactPrayerCalendarSection: some View {
        NavigationLink {
            PrayerCalendarView(prayerCompletionDates: prayerCompletionDates)
        } label: {
            PrayerCalendarStrip(prayerCompletionDates: prayerCompletionDates, prayerStreak: prayerStreak)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Prayer Calendar")
        .accessibilityHint("Opens the full prayer calendar. \(prayerStreak.badgeText).")
    }

    private func statIcon(_ systemImage: String, tint: Color) -> some View {
        Image(systemName: systemImage)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(tint)
            .frame(width: 34, height: 34)
            .background(tint.opacity(0.14), in: Circle())
    }

    private func progressRingIcon(_ systemImage: String, progress: Double) -> some View {
        ZStack {
            ProgressRingView(progress: progress, lineWidth: 4)
                .frame(width: 34, height: 34)
            Image(systemName: systemImage)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)
        }
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

    private struct RecommendationItem: Identifiable {
        let id: String
        let kicker: String
        let journey: PrayerJourney
    }

    /// Pulls from every existing recommendation category (already deduplicated against each
    /// other and against the active journey by `PrayerJourneyRecommendationService`) instead
    /// of just the first "recommended" and first "seasonal" entry, so the carousel reliably
    /// has enough cards to browse. No new recommendation logic, no invented data.
    private var recommendationItems: [RecommendationItem] {
        var seenIDs = Set<String>()
        var items: [RecommendationItem] = []

        func add(_ journeys: [PrayerJourney], kicker: String) {
            for journey in journeys where !seenIDs.contains(journey.id) {
                seenIDs.insert(journey.id)
                items.append(.init(id: journey.id, kicker: kicker, journey: journey))
            }
        }

        add(recommendationSections.recommended, kicker: "Recommended")
        add(recommendationSections.featured, kicker: "Popular")
        add(recommendationSections.seasonal, kicker: "Seasonal")
        add(recommendationSections.newToYou, kicker: "New")

        return Array(items.prefix(6))
    }

    @ViewBuilder
    private var recommendationsSection: some View {
        let items = recommendationItems
        if !items.isEmpty {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                sectionHeader("Discover Next")
                HorizontalShelf {
                    ForEach(items) { item in
                        shelfJourneyCard(item.journey, kicker: item.kicker)
                    }
                }
            }
        }
    }

    /// Reuses `HeroCard` (now that it accepts any `Background: View`) at a fixed, much
    /// smaller width instead of introducing a second card design. Background is a flat
    /// per-journey accent color — a solid color, not a gradient.
    private func shelfJourneyCard(_ journey: PrayerJourney, kicker: String) -> some View {
        let accent = AppColors.planAccent(named: journey.accentColorName)
        return Button { onOpenPlan(journey.plan) } label: {
            HeroCard(gradient: accent) {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    HStack(alignment: .top) {
                        Image(systemName: journey.heroImageName)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(AppColors.brightTextOnAccent)
                        Spacer(minLength: AppSpacing.xs)
                        Text(kicker.uppercased())
                            .font(.system(size: 9, weight: .bold))
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.85))
                    }

                    Spacer(minLength: AppSpacing.xs)

                    Text(journey.title)
                        .font(AppTypography.cardTitle())
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(journey.subtitle)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.85))
                        .lineLimit(2)
                }
            }
            .frame(width: 156)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(journey.title), \(kicker). \(journey.subtitle)")
        .accessibilityHint("Explores this journey.")
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
                GroupedCard {
                    ForEach(Array(recentActivities.enumerated()), id: \.element.id) { index, activity in
                        GroupedRow(showsDivider: index < recentActivities.count - 1) {
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
            items.append(.init(id: "completed", title: "Prayer completed", detail: "\(activity.scriptureReference) · \(activity.journeyName)", date: activity.date, systemImage: "checkmark.circle.fill"))
        }
        if let activity = latestSavedPrayer {
            items.append(.init(id: "saved", title: "Prayer saved", detail: "\(activity.scriptureReference) · \(activity.journeyName)", date: activity.date, systemImage: "bookmark.fill"))
        }
        if let activity = latestStartedJourney {
            items.append(.init(id: "started", title: "Journey opened", detail: activity.journeyName, date: activity.date, systemImage: "book.pages.fill"))
        }
        return items.sorted { $0.date > $1.date }.prefix(3).map { $0 }
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

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

    private var activePlan: PrayerPlan {
        viewModel.activePlan
    }

    private var planAccent: Color {
        activePlan.category.brandAccent
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                greetingSection

                if activePlan.supportsJourneyStart {
                    let nextDay = viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers, in: activePlan)
                    let completedCount = viewModel.completedCount(completedDayNumbers: completedDayNumbers, in: activePlan)

                    JourneyProgressCard(
                        planTitle: activePlan.title,
                        completedDays: completedCount,
                        totalDays: activePlan.durationDays,
                        accent: planAccent,
                        gradient: activePlan.category.brandGradient
                    )

                    heroCard(for: nextDay)
                    streakCard
                } else {
                    EmptyStateView(
                        title: "Coming Soon",
                        message: "\(activePlan.title) is available as a preview plan and will become fully prayer-ready in a future release.",
                        systemImage: activePlan.coverIcon
                    )
                }

                recommendedJourneySection
                recentActivitySection
                quickActionsSection
                prayerCalendarSection
                prayerThemesSection
                searchEntry
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var greetingSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(viewModel.greeting())
                .font(AppTypography.caption())
                .foregroundStyle(planAccent)
                .textCase(.uppercase)

            Text(AppMetadata.appName)
                .font(AppTypography.largeTitle())
                .foregroundStyle(AppColors.textPrimary)

            Text(AppMetadata.tagline)
                .font(AppTypography.callout())
                .italic()
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)

            Text(activePlan.subtitle)
                .font(AppTypography.callout())
                .foregroundStyle(AppColors.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, AppSpacing.small)
    }

    private func heroCard(for day: PrayerDay) -> some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(activePlan.title)
                            .font(AppTypography.caption())
                            .foregroundStyle(planAccent)
                            .textCase(.uppercase)

                        Text(day.title)
                            .font(AppTypography.title())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(day.chapterReference)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.textSecondary)
                    }

                    Spacer()

                    Image(systemName: activePlan.coverIcon)
                        .font(.system(size: 28, weight: .medium))
                        .foregroundStyle(AppColors.textPrimary)
                        .padding(14)
                        .background(activePlan.category.brandGradient, in: Circle())
                }

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                HStack(spacing: AppSpacing.medium) {
                    statPill(title: "Category", value: activePlan.category.displayTitle)
                    statPill(title: "Saved", value: "\(savedVerseIDs.count) prayers")
                }

                Button(action: { onOpenDay(day) }) {
                    PrimaryPrayerButton(title: "Open Today's Prayer", systemImage: "arrow.right.circle.fill")
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(activePlan.category.brandGradient.opacity(0.22))
                .blur(radius: 18)
        )
    }

    private var streakCard: some View {
        GlassCard {
            HStack(alignment: .center, spacing: AppSpacing.medium) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(AppColors.textPrimary)
                    .frame(width: 48, height: 48)
                    .background(BrandGradients.streakGlow, in: RoundedRectangle(cornerRadius: 16, style: .continuous))

                VStack(alignment: .leading, spacing: 6) {
                    Text(prayerStreak.badgeText)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)

                    Text(prayerStreak.encouragementText)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(analytics.completedDaysByPlan[activePlan.id] ?? 0)")
                        .font(AppTypography.title())
                        .foregroundStyle(AppColors.premiumGold)

                    Text("prayed")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(BrandGradients.streakGlow.opacity(0.18))
                .blur(radius: 16)
        )
    }

    @ViewBuilder
    private var recommendedJourneySection: some View {
        if let recommendation = viewModel.recommendedPlan(completedDaysByPlan: analytics.completedDaysByPlan) {
            sectionHeader("Recommended Journey")

            GlassCard {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    HStack(alignment: .top, spacing: AppSpacing.medium) {
                        Image(systemName: recommendation.coverIcon)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(AppColors.textPrimary)
                            .frame(width: 50, height: 50)
                            .background(recommendation.category.brandGradient, in: RoundedRectangle(cornerRadius: 17, style: .continuous))

                        VStack(alignment: .leading, spacing: 5) {
                            Text(recommendation.title)
                                .font(AppTypography.headline())
                                .foregroundStyle(AppColors.textPrimary)

                            Text(recommendation.subtitle)
                                .font(AppTypography.footnote())
                                .foregroundStyle(AppColors.textSecondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }

                    HStack(spacing: AppSpacing.medium) {
                        statPill(title: "Duration", value: "\(recommendation.durationDays) days")
                        statPill(title: "Category", value: recommendation.category.displayTitle)
                    }

                    Button {
                        onStartJourney(recommendation)
                    } label: {
                        PrimaryPrayerButton(title: "Start Journey", systemImage: "arrow.right.circle.fill")
                    }
                    .buttonStyle(.plain)
                    .accessibilityHint("Makes \(recommendation.title) your current journey.")
                }
            }
        }
    }

    private var recentActivitySection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            sectionHeader("Recent Activity")

            if latestCompletedPrayer == nil && latestSavedPrayer == nil && latestStartedJourney == nil {
                EmptyStateView(
                    title: "Your prayer story begins here.",
                    message: "Complete a prayer or save a verse, and your recent activity will appear here.",
                    systemImage: "clock.arrow.circlepath"
                )
            } else {
                GlassCard {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        if let latestCompletedPrayer {
                            prayerActivityRow(
                                title: "Last prayer completed",
                                activity: latestCompletedPrayer,
                                systemImage: "checkmark.circle.fill"
                            )
                        }

                        if let latestSavedPrayer {
                            prayerActivityRow(
                                title: "Last saved prayer",
                                activity: latestSavedPrayer,
                                systemImage: "bookmark.fill"
                            )
                        }

                        if let latestStartedJourney {
                            activityRow(
                                title: "Last journey started",
                                detail: "\(latestStartedJourney.journeyName) • \(latestStartedJourney.date.formatted(date: .abbreviated, time: .omitted))",
                                systemImage: "book.pages.fill"
                            )
                        }
                    }
                }
            }
        }
    }

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            sectionHeader("Quick Actions")

            HStack(spacing: AppSpacing.small) {
                quickAction(
                    title: "Continue",
                    systemImage: "arrow.right.circle.fill",
                    action: continueJourney
                )
                quickAction(title: "Plans", systemImage: "books.vertical.fill", action: onOpenPlans)
                quickAction(title: "Saved", systemImage: "bookmark.fill", action: onOpenSaved)
            }
        }
    }

    private var prayerCalendarSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            sectionHeader("Prayer Calendar")

            GlassCard {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    HStack {
                        Text("Recent days")
                            .font(AppTypography.footnote())
                            .foregroundStyle(AppColors.textSecondary)

                        Spacer()

                        Text("\(prayerStreak.currentStreak) day streak")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.premiumGold)
                    }

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: AppSpacing.small), count: 7), spacing: AppSpacing.small) {
                        ForEach(recentCalendarDays, id: \.self) { date in
                            calendarDay(date)
                        }
                    }
                }
            }
        }
    }

    private var prayerThemesSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            sectionHeader("Prayer Themes")

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: AppSpacing.small) {
                ForEach(themePlans) { plan in
                    Button {
                        onOpenPlan(plan)
                    } label: {
                        HStack(spacing: AppSpacing.small) {
                            Image(systemName: plan.category.brandIcon)
                                .foregroundStyle(plan.category.brandAccent)

                            Text(plan.category.displayTitle)
                                .font(AppTypography.footnote())
                                .foregroundStyle(AppColors.textPrimary)
                                .lineLimit(1)

                            Spacer(minLength: 0)
                        }
                        .padding(AppSpacing.medium)
                        .frame(maxWidth: .infinity)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .stroke(AppColors.glassStroke, lineWidth: 1)
                        }
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Open \(plan.category.displayTitle) prayers")
                }
            }
        }
    }

    private var searchEntry: some View {
        NavigationLink {
            HomeSearchPlaceholderView()
        } label: {
            GlassCard {
                HStack(spacing: AppSpacing.medium) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(AppColors.premiumGold)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Search")
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)

                        Text("Find Scripture, themes, and journeys")
                            .font(AppTypography.footnote())
                            .foregroundStyle(AppColors.textSecondary)
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundStyle(AppColors.textTertiary)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityHint("Opens the search preview.")
    }

    private var themePlans: [PrayerPlan] {
        var seenCategories: Set<PrayerPlanCategory> = []
        return viewModel.allPlans.filter { plan in
            seenCategories.insert(plan.category).inserted
        }
    }

    private var recentCalendarDays: [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        return (0..<14).compactMap { offset in
            calendar.date(byAdding: .day, value: offset - 13, to: today)
        }
    }

    private func wasPrayed(on date: Date) -> Bool {
        let calendar = Calendar.current
        return prayerCompletionDates.contains { calendar.isDate($0, inSameDayAs: date) }
    }

    private func calendarDay(_ date: Date) -> some View {
        let isToday = Calendar.current.isDateInToday(date)
        let isPrayed = wasPrayed(on: date)

        return VStack(spacing: 5) {
            Text(date.formatted(.dateTime.weekday(.narrow)))
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)

            Text(date.formatted(.dateTime.day()))
                .font(AppTypography.footnote())
                .foregroundStyle(isPrayed ? AppColors.brightTextOnAccent : AppColors.textPrimary)
                .frame(width: 32, height: 32)
                .background(isPrayed ? BrandGradients.prayerProgress : LinearGradient(colors: [.clear], startPoint: .top, endPoint: .bottom), in: Circle())
                .overlay {
                    if isToday {
                        Circle()
                            .stroke(AppColors.premiumGold, lineWidth: 2)
                    }
                }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(
            "\(date.formatted(date: .complete, time: .omitted)), \(isPrayed ? "prayed" : "not prayed")\(isToday ? ", today" : "")"
        )
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(AppTypography.headline())
            .foregroundStyle(AppColors.textPrimary)
    }

    private func activityRow(title: String, detail: String, systemImage: String) -> some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: systemImage)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(AppColors.premiumGold)
                .frame(width: 34, height: 34)
                .background(.thinMaterial, in: Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.textPrimary)
                Text(detail)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textSecondary)
            }
        }
    }

    private func prayerActivityRow(title: String, activity: HomePrayerActivity, systemImage: String) -> some View {
        activityRow(
            title: title,
            detail: "\(activity.scriptureReference) • \(activity.journeyName) • \(activity.date.formatted(date: .abbreviated, time: .omitted))",
            systemImage: systemImage
        )
    }

    private func quickAction(title: String, systemImage: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: AppSpacing.small) {
                Image(systemName: systemImage)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(AppColors.premiumGold)

                Text(title)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textPrimary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppSpacing.medium)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(AppColors.glassStroke, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title == "Continue" ? "Continue Journey" : title)
    }

    private func continueJourney() {
        guard activePlan.supportsJourneyStart else {
            onOpenPlans()
            return
        }

        onOpenDay(viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers, in: activePlan))
    }

    private func statPill(title: String, value: String) -> some View {
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
        onOpenSaved: {}
    )
    .background(PrayerBackground())
}

private struct HomeSearchPlaceholderView: View {
    var body: some View {
        VStack(spacing: AppSpacing.large) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 36, weight: .semibold))
                .foregroundStyle(AppColors.premiumGold)

            Text("Search is coming soon")
                .font(AppTypography.title2())
                .foregroundStyle(AppColors.textPrimary)

            Text("A future sprint will make Scripture, prayer themes, and journeys searchable.")
                .font(AppTypography.body())
                .foregroundStyle(AppColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(AppSpacing.xxLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PrayerBackground())
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

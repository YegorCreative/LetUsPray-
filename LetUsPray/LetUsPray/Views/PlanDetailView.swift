import SwiftUI

struct PlanDetailView: View {
    let plan: PrayerPlan
    let isActive: Bool
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    let onStartJourney: () -> Void
    let onViewCollection: () -> Void
    let completedDayNumbersForPlan: ((String) -> Binding<Set<Int>>)?
    let onOpenJourney: (PrayerPlan) -> Void
    @AppStorage(PrayerStorageKeys.savedJourneyIDs) private var savedJourneyIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.favoriteJourneyIDs) private var favoriteJourneyIDsRawValue = ""
    @State private var journeyProgressRecord: PrayerJourneyProgressRecord?

    private var journey: PrayerJourney {
        PrayerJourneyCatalog.journey(for: plan)
    }

    private var isSavedForLater: Bool {
        PrayerStorageCodec.decodeStringSet(savedJourneyIDsRawValue).contains(journey.id)
    }

    private var isMarkedFavorite: Bool {
        PrayerStorageCodec.decodeStringSet(favoriteJourneyIDsRawValue).contains(journey.id)
    }

    private func progressBinding(for planID: String) -> Binding<Set<Int>> {
        completedDayNumbersForPlan?(planID) ?? $completedDayNumbers
    }

    init(
        plan: PrayerPlan,
        isActive: Bool,
        completedDayNumbers: Binding<Set<Int>>,
        savedVerseIDs: Binding<Set<String>>,
        analytics: Binding<PrayerAnalyticsSnapshot>,
        onStartJourney: @escaping () -> Void,
        onViewCollection: @escaping () -> Void = {},
        completedDayNumbersForPlan: ((String) -> Binding<Set<Int>>)? = nil,
        onOpenJourney: @escaping (PrayerPlan) -> Void = { _ in }
    ) {
        self.plan = plan
        self.isActive = isActive
        self._completedDayNumbers = completedDayNumbers
        self._savedVerseIDs = savedVerseIDs
        self._analytics = analytics
        self.onStartJourney = onStartJourney
        self.onViewCollection = onViewCollection
        self.completedDayNumbersForPlan = completedDayNumbersForPlan
        self.onOpenJourney = onOpenJourney
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                heroSection
                actionSection
                progressSection
                journeyOverviewSection
                if !plan.days.isEmpty {
                    journeyDaysSection
                }
                secondaryActionsSection
                recommendationsSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .onAppear {
            journeyProgressRecord = PrayerJourneyProgressStore.record(for: plan.id)
        }
    }

    private var planAccent: Color {
        AppColors.planAccent(named: journey.accentColorName)
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

    private var currentSession: Int {
        nextJourneyDay?.dayNumber ?? journeyProgressRecord?.currentSession ?? 1
    }

    private var displayStatus: String {
        if !journey.isLaunchReady {
            return journey.contentState.rawValue
        }
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

    private var heroSection: some View {
        HeroCard(gradient: plan.category.brandGradient) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    Image(systemName: journey.heroImageName)
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 60, height: 60)
                        .background(Color.white.opacity(0.18), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .accessibilityHidden(true)

                    Spacer(minLength: 0)

                    Text(displayStatus)
                        .font(AppTypography.caption())
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .padding(.horizontal, AppSpacing.small)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.18), in: Capsule())
                }

                Label(journey.collection.title, systemImage: "square.grid.2x2")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.78))
                    .textCase(.uppercase)

                Text(journey.title)
                    .font(AppTypography.largeDisplay())
                    .foregroundStyle(AppColors.brightTextOnAccent)
                    .fixedSize(horizontal: false, vertical: true)

                Text(journey.subtitle)
                    .font(AppTypography.secondaryBody())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.88))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(journey.title), \(journey.subtitle), in \(journey.collection.title), \(displayStatus)")
    }

    private var journeyOverviewSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text(journey.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Move through a thoughtful rhythm of Scripture, reflection, and guided prayer at your own pace.")
                    .font(AppTypography.secondaryBody())
                    .foregroundStyle(AppColors.tertiaryText)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
            }

            GroupedCard {
                overviewRow(title: "Duration", value: durationLabel, systemImage: "calendar", showsDivider: true)
                overviewRow(title: "Prayer Time", value: "\(journey.estimatedPrayerMinutes) min", systemImage: "clock", showsDivider: true)
                overviewRow(title: "Sessions", value: "\(journey.sessionCount)", systemImage: "list.number", showsDivider: true)
                overviewRow(title: "Difficulty", value: journey.difficulty.rawValue, systemImage: "chart.bar.fill", showsDivider: false)
            }
        }
    }

    private func overviewRow(title: String, value: String, systemImage: String, showsDivider: Bool) -> some View {
        GroupedRow(showsDivider: showsDivider) {
            HStack(spacing: AppSpacing.medium) {
                Image(systemName: systemImage)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(planAccent)
                    .frame(width: 30, height: 30)
                    .background(planAccent.opacity(0.14), in: Circle())
                Text(title)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.primaryText)
                Spacer(minLength: AppSpacing.small)
                Text(value)
                    .font(AppTypography.metadata())
                    .foregroundStyle(AppColors.secondaryText)
            }
        }
    }

    private var progressSection: some View {
        GroupedCard {
            GroupedRow(showsDivider: !plan.isPreviewPlaceholder) {
                HStack(spacing: AppSpacing.large) {
                    ZStack {
                        Circle()
                            .stroke(planAccent.opacity(0.16), lineWidth: 8)
                        Circle()
                            .trim(from: 0, to: plan.isPreviewPlaceholder ? 0 : planProgress.fractionCompleted)
                            .stroke(planAccent, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 0.35), value: planProgress.fractionCompleted)
                        Text(plan.isPreviewPlaceholder ? "—" : "\(planProgress.percentage)%")
                            .font(AppTypography.cardTitle())
                            .foregroundStyle(planAccent)
                    }
                    .frame(width: 64, height: 64)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Journey progress")
                    .accessibilityValue(plan.isPreviewPlaceholder ? "Preview" : "\(planProgress.percentage) percent complete")

                    VStack(alignment: .leading, spacing: 4) {
                        Text(planProgress.status == .completed ? "Journey Complete" : "Your Progress")
                            .font(AppTypography.sectionHeader())
                            .foregroundStyle(planProgress.status == .completed ? AppColors.success : AppColors.primaryText)
                        if !plan.isPreviewPlaceholder {
                            Text("\(planProgress.completedDays) of \(planProgress.totalDays) sessions · current session \(currentSession)")
                                .font(AppTypography.metadata())
                                .foregroundStyle(AppColors.secondaryText)
                                .fixedSize(horizontal: false, vertical: true)
                            if let completedDate = journeyProgressRecord?.lastCompletedDate {
                                Text("Completed \(completedDate.formatted(date: .abbreviated, time: .omitted))")
                                    .font(AppTypography.caption())
                                    .foregroundStyle(AppColors.tertiaryText)
                            }
                        } else {
                            Text(displayStatus)
                                .font(AppTypography.metadata())
                                .foregroundStyle(AppColors.secondaryText)
                        }
                    }
                    Spacer(minLength: 0)
                }
            }

            if !plan.isPreviewPlaceholder {
                GroupedRow(showsDivider: false) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        ProgressView(value: planProgress.fractionCompleted)
                            .tint(planAccent)
                            .accessibilityHidden(true)

                        HStack(spacing: AppSpacing.large) {
                            progressStat("Total", value: "\(planProgress.totalDays)")
                            progressStat("Complete", value: "\(planProgress.completedDays)")
                            progressStat("Remaining", value: "\(planProgress.remainingDays)")
                        }

                        if planProgress.status == .notStarted {
                            Text("Your journey is ready when you are. Begin with the first prayer and move at a peaceful pace.")
                                .font(AppTypography.footnote())
                                .foregroundStyle(AppColors.secondaryText)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
        }
    }

    private func progressStat(_ title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(value)
                .font(AppTypography.cardTitle())
                .foregroundStyle(AppColors.primaryText)
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
                Button {
                    completedDayNumbers = []
                    PrayerJourneyProgressStore.restart(planID: plan.id)
                    journeyProgressRecord = PrayerJourneyProgressStore.record(for: plan.id)
                    onStartJourney()
                } label: {
                    PrimaryPrayerButton(
                        title: "Restart Journey",
                        systemImage: "arrow.counterclockwise.circle.fill"
                    )
                }
                .buttonStyle(.plain)
                .accessibilityHint("Clears this journey's completed sessions and starts again.")
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

    private var secondaryActionsSection: some View {
        HStack(spacing: AppSpacing.large) {
            DockAction(
                title: "Save",
                systemImage: isSavedForLater ? "bookmark.fill" : "bookmark",
                tint: isSavedForLater ? AppColors.accent : AppColors.tertiaryText
            ) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    PrayerJourneyLibraryService.setSaved(!isSavedForLater, journeyID: journey.id)
                }
            }
            .accessibilityValue(isSavedForLater ? "Saved" : "Not saved")

            DockAction(
                title: "Favorite",
                systemImage: isMarkedFavorite ? "heart.fill" : "heart",
                tint: isMarkedFavorite ? AppColors.accent : AppColors.tertiaryText
            ) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    PrayerJourneyLibraryService.setFavorite(!isMarkedFavorite, journeyID: journey.id)
                }
            }
            .accessibilityValue(isMarkedFavorite ? "Marked favorite" : "Not marked favorite")

            DockAction(
                title: "Collection",
                systemImage: "square.grid.2x2",
                tint: AppColors.primaryBlue,
                action: onViewCollection
            )
            .accessibilityHint("Opens the collection this journey belongs to.")

            ShareLink(item: "\(journey.title) — \(journey.subtitle)") {
                VStack(spacing: AppSpacing.xs) {
                    ZStack {
                        Circle()
                            .fill(AppColors.tertiaryText.opacity(0.14))
                            .frame(width: 44, height: 44)
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(AppColors.tertiaryText)
                    }
                    Text("Share")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.secondaryText)
                }
                .frame(maxWidth: .infinity)
            }
            .accessibilityLabel("Share")
            .accessibilityHint("Shares this journey's title and description.")
        }
    }

    private var journeyDaysSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Sessions")
                .font(AppTypography.sectionHeader())
                .foregroundStyle(AppColors.primaryText)

            GroupedCard {
                ForEach(Array(plan.days.enumerated()), id: \.element.id) { index, day in
                    NavigationLink {
                        PrayerDetailView(
                            plan: plan,
                            day: day,
                            completedDayNumbers: $completedDayNumbers,
                            savedVerseIDs: $savedVerseIDs,
                            analytics: $analytics
                        )
                    } label: {
                        GroupedRow(showsDivider: index < plan.days.count - 1) {
                            JourneyDayCard(day: day, isCompleted: completedDayNumbers.contains(day.dayNumber))
                        }
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                }
            }
        }
    }

    private struct RecommendationItem: Identifiable {
        let id: String
        let kicker: String
        let journey: PrayerJourney
    }

    @ViewBuilder
    private var recommendationsSection: some View {
        let allJourneys = PrayerJourneyCatalog.collections.flatMap {
            PrayerJourneyCatalog.journeys(in: $0.id, plans: PrayerPlansRepository.allPlans)
        }
        let next = PrayerJourneyRecommendationService.suggestedNext(
            after: journey,
            journeys: allJourneys,
            completedDaysByPlan: analytics.completedDaysByPlan
        )
        let related = PrayerJourneyRecommendationService.related(
            to: journey,
            journeys: allJourneys,
            completedDaysByPlan: analytics.completedDaysByPlan
        )

        let items: [RecommendationItem] = {
            var result: [RecommendationItem] = []
            if let next {
                result.append(.init(id: next.id, kicker: "Suggested Next", journey: next))
            }
            result.append(contentsOf: related.prefix(3).map {
                .init(id: $0.id, kicker: "This Collection", journey: $0)
            })
            return result
        }()

        if !items.isEmpty {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text("Continue Exploring")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                HorizontalShelf {
                    ForEach(items) { item in
                        recommendationShelfCard(item.journey, kicker: item.kicker)
                    }
                }
            }
        }
    }

    private func recommendationShelfCard(_ recommendation: PrayerJourney, kicker: String) -> some View {
        let accent = AppColors.planAccent(named: recommendation.accentColorName)
        return NavigationLink {
            PlanDetailView(
                plan: recommendation.plan,
                isActive: analytics.activePlanID == recommendation.plan.id,
                completedDayNumbers: progressBinding(for: recommendation.plan.id),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics,
                onStartJourney: { onOpenJourney(recommendation.plan) },
                completedDayNumbersForPlan: completedDayNumbersForPlan,
                onOpenJourney: onOpenJourney
            )
        } label: {
            ShelfCard {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    HStack(alignment: .top) {
                        Image(systemName: recommendation.heroImageName)
                            .font(.system(size: 19, weight: .semibold))
                            .foregroundStyle(accent)
                            .frame(width: 42, height: 42)
                            .background(accent.opacity(0.14), in: RoundedRectangle(cornerRadius: 13, style: .continuous))
                        Spacer(minLength: AppSpacing.small)
                        Text(kicker.uppercased())
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(accent)
                    }

                    Spacer(minLength: AppSpacing.xs)

                    Text(recommendation.title)
                        .font(AppTypography.cardTitle())
                        .foregroundStyle(AppColors.primaryText)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(recommendation.subtitle)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.secondaryText)
                        .lineLimit(2)

                    Spacer(minLength: AppSpacing.small)

                    HStack(spacing: 4) {
                        Text("Explore")
                            .font(AppTypography.caption())
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .foregroundStyle(accent)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(recommendation.title), \(recommendation.subtitle)")
    }

    private var durationLabel: String {
        journey.estimatedDurationDays > 0 ? "\(journey.estimatedDurationDays) Days" : "Self-guided"
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

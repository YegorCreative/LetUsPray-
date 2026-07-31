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
                coverSection
                metadataSection
                progressSection
                if planProgress.status == .completed {
                    completionBanner
                }
                actionSection
                secondaryActionsSection
                if !plan.days.isEmpty {
                    journeyDaysSection
                }
                recommendationsSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle(plan.title)
        .navigationBarTitleDisplayMode(.large)
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
                        Text(journey.collection.title)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textPrimary.opacity(0.86))
                            .textCase(.uppercase)

                        Text(journey.title)
                            .font(AppTypography.title())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(journey.subtitle)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Spacer()

                    Image(systemName: journey.heroImageName)
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
                    metadataPill(title: "Focus", value: journey.categoryName)
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
                Text(journey.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                Text("What you'll experience")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                Text("Move through a thoughtful rhythm of Scripture, reflection, and guided prayer at your own pace.")
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.textSecondary)

                HStack(spacing: AppSpacing.medium) {
                    metadataPill(title: "Category", value: journey.categoryName)
                    metadataPill(title: "Sessions", value: "\(journey.sessionCount)")
                }

                HStack(spacing: AppSpacing.medium) {
                    metadataPill(title: "Duration", value: durationLabel)
                    metadataPill(title: "Prayer Time", value: "\(journey.estimatedPrayerMinutes) min")
                }

                HStack(spacing: AppSpacing.small) {
                    badge(journey.difficulty.rawValue, color: planAccent)
                    if journey.isFeatured { badge("Featured", color: planAccent) }
                    if journey.isRecommended { badge("Recommended", color: .green) }
                    if journey.isSeasonal { badge("Seasonal", color: .orange) }
                }
            }
        }
    }

    private var progressSection: some View {
        GlassCard {
            HStack(spacing: AppSpacing.large) {
                ZStack {
                    Circle()
                        .stroke(planAccent.opacity(0.18), lineWidth: 9)
                    Circle()
                        .trim(from: 0, to: plan.isPreviewPlaceholder ? 0 : planProgress.fractionCompleted)
                        .stroke(planAccent, style: StrokeStyle(lineWidth: 9, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 0.35), value: planProgress.fractionCompleted)
                    Text(plan.isPreviewPlaceholder ? "—" : "\(planProgress.percentage)%")
                        .font(AppTypography.headline())
                        .foregroundStyle(planAccent)
                }
                .frame(width: 78, height: 78)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Journey progress")
                .accessibilityValue(plan.isPreviewPlaceholder ? "Preview" : "\(planProgress.percentage) percent complete")

                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text("Journey Progress")
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                    Text(displayStatus)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                    if !plan.isPreviewPlaceholder {
                        Text("\(planProgress.completedDays) of \(planProgress.totalDays) sessions complete")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                        Text("Current session: \(currentSession)")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                        if let completedDate = journeyProgressRecord?.lastCompletedDate {
                            Text("Completed \(completedDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.textTertiary)
                        }
                    }
                }
                Spacer(minLength: 0)
            }

            if !plan.isPreviewPlaceholder {
                ProgressView(value: planProgress.fractionCompleted)
                    .tint(planAccent)
                    .accessibilityHidden(true)

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

    private var completionBanner: some View {
        GlassCard {
            Label("Journey complete", systemImage: "checkmark.seal.fill")
                .font(AppTypography.headline())
                .foregroundStyle(planAccent)
                .accessibilityElement(children: .combine)
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
        ViewThatFits(in: .horizontal) {
            HStack(spacing: AppSpacing.small) {
                secondaryAction("Save", systemImage: isSavedForLater ? "bookmark.fill" : "bookmark") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        PrayerJourneyLibraryService.setSaved(!isSavedForLater, journeyID: journey.id)
                    }
                }
                secondaryAction("Favorite", systemImage: isMarkedFavorite ? "heart.fill" : "heart") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        PrayerJourneyLibraryService.setFavorite(!isMarkedFavorite, journeyID: journey.id)
                    }
                }
                secondaryAction("Collection", systemImage: "square.grid.2x2") {
                    onViewCollection()
                }
                ShareLink(item: "\(journey.title) — \(journey.subtitle)") {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                .buttonStyle(.bordered)
                .tint(planAccent)
                .accessibilityHint("Shares this journey's title and description.")
            }

            VStack(spacing: AppSpacing.small) {
                secondaryAction("Save", systemImage: isSavedForLater ? "bookmark.fill" : "bookmark") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        PrayerJourneyLibraryService.setSaved(!isSavedForLater, journeyID: journey.id)
                    }
                }
                secondaryAction("Favorite", systemImage: isMarkedFavorite ? "heart.fill" : "heart") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        PrayerJourneyLibraryService.setFavorite(!isMarkedFavorite, journeyID: journey.id)
                    }
                }
                secondaryAction("View Collection", systemImage: "square.grid.2x2") {
                    onViewCollection()
                }
                ShareLink(item: "\(journey.title) — \(journey.subtitle)") {
                    Label("Share Journey", systemImage: "square.and.arrow.up")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(planAccent)
            }
        }
    }

    private func secondaryAction(_ title: String, systemImage: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
        .tint(planAccent)
        .accessibilityValue(title == "Save" ? (isSavedForLater ? "Saved" : "Not saved") : (isMarkedFavorite ? "Marked favorite" : "Not marked favorite"))
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

        return VStack(alignment: .leading, spacing: AppSpacing.medium) {
            if let next {
                Text("Suggested Next Journey")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                recommendationLink(next)
            }

            if !related.isEmpty {
                Text("More From This Collection")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                    .padding(.top, next == nil ? 0 : AppSpacing.small)
                ForEach(related) { recommendation in
                    recommendationLink(recommendation)
                }
            }
        }
    }

    private func recommendationLink(_ recommendation: PrayerJourney) -> some View {
        NavigationLink {
            PlanDetailView(
                plan: recommendation.plan,
                isActive: activePlanID(for: recommendation) == recommendation.plan.id,
                completedDayNumbers: progressBinding(for: recommendation.plan.id),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics,
                onStartJourney: { onOpenJourney(recommendation.plan) },
                completedDayNumbersForPlan: completedDayNumbersForPlan,
                onOpenJourney: onOpenJourney
            )
        } label: {
            GlassCard(padding: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    Image(systemName: recommendation.heroImageName)
                        .foregroundStyle(AppColors.planAccent(named: recommendation.accentColorName))
                        .frame(width: 42, height: 42)
                        .background(AppColors.planAccent(named: recommendation.accentColorName).opacity(0.16), in: Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(recommendation.title)
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                        Text(recommendation.subtitle)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(2)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(AppColors.planAccent(named: recommendation.accentColorName))
                }
            }
        }
        .buttonStyle(.plain)
    }

    private func activePlanID(for recommendation: PrayerJourney) -> String {
        analytics.activePlanID
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

    private var durationLabel: String {
        journey.estimatedDurationDays > 0 ? "\(journey.estimatedDurationDays) Days" : "Self-guided"
    }

    private func badge(_ title: String, color: Color) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.14), in: Capsule())
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

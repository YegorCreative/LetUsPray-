import SwiftUI

struct PrayerCollectionsView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    @AppStorage(PrayerStorageKeys.savedJourneyIDs) private var savedJourneyIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.favoriteJourneyIDs) private var favoriteJourneyIDsRawValue = ""
    @State private var searchQuery = ""
    @State private var searchFilters = JourneySearchFilters.empty
    @State private var searchSort: JourneySortOption = .recommended
    @State private var showingFilters = false
    @State private var recentSearches: [String] = []
    @State private var showingComingSoonMessage = false
    @State private var showingPlanSuggestion = false

    private var collections: [JourneyCollection] { PrayerJourneyCatalog.collections }

    var body: some View {
        ScrollView(showsIndicators: false) {
            Group {
                if searchIsActive {
                    searchResultsContent
                } else {
                    discoveryContent
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .navigationTitle("Prayer Journeys")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
        .searchable(text: $searchQuery, prompt: "Search prayer journeys")
        .searchSuggestions {
            if !recentSearches.isEmpty {
                Section("Recent Searches") {
                    ForEach(recentSearches, id: \.self) { recent in
                        Button(recent) { searchQuery = recent }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    showingFilters = true
                } label: {
                    Label("Filter", systemImage: searchFilters.isEmpty ? "line.3.horizontal.decrease.circle" : "line.3.horizontal.decrease.circle.fill")
                }
                Menu {
                    Picker("Sort", selection: $searchSort) {
                        ForEach(JourneySortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
            }
        }
        .sheet(isPresented: $showingFilters) {
            JourneyFilterSheet(filters: $searchFilters)
        }
        .onSubmit(of: .search) {
            let trimmed = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { return }
            recentSearches.removeAll { $0.caseInsensitiveCompare(trimmed) == .orderedSame }
            recentSearches.insert(trimmed, at: 0)
            recentSearches = Array(recentSearches.prefix(5))
        }
    }

    private var searchIsActive: Bool {
        !searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !searchFilters.isEmpty
    }

    private var searchResults: [PrayerJourney] {
        PrayerJourneySearchService.search(
            journeys: allJourneys,
            query: searchQuery,
            filters: searchFilters,
            sort: searchSort,
            completedDaysByPlan: analytics.completedDaysByPlan,
            activePlanID: activePlanID
        )
    }

    private var discoveryContent: some View {
        LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
            intro
            allPlansEntry
            libraryContent
            ForEach(recommendationSections.ordered, id: \.0) { section in
                activitySection(title: section.0, journeys: section.1)
            }
            collectionsShelf
        }
    }

    private var allPlansEntry: some View {
        NavigationLink {
            allPlansList
        } label: {
            InfoCard(padding: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(AppColors.accentCyan)
                        .frame(width: 44, height: 44)
                        .background(AppColors.accentCyan.opacity(0.14), in: RoundedRectangle(cornerRadius: 14, style: .continuous))

                    VStack(alignment: .leading, spacing: 3) {
                        Text("See All Plans")
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)

                        Text("Browse every available prayer plan and journey")
                            .font(AppTypography.footnote())
                            .foregroundStyle(AppColors.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Spacer(minLength: AppSpacing.small)

                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(AppColors.accentCyan)
                        .accessibilityHidden(true)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("See All Plans")
        .accessibilityHint("Opens the complete list of prayer plans and journeys.")
    }

    private var allPlansList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
                if !availableJourneys.isEmpty {
                    planListSection(title: "Available Now") {
                        GroupedCard {
                            ForEach(Array(availableJourneys.enumerated()), id: \.element.id) { index, journey in
                                journeySearchLink(
                                    journey,
                                    showsDivider: index < availableJourneys.count - 1,
                                    showsDescription: true
                                )
                            }
                        }
                    }
                }

                if !comingSoonJourneys.isEmpty {
                    planListSection(title: "Coming Soon") {
                        GroupedCard {
                            ForEach(Array(comingSoonJourneys.enumerated()), id: \.element.id) { index, journey in
                                Button {
                                    showingComingSoonMessage = true
                                } label: {
                                    GroupedRow(showsDivider: index < comingSoonJourneys.count - 1) {
                                        comingSoonRowContent(journey)
                                    }
                                }
                                .buttonStyle(.plain)
                                .accessibilityHint("Shows information about when this plan will be available.")
                            }
                        }
                    }
                }

                suggestionSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle("All Plans")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
        .alert("Coming Soon", isPresented: $showingComingSoonMessage) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("This prayer plan is currently in development and will be available in a future update.")
        }
        .sheet(isPresented: $showingPlanSuggestion) {
            PrayerPlanSuggestionView()
        }
    }

    private var availableJourneys: [PrayerJourney] {
        allJourneys.filter(isAvailable)
    }

    private var comingSoonJourneys: [PrayerJourney] {
        allJourneys.filter { !isAvailable($0) }
    }

    private func isAvailable(_ journey: PrayerJourney) -> Bool {
        if !journey.plan.days.isEmpty || journey.plan.id == "psalms-journey-overview" {
            return true
        }
        return JourneyPlansRepository.planByID(journey.plan.id)?.days.isEmpty == false
    }

    private func planListSection<Content: View>(
        title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(title)
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            content()
        }
    }

    private func comingSoonRowContent(_ journey: PrayerJourney) -> some View {
        HStack(spacing: AppSpacing.medium) {
            journeyArtwork(journey)
            VStack(alignment: .leading, spacing: 4) {
                Text(journey.title)
                    .font(AppTypography.cardTitle())
                    .foregroundStyle(AppColors.primaryText)
                    .fixedSize(horizontal: false, vertical: true)
                Text(journey.description)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Coming Soon")
                    .font(AppTypography.metadata())
                    .foregroundStyle(AppColors.planAccent(named: journey.accentColorName))
            }
            Spacer(minLength: AppSpacing.small)
            Image(systemName: "clock")
                .foregroundStyle(AppColors.tertiaryText)
                .accessibilityHidden(true)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(journey.title), \(journey.description), Coming Soon")
    }

    private var suggestionSection: some View {
        InfoCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text("Looking for something else?")
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                    Text("Don't see the prayer plan you're looking for? We'd love to hear your ideas. Every suggestion helps shape future updates to LetUsPray.")
                        .font(AppTypography.secondaryBody())
                        .foregroundStyle(AppColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Button("Suggest a Prayer Plan") {
                    showingPlanSuggestion = true
                }
                .buttonStyle(.borderedProminent)
                .tint(AppColors.accentCyan)
                .accessibilityHint("Opens a form to suggest a future prayer plan.")
            }
        }
    }

    @ViewBuilder
    private var collectionsShelf: some View {
        if !collections.isEmpty {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("Browse Collections")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                HorizontalShelf {
                    ForEach(collections) { collection in
                        NavigationLink {
                            PrayerCollectionDetailView(
                                collection: collection,
                                viewModel: viewModel,
                                activePlanID: $activePlanID,
                                completedDayNumbers: $completedDayNumbers,
                                completedDayNumbersForPlan: completedDayNumbersForPlan,
                                savedVerseIDs: $savedVerseIDs,
                                analytics: $analytics
                            )
                        } label: {
                            collectionShelfCard(collection)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    private var savedJourneyIDs: Set<String> {
        PrayerStorageCodec.decodeStringSet(savedJourneyIDsRawValue)
    }

    private var favoriteJourneyIDs: Set<String> {
        PrayerStorageCodec.decodeStringSet(favoriteJourneyIDsRawValue)
    }

    private var libraryContent: some View {
        let saved = allJourneys.filter { savedJourneyIDs.contains($0.id) }
        let favorites = allJourneys.filter { favoriteJourneyIDs.contains($0.id) }
        return Group {
            if !saved.isEmpty || !favorites.isEmpty {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text("Your Library")
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                    activitySection(title: "Saved Journeys", journeys: saved)
                    activitySection(title: "Favorite Journeys", journeys: favorites)
                }
            } else {
                EmptyStateView(
                    title: "Build Your Prayer Library",
                    message: "Save journeys you want to return to, or mark a favorite for quick access.",
                    systemImage: "books.vertical"
                )
            }
        }
    }

    private var searchResultsContent: some View {
        LazyVStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack {
                Text("\(searchResults.count) result\(searchResults.count == 1 ? "" : "s")")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                Spacer()
                if !searchQuery.isEmpty || !searchFilters.isEmpty {
                    Button("Clear") {
                        searchQuery = ""
                        searchFilters = .empty
                    }
                    .font(AppTypography.footnote())
                }
            }

            if searchResults.isEmpty {
                EmptyStateView(
                    title: searchQuery.isEmpty ? "No journeys match these filters" : "No journeys found",
                    message: "Try a different search or broaden your filters.",
                    systemImage: "magnifyingglass"
                )
            } else {
                ForEach(groupedSearchResults, id: \.0) { group in
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(group.0)
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                        GroupedCard {
                            ForEach(Array(group.1.enumerated()), id: \.element.id) { index, journey in
                                journeySearchLink(journey, showsDivider: index < group.1.count - 1)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, AppSpacing.large)
        .padding(.top, AppSpacing.medium)
        .padding(.bottom, AppSpacing.xxLarge)
    }

    private var groupedSearchResults: [(String, [PrayerJourney])] {
        let groups = Dictionary(grouping: searchResults) { $0.collection.title }
        return collections.compactMap { collection in
            guard let journeys = groups[collection.title], !journeys.isEmpty else { return nil }
            return (collection.title, journeys)
        }
    }

    private func journeySearchLink(
        _ journey: PrayerJourney,
        showsDivider: Bool = true,
        showsDescription: Bool = false
    ) -> some View {
        NavigationLink {
            PlanDetailView(
                plan: journey.plan,
                isActive: activePlanID == journey.plan.id,
                completedDayNumbers: completedDayNumbersForPlan(journey.plan.id),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics,
                onStartJourney: {
                    activePlanID = journey.plan.id
                    viewModel.setActivePlan(id: journey.plan.id)
                },
                completedDayNumbersForPlan: completedDayNumbersForPlan,
                onOpenJourney: { plan in
                    activePlanID = plan.id
                    viewModel.setActivePlan(id: plan.id)
                }
            )
        } label: {
            GroupedRow(showsDivider: showsDivider) {
                activityRowContent(journey, showsDescription: showsDescription)
            }
        }
        .buttonStyle(.plain)
        .contextMenu { libraryContextMenu(for: journey) }
    }

    private var intro: some View {
        HeroCard(gradient: BrandGradients.activityHero) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("Find a prayer journey for this season of life.")
                    .font(AppTypography.largeDisplay())
                    .foregroundStyle(AppColors.brightTextOnAccent)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Explore Scripture, themes, and gentle rhythms of prayer at your own pace.")
                    .font(AppTypography.secondaryBody())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.88))
                    .fixedSize(horizontal: false, vertical: true)
                Label("Search or browse collections below", systemImage: "magnifyingglass")
                    .font(AppTypography.metadata())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
            }
        }
        .accessibilityElement(children: .combine)
    }

    private var allJourneys: [PrayerJourney] {
        collections.flatMap { PrayerJourneyCatalog.journeys(in: $0.id, plans: viewModel.allPlans) }
    }

    private var recommendationSections: PrayerJourneyRecommendationSections {
        PrayerJourneyRecommendationService.sections(
            journeys: allJourneys,
            completedDaysByPlan: analytics.completedDaysByPlan,
            activePlanID: activePlanID
        )
    }

    private var inProgressJourneys: [PrayerJourney] {
        allJourneys.filter {
            let progress = progress(for: $0)
            return progress.status == .inProgress
        }.sorted {
            (PrayerJourneyProgressStore.record(for: $0.plan.id)?.lastOpenedDate ?? .distantPast)
                > (PrayerJourneyProgressStore.record(for: $1.plan.id)?.lastOpenedDate ?? .distantPast)
        }
    }

    private var completedJourneys: [PrayerJourney] {
        allJourneys.filter { progress(for: $0).status == .completed }
            .sorted {
                (PrayerJourneyProgressStore.record(for: $0.plan.id)?.lastCompletedDate ?? .distantPast)
                    > (PrayerJourneyProgressStore.record(for: $1.plan.id)?.lastCompletedDate ?? .distantPast)
            }
    }

    private var recentlyContinuedSection: some View {
        activitySection(title: "Continue Journey", journeys: Array(inProgressJourneys.prefix(3)))
    }

    private var recentlyCompletedSection: some View {
        activitySection(title: "Recently Completed", journeys: Array(completedJourneys.prefix(3)))
    }

    @ViewBuilder
    private func activitySection(title: String, journeys: [PrayerJourney]) -> some View {
        if !journeys.isEmpty {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text(title)
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                GroupedCard {
                    ForEach(Array(journeys.enumerated()), id: \.element.id) { index, journey in
                        NavigationLink {
                            PlanDetailView(
                                plan: journey.plan,
                                isActive: activePlanID == journey.plan.id,
                                completedDayNumbers: completedDayNumbersForPlan(journey.plan.id),
                                savedVerseIDs: $savedVerseIDs,
                                analytics: $analytics,
                                onStartJourney: {
                                    activePlanID = journey.plan.id
                                    viewModel.setActivePlan(id: journey.plan.id)
                                },
                                completedDayNumbersForPlan: completedDayNumbersForPlan,
                                onOpenJourney: { plan in
                                    activePlanID = plan.id
                                    viewModel.setActivePlan(id: plan.id)
                                }
                            )
                        } label: {
                            GroupedRow(showsDivider: index < journeys.count - 1) {
                                activityRowContent(journey)
                            }
                        }
                        .buttonStyle(.plain)
                        .contextMenu { libraryContextMenu(for: journey) }
                    }
                }
            }
            .transition(.opacity.combined(with: .move(edge: .top)))
        }
    }

    private func activityRowContent(_ journey: PrayerJourney, showsDescription: Bool = false) -> some View {
        let progress = progress(for: journey)
        return Group {
            if dynamicTypeSize.isAccessibilitySize {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    HStack(alignment: .top, spacing: AppSpacing.medium) {
                        journeyArtwork(journey)

                        Text(journey.title)
                            .font(AppTypography.cardTitle())
                            .foregroundStyle(AppColors.primaryText)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    if showsDescription {
                        Text(journey.description)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.secondaryText)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    HStack(alignment: .firstTextBaseline, spacing: AppSpacing.small) {
                        journeyProgressLabel(journey, progress: progress)
                        Spacer(minLength: AppSpacing.small)
                        journeyPercentage(journey, progress: progress)
                    }
                }
            } else {
                HStack(spacing: AppSpacing.medium) {
                    journeyArtwork(journey)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(journey.title)
                            .font(AppTypography.cardTitle())
                            .foregroundStyle(AppColors.primaryText)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                        if showsDescription {
                            Text(journey.description)
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.secondaryText)
                                .lineLimit(3)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        journeyProgressLabel(journey, progress: progress)
                    }
                    Spacer(minLength: AppSpacing.small)
                    journeyPercentage(journey, progress: progress)
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "\(journey.title), \(journey.description), \(journey.estimatedDurationDays > 0 ? "\(journey.estimatedDurationDays) days" : "Self-guided"), \(progress.percentage) percent complete"
        )
        .accessibilityHint("Opens plan details.")
    }

    private func journeyArtwork(_ journey: PrayerJourney) -> some View {
        Image(systemName: journey.heroImageName)
            .foregroundStyle(AppColors.planAccent(named: journey.accentColorName))
            .frame(width: 38, height: 38)
            .background(AppColors.planAccent(named: journey.accentColorName).opacity(0.16), in: Circle())
            .accessibilityHidden(true)
    }

    private func journeyProgressLabel(
        _ journey: PrayerJourney,
        progress: PrayerPlanProgress
    ) -> some View {
        HStack(spacing: AppSpacing.small) {
            Text(progress.status == .completed ? "Completed" : "Session \(nextSession(for: journey)) of \(journey.sessionCount)")
                .font(AppTypography.metadata())
                .foregroundStyle(AppColors.secondaryText)
            Text("· \(journey.estimatedDurationDays > 0 ? "\(journey.estimatedDurationDays) days" : "Self-guided")")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
        }
        .fixedSize(horizontal: false, vertical: true)
    }

    private func journeyPercentage(
        _ journey: PrayerJourney,
        progress: PrayerPlanProgress
    ) -> some View {
        Text("\(progress.percentage)%")
            .font(AppTypography.headline())
            .foregroundStyle(AppColors.planAccent(named: journey.accentColorName))
            .fixedSize()
    }

    @ViewBuilder
    private func libraryContextMenu(for journey: PrayerJourney) -> some View {
        Button {
            PrayerJourneyLibraryService.setSaved(!savedJourneyIDs.contains(journey.id), journeyID: journey.id)
        } label: {
            Label(savedJourneyIDs.contains(journey.id) ? "Remove Saved" : "Save Journey", systemImage: savedJourneyIDs.contains(journey.id) ? "bookmark.slash" : "bookmark")
        }
        Button {
            PrayerJourneyLibraryService.setFavorite(!favoriteJourneyIDs.contains(journey.id), journeyID: journey.id)
        } label: {
            Label(favoriteJourneyIDs.contains(journey.id) ? "Remove Favorite" : "Mark Favorite", systemImage: favoriteJourneyIDs.contains(journey.id) ? "heart.slash" : "heart")
        }
    }

    private func progress(for journey: PrayerJourney) -> PrayerPlanProgress {
        if journey.plan.id == activePlanID {
            return journey.progress(completedSessionNumbers: completedDayNumbers)
        }
        return PrayerPlanProgress(
            completedDays: analytics.completedDaysByPlan[journey.plan.id] ?? 0,
            totalDays: journey.sessionCount
        )
    }

    private func nextSession(for journey: PrayerJourney) -> Int {
        PrayerJourneyProgressStore.record(for: journey.plan.id)?.currentSession ?? (progress(for: journey).completedDays + 1)
    }

    private func collectionShelfCard(_ collection: JourneyCollection) -> some View {
        let journeys = PrayerJourneyCatalog.journeys(in: collection.id, plans: viewModel.allPlans)
        let featured = journeys.first(where: \.isFeatured)
        let accent = featured.map { AppColors.planAccent(named: $0.accentColorName) } ?? AppColors.electricCyan
        let launchReady = journeys.filter(\.isLaunchReady).count

        return ShelfCard {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Image(systemName: featured?.heroImageName ?? collection.iconName)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(accent)
                    .frame(width: 48, height: 48)
                    .background(accent.opacity(0.14), in: RoundedRectangle(cornerRadius: 14, style: .continuous))

                Text(collection.title)
                    .font(AppTypography.cardTitle())
                    .foregroundStyle(AppColors.primaryText)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)

                Text(collection.description)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineLimit(2)

                Spacer(minLength: AppSpacing.small)

                if featured != nil {
                    badge("Featured", color: accent)
                }
                Text("\(journeys.count) journey\(journeys.count == 1 ? "" : "s") · \(launchReady) available")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens the \(collection.title) collection.")
    }

    private func badge(_ title: String, color: Color) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(color)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(color.opacity(0.14), in: Capsule())
    }
}

private struct PrayerPlanSuggestionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var fullName = ""
    @State private var emailAddress = ""
    @State private var planName = ""
    @State private var planDescription = ""
    @State private var allowsCredit = false
    @State private var showingSuccess = false

    private var trimmedName: String {
        fullName.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var emailIsValid: Bool {
        let trimmed = emailAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let atIndex = trimmed.firstIndex(of: "@") else { return false }
        let domain = trimmed[trimmed.index(after: atIndex)...]
        return atIndex != trimmed.startIndex && domain.contains(".") && !domain.hasSuffix(".")
    }

    private var canSubmit: Bool {
        emailIsValid && !planName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var creditBinding: Binding<Bool> {
        Binding(
            get: { allowsCredit && !trimmedName.isEmpty },
            set: { allowsCredit = $0 }
        )
    }

    var body: some View {
        NavigationStack {
            Group {
                if showingSuccess {
                    successContent
                } else {
                    suggestionForm
                }
            }
            .navigationTitle(showingSuccess ? "Thank You!" : "Suggest a Prayer Plan")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if !showingSuccess {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { dismiss() }
                    }
                }
            }
        }
    }

    private var suggestionForm: some View {
        Form {
            Section {
                Text("Help shape the future of LetUsPray.")
                    .font(AppTypography.secondaryBody())
                    .foregroundStyle(AppColors.textSecondary)
            }

            Section {
                TextField("John Smith", text: $fullName)
                    .textContentType(.name)
                    .textInputAutocapitalization(.words)
                    .accessibilityLabel("Full Name, optional")
            } header: {
                Text("Full Name · Optional")
            } footer: {
                Text("So I can personally thank you if your suggestion is selected.")
            }

            Section {
                TextField("name@example.com", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .accessibilityLabel("Email Address, required")
            } header: {
                Text("Email Address · Required")
            } footer: {
                Text("I'll send you a thank-you email and let you know if your suggestion is added to LetUsPray.")
            }

            Section("Prayer Plan Name · Required") {
                TextField("Overcoming Fear", text: $planName)
                    .textInputAutocapitalization(.words)
                    .accessibilityLabel("Prayer Plan Name, required")
            }

            Section("Tell Me More · Optional") {
                ZStack(alignment: .topLeading) {
                    if planDescription.isEmpty {
                        Text("What would you like this prayer plan to cover?")
                            .foregroundStyle(AppColors.tertiaryText)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 8)
                            .allowsHitTesting(false)
                    }
                    TextEditor(text: $planDescription)
                        .frame(minHeight: 120)
                        .scrollContentBackground(.hidden)
                }
            }

            Section {
                Toggle(isOn: creditBinding) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text("If this prayer plan is added to LetUsPray, you may credit it as:")
                        if !trimmedName.isEmpty {
                            Text("\"Inspired by \(trimmedName).\"")
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.textSecondary)
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
                .disabled(trimmedName.isEmpty)
                .accessibilityHint(trimmedName.isEmpty ? "Enter your full name to enable credit." : "Allows LetUsPray to credit your contribution if the plan is selected.")
            } header: {
                Text("Credit · Optional")
            }

            Section {
                Button("Submit") {
                    showingSuccess = true
                }
                .frame(maxWidth: .infinity)
                .disabled(!canSubmit)
            }
        }
    }

    private var successContent: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                InfoCard(padding: AppSpacing.large) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        Text("Thank You!")
                            .font(AppTypography.largeDisplay())
                            .foregroundStyle(AppColors.textPrimary)

                        Text("""
                        Thank you for taking the time to help build LetUsPray.

                        Your suggestion has been received, and I truly appreciate you sharing your idea.

                        Please know that I'll be praying for you, and I'm grateful you're part of this journey.

                        Every suggestion is personally reviewed as I continue building LetUsPray one prayer at a time.

                        If your idea is selected, I'll reach out using the email you provided. If you've chosen to be credited, I'd be honored to recognize your contribution inside the app.

                        God bless you.

                        — Yegor
                        """)
                        .font(AppTypography.secondaryBody())
                        .foregroundStyle(AppColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }

                Button("Done") { dismiss() }
                    .buttonStyle(.borderedProminent)
                    .tint(AppColors.accentCyan)
                    .frame(maxWidth: .infinity)
            }
            .padding(AppSpacing.large)
        }
        .background(PrayerBackground())
    }
}

struct PrayerCollectionDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let collection: JourneyCollection
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    @AppStorage(PrayerStorageKeys.savedJourneyIDs) private var savedJourneyIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.favoriteJourneyIDs) private var favoriteJourneyIDsRawValue = ""
    @State private var searchQuery = ""
    @State private var searchFilters = JourneySearchFilters.empty
    @State private var searchSort: JourneySortOption = .recommended
    @State private var showingFilters = false

    private var journeys: [PrayerJourney] {
        PrayerJourneyCatalog.journeys(in: collection.id, plans: viewModel.allPlans)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
                header
                if collectionSearchIsActive {
                    collectionSearchContent
                } else if let featured = journeys.first(where: \.isFeatured) {
                    featuredSection(featured)
                    allJourneysSection(excluding: featured.id)
                } else if journeys.isEmpty {
                    emptyState
                } else {
                    allJourneysSection(excluding: nil)
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .navigationTitle(collection.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
        .searchable(text: $searchQuery, prompt: "Search this collection")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button { showingFilters = true } label: {
                    Label("Filter", systemImage: searchFilters.isEmpty ? "line.3.horizontal.decrease.circle" : "line.3.horizontal.decrease.circle.fill")
                }
                Menu {
                    Picker("Sort", selection: $searchSort) {
                        ForEach(JourneySortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
            }
        }
        .sheet(isPresented: $showingFilters) {
            JourneyFilterSheet(filters: $searchFilters, collectionLockedTo: collection.id)
        }
    }

    private var collectionSearchIsActive: Bool {
        !searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !searchFilters.isEmpty
    }

    private var collectionSearchResults: [PrayerJourney] {
        PrayerJourneySearchService.search(
            journeys: journeys,
            query: searchQuery,
            filters: searchFilters,
            sort: searchSort,
            completedDaysByPlan: analytics.completedDaysByPlan,
            activePlanID: activePlanID
        )
    }

    private var collectionSearchContent: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack {
                Text("\(collectionSearchResults.count) result\(collectionSearchResults.count == 1 ? "" : "s")")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                Spacer()
                Button("Clear") {
                    searchQuery = ""
                    searchFilters = .empty
                }
                .font(AppTypography.footnote())
            }
            if collectionSearchResults.isEmpty {
                EmptyStateView(title: "No journeys found", message: "Try a different search or broaden your filters.", systemImage: "magnifyingglass")
            } else {
                ForEach(collectionSearchResults) { journey in
                    journeyLink(journey)
                }
            }
        }
    }

    private var header: some View {
        let accent = journeys.first.map { AppColors.planAccent(named: $0.accentColorName) } ?? AppColors.accent
        return VStack(alignment: .leading, spacing: AppSpacing.small) {
            Image(systemName: journeys.first(where: \.isFeatured)?.heroImageName ?? collection.iconName)
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(accent)
                .frame(width: 64, height: 64)
                .background(accent.opacity(0.13), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            Text(collection.title)
                .font(AppTypography.screenTitle())
                .foregroundStyle(AppColors.primaryText)
            Text(collection.description)
                .font(AppTypography.secondaryBody())
                .foregroundStyle(AppColors.secondaryText)
            Text("\(journeys.count) journey\(journeys.count == 1 ? "" : "s")")
                .font(AppTypography.metadata())
                .foregroundStyle(AppColors.tertiaryText)
            let availableCount = journeys.filter(\.isLaunchReady).count
            Text("\(availableCount) available · \(journeys.count - availableCount) upcoming · \(collectionCompletionPercentage)% content ready")
                .font(AppTypography.caption())
                .foregroundStyle(accent)
        }
        .accessibilityElement(children: .combine)
    }

    private var collectionCompletionPercentage: Int {
        guard !journeys.isEmpty else { return 0 }
        return journeys.reduce(0) { $0 + $1.metadata.contentCompletionPercentage } / journeys.count
    }

    private func featuredSection(_ journey: PrayerJourney) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Featured Journey")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            journeyLink(journey, featured: true)
        }
    }

    private func allJourneysSection(excluding featuredID: String?) -> some View {
        let remaining = journeys.filter { $0.id != featuredID }
        return VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("All Journeys")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
                .padding(.top, featuredID == nil ? 0 : AppSpacing.small)
            GroupedCard {
                ForEach(Array(remaining.enumerated()), id: \.element.id) { index, journey in
                    journeyLink(journey, showsDivider: index < remaining.count - 1)
                }
            }
        }
    }

    private var emptyState: some View {
        InfoCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("More journeys are on the way")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                Text("This collection is ready for future prayer journeys.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
            }
        }
        .accessibilityElement(children: .combine)
    }

    private func journeyLink(_ journey: PrayerJourney, featured: Bool = false, showsDivider: Bool = true) -> some View {
        NavigationLink {
            PlanDetailView(
                plan: journey.plan,
                isActive: activePlanID == journey.plan.id,
                completedDayNumbers: completedDayNumbersForPlan(journey.plan.id),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics,
                onStartJourney: {
                    activePlanID = journey.plan.id
                    viewModel.setActivePlan(id: journey.plan.id)
                },
                onViewCollection: { dismiss() },
                onOpenJourney: { plan in
                    activePlanID = plan.id
                    viewModel.setActivePlan(id: plan.id)
                }
            )
        } label: {
            if featured {
                journeyFeaturedCard(journey)
            } else {
                GroupedRow(showsDivider: showsDivider) {
                    journeyRowContent(journey)
                }
            }
        }
        .buttonStyle(.plain)
        .contextMenu { libraryContextMenu(for: journey) }
    }

    private func journeyRowContent(_ journey: PrayerJourney) -> some View {
        let accent = AppColors.planAccent(named: journey.accentColorName)
        let progress = progress(for: journey)
        return HStack(spacing: AppSpacing.medium) {
            Image(systemName: journey.heroImageName)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(accent)
                .frame(width: 42, height: 42)
                .background(accent.opacity(0.14), in: RoundedRectangle(cornerRadius: 13, style: .continuous))
            VStack(alignment: .leading, spacing: 4) {
                Text(journey.title)
                    .font(AppTypography.cardTitle())
                    .foregroundStyle(AppColors.primaryText)
                    .lineLimit(1)
                Text("\(durationLabel(for: journey)) · \(journey.estimatedPrayerMinutes) min")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineLimit(1)
            }
            Spacer(minLength: AppSpacing.small)
            if journey.sessionCount > 0 {
                Text("\(progress.percentage)%")
                    .font(AppTypography.metadata())
                    .foregroundStyle(progress.status == .completed ? accent : AppColors.tertiaryText)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(journey.title), \(journey.difficulty.rawValue) difficulty, \(durationLabel(for: journey)), \(journey.estimatedPrayerMinutes) minutes, \(progress.status.rawValue), \(progress.percentage) percent complete")
        .accessibilityHint("Opens \(journey.title).")
    }

    @ViewBuilder
    private func libraryContextMenu(for journey: PrayerJourney) -> some View {
        let saved = PrayerStorageCodec.decodeStringSet(savedJourneyIDsRawValue).contains(journey.id)
        let favorite = PrayerStorageCodec.decodeStringSet(favoriteJourneyIDsRawValue).contains(journey.id)
        Button {
            PrayerJourneyLibraryService.setSaved(!saved, journeyID: journey.id)
        } label: {
            Label(saved ? "Remove Saved" : "Save Journey", systemImage: saved ? "bookmark.slash" : "bookmark")
        }
        Button {
            PrayerJourneyLibraryService.setFavorite(!favorite, journeyID: journey.id)
        } label: {
            Label(favorite ? "Remove Favorite" : "Mark Favorite", systemImage: favorite ? "heart.slash" : "heart")
        }
    }

    private func journeyFeaturedCard(_ journey: PrayerJourney) -> some View {
        let progress = progress(for: journey)

        return HeroCard(gradient: BrandGradients.planGradient(for: journey.plan.category)) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    Image(systemName: journey.heroImageName)
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 58, height: 58)
                        .background(Color.white.opacity(0.18), in: RoundedRectangle(cornerRadius: 17, style: .continuous))

                    VStack(alignment: .leading, spacing: 5) {
                        Text(journey.title)
                            .font(AppTypography.title2())
                            .foregroundStyle(AppColors.brightTextOnAccent)
                            .lineLimit(2)
                        Text(journey.subtitle)
                            .font(AppTypography.metadata())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.85))
                            .lineLimit(1)
                    }

                    Spacer(minLength: AppSpacing.small)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.8))
                }

                HStack(spacing: AppSpacing.small) {
                    Label(durationLabel(for: journey), systemImage: "calendar")
                    Label("\(journey.estimatedPrayerMinutes) min", systemImage: "clock")
                    Label(journey.difficulty.rawValue, systemImage: "chart.bar.fill")
                }
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
                .lineLimit(1)
                .minimumScaleFactor(0.78)

                if let primaryBadge = primaryBadge(for: journey, progress: progress) {
                    Text(primaryBadge.title)
                        .font(AppTypography.caption())
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .padding(.horizontal, AppSpacing.small)
                        .padding(.vertical, 3)
                        .background(Color.white.opacity(0.18), in: Capsule())
                }

                if journey.sessionCount > 0 {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(progress.status.rawValue)
                            Spacer()
                            Text("\(progress.percentage)%")
                        }
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.9))
                        ProgressView(value: progress.fractionCompleted)
                            .tint(AppColors.brightTextOnAccent)
                    }
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(journey.title), \(journey.difficulty.rawValue) difficulty, \(durationLabel(for: journey)), \(journey.estimatedPrayerMinutes) minutes, \(progress.status.rawValue), \(progress.percentage) percent complete")
        .accessibilityHint("Opens \(journey.title).")
    }

    private func progress(for journey: PrayerJourney) -> PrayerPlanProgress {
        if journey.plan.id == activePlanID {
            return journey.progress(completedSessionNumbers: completedDayNumbers)
        }
        let completedCount = analytics.completedDaysByPlan[journey.plan.id] ?? 0
        return PrayerPlanProgress(completedDays: completedCount, totalDays: journey.sessionCount)
    }

    private func durationLabel(for journey: PrayerJourney) -> String {
        journey.estimatedDurationDays > 0 ? "\(journey.estimatedDurationDays) days" : "Self-guided"
    }

    private func badge(_ title: String, color: Color) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(color)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(color.opacity(0.14), in: Capsule())
    }

    private func primaryBadge(for journey: PrayerJourney, progress: PrayerPlanProgress) -> (title: String, color: Color)? {
        if progress.status == .completed { return ("Completed", AppColors.success) }
        if journey.isFeatured { return ("Featured", AppColors.premiumGold) }
        if journey.isRecommended { return ("Recommended", AppColors.accent) }
        if journey.isSeasonal { return ("Seasonal", AppColors.warning) }
        return nil
    }
}

private struct JourneyFilterSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var filters: JourneySearchFilters
    let collectionLockedTo: PrayerCollectionID?

    init(filters: Binding<JourneySearchFilters>, collectionLockedTo: PrayerCollectionID? = nil) {
        self._filters = filters
        self.collectionLockedTo = collectionLockedTo
    }

    var body: some View {
        NavigationStack {
            Form {
                if collectionLockedTo == nil {
                    Section("Collection") {
                        Picker("Collection", selection: $filters.collection) {
                            Text("All Collections").tag(Optional<PrayerCollectionID>.none)
                            ForEach(PrayerJourneyCatalog.collections) { collection in
                                Text(collection.title).tag(Optional(collection.id))
                            }
                        }
                    }
                }
                Section("Journey") {
                    Picker("Difficulty", selection: $filters.difficulty) {
                        Text("Any Difficulty").tag(Optional<PrayerJourneyDifficulty>.none)
                        ForEach(PrayerJourneyDifficulty.allCases, id: \.self) { difficulty in
                            Text(difficulty.rawValue).tag(Optional(difficulty))
                        }
                    }
                    Picker("Duration", selection: $filters.duration) {
                        ForEach(JourneyDurationFilter.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    Picker("Prayer Time", selection: $filters.prayerTime) {
                        ForEach(JourneyPrayerTimeFilter.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    Picker("Progress", selection: $filters.progress) {
                        ForEach(JourneyProgressFilter.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                }
                Section("Highlights") {
                    Toggle("Featured", isOn: $filters.featuredOnly)
                    Toggle("Recommended", isOn: $filters.recommendedOnly)
                    Toggle("Seasonal", isOn: $filters.seasonalOnly)
                    Toggle("Saved", isOn: $filters.savedOnly)
                    Toggle("Favorite", isOn: $filters.favoriteOnly)
                }
                Section {
                    Button("Reset Filters", role: .destructive) {
                        filters = .empty
                        filters.collection = collectionLockedTo
                    }
                }
            }
            .navigationTitle("Filter Journeys")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .onAppear {
                if let collectionLockedTo { filters.collection = collectionLockedTo }
            }
        }
    }
}

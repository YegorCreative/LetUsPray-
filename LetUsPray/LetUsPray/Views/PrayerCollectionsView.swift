import SwiftUI

struct PrayerCollectionsView: View {
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
        LazyVStack(alignment: .leading, spacing: AppSpacing.medium) {
            intro
            libraryContent
            ForEach(recommendationSections.ordered, id: \.0) { section in
                activitySection(title: section.0, journeys: section.1)
            }
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
                    collectionCard(collection)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, AppSpacing.large)
        .padding(.top, AppSpacing.medium)
        .padding(.bottom, AppSpacing.xxLarge)
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
                        ForEach(group.1) { journey in
                            journeySearchLink(journey)
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

    private func journeySearchLink(_ journey: PrayerJourney) -> some View {
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
            activityCard(journey)
        }
        .buttonStyle(.plain)
        .contextMenu { libraryContextMenu(for: journey) }
    }

    private var intro: some View {
        Text("Find a journey for this season of your life.")
            .font(AppTypography.body())
            .foregroundStyle(AppColors.textSecondary)
            .padding(.bottom, AppSpacing.small)
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
                ForEach(journeys) { journey in
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
                        activityCard(journey)
                    }
                    .buttonStyle(.plain)
                    .contextMenu { libraryContextMenu(for: journey) }
                }
            }
            .transition(.opacity.combined(with: .move(edge: .top)))
        }
    }

    private func activityCard(_ journey: PrayerJourney) -> some View {
        let progress = progress(for: journey)
        return GlassCard(padding: AppSpacing.medium) {
            HStack(spacing: AppSpacing.medium) {
                Image(systemName: journey.heroImageName)
                    .foregroundStyle(AppColors.planAccent(named: journey.accentColorName))
                    .frame(width: 38, height: 38)
                    .background(AppColors.planAccent(named: journey.accentColorName).opacity(0.16), in: Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(journey.title)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                    HStack(spacing: AppSpacing.small) {
                        Text(progress.status == .completed ? "Completed" : "Session \(nextSession(for: journey)) of \(journey.sessionCount)")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textSecondary)
                        if savedJourneyIDs.contains(journey.id) { Image(systemName: "bookmark.fill").accessibilityLabel("Saved") }
                        if favoriteJourneyIDs.contains(journey.id) { Image(systemName: "heart.fill").accessibilityLabel("Favorite") }
                    }
                }
                Spacer()
                Text("\(progress.percentage)%")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.planAccent(named: journey.accentColorName))
            }
        }
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

    private func collectionCard(_ collection: JourneyCollection) -> some View {
        let journeys = PrayerJourneyCatalog.journeys(in: collection.id, plans: viewModel.allPlans)
        let featured = journeys.first(where: \.isFeatured)
        let accent = featured.map { AppColors.planAccent(named: $0.accentColorName) } ?? AppColors.electricCyan

        return GlassCard(padding: AppSpacing.large) {
            HStack(alignment: .top, spacing: AppSpacing.medium) {
                Image(systemName: featured?.heroImageName ?? collection.iconName)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(accent)
                    .frame(width: 58, height: 58)
                    .background(accent.opacity(0.18), in: RoundedRectangle(cornerRadius: 17, style: .continuous))

                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: AppSpacing.small) {
                        Text(collection.title)
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                        if featured != nil { badge("Featured", color: accent) }
                    }
                    Text(collection.description)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)
                    Text("\(journeys.count) journey\(journeys.count == 1 ? "" : "s")")
                        .font(AppTypography.caption())
                        .foregroundStyle(accent)
                    let launchReady = journeys.filter(\.isLaunchReady).count
                    Text("\(launchReady) available · \(journeys.count - launchReady) upcoming")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                    let completed = journeys.filter { progress(for: $0).status == .completed }.count
                    let inProgress = journeys.filter { progress(for: $0).status == .inProgress }.count
                    if completed > 0 || inProgress > 0 {
                        Text("\(inProgress) in progress · \(completed) completed")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                    }
                }

                Spacer(minLength: AppSpacing.small)
                Image(systemName: "chevron.right")
                    .foregroundStyle(accent)
                    .padding(.top, 5)
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
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Image(systemName: journeys.first(where: \.isFeatured)?.heroImageName ?? collection.iconName)
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(AppColors.electricCyan)
                .frame(width: 64, height: 64)
                .background(AppColors.electricCyan.opacity(0.16), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            Text(collection.description)
                .font(AppTypography.body())
                .foregroundStyle(AppColors.textSecondary)
            Text("\(journeys.count) journey\(journeys.count == 1 ? "" : "s")")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)
            let availableCount = journeys.filter(\.isLaunchReady).count
            Text("\(availableCount) available · \(journeys.count - availableCount) upcoming · \(collectionCompletionPercentage)% content ready")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.electricCyan)
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
            LazyVStack(spacing: AppSpacing.small) {
                ForEach(remaining) { journey in
                    journeyLink(journey)
                }
            }
        }
    }

    private var emptyState: some View {
        GlassCard(padding: AppSpacing.large) {
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

    private func journeyLink(_ journey: PrayerJourney, featured: Bool = false) -> some View {
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
            journeyCard(journey, featured: featured)
        }
        .buttonStyle(.plain)
        .contextMenu { libraryContextMenu(for: journey) }
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

    private func journeyCard(_ journey: PrayerJourney, featured: Bool = false) -> some View {
        let accent = AppColors.planAccent(named: journey.accentColorName)
        let progress = progress(for: journey)

        return GlassCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    Image(systemName: journey.heroImageName)
                        .font(.system(size: featured ? 26 : 21, weight: .semibold))
                        .foregroundStyle(accent)
                        .frame(width: featured ? 58 : 48, height: featured ? 58 : 48)
                        .background(accent.opacity(0.18), in: RoundedRectangle(cornerRadius: featured ? 17 : 14, style: .continuous))

                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: AppSpacing.small) {
                            Text(journey.title)
                                .font(featured ? AppTypography.title2() : AppTypography.headline())
                                .foregroundStyle(AppColors.textPrimary)
                            if journey.isRecommended { badge("Recommended", color: accent) }
                            if journey.isSeasonal { badge("Seasonal", color: .orange) }
                            if PrayerStorageCodec.decodeStringSet(savedJourneyIDsRawValue).contains(journey.id) {
                                Image(systemName: "bookmark.fill").foregroundStyle(accent).accessibilityLabel("Saved")
                            }
                            if PrayerStorageCodec.decodeStringSet(favoriteJourneyIDsRawValue).contains(journey.id) {
                                Image(systemName: "heart.fill").foregroundStyle(.pink).accessibilityLabel("Favorite")
                            }
                        }
                        Text(journey.subtitle)
                            .font(AppTypography.footnote())
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(2)
                    }

                    Spacer(minLength: AppSpacing.small)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(accent)
                }

                HStack(spacing: AppSpacing.medium) {
                    Label(durationLabel(for: journey), systemImage: "calendar")
                    Label("\(journey.estimatedPrayerMinutes) min", systemImage: "clock")
                    Label(journey.difficulty.rawValue, systemImage: "chart.bar.fill")
                }
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)

                if journey.sessionCount > 0 {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(progress.status.rawValue)
                            Spacer()
                            Text("\(progress.percentage)%")
                        }
                        .font(AppTypography.caption())
                        .foregroundStyle(progress.status == .completed ? accent : AppColors.textTertiary)
                        ProgressView(value: progress.fractionCompleted)
                            .tint(accent)
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

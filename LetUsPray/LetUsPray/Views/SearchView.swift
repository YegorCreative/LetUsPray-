import SwiftUI

struct SearchView: View {
    let viewModel: PrayerPlanViewModel
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    @State private var query = ""
    @State private var debouncedQuery = ""
    @State private var recentSearches: [String] = []

    private let searchIndex: [PrayerSearchResult]

    init(
        viewModel: PrayerPlanViewModel,
        completedDayNumbersForPlan: @escaping (String) -> Binding<Set<Int>>,
        savedVerseIDs: Binding<Set<String>>,
        analytics: Binding<PrayerAnalyticsSnapshot>
    ) {
        self.viewModel = viewModel
        self.completedDayNumbersForPlan = completedDayNumbersForPlan
        self._savedVerseIDs = savedVerseIDs
        self._analytics = analytics
        self.searchIndex = PrayerSearchIndex(plans: viewModel.allPlans).results
    }

    var body: some View {
        Group {
            if trimmedQuery.isEmpty {
                discoveryState
            } else if isWaitingForDebounce {
                searchingState
            } else if matchingResults.isEmpty {
                noResultsState
            } else {
                resultsList
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.large)
        .searchable(
            text: $query,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search Scripture, prayers, or journeys"
        )
        .searchSuggestions {
            if !recentSearches.isEmpty {
                Section("Recent Searches") {
                    ForEach(recentSearches, id: \.self) { recent in
                        Button {
                            query = recent
                        } label: {
                            Label(recent, systemImage: "clock.arrow.circlepath")
                        }
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .tint(AppColors.electricCyan)
        .toolbarBackground(.hidden, for: .navigationBar)
        .onSubmit(of: .search) {
            let trimmed = trimmedQuery
            guard !trimmed.isEmpty else { return }
            recentSearches.removeAll { $0.caseInsensitiveCompare(trimmed) == .orderedSame }
            recentSearches.insert(trimmed, at: 0)
            recentSearches = Array(recentSearches.prefix(5))
        }
        .task(id: query) {
            let pendingQuery = query

            guard !pendingQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                debouncedQuery = ""
                return
            }

            try? await Task.sleep(for: .milliseconds(180))
            guard !Task.isCancelled else { return }
            debouncedQuery = pendingQuery
        }
        .navigationDestination(for: PrayerSearchResult.self) { result in
            PrayerDetailView(
                plan: result.plan,
                day: result.day,
                completedDayNumbers: completedDayNumbersForPlan(result.plan.id),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics
            )
        }
    }

    private var resultsList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
                if !journeyResults.isEmpty {
                    resultSection("Prayer Journeys", count: journeyResults.count) {
                        ForEach(journeyResults) { result in journeyResultCard(result) }
                    }
                }
                if !scriptureResults.isEmpty {
                    resultSection("Scripture", count: scriptureResults.count) {
                        ForEach(scriptureResults) { result in scriptureResultCard(result) }
                    }
                }
                if !guidedPrayerResults.isEmpty {
                    resultSection("Guided Prayers", count: guidedPrayerResults.count) {
                        ForEach(guidedPrayerResults) { result in prayerResultCard(result) }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.vertical, AppSpacing.medium)
        }
        .background(PrayerBackground())
    }

    private func resultSection<Content: View>(_ title: String, count: Int, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            HStack {
                Text(title)
                    .font(AppTypography.sectionHeader())
                    .foregroundStyle(AppColors.primaryText)
                Spacer()
                Text("\(count)")
                    .font(AppTypography.metadata())
                    .foregroundStyle(AppColors.tertiaryText)
            }
            content()
        }
    }

    private func journeyResultCard(_ result: PrayerSearchResult) -> some View {
        NavigationLink(value: result) {
            GlassCard(padding: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    Image(systemName: result.plan.coverIcon)
                        .foregroundStyle(result.plan.category.brandAccent)
                        .frame(width: 44, height: 44)
                        .background(result.plan.category.brandAccent.opacity(0.13), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    VStack(alignment: .leading, spacing: 4) {
                        highlightedText(result.plan.title, matching: debouncedQuery, font: AppTypography.cardTitle(), color: AppColors.primaryText)
                        Text(result.plan.category.displayTitle)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.secondaryText)
                        Text(result.plan.subtitle)
                            .font(AppTypography.metadata())
                            .foregroundStyle(AppColors.tertiaryText)
                            .lineLimit(1)
                    }
                    Spacer()
                    Text("\(result.plan.durationDays) days")
                        .font(AppTypography.caption())
                        .foregroundStyle(result.plan.category.brandAccent)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens this prayer journey.")
    }

    private func scriptureResultCard(_ result: PrayerSearchResult) -> some View {
        NavigationLink(value: result) {
            GlassCard(padding: AppSpacing.medium) {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    highlightedText(result.verse.reference, matching: debouncedQuery, font: AppTypography.sectionHeader(), color: AppColors.accent)
                    highlightedText(result.verse.text, matching: debouncedQuery, font: AppTypography.body(), color: AppColors.primaryText)
                        .lineLimit(4)
                    Text(result.plan.title)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.secondaryText)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens this Scripture prayer.")
    }

    private func prayerResultCard(_ result: PrayerSearchResult) -> some View {
        NavigationLink(value: result) {
            GlassCard(padding: AppSpacing.medium) {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    highlightedText(result.verse.reference, matching: debouncedQuery, font: AppTypography.sectionHeader(), color: AppColors.accent)
                    highlightedText(result.verse.prayer, matching: debouncedQuery, font: AppTypography.body(), color: AppColors.primaryText)
                        .lineLimit(4)
                    Text(result.plan.title)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.secondaryText)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens this guided prayer.")
    }

    private var searchingState: some View {
        ProgressView("Searching…")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PrayerBackground())
            .accessibilityLabel("Searching prayer library")
    }

    private var discoveryState: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                GlassCard(padding: AppSpacing.heroPadding) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundStyle(AppColors.accent)
                        Text("Find a place to begin")
                            .font(AppTypography.screenTitle())
                            .foregroundStyle(AppColors.primaryText)
                        Text("Search Scripture, guided prayers, and prayer journeys by word or phrase.")
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.secondaryText)
                    }
                }
                if !recentSearches.isEmpty {
                    Text("Recent Searches")
                        .font(AppTypography.sectionHeader())
                        .foregroundStyle(AppColors.primaryText)
                    ForEach(recentSearches, id: \.self) { recent in
                        Button(recent) { query = recent }
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.accent)
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.vertical, AppSpacing.medium)
        }
        .background(PrayerBackground())
    }

    private var noResultsState: some View {
        ContentUnavailableView {
            Label("No Results Found", systemImage: "magnifyingglass")
        } description: {
            Text("Try a different scripture reference, prayer phrase, or journey name.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PrayerBackground())
        .accessibilityElement(children: .combine)
    }

    private var trimmedQuery: String {
        query.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var isWaitingForDebounce: Bool {
        trimmedQuery != debouncedQuery.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var matchingResults: [PrayerSearchResult] {
        PrayerSearchIndex.matches(
            searchIndex,
            query: debouncedQuery
        )
    }

    private var journeyResults: [PrayerSearchResult] {
        uniquePlans(from: matchingResults.filter { result in
            let terms = searchTerms
            return terms.allSatisfy { result.normalizedPlanTitle.contains($0) || result.normalizedPlanSubtitle.contains($0) }
        })
    }

    private var scriptureResults: [PrayerSearchResult] {
        matchingResults.filter { result in
            searchTerms.allSatisfy { result.normalizedVerseReference.contains($0) || result.normalizedVerseText.contains($0) || result.normalizedChapterReference.contains($0) }
        }
    }

    private var guidedPrayerResults: [PrayerSearchResult] {
        matchingResults.filter { result in
            searchTerms.allSatisfy { result.normalizedPrayer.contains($0) }
        }
    }

    private var searchTerms: [String] {
        PrayerSearchIndex.normalize(debouncedQuery).split(separator: " ").map(String.init)
    }

    private func uniquePlans(from results: [PrayerSearchResult]) -> [PrayerSearchResult] {
        var seen = Set<String>()
        return results.filter { seen.insert($0.plan.id).inserted }
    }

    private func highlightedText(
        _ text: String,
        matching query: String,
        font: Font,
        color: Color
    ) -> Text {
        let terms = query.split(whereSeparator: { $0 == " " || $0 == "\n" }).map { PrayerSearchIndex.normalize(String($0)) }
        let pieces = text.split(separator: " ", omittingEmptySubsequences: false)
        var output = Text("")
        for (index, piece) in pieces.enumerated() {
            let part = String(piece)
            let isMatch = terms.contains { PrayerSearchIndex.normalize(part).contains($0) }
            let pieceText = Text(part).foregroundStyle(isMatch ? AppColors.accent : color)
            output = output + pieceText + (index == pieces.count - 1 ? Text("") : Text(" "))
        }
        return output
            .font(font)
    }
}

private struct PrayerSearchResult: Identifiable, Hashable {
    let plan: PrayerPlan
    let day: PrayerDay
    let verse: PrayerVerse
    let normalizedPlanTitle: String
    let normalizedPlanSubtitle: String
    let normalizedDayTitle: String
    let normalizedDaySummary: String
    let normalizedChapterReference: String
    let normalizedVerseReference: String
    let normalizedVerseText: String
    let normalizedPrayer: String
    let searchableText: String

    var id: String { "\(plan.id):\(day.dayNumber):\(verse.id)" }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

private struct PrayerSearchIndex {
    let results: [PrayerSearchResult]

    init(plans: [PrayerPlan]) {
        results = plans.flatMap { plan in
            plan.days.flatMap { day in
                day.verses.map { verse in
                    let planTitle = Self.normalize(plan.title)
                    let planSubtitle = Self.normalize(plan.subtitle)
                    let dayTitle = Self.normalize(day.title)
                    let daySummary = Self.normalize(day.summary)
                    let chapterReference = Self.normalize(day.chapterReference)
                    let verseReference = Self.normalize(verse.reference)
                    let verseText = Self.normalize(verse.text)
                    let prayer = Self.normalize(verse.prayer)

                    return PrayerSearchResult(
                        plan: plan,
                        day: day,
                        verse: verse,
                        normalizedPlanTitle: planTitle,
                        normalizedPlanSubtitle: planSubtitle,
                        normalizedDayTitle: dayTitle,
                        normalizedDaySummary: daySummary,
                        normalizedChapterReference: chapterReference,
                        normalizedVerseReference: verseReference,
                        normalizedVerseText: verseText,
                        normalizedPrayer: prayer,
                        searchableText: [
                            planTitle,
                            planSubtitle,
                            dayTitle,
                            daySummary,
                            chapterReference,
                            verseReference,
                            verseText,
                            prayer
                        ].joined(separator: " ")
                    )
                }
            }
        }
    }

    static func matches(
        _ index: [PrayerSearchResult],
        query: String
    ) -> [PrayerSearchResult] {
        let normalizedQuery = normalize(query)
        let terms = normalizedQuery.split(separator: " ").map(String.init)
        guard !terms.isEmpty else { return [] }

        return index
            .compactMap { result -> (PrayerSearchResult, Int)? in
                guard terms.allSatisfy(result.searchableText.contains) else {
                    return nil
                }

                return (result, score(result, query: normalizedQuery, terms: terms))
            }
            .sorted {
                if $0.1 != $1.1 {
                    return $0.1 > $1.1
                }
                if $0.0.plan.title != $1.0.plan.title {
                    return $0.0.plan.title.localizedStandardCompare($1.0.plan.title) == .orderedAscending
                }
                if $0.0.day.dayNumber != $1.0.day.dayNumber {
                    return $0.0.day.dayNumber < $1.0.day.dayNumber
                }
                return $0.0.verse.reference.localizedStandardCompare($1.0.verse.reference) == .orderedAscending
            }
            .map(\.0)
    }

    private static func score(
        _ result: PrayerSearchResult,
        query: String,
        terms: [String]
    ) -> Int {
        var score = 0

        score += fieldScore(result.normalizedVerseReference, query: query, terms: terms, weight: 120)
        score += fieldScore(result.normalizedPlanTitle, query: query, terms: terms, weight: 100)
        score += fieldScore(result.normalizedDayTitle, query: query, terms: terms, weight: 90)
        score += fieldScore(result.normalizedChapterReference, query: query, terms: terms, weight: 85)
        score += fieldScore(result.normalizedVerseText, query: query, terms: terms, weight: 70)
        score += fieldScore(result.normalizedPrayer, query: query, terms: terms, weight: 60)
        score += fieldScore(result.normalizedPlanSubtitle, query: query, terms: terms, weight: 45)
        score += fieldScore(result.normalizedDaySummary, query: query, terms: terms, weight: 35)

        return score
    }

    private static func fieldScore(
        _ field: String,
        query: String,
        terms: [String],
        weight: Int
    ) -> Int {
        if field == query {
            return weight * 4
        }
        if field.hasPrefix(query) {
            return weight * 3
        }
        if field.contains(query) {
            return weight * 2
        }

        return terms.reduce(into: 0) { partialScore, term in
            if field.contains(term) {
                partialScore += weight
            }
        }
    }

    static func normalize(_ value: String) -> String {
        value
            .folding(
                options: [.caseInsensitive, .diacriticInsensitive],
                locale: .current
            )
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    NavigationStack {
        SearchView(
            viewModel: PrayerPlanViewModel(),
            completedDayNumbersForPlan: { _ in .constant([]) },
            savedVerseIDs: .constant([]),
            analytics: .constant(
                .init(
                    completedPrayersCount: 0,
                    savedPrayersCount: 0,
                    activePlanID: ProverbsPrayerData.plan.id,
                    completedDaysByPlan: [:]
                )
            )
        )
    }
}

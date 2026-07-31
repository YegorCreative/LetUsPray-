import SwiftUI

struct SearchView: View {
    let viewModel: PrayerPlanViewModel
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    @State private var query = ""
    @State private var debouncedQuery = ""

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
            prompt: "Scripture, prayer, or journey"
        )
        .scrollDismissesKeyboard(.interactively)
        .toolbarBackground(.hidden, for: .navigationBar)
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
        List(matchingResults) { result in
            NavigationLink(value: result) {
                VStack(alignment: .leading, spacing: 8) {
                    highlightedText(
                        result.verse.reference,
                        matching: debouncedQuery,
                        font: AppTypography.headline(),
                        color: AppColors.textPrimary
                    )

                    highlightedText(
                        result.plan.title,
                        matching: debouncedQuery,
                        font: AppTypography.caption(),
                        color: result.plan.category.brandAccent
                    )

                    highlightedText(
                        result.verse.prayer,
                        matching: debouncedQuery,
                        font: AppTypography.body(),
                        color: AppColors.textSecondary
                    )
                    .lineLimit(3)
                }
                .padding(.vertical, 6)
                .contentShape(Rectangle())
            }
            .accessibilityElement(children: .combine)
            .accessibilityHint("Opens this prayer.")
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(PrayerBackground())
    }

    private var searchingState: some View {
        ProgressView("Searching…")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PrayerBackground())
            .accessibilityLabel("Searching prayer library")
    }

    private var discoveryState: some View {
        ContentUnavailableView {
            Label("Search Prayer Library", systemImage: "text.magnifyingglass")
        } description: {
            Text("Find a verse, guided prayer, Psalm, Proverb, or journey to pray with.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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

    private func highlightedText(
        _ text: String,
        matching query: String,
        font: Font,
        color: Color
    ) -> Text {
        var attributedText = AttributedString(text)

        if let range = attributedText.range(
            of: query.trimmingCharacters(in: .whitespacesAndNewlines),
            options: [.caseInsensitive, .diacriticInsensitive]
        ) {
            attributedText[range].foregroundColor = AppColors.premiumGold
            attributedText[range].inlinePresentationIntent = .stronglyEmphasized
        }

        return Text(attributedText)
            .font(font)
            .foregroundStyle(color)
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

    private static func normalize(_ value: String) -> String {
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

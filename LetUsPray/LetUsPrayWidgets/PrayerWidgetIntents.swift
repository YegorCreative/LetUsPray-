import AppIntents

struct ContinuePrayerIntent: AppIntent {
    static let title: LocalizedStringResource = "Continue My Prayer"
    static let description = IntentDescription("Open the next session in your prayer journey.")
    static let openAppWhenRun = true
    func perform() async throws -> some IntentResult { .result() }
}

struct OpenPlansIntent: AppIntent {
    static let title: LocalizedStringResource = "Open Plans"
    static let openAppWhenRun = true
    func perform() async throws -> some IntentResult { .result() }
}

struct OpenLibraryIntent: AppIntent {
    static let title: LocalizedStringResource = "Open Prayer Library"
    static let openAppWhenRun = true
    func perform() async throws -> some IntentResult { .result() }
}

struct OpenPrayerInsightsIntent: AppIntent {
    static let title: LocalizedStringResource = "Open Prayer Insights"
    static let openAppWhenRun = true
    func perform() async throws -> some IntentResult { .result() }
}

struct OpenRecommendedJourneyIntent: AppIntent {
    static let title: LocalizedStringResource = "Open Recommended Journey"
    static let openAppWhenRun = true
    func perform() async throws -> some IntentResult { .result() }
}

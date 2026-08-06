import Foundation

struct JourneyPlan: Identifiable, Hashable, Codable {
    let metadata: PrayerPlan
    let days: [JourneyDay]
    let introduction: JourneyIntroduction?

    init(metadata: PrayerPlan, days: [JourneyDay], introduction: JourneyIntroduction? = nil) {
        self.metadata = metadata
        self.days = days
        self.introduction = introduction
    }

    var id: String { metadata.id }
    var title: String { metadata.title }
    var subtitle: String { metadata.subtitle }
    var description: String { metadata.description }
    var category: PrayerPlanCategory { metadata.category }
    var durationDays: Int { metadata.durationDays }
    var accentColorName: String { metadata.accentColorName }
    var coverIcon: String { metadata.coverIcon }
}

struct JourneyIntroduction: Hashable, Codable {
    let themeVerse: JourneyScripture
    let paragraphs: [String]
    let estimatedDailyPrayerTime: String
    let difficulty: JourneyDifficulty
    let categoryTitle: String
    let experiences: [JourneyExperience]
    let mission: JourneyMissionInformation?
    let sectionTitle: String?
    let beforeYouBeginTitle: String?
    let beforeYouBeginContent: [String]

    init(
        themeVerse: JourneyScripture,
        paragraphs: [String],
        estimatedDailyPrayerTime: String,
        difficulty: JourneyDifficulty,
        categoryTitle: String,
        experiences: [JourneyExperience],
        mission: JourneyMissionInformation?,
        sectionTitle: String? = nil,
        beforeYouBeginTitle: String? = nil,
        beforeYouBeginContent: [String] = []
    ) {
        self.themeVerse = themeVerse
        self.paragraphs = paragraphs
        self.estimatedDailyPrayerTime = estimatedDailyPrayerTime
        self.difficulty = difficulty
        self.categoryTitle = categoryTitle
        self.experiences = experiences
        self.mission = mission
        self.sectionTitle = sectionTitle
        self.beforeYouBeginTitle = beforeYouBeginTitle
        self.beforeYouBeginContent = beforeYouBeginContent
    }
}

struct JourneyExperience: Identifiable, Hashable, Codable {
    let title: String
    let description: String?

    var id: String { title }
}

enum JourneyDifficulty: String, Hashable, Codable {
    case gentle = "Gentle"
    case steady = "Steady"
    case deep = "Deep"
}

struct JourneyMissionInformation: Hashable, Codable {
    let countryOrPeopleGroup: String
    let approximatePopulation: String
    let approximateChristianPercentage: String
    let prayerFocus: String
}

struct JourneyDay: Identifiable, Hashable, Codable {
    let dayNumber: Int
    let title: String
    let chapterReference: String
    let summary: String
    let primaryScripture: JourneyScripture
    let devotional: String
    let reflections: [JourneyReflection]
    let closingPrayer: String
    let missionFocus: JourneyMissionInformation?

    init(
        dayNumber: Int,
        title: String,
        chapterReference: String,
        summary: String,
        primaryScripture: JourneyScripture,
        devotional: String,
        reflections: [JourneyReflection],
        closingPrayer: String,
        missionFocus: JourneyMissionInformation? = nil
    ) {
        self.dayNumber = dayNumber
        self.title = title
        self.chapterReference = chapterReference
        self.summary = summary
        self.primaryScripture = primaryScripture
        self.devotional = devotional
        self.reflections = reflections
        self.closingPrayer = closingPrayer
        self.missionFocus = missionFocus
    }

    var id: Int { dayNumber }
}

struct JourneyScripture: Hashable, Codable {
    let reference: String
    let text: String
}

struct JourneyReflection: Identifiable, Hashable, Codable {
    let id: String
    let scripture: JourneyScripture
    let prayer: String
}

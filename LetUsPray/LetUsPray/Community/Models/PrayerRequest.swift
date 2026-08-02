import Foundation

enum PrayerRequestCategory: String, Codable, CaseIterable, Identifiable {
    case healing, family, marriage, children, school, work
    case financial, salvation, church, missions, thanksgiving, other

    var id: String { rawValue }

    var displayTitle: String {
        switch self {
        case .healing: "Healing"
        case .family: "Family"
        case .marriage: "Marriage"
        case .children: "Children"
        case .school: "School"
        case .work: "Work"
        case .financial: "Financial"
        case .salvation: "Salvation"
        case .church: "Church"
        case .missions: "Missions"
        case .thanksgiving: "Thanksgiving"
        case .other: "Other"
        }
    }

    var systemImage: String {
        switch self {
        case .healing: "heart.text.square.fill"
        case .family: "figure.2.and.child.holdinghands"
        case .marriage: "heart.fill"
        case .children: "figure.child"
        case .school: "graduationcap.fill"
        case .work: "briefcase.fill"
        case .financial: "dollarsign.circle.fill"
        case .salvation: "cross.fill"
        case .church: "building.columns.fill"
        case .missions: "globe.americas.fill"
        case .thanksgiving: "hands.sparkles.fill"
        case .other: "ellipsis.circle.fill"
        }
    }
}

enum PrayerRequestVisibility: String, Codable, CaseIterable, Identifiable {
    case `public`
    case `private`

    var id: String { rawValue }

    var displayTitle: String {
        switch self {
        case .public: "Public"
        case .private: "Private"
        }
    }
}

enum PrayerRequestStatus: String, Codable {
    case open
    case answered
}

nonisolated struct PrayerRequest: Identifiable, Codable, Hashable, Sendable {
    let id: UUID
    let userId: UUID
    var title: String
    var description: String
    var category: PrayerRequestCategory
    var visibility: PrayerRequestVisibility
    var isAnonymous: Bool
    var prayerCount: Int
    var status: PrayerRequestStatus
    /// A short line summarizing how God answered — set together with `answerDetails` and
    /// `answeredAt` when the owner marks the request answered. Not a testimony; just the
    /// completion of this request.
    var answerSummary: String?
    var answerDetails: String?
    var answeredAt: Date?
    let createdAt: Date
    var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case title
        case description
        case category
        case visibility
        case isAnonymous = "is_anonymous"
        case prayerCount = "prayer_count"
        case status
        case answerSummary = "answer_summary"
        case answerDetails = "answer_details"
        case answeredAt = "answered_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    var isAnswered: Bool { status == .answered }
}

/// A single "🙏 I Prayed" record — one row per (user, request), enforced by a unique
/// constraint in the database. Never a generic "like."
nonisolated struct PrayerSupport: Identifiable, Codable, Hashable, Sendable {
    let id: UUID
    let prayerRequestId: UUID
    let userId: UUID
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case prayerRequestId = "prayer_request_id"
        case userId = "user_id"
        case createdAt = "created_at"
    }
}

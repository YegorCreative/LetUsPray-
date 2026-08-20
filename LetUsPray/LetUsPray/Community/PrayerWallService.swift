import Foundation
import Supabase

/// Talks to the `prayer_requests` / `prayer_supports` tables (see
/// supabase/migrations/20260801_prayer_wall.sql). Duplicate "I Prayed" prevention relies on
/// the database's own unique(prayer_request_id, user_id) constraint as the source of truth.
struct PrayerWallService {
    private func requireClient() throws -> SupabaseClient {
        try SupabaseService.shared.requireClient()
    }

    func fetchPublicRequests() async throws -> [PrayerRequest] {
        let client = try requireClient()
        return try await client
            .from("prayer_requests")
            .select()
            .eq("visibility", value: PrayerRequestVisibility.public.rawValue)
            .order("created_at", ascending: false)
            .execute()
            .value
    }

    func fetchMyRequests() async throws -> [PrayerRequest] {
        let client = try requireClient()
        guard let userID = SupabaseService.shared.currentUserID else { return [] }
        return try await client
            .from("prayer_requests")
            .select()
            .eq("user_id", value: userID)
            .order("created_at", ascending: false)
            .execute()
            .value
    }

    func createRequest(
        title: String,
        description: String,
        category: PrayerRequestCategory,
        visibility: PrayerRequestVisibility,
        isAnonymous: Bool
    ) async throws -> PrayerRequest {
        let client = try requireClient()
        guard let userID = SupabaseService.shared.currentUserID else {
            throw PrayerWallError.notAuthenticated
        }

        let payload = NewPrayerRequest(
            userId: userID,
            title: title,
            description: description,
            category: category.rawValue,
            visibility: visibility.rawValue,
            isAnonymous: isAnonymous
        )

        return try await client
            .from("prayer_requests")
            .insert(payload)
            .select()
            .single()
            .execute()
            .value
    }

    func updateRequest(_ request: PrayerRequest) async throws {
        let client = try requireClient()
        guard SupabaseService.shared.currentUserID != nil else {
            throw PrayerWallError.notAuthenticated
        }

        let payload = UpdatedPrayerRequest(
            title: request.title,
            description: request.description,
            category: request.category.rawValue,
            visibility: request.visibility.rawValue,
            isAnonymous: request.isAnonymous
        )

        try await client
            .from("prayer_requests")
            .update(payload)
            .eq("id", value: request.id)
            .execute()
    }

    /// Marks a Prayer Request answered in place — same row, no new post. Ownership is
    /// enforced by the existing update RLS policy (user_id = auth.uid()), the same one
    /// `updateRequest` relies on.
    func markAnswered(requestID: UUID, summary: String, details: String, answeredAt: Date) async throws {
        let client = try requireClient()
        guard SupabaseService.shared.currentUserID != nil else {
            throw PrayerWallError.notAuthenticated
        }

        let payload = MarkAnsweredPayload(
            status: PrayerRequestStatus.answered.rawValue,
            answerSummary: summary,
            answerDetails: details,
            answeredAt: answeredAt
        )

        try await client
            .from("prayer_requests")
            .update(payload)
            .eq("id", value: requestID)
            .execute()
    }

    /// Reopens a previously-answered request — clears the answer fields rather than leaving
    /// stale ones behind. Owner-only, same RLS policy as any other update.
    func reopenRequest(id: UUID) async throws {
        let client = try requireClient()
        guard SupabaseService.shared.currentUserID != nil else {
            throw PrayerWallError.notAuthenticated
        }

        try await client
            .from("prayer_requests")
            .update(ReopenPayload())
            .eq("id", value: id)
            .execute()
    }

    func deleteRequest(id: UUID) async throws {
        let client = try requireClient()
        guard SupabaseService.shared.currentUserID != nil else {
            throw PrayerWallError.notAuthenticated
        }
        try await client
            .from("prayer_requests")
            .delete()
            .eq("id", value: id)
            .execute()
    }

    /// Records "🙏 I Prayed." A duplicate insert is caught (unique-constraint violation,
    /// Postgres code 23505) and treated as already-prayed, not surfaced as an error.
    func markPrayed(requestID: UUID) async throws {
        let client = try requireClient()
        guard let userID = SupabaseService.shared.currentUserID else {
            throw PrayerWallError.notAuthenticated
        }

        do {
            try await client
                .from("prayer_supports")
                .insert(NewPrayerSupport(prayerRequestId: requestID, userId: userID))
                .execute()
        } catch let error as PostgrestError where error.code == "23505" {
            // Already prayed — not a failure from the user's perspective.
        }
    }

    func hasPrayed(requestID: UUID) async throws -> Bool {
        let client = try requireClient()
        guard let userID = SupabaseService.shared.currentUserID else { return false }

        let supports: [PrayerSupport] = try await client
            .from("prayer_supports")
            .select()
            .eq("prayer_request_id", value: requestID)
            .eq("user_id", value: userID)
            .execute()
            .value

        return !supports.isEmpty
    }
}

private struct NewPrayerRequest: Encodable {
    let userId: UUID
    let title: String
    let description: String
    let category: String
    let visibility: String
    let isAnonymous: Bool

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case title, description, category, visibility
        case isAnonymous = "is_anonymous"
    }
}

private struct UpdatedPrayerRequest: Encodable {
    let title: String
    let description: String
    let category: String
    let visibility: String
    let isAnonymous: Bool

    enum CodingKeys: String, CodingKey {
        case title, description, category, visibility
        case isAnonymous = "is_anonymous"
    }
}

private struct MarkAnsweredPayload: Encodable {
    let status: String
    let answerSummary: String
    let answerDetails: String
    let answeredAt: Date

    enum CodingKeys: String, CodingKey {
        case status
        case answerSummary = "answer_summary"
        case answerDetails = "answer_details"
        case answeredAt = "answered_at"
    }
}

/// Reopening clears the answer fields rather than leaving stale ones behind, so this needs
/// explicit `null`s — Swift's default Encodable synthesis omits nil optionals entirely,
/// which PostgREST reads as "leave unchanged," not "clear."
private struct ReopenPayload: Encodable {
    enum CodingKeys: String, CodingKey {
        case status
        case answerSummary = "answer_summary"
        case answerDetails = "answer_details"
        case answeredAt = "answered_at"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(PrayerRequestStatus.open.rawValue, forKey: .status)
        try container.encodeNil(forKey: .answerSummary)
        try container.encodeNil(forKey: .answerDetails)
        try container.encodeNil(forKey: .answeredAt)
    }
}

private struct NewPrayerSupport: Encodable {
    let prayerRequestId: UUID
    let userId: UUID

    enum CodingKeys: String, CodingKey {
        case prayerRequestId = "prayer_request_id"
        case userId = "user_id"
    }
}

enum PrayerWallError: LocalizedError {
    case notAuthenticated

    var errorDescription: String? {
        switch self {
        case .notAuthenticated: "You need to be signed in to do that."
        }
    }
}

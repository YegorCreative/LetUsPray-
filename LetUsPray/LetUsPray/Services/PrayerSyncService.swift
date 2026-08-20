import Combine
import Foundation
import Supabase

/// Optional cloud sync for owner-authorized local prayer data.
/// Local UserDefaults remains the source of truth while signed out.
/// Sync runs only after the user intentionally signs in.
@MainActor
final class PrayerSyncService: ObservableObject {
    static let shared = PrayerSyncService()

    @Published private(set) var lastSuccessfulSync: Date?
    @Published private(set) var lastSyncMessage: String?
    private(set) var isApplyingRemoteMerge = false

    private var inFlight: Task<Void, Never>?
    private var queued = false

    private init() {}

    func noteLocalChange() {
        guard !isApplyingRemoteMerge else { return }
        var snapshot = PrayerSyncSnapshot.loadFromDefaults()
        snapshot.updatedAt = Date()
        snapshot.persistUpdatedAt()
        scheduleSynchronize()
    }

    func scheduleSynchronize() {
        queued = true
        guard inFlight == nil else { return }
        inFlight = Task { [weak self] in
            try? await Task.sleep(for: .milliseconds(400))
            await self?.runQueued()
        }
    }

    func synchronize() async {
        queued = true
        await runQueued()
    }

    func synchronizeIfNeeded() async {
        guard AccountService.shared.isSignedIn else { return }
        await synchronize()
    }

    func clearCloudStatus() {
        lastSuccessfulSync = nil
        lastSyncMessage = nil
    }

    private func runQueued() async {
        inFlight?.cancel()
        inFlight = nil
        guard queued else { return }
        queued = false

        guard AccountService.shared.isSignedIn else { return }

        do {
            try await pushAndPull()
            lastSuccessfulSync = Date()
            lastSyncMessage = nil
        } catch {
            lastSyncMessage = CloudServiceError.unavailable.errorDescription
        }

        if queued {
            await runQueued()
        }
    }

    private func pushAndPull() async throws {
        let client = try SupabaseService.shared.requireClient()
        let userID = try SupabaseService.shared.requireSignedInUserID()

        let local = PrayerSyncSnapshot.loadFromDefaults()
        let cloud = try await fetchCloudSnapshot(client: client, userID: userID)
        let merged = PrayerSyncMerger.merge(local, with: cloud)
        isApplyingRemoteMerge = true
        defer { isApplyingRemoteMerge = false }
        merged.writeToDefaults()

        try await client
            .from("user_prayer_sync")
            .upsert(UserPrayerSyncRecord(userID: userID, snapshot: merged))
            .execute()
    }

    private func fetchCloudSnapshot(client: SupabaseClient, userID: UUID) async throws -> PrayerSyncSnapshot? {
        let rows: [UserPrayerSyncRecord] = try await client
            .from("user_prayer_sync")
            .select()
            .eq("user_id", value: userID)
            .limit(1)
            .execute()
            .value

        return rows.first?.snapshot
    }
}

private struct UserPrayerSyncRecord: Codable {
    var userId: UUID
    var activePlanId: String
    var completedDaysByPlan: [String: [Int]]
    var savedVerseIds: [String]
    var savedPrayerRecords: [SyncedSavedPrayerRecord]
    var prayerJournalEntries: [String: PrayerJournalEntry]
    var currentStreak: Int
    var longestStreak: Int
    var lastCompletedDate: Double
    var prayerCompletionDates: [Double]
    var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case activePlanId = "active_plan_id"
        case completedDaysByPlan = "completed_days_by_plan"
        case savedVerseIds = "saved_verse_ids"
        case savedPrayerRecords = "saved_prayer_records"
        case prayerJournalEntries = "prayer_journal_entries"
        case currentStreak = "current_streak"
        case longestStreak = "longest_streak"
        case lastCompletedDate = "last_completed_date"
        case prayerCompletionDates = "prayer_completion_dates"
        case updatedAt = "updated_at"
    }

    init(userID: UUID, snapshot: PrayerSyncSnapshot) {
        userId = userID
        activePlanId = snapshot.activePlanID
        completedDaysByPlan = snapshot.completedDaysByPlan.mapValues { Array($0).sorted() }
        savedVerseIds = snapshot.savedVerseIDs.sorted()
        savedPrayerRecords = snapshot.savedPrayerRecords.map(SyncedSavedPrayerRecord.init)
        prayerJournalEntries = snapshot.journalEntries
        currentStreak = snapshot.currentStreak
        longestStreak = snapshot.longestStreak
        lastCompletedDate = snapshot.lastCompletedDate
        prayerCompletionDates = snapshot.prayerCompletionDates.map(\.timeIntervalSince1970).sorted()
        updatedAt = snapshot.updatedAt
    }

    var snapshot: PrayerSyncSnapshot {
        PrayerSyncSnapshot(
            activePlanID: activePlanId,
            completedDaysByPlan: completedDaysByPlan.mapValues(Set.init),
            savedVerseIDs: Set(savedVerseIds),
            savedPrayerRecords: savedPrayerRecords.map(\.record),
            journalEntries: prayerJournalEntries,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            lastCompletedDate: lastCompletedDate,
            prayerCompletionDates: prayerCompletionDates.map(Date.init(timeIntervalSince1970:)),
            updatedAt: updatedAt
        )
    }
}

private struct SyncedSavedPrayerRecord: Codable {
    var verseID: String
    var savedDate: Double

    init(_ record: SavedPrayerRecord) {
        verseID = record.verseID
        savedDate = record.savedDate.timeIntervalSince1970
    }

    var record: SavedPrayerRecord {
        SavedPrayerRecord(verseID: verseID, savedDate: Date(timeIntervalSince1970: savedDate))
    }
}

import XCTest
@testable import LetUsPray

final class PrayerSyncMergerTests: XCTestCase {
    @MainActor
    func testMergeUnionsProgressWithoutDroppingEitherSide() {
        let local = PrayerSyncSnapshot(
            activePlanID: "local-plan",
            completedDaysByPlan: ["proverbs": [1, 2], "psalms": [1]],
            savedVerseIDs: ["a"],
            savedPrayerRecords: [SavedPrayerRecord(verseID: "a", savedDate: Date(timeIntervalSince1970: 20))],
            journalEntries: ["day-1": PrayerJournalEntry(prayerText: "Local prayer", reflectionText: "")],
            currentStreak: 2,
            longestStreak: 4,
            lastCompletedDate: 20,
            prayerCompletionDates: [Date(timeIntervalSince1970: 20)],
            updatedAt: Date(timeIntervalSince1970: 30)
        )
        let cloud = PrayerSyncSnapshot(
            activePlanID: "cloud-plan",
            completedDaysByPlan: ["proverbs": [2, 3]],
            savedVerseIDs: ["b"],
            savedPrayerRecords: [SavedPrayerRecord(verseID: "a", savedDate: Date(timeIntervalSince1970: 10))],
            journalEntries: ["day-1": PrayerJournalEntry(prayerText: "", reflectionText: "Cloud reflection")],
            currentStreak: 5,
            longestStreak: 5,
            lastCompletedDate: 40,
            prayerCompletionDates: [Date(timeIntervalSince1970: 40)],
            updatedAt: Date(timeIntervalSince1970: 10)
        )

        let merged = PrayerSyncMerger.merge(local, with: cloud)

        XCTAssertEqual(merged.activePlanID, "local-plan")
        XCTAssertEqual(merged.completedDaysByPlan["proverbs"], Set([1, 2, 3]))
        XCTAssertEqual(merged.completedDaysByPlan["psalms"], Set([1]))
        XCTAssertEqual(merged.savedVerseIDs, Set(["a", "b"]))
        XCTAssertEqual(
            merged.savedPrayerRecords.first(where: { $0.verseID == "a" })?.savedDate,
            Date(timeIntervalSince1970: 10)
        )
        XCTAssertEqual(merged.journalEntries["day-1"]?.prayerText, "Local prayer")
        XCTAssertEqual(merged.journalEntries["day-1"]?.reflectionText, "Cloud reflection")
        XCTAssertEqual(merged.currentStreak, 5)
        XCTAssertEqual(merged.longestStreak, 5)
        XCTAssertEqual(merged.lastCompletedDate, 40)
    }

    @MainActor
    func testCloudNilReturnsLocalSnapshot() {
        let local = PrayerSyncSnapshot(
            activePlanID: "local-plan",
            completedDaysByPlan: [:],
            savedVerseIDs: [],
            savedPrayerRecords: [],
            journalEntries: [:],
            currentStreak: 1,
            longestStreak: 1,
            lastCompletedDate: 1,
            prayerCompletionDates: [],
            updatedAt: Date(timeIntervalSince1970: 1)
        )

        XCTAssertEqual(PrayerSyncMerger.merge(local, with: nil), local)
    }

    @MainActor
    func testRoundTripThroughUserDefaults() {
        let suite = UserDefaults(suiteName: "PrayerSyncMergerTests")!
        suite.removePersistentDomain(forName: "PrayerSyncMergerTests")

        let snapshot = PrayerSyncSnapshot(
            activePlanID: "proverbs-journey",
            completedDaysByPlan: ["proverbs-journey": [1, 4]],
            savedVerseIDs: ["verse-1"],
            savedPrayerRecords: [SavedPrayerRecord(verseID: "verse-1", savedDate: Date(timeIntervalSince1970: 99))],
            journalEntries: ["key": PrayerJournalEntry(prayerText: "Amen", reflectionText: "Peace")],
            currentStreak: 3,
            longestStreak: 7,
            lastCompletedDate: 99,
            prayerCompletionDates: [Date(timeIntervalSince1970: 99)],
            updatedAt: Date(timeIntervalSince1970: 100)
        )
        snapshot.writeToDefaults(suite)

        let loaded = PrayerSyncSnapshot.loadFromDefaults(suite)
        XCTAssertEqual(loaded.activePlanID, snapshot.activePlanID)
        XCTAssertEqual(loaded.completedDaysByPlan, snapshot.completedDaysByPlan)
        XCTAssertEqual(loaded.savedVerseIDs, snapshot.savedVerseIDs)
        XCTAssertEqual(loaded.journalEntries, snapshot.journalEntries)
        XCTAssertEqual(loaded.currentStreak, snapshot.currentStreak)
        XCTAssertEqual(loaded.longestStreak, snapshot.longestStreak)
        XCTAssertEqual(loaded.lastCompletedDate, snapshot.lastCompletedDate)
        XCTAssertEqual(loaded.updatedAt, snapshot.updatedAt)
    }
}

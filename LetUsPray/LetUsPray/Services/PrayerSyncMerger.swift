import Foundation

/// Merge rules for optional account sync. Local and cloud snapshots are combined
/// without deleting progress the user already has on either side.
enum PrayerSyncMerger: Sendable {
    static func merge(_ local: PrayerSyncSnapshot, with cloud: PrayerSyncSnapshot?) -> PrayerSyncSnapshot {
        guard let cloud else { return local }

        let localIsNewer = local.updatedAt >= cloud.updatedAt
        let newer = localIsNewer ? local : cloud
        let older = localIsNewer ? cloud : local

        return PrayerSyncSnapshot(
            activePlanID: newer.activePlanID.isEmpty ? older.activePlanID : newer.activePlanID,
            completedDaysByPlan: unionDays(local.completedDaysByPlan, cloud.completedDaysByPlan),
            savedVerseIDs: local.savedVerseIDs.union(cloud.savedVerseIDs),
            savedPrayerRecords: mergeRecords(local.savedPrayerRecords, cloud.savedPrayerRecords),
            journalEntries: mergeJournals(local.journalEntries, cloud.journalEntries),
            currentStreak: max(local.currentStreak, cloud.currentStreak),
            longestStreak: max(local.longestStreak, cloud.longestStreak),
            lastCompletedDate: max(local.lastCompletedDate, cloud.lastCompletedDate),
            prayerCompletionDates: unionDates(local.prayerCompletionDates, cloud.prayerCompletionDates),
            updatedAt: max(local.updatedAt, cloud.updatedAt, Date())
        )
    }

    private static func unionDays(
        _ lhs: [String: Set<Int>],
        _ rhs: [String: Set<Int>]
    ) -> [String: Set<Int>] {
        var result = lhs
        for (planID, days) in rhs {
            result[planID, default: []].formUnion(days)
        }
        return result
    }

    private static func mergeRecords(
        _ lhs: [SavedPrayerRecord],
        _ rhs: [SavedPrayerRecord]
    ) -> [SavedPrayerRecord] {
        var byID: [String: SavedPrayerRecord] = [:]
        for record in lhs + rhs {
            if let existing = byID[record.verseID] {
                if record.savedDate < existing.savedDate {
                    byID[record.verseID] = record
                }
            } else {
                byID[record.verseID] = record
            }
        }
        return Array(byID.values)
    }

    private static func mergeJournals(
        _ lhs: [String: PrayerJournalEntry],
        _ rhs: [String: PrayerJournalEntry]
    ) -> [String: PrayerJournalEntry] {
        var result = lhs
        for (key, incoming) in rhs {
            guard let existing = result[key] else {
                result[key] = incoming
                continue
            }
            result[key] = PrayerJournalEntry(
                prayerText: preferNonEmpty(existing.prayerText, incoming.prayerText),
                reflectionText: preferNonEmpty(existing.reflectionText, incoming.reflectionText)
            )
        }
        return result
    }

    private static func preferNonEmpty(_ local: String, _ cloud: String) -> String {
        let trimmedLocal = local.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedLocal.isEmpty { return local }
        return cloud
    }

    private static func unionDates(_ lhs: [Date], _ rhs: [Date]) -> [Date] {
        let calendar = Calendar.current
        var unique: [Date] = []
        for date in (lhs + rhs).sorted() {
            if !unique.contains(where: { calendar.isDate($0, inSameDayAs: date) }) {
                unique.append(calendar.startOfDay(for: date))
            }
        }
        return unique
    }
}

struct PrayerSyncSnapshot: Equatable, Sendable {
    var activePlanID: String
    var completedDaysByPlan: [String: Set<Int>]
    var savedVerseIDs: Set<String>
    var savedPrayerRecords: [SavedPrayerRecord]
    var journalEntries: [String: PrayerJournalEntry]
    var currentStreak: Int
    var longestStreak: Int
    var lastCompletedDate: Double
    var prayerCompletionDates: [Date]
    var updatedAt: Date

    static func loadFromDefaults(_ defaults: UserDefaults = .standard) -> PrayerSyncSnapshot {
        let savedIDs = PrayerStorageCodec.decodeStringSet(
            defaults.string(forKey: PrayerStorageKeys.savedVerseIDs) ?? ""
        )
        let records = PrayerStorageCodec.decodeValue(
            [SavedPrayerRecord].self,
            from: defaults.string(forKey: PrayerStorageKeys.savedPrayerRecords) ?? "[]"
        ) ?? []
        let journals = PrayerStorageCodec.decodeValue(
            [String: PrayerJournalEntry].self,
            from: defaults.string(forKey: PrayerStorageKeys.prayerJournalEntries) ?? "{}"
        ) ?? [:]
        let completionDates = PrayerStorageCodec.decodeValue(
            [Date].self,
            from: defaults.string(forKey: PrayerStorageKeys.prayerCompletionDates) ?? "[]"
        ) ?? []
        let storedUpdatedAt = defaults.double(forKey: PrayerStorageKeys.syncUpdatedAt)

        return PrayerSyncSnapshot(
            activePlanID: defaults.string(forKey: PrayerStorageKeys.activePlanID) ?? "",
            completedDaysByPlan: PrayerStorageCodec.decodeCompletedDaysByPlan(
                defaults.string(forKey: PrayerStorageKeys.completedDaysByPlan) ?? "{}"
            ),
            savedVerseIDs: savedIDs,
            savedPrayerRecords: records,
            journalEntries: journals,
            currentStreak: defaults.integer(forKey: PrayerStorageKeys.currentStreak),
            longestStreak: defaults.integer(forKey: PrayerStorageKeys.longestStreak),
            lastCompletedDate: defaults.double(forKey: PrayerStorageKeys.lastCompletedDate),
            prayerCompletionDates: completionDates,
            updatedAt: storedUpdatedAt > 0 ? Date(timeIntervalSince1970: storedUpdatedAt) : .distantPast
        )
    }

    func persistUpdatedAt(_ defaults: UserDefaults = .standard) {
        defaults.set(updatedAt.timeIntervalSince1970, forKey: PrayerStorageKeys.syncUpdatedAt)
    }

    func writeToDefaults(_ defaults: UserDefaults = .standard) {
        defaults.set(activePlanID, forKey: PrayerStorageKeys.activePlanID)
        defaults.set(
            PrayerStorageCodec.encodeCompletedDaysByPlan(completedDaysByPlan),
            forKey: PrayerStorageKeys.completedDaysByPlan
        )
        defaults.set(
            PrayerStorageCodec.encodeStringSet(savedVerseIDs),
            forKey: PrayerStorageKeys.savedVerseIDs
        )
        defaults.set(
            PrayerStorageCodec.encodeValue(savedPrayerRecords),
            forKey: PrayerStorageKeys.savedPrayerRecords
        )
        defaults.set(
            PrayerStorageCodec.encodeValue(journalEntries),
            forKey: PrayerStorageKeys.prayerJournalEntries
        )
        defaults.set(currentStreak, forKey: PrayerStorageKeys.currentStreak)
        defaults.set(longestStreak, forKey: PrayerStorageKeys.longestStreak)
        defaults.set(lastCompletedDate, forKey: PrayerStorageKeys.lastCompletedDate)
        defaults.set(
            PrayerStorageCodec.encodeValue(prayerCompletionDates.sorted()),
            forKey: PrayerStorageKeys.prayerCompletionDates
        )
        defaults.set(updatedAt.timeIntervalSince1970, forKey: PrayerStorageKeys.syncUpdatedAt)

        let activeDays = completedDaysByPlan[activePlanID] ?? []
        defaults.set(
            PrayerStorageCodec.encodeIntSet(activeDays),
            forKey: PrayerStorageKeys.completedDayNumbers
        )
        defaults.set(savedVerseIDs.count, forKey: PrayerStorageKeys.savedPrayersCount)
        defaults.set(
            completedDaysByPlan.values.reduce(0) { $0 + $1.count },
            forKey: PrayerStorageKeys.completedPrayersCount
        )
        defaults.set(activePlanID, forKey: PrayerStorageKeys.analyticsActivePlanID)
    }
}

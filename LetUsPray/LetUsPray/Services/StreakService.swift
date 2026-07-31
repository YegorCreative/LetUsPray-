import Foundation

struct StreakService {
    private let calendar: Calendar

    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    func refreshedStreak(
        from existing: PrayerStreak,
        referenceDate: Date = Date()
    ) -> PrayerStreak {
        guard existing.currentStreak > 0,
              let lastCompletedDate = existing.lastCompletedDate else {
            return existing
        }

        let lastDay = calendar.startOfDay(for: lastCompletedDate)
        let referenceDay = calendar.startOfDay(for: referenceDate)
        let daysSinceCompletion = calendar.dateComponents(
            [.day],
            from: lastDay,
            to: referenceDay
        ).day ?? 0

        guard daysSinceCompletion > 1 else {
            return existing
        }

        return PrayerStreak(
            currentStreak: 0,
            longestStreak: existing.longestStreak,
            lastCompletedDate: lastDay
        )
    }

    func updateStreak(from existing: PrayerStreak, completionDate: Date = Date()) -> PrayerStreak {
        let completionDay = calendar.startOfDay(for: completionDate)

        guard let lastCompletedDate = existing.lastCompletedDate else {
            return PrayerStreak(
                currentStreak: 1,
                longestStreak: max(existing.longestStreak, 1),
                lastCompletedDate: completionDay
            )
        }

        let lastDay = calendar.startOfDay(for: lastCompletedDate)

        if calendar.isDate(lastDay, inSameDayAs: completionDay) {
            return existing
        }

        let daysBetween = calendar.dateComponents([.day], from: lastDay, to: completionDay).day ?? 0

        guard daysBetween > 0 else {
            return existing
        }

        let nextCurrentStreak = daysBetween == 1 ? max(existing.currentStreak, 0) + 1 : 1
        let nextLongestStreak = max(existing.longestStreak, nextCurrentStreak)

        return PrayerStreak(
            currentStreak: nextCurrentStreak,
            longestStreak: nextLongestStreak,
            lastCompletedDate: completionDay
        )
    }
}

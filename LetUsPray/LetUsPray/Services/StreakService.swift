import Foundation

struct StreakService {
    private let calendar: Calendar

    init(calendar: Calendar = .current) {
        self.calendar = calendar
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

        let nextCurrentStreak = daysBetween == 1 ? existing.currentStreak + 1 : 1
        let nextLongestStreak = max(existing.longestStreak, nextCurrentStreak)

        return PrayerStreak(
            currentStreak: nextCurrentStreak,
            longestStreak: nextLongestStreak,
            lastCompletedDate: completionDay
        )
    }
}

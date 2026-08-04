import SwiftUI

/// A compact, at-a-glance progress card for the Today screen — reads as an actual calendar
/// (weekday header + a fixed 7-column, 2-row date grid for the last 14 days, ending today),
/// not a chip list. Tapping it opens the full `PrayerCalendarView`. Completion is derived
/// entirely from `prayerCompletionDates`; streak text reuses `PrayerStreak.badgeText`.
struct PrayerCalendarStrip: View {
    let prayerCompletionDates: [Date]
    let prayerStreak: PrayerStreak

    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 7)

    private var completedDayComponents: Set<DateComponents> {
        Set(prayerCompletionDates.map {
            calendar.dateComponents([.year, .month, .day], from: $0)
        })
    }

    /// Last 14 days ending today — never future days, by construction.
    private var recentDays: [Date] {
        let today = calendar.startOfDay(for: Date())
        return (0..<14).reversed().compactMap {
            calendar.date(byAdding: .day, value: -$0, to: today)
        }
    }

    private var weekdaySymbols: [String] {
        let symbols = calendar.veryShortWeekdaySymbols
        let offset = calendar.firstWeekday - 1
        return Array(symbols[offset...] + symbols[..<offset])
    }

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            header

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(weekdaySymbols.enumerated()), id: \.offset) { _, symbol in
                    Text(symbol)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(AppColors.tertiaryText)
                        .frame(maxWidth: .infinity)
                }

                ForEach(recentDays, id: \.self) { date in
                    dayCell(for: date)
                }
            }
            .accessibilityElement(children: .contain)
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(cardBackground)
    }

    /// Deliberately not `.prayerSurface()` — that shared style bakes in a white→blue→green
    /// highlight gradient, which is exactly the multi-hue effect the new "98% solid, 2% depth"
    /// language rules out. Fixing the shared token is Phase X scope; this card gets its own
    /// minimal background instead: one base color, a near-invisible white overlay for depth,
    /// no hue transition anywhere.
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
            .fill(AppColors.surface)
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .stroke(AppColors.separator, lineWidth: 1)
            }
            .shadow(color: AppColors.shadow, radius: 14, x: 0, y: 6)
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Prayer Calendar")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.primaryText)
            Spacer()
            Text(prayerStreak.badgeText)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
        }
    }

    private func dayCell(for date: Date) -> some View {
        let completed = isCompleted(date)
        let isToday = calendar.isDateInToday(date)
        let dayNumber = calendar.component(.day, from: date)

        return ZStack {
            if completed {
                Circle()
                    .fill(AppColors.accent)
                    .frame(width: 30, height: 30)
            }

            if isToday {
                Circle()
                    .stroke(AppColors.accent, lineWidth: 1.5)
                    .frame(width: 30, height: 30)
            }

            if completed {
                Image(systemName: "checkmark")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(AppColors.brightTextOnAccent)
            } else {
                Text("\(dayNumber)")
                    .font(.system(size: 13, weight: isToday ? .semibold : .regular))
                    .foregroundStyle(AppColors.secondaryText)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 34)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabel(for: date, completed: completed, isToday: isToday))
    }

    private func accessibilityLabel(for date: Date, completed: Bool, isToday: Bool) -> String {
        let dateText = date.formatted(.dateTime.month(.wide).day())
        var state = completed ? "Prayer completed" : "No prayer recorded"
        if isToday { state += ", today" }
        return "\(dateText), \(state)"
    }

    private func isCompleted(_ date: Date) -> Bool {
        completedDayComponents.contains(calendar.dateComponents([.year, .month, .day], from: date))
    }
}

#Preview {
    PrayerCalendarStrip(
        prayerCompletionDates: [
            Calendar.current.date(byAdding: .day, value: -1, to: .now) ?? .now,
            Calendar.current.date(byAdding: .day, value: -2, to: .now) ?? .now,
            Calendar.current.date(byAdding: .day, value: -4, to: .now) ?? .now
        ],
        prayerStreak: PrayerStreak(currentStreak: 2, longestStreak: 5, lastCompletedDate: .now)
    )
    .padding()
    .background(PrayerBackground())
}

import SwiftUI

private struct CompletedDaySelection: Identifiable {
    let date: Date
    var id: Date { date }
}

/// A read-only progress calendar — not a scheduler. Completion is derived entirely from
/// `prayerCompletionDates`, the same store `PrayerInsightsService` already reads.
struct PrayerCalendarView: View {
    let prayerCompletionDates: [Date]

    @State private var displayedMonth = Calendar.current.startOfMonth(for: Date())
    @State private var selectedCompletion: CompletedDaySelection?

    private let calendar = Calendar.current

    private var completedDayComponents: Set<DateComponents> {
        Set(prayerCompletionDates.map {
            calendar.dateComponents([.year, .month, .day], from: $0)
        })
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                monthHeader
                GlassCard(padding: AppSpacing.large) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        weekdayHeader
                        calendarGrid
                    }
                }
                legend
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle("Prayer Calendar")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
        .sheet(item: $selectedCompletion) { selection in
            completionDetail(for: selection.date)
                .presentationDetents([.height(260)])
        }
    }

    // MARK: - Month header

    private var monthHeader: some View {
        HStack {
            Text(monthTitle)
                .font(AppTypography.screenTitle())
                .foregroundStyle(AppColors.primaryText)
                .contentTransition(.numericText())

            Spacer()

            HStack(spacing: AppSpacing.small) {
                monthStepButton(systemImage: "chevron.left", accessibilityLabel: "Previous month") {
                    changeMonth(by: -1)
                }
                monthStepButton(systemImage: "chevron.right", accessibilityLabel: "Next month") {
                    changeMonth(by: 1)
                }
            }
        }
    }

    private func monthStepButton(systemImage: String, accessibilityLabel: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)
                .frame(width: 44, height: 44)
                .background(AppColors.elevatedSurface, in: Circle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(accessibilityLabel)
    }

    private func changeMonth(by value: Int) {
        guard let newMonth = calendar.date(byAdding: .month, value: value, to: displayedMonth) else { return }
        withAnimation(PrayerMotion.spring) {
            displayedMonth = newMonth
        }
    }

    private var monthTitle: String {
        displayedMonth.formatted(.dateTime.month(.wide).year())
    }

    // MARK: - Grid

    private var weekdaySymbols: [String] {
        let symbols = calendar.veryShortWeekdaySymbols
        let offset = calendar.firstWeekday - 1
        return Array(symbols[offset...] + symbols[..<offset])
    }

    private var weekdayHeader: some View {
        HStack {
            ForEach(Array(weekdaySymbols.enumerated()), id: \.offset) { _, symbol in
                Text(symbol)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
                    .frame(maxWidth: .infinity)
            }
        }
        .accessibilityHidden(true)
    }

    private var monthDays: [Date?] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: displayedMonth),
              let dayRange = calendar.range(of: .day, in: .month, for: displayedMonth) else {
            return []
        }

        let firstWeekdayOffset = (calendar.component(.weekday, from: monthInterval.start) - calendar.firstWeekday + 7) % 7
        let leadingBlanks = Array<Date?>(repeating: nil, count: firstWeekdayOffset)
        let days = dayRange.compactMap { day -> Date? in
            calendar.date(byAdding: .day, value: day - 1, to: monthInterval.start)
        }
        return leadingBlanks + days
    }

    private var calendarGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 7), spacing: 8) {
            ForEach(Array(monthDays.enumerated()), id: \.offset) { _, date in
                if let date {
                    dayCell(for: date)
                } else {
                    Color.clear.frame(minHeight: 44)
                }
            }
        }
    }

    // MARK: - Day cell

    private func dayCell(for date: Date) -> some View {
        let completed = isCompleted(date)
        let isToday = calendar.isDateInToday(date)
        let isFuture = calendar.startOfDay(for: date) > calendar.startOfDay(for: Date())
        let dayNumber = calendar.component(.day, from: date)

        return Button {
            guard completed else { return }
            selectedCompletion = CompletedDaySelection(date: date)
        } label: {
            ZStack {
                Circle()
                    .fill(completed ? AppColors.accent : AppColors.surface.opacity(isFuture ? 0.5 : 1))

                if isToday {
                    Circle()
                        .stroke(AppColors.accent, lineWidth: 2)
                }

                if completed {
                    Image(systemName: "checkmark")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                } else {
                    Text("\(dayNumber)")
                        .font(AppTypography.footnote())
                        .fontWeight(isToday ? .semibold : .regular)
                        .foregroundStyle(isFuture ? AppColors.tertiaryText : AppColors.secondaryText)
                }
            }
            .frame(minWidth: 44, minHeight: 44)
        }
        .buttonStyle(.plain)
        .disabled(!completed)
        .accessibilityLabel(accessibilityLabel(for: date, completed: completed, isToday: isToday))
        .accessibilityAddTraits(completed ? [.isButton] : [])
    }

    private func accessibilityLabel(for date: Date, completed: Bool, isToday: Bool) -> String {
        let dateText = date.formatted(.dateTime.month(.wide).day().year())
        var state = completed ? "Prayer completed" : "No prayer recorded"
        if isToday { state += ", today" }
        return "\(dateText), \(state)"
    }

    private func isCompleted(_ date: Date) -> Bool {
        completedDayComponents.contains(calendar.dateComponents([.year, .month, .day], from: date))
    }

    // MARK: - Legend

    private var legend: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            legendRow(color: AppColors.accent, label: "Completed", showsCheckmark: true)
            legendRow(color: AppColors.surface, label: "No activity", isOutlined: true)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Legend: filled with a checkmark means prayer completed. An outlined circle marks today.")
    }

    private func legendRow(color: Color, label: String, showsCheckmark: Bool = false, isOutlined: Bool = false) -> some View {
        HStack(spacing: AppSpacing.small) {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 20, height: 20)
                if isOutlined {
                    Circle()
                        .stroke(AppColors.separator, lineWidth: 1)
                        .frame(width: 20, height: 20)
                }
                if showsCheckmark {
                    Image(systemName: "checkmark")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                }
            }
            Text(label)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.secondaryText)
        }
    }

    // MARK: - Completion detail

    /// Shown when a completed day is tapped. Keyed only by date today; once prayer history
    /// records which plan/day was prayed on a given date, this is the extension point to
    /// navigate straight into that journey day instead of showing a summary.
    private func completionDetail(for date: Date) -> some View {
        VStack(spacing: AppSpacing.medium) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 34, weight: .semibold))
                .foregroundStyle(AppColors.success)
                .padding(.top, AppSpacing.large)

            Text(date.formatted(.dateTime.month(.wide).day().year()))
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.primaryText)

            Text("You spent time in prayer this day.")
                .font(AppTypography.secondaryBody())
                .foregroundStyle(AppColors.secondaryText)
                .multilineTextAlignment(.center)

            Spacer(minLength: 0)
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity)
        .background(PrayerBackground())
        .accessibilityElement(children: .combine)
    }
}

private extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        dateInterval(of: .month, for: date)?.start ?? date
    }
}

#Preview {
    NavigationStack {
        PrayerCalendarView(prayerCompletionDates: [
            Calendar.current.date(byAdding: .day, value: -1, to: .now) ?? .now,
            Calendar.current.date(byAdding: .day, value: -3, to: .now) ?? .now,
            Calendar.current.date(byAdding: .day, value: -4, to: .now) ?? .now
        ])
    }
}

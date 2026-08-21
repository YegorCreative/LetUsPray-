import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var prayerStreak: PrayerStreak
    @Binding var analytics: PrayerAnalyticsSnapshot
    let latestCompletedPrayer: HomePrayerActivity?
    let latestSavedPrayer: HomePrayerActivity?
    let latestStartedJourney: HomeJourneyActivity?
    let prayerCompletionDates: [Date]
    let onOpenDay: (PrayerDay) -> Void
    let onStartJourney: (PrayerPlan) -> Void
    let onOpenPlan: (PrayerPlan) -> Void
    let onOpenPlans: () -> Void
    let onOpenSaved: () -> Void
    let onOpenSearch: () -> Void

    private var activePlan: PrayerPlan { viewModel.activePlan }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.xLarge) {
                greetingSection

                if activePlan.supportsJourneyStart {
                    let nextDay = viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers, in: activePlan)
                    continuePrayerCard(for: nextDay)
                } else {
                    EmptyStateView(
                        title: "A prayer journey is on its way",
                        message: "\(activePlan.title) is available as a preview and will become prayer-ready in a future release.",
                        systemImage: activePlan.coverIcon
                    )
                }

                compactPrayerCalendarSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var greetingSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(viewModel.greeting())
                .font(AppTypography.screenTitle())
                .foregroundStyle(AppColors.primaryText)

            Text(Date.now.formatted(date: .complete, time: .omitted))
                .font(AppTypography.metadata())
                .foregroundStyle(AppColors.tertiaryText)

            Text(dailyEncouragement)
                .font(AppTypography.secondaryBody())
                .foregroundStyle(AppColors.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, AppSpacing.small)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(viewModel.greeting()). \(Date.now.formatted(date: .complete, time: .omitted)). \(dailyEncouragement)")
    }

    private var dailyEncouragement: String {
        prayerStreak.currentStreak > 0
            ? "You’re on a \(prayerStreak.currentStreak)-day prayer journey."
            : "Today is a gentle place to begin your prayer journey."
    }

    private func continuePrayerCard(for day: PrayerDay) -> some View {
        let completed = viewModel.completedCount(completedDayNumbers: completedDayNumbers, in: activePlan)
        let total = max(activePlan.days.count, activePlan.durationDays)
        let isStarted = completed > 0

        // A "nice green card," not a "nice gradient": one flat color, no hue transition.
        // Replaces the previous green→blue diagonal `category.brandGradient` locally,
        // without touching the shared `BrandGradients.swift` (Phase X scope).
        return HeroCard(gradient: AppColors.accent) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                        Text(isStarted ? "Continue Journey" : "Today's Prayer")
                            .font(AppTypography.caption())
                            .fontWeight(.bold)
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
                            .textCase(.uppercase)

                        Text(day.title)
                            .font(AppTypography.largeDisplay())
                            .foregroundStyle(AppColors.brightTextOnAccent)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(activePlan.title)
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
                    }

                    Spacer(minLength: AppSpacing.small)

                    Image(systemName: activePlan.coverIcon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 46, height: 46)
                        .background(Color.white.opacity(0.18), in: Circle())
                        .accessibilityHidden(true)
                }

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.92))
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)

                HStack(spacing: AppSpacing.xLarge) {
                    heroStat("Session", value: "\(min(completed + 1, total)) of \(total)")
                    Spacer(minLength: 0)
                }

                Button { onOpenDay(day) } label: {
                    HStack(spacing: AppSpacing.small) {
                        Text(isStarted ? "Continue Prayer" : "Start Today's Prayer")
                            .font(AppTypography.callout())
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 14, weight: .bold))
                    }
                    .foregroundStyle(AppColors.accent)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, AppSpacing.medium)
                    .background(AppColors.elevatedSurface, in: RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous))
                }
                .buttonStyle(.plain)
                .accessibilityHint(isStarted ? "Resumes your current prayer journey." : "Opens today's prayer.")
            }
        }
        .accessibilityElement(children: .contain)
    }

    private func heroStat(_ title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.68))
            Text(value)
                .font(AppTypography.cardTitle())
                .foregroundStyle(AppColors.brightTextOnAccent)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
    }

    private var compactPrayerCalendarSection: some View {
        NavigationLink {
            PrayerCalendarView(prayerCompletionDates: prayerCompletionDates)
        } label: {
            PrayerCalendarStrip(prayerCompletionDates: prayerCompletionDates, prayerStreak: prayerStreak)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Prayer Calendar")
        .accessibilityHint("Opens the full prayer calendar. \(prayerStreak.badgeText).")
    }
}

#Preview {
    TodayView(
        viewModel: PrayerPlanViewModel(),
        completedDayNumbers: .constant([]),
        savedVerseIDs: .constant([]),
        prayerStreak: .constant(.empty),
        analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:])),
        latestCompletedPrayer: nil,
        latestSavedPrayer: nil,
        latestStartedJourney: nil,
        prayerCompletionDates: [],
        onOpenDay: { _ in },
        onStartJourney: { _ in },
        onOpenPlan: { _ in },
        onOpenPlans: {},
        onOpenSaved: {},
        onOpenSearch: {}
    )
}

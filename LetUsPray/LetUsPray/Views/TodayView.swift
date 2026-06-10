import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var prayerStreak: PrayerStreak
    @Binding var analytics: PrayerAnalyticsSnapshot
    let onOpenDay: (PrayerDay) -> Void

    @State private var completionPulse = false
    private let streakService = StreakService()

    private var activePlan: PrayerPlan {
        viewModel.activePlan
    }

    private var planAccent: Color {
        activePlan.category.brandAccent
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                greetingSection

                if activePlan.supportsJourneyStart {
                    let nextDay = viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers, in: activePlan)
                    let completedCount = viewModel.completedCount(completedDayNumbers: completedDayNumbers, in: activePlan)

                    JourneyProgressCard(
                        planTitle: activePlan.title,
                        completedDays: completedCount,
                        totalDays: activePlan.durationDays,
                        accent: planAccent,
                        gradient: activePlan.category.brandGradient
                    )

                    heroCard(for: nextDay)
                    streakCard
                    continueJourneySection(for: nextDay)
                } else {
                    EmptyStateView(
                        title: "Coming Soon",
                        message: "\(activePlan.title) is available as a preview plan and will become fully prayer-ready in a future release.",
                        systemImage: activePlan.coverIcon
                    )
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var greetingSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(viewModel.greeting())
                .font(AppTypography.caption())
                .foregroundStyle(planAccent)
                .textCase(.uppercase)

            Text(AppMetadata.appName)
                .font(AppTypography.largeTitle())
                .foregroundStyle(AppColors.textPrimary)

            Text(AppMetadata.tagline)
                .font(AppTypography.callout())
                .foregroundStyle(AppColors.textSecondary)
                .fixedSize(horizontal: false, vertical: true)

            Text(activePlan.subtitle)
                .font(AppTypography.callout())
                .foregroundStyle(AppColors.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, AppSpacing.small)
    }

    private func heroCard(for day: PrayerDay) -> some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(activePlan.title)
                            .font(AppTypography.caption())
                            .foregroundStyle(planAccent)
                            .textCase(.uppercase)

                        Text(day.title)
                            .font(AppTypography.title())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(day.chapterReference)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.textSecondary)
                    }

                    Spacer()

                    Image(systemName: completionPulse ? "checkmark.seal.fill" : activePlan.coverIcon)
                        .font(.system(size: 28, weight: .medium))
                        .foregroundStyle(AppColors.textPrimary)
                        .padding(14)
                        .background(activePlan.category.brandGradient, in: Circle())
                        .scaleEffect(completionPulse ? 1.08 : 1.0)
                        .animation(.spring(response: 0.36, dampingFraction: 0.68), value: completionPulse)
                }

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                HStack(spacing: AppSpacing.medium) {
                    statPill(title: "Category", value: activePlan.category.displayTitle)
                    statPill(title: "Saved", value: "\(savedVerseIDs.count) prayers")
                }

                VStack(spacing: AppSpacing.medium) {
                    Button(action: { onOpenDay(day) }) {
                        PrimaryPrayerButton(title: "Open Today's Prayer", systemImage: "arrow.right.circle.fill")
                    }
                    .buttonStyle(.plain)

                    Button(action: { markDayAsPrayed(dayNumber: day.dayNumber) }) {
                        PrimaryPrayerButton(
                            title: completedDayNumbers.contains(day.dayNumber) ? "Marked as Prayed" : "Mark as Prayed",
                            systemImage: completedDayNumbers.contains(day.dayNumber) ? "checkmark.circle.fill" : "checkmark.circle",
                            isSecondary: true
                        )
                        .scaleEffect(completionPulse ? 1.02 : 1.0)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(activePlan.category.brandGradient.opacity(0.22))
                .blur(radius: 18)
        )
    }

    private var streakCard: some View {
        GlassCard {
            HStack(alignment: .center, spacing: AppSpacing.medium) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(AppColors.textPrimary)
                    .frame(width: 48, height: 48)
                    .background(BrandGradients.streakGlow, in: RoundedRectangle(cornerRadius: 16, style: .continuous))

                VStack(alignment: .leading, spacing: 6) {
                    Text(prayerStreak.badgeText)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)

                    Text("Longest streak: \(prayerStreak.longestStreak) day\(prayerStreak.longestStreak == 1 ? "" : "s")")
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(analytics.completedDaysByPlan[activePlan.id] ?? 0)")
                        .font(AppTypography.title())
                        .foregroundStyle(AppColors.premiumGold)

                    Text("prayed")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(BrandGradients.streakGlow.opacity(0.18))
                .blur(radius: 16)
        )
    }

    private func continueJourneySection(for day: PrayerDay) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Continue Journey")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            Button(action: { onOpenDay(day) }) {
                JourneyDayCard(day: day, isCompleted: completedDayNumbers.contains(day.dayNumber))
            }
            .buttonStyle(.plain)
        }
    }

    private func statPill(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)
            Text(value)
                .font(AppTypography.footnote())
                .foregroundStyle(AppColors.textPrimary)
        }
        .padding(.vertical, AppSpacing.small)
        .padding(.horizontal, AppSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(AppColors.glassStroke, lineWidth: 1)
        }
    }

    private func markDayAsPrayed(dayNumber: Int) {
        guard !completedDayNumbers.contains(dayNumber) else { return }

        withAnimation(.spring(response: 0.34, dampingFraction: 0.76)) {
            completedDayNumbers.insert(dayNumber)
            completionPulse = true
        }

        prayerStreak = streakService.updateStreak(from: prayerStreak)
        HapticsService.markPrayerCompleted()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            withAnimation(.spring(response: 0.36, dampingFraction: 0.84)) {
                completionPulse = false
            }
        }
    }
}

#Preview {
    TodayView(
        viewModel: PrayerPlanViewModel(),
        completedDayNumbers: .constant([]),
        savedVerseIDs: .constant([]),
        prayerStreak: .constant(.empty),
        analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:])),
        onOpenDay: { _ in }
    )
    .background(PrayerBackground())
}

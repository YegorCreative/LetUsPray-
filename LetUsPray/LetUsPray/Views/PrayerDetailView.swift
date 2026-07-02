import SwiftUI

struct PrayerDetailView: View {
    let plan: PrayerPlan
    let day: PrayerDay
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    @State private var completionPulse = false
    private let streakService = StreakService()

    private var accentColor: Color {
        AppColors.planAccent(named: plan.accentColorName)
    }

    private var isCompleted: Bool {
        completedDayNumbers.contains(day.dayNumber)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                headerCard

                if day.verses.isEmpty {
                    placeholderCard
                } else {
                    ForEach(day.verses) { verse in
                        PrayerCardView(
                            verse: verse,
                            isSaved: savedVerseIDs.contains(verse.id),
                            onToggleSaved: {
                                toggleSaved(verseID: verse.id)
                            }
                        )
                    }

                    reflectionCompletionSection
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var reflectionCompletionSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Continue the conversation", systemImage: isCompleted ? "checkmark.circle.fill" : "heart.text.square.fill")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                Text("Take a quiet moment to respond to God in your own words. You may reflect, pray silently, or simply rest before continuing.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                Button(action: completePrayer) {
                    PrimaryPrayerButton(
                        title: isCompleted ? "Prayer Completed" : "Complete Prayer",
                        systemImage: isCompleted ? "checkmark.circle.fill" : "checkmark.circle",
                        isSecondary: isCompleted
                    )
                    .scaleEffect(completionPulse ? 1.02 : 1.0)
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                .disabled(isCompleted)
                .accessibilityHint(isCompleted ? "This prayer has already been completed." : "Marks this prayer complete after reflection.")
            }
        }
    }

    private var headerCard: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text(plan.title)
                    .font(AppTypography.caption())
                    .foregroundStyle(accentColor)
                    .textCase(.uppercase)

                Text("Day \(day.dayNumber)")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textTertiary)
                    .textCase(.uppercase)

                Text(day.title)
                    .font(AppTypography.title())
                    .foregroundStyle(AppColors.textPrimary)

                Text(day.chapterReference)
                    .font(AppTypography.callout())
                    .foregroundStyle(AppColors.textSecondary)

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
            }
        }
    }

    private var placeholderCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Prayer content is coming soon", systemImage: "sparkles")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                Text("This journey day has been prepared as a placeholder for the next stage of content creation. The plan structure is already in place.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
            }
        }
    }

    private func completePrayer() {
        guard !isCompleted else { return }

        var updatedDays = completedDayNumbers
        updatedDays.insert(day.dayNumber)

        withAnimation(.spring(response: 0.34, dampingFraction: 0.76)) {
            completedDayNumbers = updatedDays
            completionPulse = true
        }

        updateAnalytics(completedDaysCount: updatedDays.count)
        updateStoredStreak()
        HapticsService.markPrayerCompleted()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            withAnimation(.spring(response: 0.36, dampingFraction: 0.84)) {
                completionPulse = false
            }
        }
    }

    private func toggleSaved(verseID: String) {
        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
            if savedVerseIDs.contains(verseID) {
                savedVerseIDs.remove(verseID)
                HapticsService.unsavePrayer()
            } else {
                savedVerseIDs.insert(verseID)
                HapticsService.savePrayer()
            }
        }

        analytics = PrayerAnalyticsSnapshot(
            completedPrayersCount: analytics.completedPrayersCount,
            savedPrayersCount: savedVerseIDs.count,
            activePlanID: analytics.activePlanID,
            completedDaysByPlan: analytics.completedDaysByPlan
        )
    }

    private func updateAnalytics(completedDaysCount: Int) {
        var completedDaysByPlan = analytics.completedDaysByPlan
        completedDaysByPlan[plan.id] = completedDaysCount

        analytics = PrayerAnalyticsSnapshot(
            completedPrayersCount: analytics.completedPrayersCount + 1,
            savedPrayersCount: analytics.savedPrayersCount,
            activePlanID: analytics.activePlanID,
            completedDaysByPlan: completedDaysByPlan
        )
    }

    private func updateStoredStreak() {
        let defaults = UserDefaults.standard
        let lastCompletedTimeInterval = defaults.double(forKey: PrayerStorageKeys.lastCompletedDate)
        let existing = PrayerStreak(
            currentStreak: defaults.integer(forKey: PrayerStorageKeys.currentStreak),
            longestStreak: defaults.integer(forKey: PrayerStorageKeys.longestStreak),
            lastCompletedDate: lastCompletedTimeInterval > 0 ? Date(timeIntervalSince1970: lastCompletedTimeInterval) : nil
        )
        let updated = streakService.updateStreak(from: existing)

        defaults.set(updated.currentStreak, forKey: PrayerStorageKeys.currentStreak)
        defaults.set(updated.longestStreak, forKey: PrayerStorageKeys.longestStreak)
        defaults.set(updated.lastCompletedDate?.timeIntervalSince1970 ?? 0, forKey: PrayerStorageKeys.lastCompletedDate)
    }
}

#Preview {
    NavigationStack {
        PrayerDetailView(
            plan: ProverbsPrayerData.plan,
            day: ProverbsPrayerData.plan.days[0],
            completedDayNumbers: .constant([]),
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

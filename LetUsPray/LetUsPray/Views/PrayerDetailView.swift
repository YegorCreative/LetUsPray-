import SwiftUI

struct PrayerDetailView: View {
    let plan: PrayerPlan
    let day: PrayerDay
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    private var accentColor: Color {
        AppColors.planAccent(named: plan.accentColorName)
    }

    var body: some View {
        ZStack {
            PrayerBackground()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: AppSpacing.large) {
                    headerCard

                    Text("Loaded \(day.verses.count) prayers")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                        .frame(maxWidth: .infinity, alignment: .center)

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
                    }
                }
                .padding(.horizontal, AppSpacing.large)
                .padding(.top, AppSpacing.medium)
                .padding(.bottom, AppSpacing.xxLarge)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
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
}

#Preview {
    NavigationStack {
        PrayerDetailView(
            plan: ProverbsPrayerData.plan,
            day: ProverbsPrayerData.plan.days[0],
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

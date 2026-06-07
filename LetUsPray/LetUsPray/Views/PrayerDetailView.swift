import SwiftUI

struct PrayerDetailView: View {
    let day: PrayerDay
    @Binding var savedVerseIDs: Set<String>

    var body: some View {
        ZStack {
            PrayerBackground()

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
                Text("Day \(day.dayNumber)")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.accent)
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

                Text("This journey day has been prepared as a placeholder for the next stage of content creation. The Proverbs plan structure is already in place.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
            }
        }
    }

    private func toggleSaved(verseID: String) {
        if savedVerseIDs.contains(verseID) {
            savedVerseIDs.remove(verseID)
        } else {
            savedVerseIDs.insert(verseID)
        }
    }
}

#Preview {
    NavigationStack {
        PrayerDetailView(
            day: ProverbsPrayerData.plan.days[0],
            savedVerseIDs: .constant([])
        )
    }
}

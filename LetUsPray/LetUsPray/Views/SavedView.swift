import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    var body: some View {
        let savedItems = viewModel.savedVerses(for: savedVerseIDs)

        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                Text("Saved")
                    .font(AppTypography.largeTitle())
                    .foregroundStyle(AppColors.textPrimary)
                    .padding(.top, AppSpacing.small)

                if savedItems.isEmpty {
                    emptyState
                } else {
                    ForEach(savedItems) { item in
                        let accent = item.plan.category.brandAccent

                        GlassCard {
                            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                                HStack(alignment: .top, spacing: AppSpacing.medium) {
                                    Image(systemName: item.plan.category.brandIcon)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundStyle(AppColors.textPrimary)
                                        .frame(width: 42, height: 42)
                                        .background(BrandGradients.savedPrayer, in: RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(item.plan.title)
                                            .font(AppTypography.caption())
                                            .foregroundStyle(accent)

                                        Text(item.verse.reference)
                                            .font(AppTypography.caption())
                                            .foregroundStyle(AppColors.premiumGold)

                                        Text(item.day.chapterReference)
                                            .font(AppTypography.footnote())
                                            .foregroundStyle(AppColors.textTertiary)

                                        Text(item.verse.text)
                                            .font(AppTypography.headline())
                                            .foregroundStyle(AppColors.textPrimary)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }

                                    Spacer()

                                    Button {
                                        removeSavedPrayer(id: item.verse.id)
                                    } label: {
                                        Image(systemName: "bookmark.fill")
                                            .foregroundStyle(AppColors.premiumGold)
                                            .padding(10)
                                            .background(.thinMaterial, in: Circle())
                                    }
                                    .buttonStyle(.plain)
                                }

                                VStack(alignment: .leading, spacing: AppSpacing.small) {
                                    Text("Prayer")
                                        .font(AppTypography.caption())
                                        .foregroundStyle(AppColors.textTertiary)
                                        .textCase(.uppercase)

                                    Text(item.verse.prayer)
                                        .font(AppTypography.body())
                                        .foregroundStyle(AppColors.textSecondary)
                                        .lineSpacing(4)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var emptyState: some View {
        EmptyStateView(
            title: "No saved prayers yet.",
            message: "When a verse becomes a prayer you want to return to, save it here for quiet reflection later.",
            systemImage: "bookmark.slash"
        )
    }

    private func removeSavedPrayer(id: String) {
        withAnimation(.spring(response: 0.34, dampingFraction: 0.84)) {
            _ = savedVerseIDs.remove(id)
        }

        HapticsService.unsavePrayer()
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
        SavedView(
            viewModel: PrayerPlanViewModel(),
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

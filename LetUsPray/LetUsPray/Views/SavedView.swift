import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var savedVerseIDs: Set<String>
    let savedPrayerRecords: [SavedPrayerRecord]
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var analytics: PrayerAnalyticsSnapshot
    @State private var selectedSavedPrayer: SavedPrayerItem?

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
                Text("Saved")
                    .font(AppTypography.largeTitle())
                    .foregroundStyle(AppColors.textPrimary)
                    .padding(.top, AppSpacing.small)

                if savedItems.isEmpty {
                    emptyState
                } else {
                    ForEach(savedItems) { item in
                        let accent = item.plan.category.brandAccent

                        ZStack(alignment: .topTrailing) {
                            Button {
                                selectedSavedPrayer = item
                            } label: {
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

                                                Text(item.record.savedDate, format: .dateTime.month(.abbreviated).day().year())
                                                    .font(AppTypography.caption())
                                                    .foregroundStyle(AppColors.textTertiary)
                                                    .accessibilityLabel("Saved date")
                                                    .accessibilityValue(
                                                        item.record.savedDate.formatted(
                                                            date: .long,
                                                            time: .omitted
                                                        )
                                                    )
                                                    .accessibilityHint("The date this prayer was saved.")
                                            }

                                            Spacer(minLength: 44)
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
                                    .multilineTextAlignment(.leading)
                                }
                            }
                            .buttonStyle(.plain)
                            .contentShape(Rectangle())
                            .accessibilityElement(children: .combine)
                            .accessibilityHint("Opens this prayer.")

                            Button {
                                removeSavedPrayer(id: item.verse.id)
                            } label: {
                                Image(systemName: "bookmark.fill")
                                    .foregroundStyle(AppColors.premiumGold)
                                    .frame(minWidth: 44, minHeight: 44)
                                    .background(.thinMaterial, in: Circle())
                            }
                            .buttonStyle(.plain)
                            .contentShape(Rectangle())
                            .padding(AppSpacing.medium)
                            .accessibilityLabel("Remove \(item.verse.reference) from Saved")
                            .accessibilityHint("Removes this prayer from Saved.")
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.98)))
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .animation(.spring(response: 0.34, dampingFraction: 0.84), value: savedItems.map(\.id))
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationDestination(item: $selectedSavedPrayer) { item in
            PrayerDetailView(
                plan: item.plan,
                day: item.day,
                completedDayNumbers: completedDayNumbersForPlan(item.plan.id),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics
            )
        }
    }

    private var emptyState: some View {
        EmptyStateView(
            title: "No saved prayers yet.",
            message: "When a verse becomes a prayer you want to return to, save it here for quiet reflection later.",
            systemImage: "bookmark.slash"
        )
    }

    private var savedItems: [SavedPrayerItem] {
        viewModel.savedPrayers(for: savedPrayerRecords)
            .filter { savedVerseIDs.contains($0.id) }
    }

    private func removeSavedPrayer(id: String) {
        _ = savedVerseIDs.remove(id)

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
            savedPrayerRecords: [],
            completedDayNumbersForPlan: { _ in .constant([]) },
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

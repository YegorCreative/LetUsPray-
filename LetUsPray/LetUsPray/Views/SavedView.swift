import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var savedVerseIDs: Set<String>
    let savedPrayerRecords: [SavedPrayerRecord]
    let completedDayNumbersForPlan: (String) -> Binding<Set<Int>>
    @Binding var analytics: PrayerAnalyticsSnapshot
    var onOpenSearch: () -> Void = {}
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
                    GroupedCard {
                        ForEach(Array(savedItems.enumerated()), id: \.element.id) { index, item in
                            GroupedRow(showsDivider: index < savedItems.count - 1) {
                                savedRow(item)
                            }
                        }
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

    private func savedRow(_ item: SavedPrayerItem) -> some View {
        let accent = item.plan.category.brandAccent

        return HStack(spacing: AppSpacing.small) {
            Button {
                selectedSavedPrayer = item
            } label: {
                HStack(spacing: AppSpacing.medium) {
                    Image(systemName: item.plan.category.brandIcon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                        .frame(width: 42, height: 42)
                        .background(BrandGradients.savedPrayer, in: RoundedRectangle(cornerRadius: 14, style: .continuous))

                    VStack(alignment: .leading, spacing: 3) {
                        Text(item.verse.reference)
                            .font(AppTypography.cardTitle())
                            .foregroundStyle(accent)

                        Text(item.verse.text)
                            .font(AppTypography.metadata())
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)

                        HStack(spacing: 4) {
                            Text(item.plan.title)
                                .lineLimit(1)
                            Text("·")
                            Text(item.record.savedDate, format: .dateTime.month(.abbreviated).day())
                                .accessibilityLabel("Saved \(item.record.savedDate.formatted(date: .long, time: .omitted))")
                        }
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                    }

                    Spacer(minLength: 0)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .accessibilityElement(children: .combine)
            .accessibilityHint("Opens this prayer.")

            Menu {
                Button(role: .destructive) {
                    removeSavedPrayer(id: item.verse.id)
                } label: {
                    Label("Remove from Saved", systemImage: "bookmark.slash")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(AppColors.textTertiary)
                    .frame(width: 32, height: 32)
            }
            .accessibilityLabel("More options for \(item.verse.reference)")
        }
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: AppSpacing.large) {
            HeroCard(gradient: BrandGradients.savedPrayer) {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 52, height: 52)
                        .background(Color.white.opacity(0.18), in: Circle())

                    Text("Your Prayer Library")
                        .font(AppTypography.largeDisplay())
                        .foregroundStyle(AppColors.brightTextOnAccent)

                    Text("When a verse becomes a prayer you want to return to, save it here for quiet reflection later.")
                        .font(AppTypography.secondaryBody())
                        .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.88))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Button(action: onOpenSearch) {
                PrimaryPrayerButton(title: "Browse Scripture & Prayers", systemImage: "magnifyingglass")
            }
            .buttonStyle(.plain)
            .accessibilityHint("Opens Search to find Scripture and prayers to save.")
        }
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

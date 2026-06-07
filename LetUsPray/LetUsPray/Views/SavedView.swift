import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var savedVerseIDs: Set<String>

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
                        GlassCard {
                            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Day \(item.day.dayNumber) · \(item.day.title)")
                                            .font(AppTypography.caption())
                                            .foregroundStyle(AppColors.accent)

                                        Text(item.verse.reference)
                                            .font(AppTypography.headline())
                                            .foregroundStyle(AppColors.textPrimary)
                                    }

                                    Spacer()

                                    Button {
                                        savedVerseIDs.remove(item.verse.id)
                                    } label: {
                                        Image(systemName: "bookmark.fill")
                                            .foregroundStyle(AppColors.prayerGold)
                                            .padding(10)
                                            .background(.thinMaterial, in: Circle())
                                    }
                                    .buttonStyle(.plain)
                                }

                                Text(item.verse.text)
                                    .font(AppTypography.body())
                                    .foregroundStyle(AppColors.textPrimary)

                                Text(item.verse.prayer)
                                    .font(AppTypography.footnote())
                                    .foregroundStyle(AppColors.textSecondary)
                                    .lineSpacing(4)
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
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .center, spacing: AppSpacing.medium) {
                Image(systemName: "bookmark.slash")
                    .font(.system(size: 34, weight: .medium))
                    .foregroundStyle(AppColors.textSecondary)

                Text("No saved prayers yet.")
                    .font(AppTypography.title2())
                    .foregroundStyle(AppColors.textPrimary)

                Text("When a verse becomes a prayer you want to return to, save it here for quiet reflection later.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppSpacing.xxLarge)
        }
    }
}

#Preview {
    NavigationStack {
        SavedView(viewModel: PrayerPlanViewModel(), savedVerseIDs: .constant([]))
    }
}

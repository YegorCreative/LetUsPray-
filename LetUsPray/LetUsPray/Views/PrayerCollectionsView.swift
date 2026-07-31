import SwiftUI

struct PrayerCollectionsView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    private var collections: [JourneyCollection] { PrayerJourneyCatalog.collections }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.medium) {
                intro
                ForEach(collections) { collection in
                    NavigationLink {
                        PrayerCollectionDetailView(
                            collection: collection,
                            viewModel: viewModel,
                            activePlanID: $activePlanID,
                            completedDayNumbers: $completedDayNumbers,
                            savedVerseIDs: $savedVerseIDs,
                            analytics: $analytics
                        )
                    } label: {
                        collectionCard(collection)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var intro: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Prayer Journeys")
                .font(AppTypography.largeTitle())
                .foregroundStyle(AppColors.textPrimary)
            Text("Find a journey for this season of your life.")
                .font(AppTypography.body())
                .foregroundStyle(AppColors.textSecondary)
        }
        .padding(.bottom, AppSpacing.small)
        .accessibilityElement(children: .combine)
    }

    private func collectionCard(_ collection: JourneyCollection) -> some View {
        let journeys = PrayerJourneyCatalog.journeys(in: collection.id, plans: viewModel.allPlans)
        let featured = journeys.first(where: \.isFeatured) ?? journeys.first
        let accent = featured.map { AppColors.planAccent(named: $0.accentColorName) } ?? AppColors.electricCyan

        return GlassCard(padding: AppSpacing.large) {
            HStack(spacing: AppSpacing.medium) {
                Image(systemName: collection.iconName)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(accent)
                    .frame(width: 48, height: 48)
                    .background(accent.opacity(0.18), in: RoundedRectangle(cornerRadius: 14, style: .continuous))

                VStack(alignment: .leading, spacing: 6) {
                    Text(collection.title)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                    Text(collection.description)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)
                    Text("\(journeys.count) journey\(journeys.count == 1 ? "" : "s")")
                        .font(AppTypography.caption())
                        .foregroundStyle(accent)
                }

                Spacer(minLength: AppSpacing.small)
                Image(systemName: "chevron.right")
                    .foregroundStyle(accent)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens the \(collection.title) collection.")
    }
}

struct PrayerCollectionDetailView: View {
    let collection: JourneyCollection
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot

    private var journeys: [PrayerJourney] {
        PrayerJourneyCatalog.journeys(in: collection.id, plans: viewModel.allPlans)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                header
                if journeys.isEmpty {
                    emptyState
                } else {
                    ForEach(journeys) { journey in
                        NavigationLink {
                            PlanDetailView(
                                plan: journey.plan,
                                isActive: activePlanID == journey.id,
                                completedDayNumbers: $completedDayNumbers,
                                savedVerseIDs: $savedVerseIDs,
                                analytics: $analytics,
                                onStartJourney: {
                                    activePlanID = journey.id
                                    viewModel.setActivePlan(id: journey.id)
                                }
                            )
                        } label: {
                            journeyCard(journey)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .navigationTitle(collection.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Image(systemName: collection.iconName)
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(AppColors.electricCyan)
                .frame(width: 64, height: 64)
                .background(AppColors.electricCyan.opacity(0.16), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            Text(collection.description)
                .font(AppTypography.body())
                .foregroundStyle(AppColors.textSecondary)
            Text("\(journeys.count) journey\(journeys.count == 1 ? "" : "s")")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)
        }
        .accessibilityElement(children: .combine)
    }

    private var emptyState: some View {
        GlassCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("More journeys are on the way")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                Text("This collection is ready for future prayer journeys.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
            }
        }
    }

    private func journeyCard(_ journey: PrayerJourney) -> some View {
        let accent = AppColors.planAccent(named: journey.accentColorName)
        return GlassCard(padding: AppSpacing.large) {
            HStack(spacing: AppSpacing.medium) {
                Image(systemName: journey.heroImageName)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(accent)
                    .frame(width: 48, height: 48)
                    .background(accent.opacity(0.18), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                VStack(alignment: .leading, spacing: 5) {
                    Text(journey.title)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.textPrimary)
                    Text(journey.subtitle)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)
                    Label("\(journey.estimatedDurationDays) days · \(journey.estimatedPrayerMinutes) min", systemImage: "clock")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                }
                Spacer(minLength: AppSpacing.small)
                Image(systemName: "chevron.right")
                    .foregroundStyle(accent)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens \(journey.title).")
    }
}

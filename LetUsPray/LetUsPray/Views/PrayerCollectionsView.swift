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
        .navigationTitle("Prayer Journeys")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var intro: some View {
        Text("Find a journey for this season of your life.")
            .font(AppTypography.body())
            .foregroundStyle(AppColors.textSecondary)
            .padding(.bottom, AppSpacing.small)
            .accessibilityElement(children: .combine)
    }

    private func collectionCard(_ collection: JourneyCollection) -> some View {
        let journeys = PrayerJourneyCatalog.journeys(in: collection.id, plans: viewModel.allPlans)
        let featured = journeys.first(where: \.isFeatured)
        let accent = featured.map { AppColors.planAccent(named: $0.accentColorName) } ?? AppColors.electricCyan

        return GlassCard(padding: AppSpacing.large) {
            HStack(alignment: .top, spacing: AppSpacing.medium) {
                Image(systemName: featured?.heroImageName ?? collection.iconName)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(accent)
                    .frame(width: 58, height: 58)
                    .background(accent.opacity(0.18), in: RoundedRectangle(cornerRadius: 17, style: .continuous))

                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: AppSpacing.small) {
                        Text(collection.title)
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                        if featured != nil { badge("Featured", color: accent) }
                    }
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
                    .padding(.top, 5)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint("Opens the \(collection.title) collection.")
    }

    private func badge(_ title: String, color: Color) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(color)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(color.opacity(0.14), in: Capsule())
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
            LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
                header
                if let featured = journeys.first(where: \.isFeatured) {
                    featuredSection(featured)
                    allJourneysSection(excluding: featured.id)
                } else if journeys.isEmpty {
                    emptyState
                } else {
                    allJourneysSection(excluding: nil)
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .navigationTitle(collection.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Image(systemName: journeys.first(where: \.isFeatured)?.heroImageName ?? collection.iconName)
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

    private func featuredSection(_ journey: PrayerJourney) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Featured Journey")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            journeyLink(journey, featured: true)
        }
    }

    private func allJourneysSection(excluding featuredID: String?) -> some View {
        let remaining = journeys.filter { $0.id != featuredID }
        return VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("All Journeys")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
                .padding(.top, featuredID == nil ? 0 : AppSpacing.small)
            LazyVStack(spacing: AppSpacing.small) {
                ForEach(remaining) { journey in
                    journeyLink(journey)
                }
            }
        }
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
        .accessibilityElement(children: .combine)
    }

    private func journeyLink(_ journey: PrayerJourney, featured: Bool = false) -> some View {
        NavigationLink {
            PlanDetailView(
                plan: journey.plan,
                isActive: activePlanID == journey.plan.id,
                completedDayNumbers: $completedDayNumbers,
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics,
                onStartJourney: {
                    activePlanID = journey.plan.id
                    viewModel.setActivePlan(id: journey.plan.id)
                }
            )
        } label: {
            journeyCard(journey, featured: featured)
        }
        .buttonStyle(.plain)
    }

    private func journeyCard(_ journey: PrayerJourney, featured: Bool = false) -> some View {
        let accent = AppColors.planAccent(named: journey.accentColorName)
        let progress = progress(for: journey)

        return GlassCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    Image(systemName: journey.heroImageName)
                        .font(.system(size: featured ? 26 : 21, weight: .semibold))
                        .foregroundStyle(accent)
                        .frame(width: featured ? 58 : 48, height: featured ? 58 : 48)
                        .background(accent.opacity(0.18), in: RoundedRectangle(cornerRadius: featured ? 17 : 14, style: .continuous))

                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: AppSpacing.small) {
                            Text(journey.title)
                                .font(featured ? AppTypography.title2() : AppTypography.headline())
                                .foregroundStyle(AppColors.textPrimary)
                            if journey.isRecommended { badge("Recommended", color: accent) }
                            if journey.isSeasonal { badge("Seasonal", color: .orange) }
                        }
                        Text(journey.subtitle)
                            .font(AppTypography.footnote())
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(2)
                    }

                    Spacer(minLength: AppSpacing.small)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(accent)
                }

                HStack(spacing: AppSpacing.medium) {
                    Label(durationLabel(for: journey), systemImage: "calendar")
                    Label("\(journey.estimatedPrayerMinutes) min", systemImage: "clock")
                    Label(journey.difficulty.rawValue, systemImage: "chart.bar.fill")
                }
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)

                if journey.sessionCount > 0 {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(progress.status.rawValue)
                            Spacer()
                            Text("\(progress.percentage)%")
                        }
                        .font(AppTypography.caption())
                        .foregroundStyle(progress.status == .completed ? accent : AppColors.textTertiary)
                        ProgressView(value: progress.fractionCompleted)
                            .tint(accent)
                    }
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(journey.title), \(journey.difficulty.rawValue) difficulty, \(durationLabel(for: journey)), \(journey.estimatedPrayerMinutes) minutes, \(progress.status.rawValue), \(progress.percentage) percent complete")
        .accessibilityHint("Opens \(journey.title).")
    }

    private func progress(for journey: PrayerJourney) -> PrayerPlanProgress {
        if journey.plan.id == activePlanID {
            return journey.progress(completedSessionNumbers: completedDayNumbers)
        }
        let completedCount = analytics.completedDaysByPlan[journey.plan.id] ?? 0
        return PrayerPlanProgress(completedDays: completedCount, totalDays: journey.sessionCount)
    }

    private func durationLabel(for journey: PrayerJourney) -> String {
        journey.estimatedDurationDays > 0 ? "\(journey.estimatedDurationDays) days" : "Self-guided"
    }

    private func badge(_ title: String, color: Color) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(color)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(color.opacity(0.14), in: Capsule())
    }
}

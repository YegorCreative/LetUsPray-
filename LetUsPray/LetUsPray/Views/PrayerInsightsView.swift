import SwiftUI

struct PrayerInsightsView: View {
    let insights: PrayerInsights

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: AppSpacing.large) {
                overviewSection
                collectionSection
                journeySection
                milestonesSection
                timelineSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .navigationTitle("Prayer Insights")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Your Journey")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            GlassCard {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    HStack {
                        Text("Overall completion")
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)
                        Spacer()
                        Text("\(insights.overallCompletionPercentage)%")
                            .font(AppTypography.title2())
                            .foregroundStyle(AppColors.premiumGold)
                    }
                    ProgressView(value: Double(insights.overallCompletionPercentage), total: 100)
                        .tint(AppColors.premiumGold)
                    HStack(spacing: AppSpacing.small) {
                        insightPill("Started", value: "\(insights.journeysStarted)")
                        insightPill("Completed", value: "\(insights.journeysCompleted)")
                        insightPill("Sessions", value: "\(insights.totalPrayerSessions)")
                    }
                }
            }
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: AppSpacing.small) {
                metricCard("Current Streak", value: "\(insights.currentStreak) days", icon: "flame.fill", color: .orange)
                metricCard("Longest Streak", value: "\(insights.longestStreak) days", icon: "calendar.badge.checkmark", color: .green)
                metricCard("Prayer Time", value: "\(insights.estimatedPrayerMinutes) min", icon: "clock.fill", color: .blue)
                metricCard("Last Prayer", value: insights.lastPrayerDate?.formatted(date: .abbreviated, time: .omitted) ?? "Not yet", icon: "checkmark.circle.fill", color: .purple)
            }
        }
    }

    private var collectionSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Collections")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            if let most = insights.mostCompletedCollection {
                insightCallout("Most completed", detail: most.title, icon: "star.fill", color: .yellow)
            }
            if let active = insights.activeCollection {
                insightCallout("Active collection", detail: active.title, icon: "arrow.right.circle.fill", color: .green)
            }
            LazyVStack(spacing: AppSpacing.small) {
                ForEach(insights.collections) { collection in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(collection.title)
                                .font(AppTypography.footnote())
                                .foregroundStyle(AppColors.textPrimary)
                            Spacer()
                            Text("\(collection.completed) of \(collection.total)")
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.textTertiary)
                        }
                        ProgressView(value: collection.progress)
                            .tint(AppColors.electricCyan)
                    }
                }
            }
        }
    }

    private var journeySection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Journey Highlights")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            if let most = insights.mostPrayedJourney {
                insightCallout("Most prayed", detail: most.title, icon: "book.fill", color: .blue)
            }
            Text("Saved \(insights.savedJourneyCount) · Favorites \(insights.favoriteJourneyCount)")
                .font(AppTypography.footnote())
                .foregroundStyle(AppColors.textSecondary)
            ForEach(insights.recentlyCompleted) { journey in
                journeyRow(journey, label: "Recently completed", icon: "checkmark.seal.fill")
            }
            ForEach(insights.recentlyStarted) { journey in
                journeyRow(journey, label: "Recently started", icon: "book.pages.fill")
            }
        }
    }

    private var milestonesSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Milestones")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            milestone("First Journey", unlocked: insights.journeysStarted >= 1)
            milestone("First Completion", unlocked: insights.journeysCompleted >= 1)
            milestone("Five Journeys Completed", unlocked: insights.journeysCompleted >= 5)
            milestone("Ten Journeys Completed", unlocked: insights.journeysCompleted >= 10)
            milestone("Seven Day Streak", unlocked: insights.longestStreak >= 7)
        }
    }

    private var timelineSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Recent Activity")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            if insights.activities.isEmpty {
                EmptyStateView(title: "Your timeline will appear here", message: "Complete a prayer or begin a journey to see your progress over time.", systemImage: "clock.arrow.circlepath")
            } else {
                ForEach(insights.activities) { activity in
                    HStack(spacing: AppSpacing.medium) {
                        Image(systemName: activity.systemImage)
                            .foregroundStyle(AppColors.electricCyan)
                            .frame(width: 36, height: 36)
                            .background(AppColors.electricCyan.opacity(0.14), in: Circle())
                        VStack(alignment: .leading, spacing: 3) {
                            Text(activity.title)
                                .font(AppTypography.footnote())
                                .foregroundStyle(AppColors.textPrimary)
                            Text(activity.detail)
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.textSecondary)
                        }
                        Spacer()
                        Text(activity.date.formatted(date: .abbreviated, time: .omitted))
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                    }
                }
            }
        }
    }

    private func metricCard(_ title: String, value: String, icon: String, color: Color) -> some View {
        GlassCard(padding: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: icon).foregroundStyle(color)
                Text(value).font(AppTypography.headline()).foregroundStyle(AppColors.textPrimary)
                Text(title).font(AppTypography.caption()).foregroundStyle(AppColors.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func insightPill(_ title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(value).font(AppTypography.headline()).foregroundStyle(AppColors.textPrimary)
            Text(title).font(AppTypography.caption()).foregroundStyle(AppColors.textTertiary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func insightCallout(_ title: String, detail: String, icon: String, color: Color) -> some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: icon).foregroundStyle(color)
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(AppTypography.caption()).foregroundStyle(AppColors.textSecondary)
                Text(detail).font(AppTypography.headline()).foregroundStyle(AppColors.textPrimary)
            }
            Spacer()
        }
        .padding(AppSpacing.medium)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func journeyRow(_ journey: PrayerJourney, label: String, icon: String) -> some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: icon).foregroundStyle(AppColors.electricCyan)
            VStack(alignment: .leading, spacing: 3) {
                Text(label).font(AppTypography.caption()).foregroundStyle(AppColors.textSecondary)
                Text(journey.title).font(AppTypography.footnote()).foregroundStyle(AppColors.textPrimary)
            }
            Spacer()
        }
    }

    private func milestone(_ title: String, unlocked: Bool) -> some View {
        Label {
            Text(title).foregroundStyle(unlocked ? AppColors.textPrimary : AppColors.textTertiary)
        } icon: {
            Image(systemName: unlocked ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(unlocked ? AppColors.premiumGold : AppColors.textTertiary)
        }
        .accessibilityValue(unlocked ? "Unlocked" : "Locked")
    }
}

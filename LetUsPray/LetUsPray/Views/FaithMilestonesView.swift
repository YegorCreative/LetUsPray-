import SwiftUI

/// Faith Milestones — spiritual encouragement, not gamification. No confetti, no XP, no
/// levels; just a quiet record of steps taken in prayer. Reuses the existing Achievement
/// model/service/storage in full — see Models/Achievement.swift and Services/AchievementService.swift.
struct FaithMilestonesView: View {
    @AppStorage(PrayerStorageKeys.achievementUnlockDates) private var unlockDatesRawValue = "{}"
    @AppStorage(PrayerStorageKeys.completedDaysByPlan) private var completedDaysByPlanRawValue = "{}"
    @AppStorage(PrayerStorageKeys.longestStreak) private var longestStreak = 0
    @AppStorage(PrayerStorageKeys.savedVerseIDs) private var savedVerseIDsRawValue = ""

    private let service = AchievementService()

    var body: some View {
        List {
            section(title: "Earned", items: earned, emptyText: "Your Faith Milestones will appear here as your journey unfolds.")
            section(title: "In Progress", items: inProgress, emptyText: nil)
            section(title: "Ahead", items: locked, emptyText: nil)
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(PrayerBackground())
        .navigationTitle("Faith Milestones")
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var milestones: [Achievement] {
        service.achievements(unlockDates: unlockDates, progress: progress)
    }

    private var earned: [Achievement] {
        milestones.filter(\.isUnlocked).sorted { ($0.unlockDate ?? .distantPast) > ($1.unlockDate ?? .distantPast) }
    }

    private var inProgress: [Achievement] {
        milestones.filter(\.isInProgress).sorted { $0.fractionComplete > $1.fractionComplete }
    }

    private var locked: [Achievement] {
        milestones.filter { !$0.isUnlocked && !$0.isInProgress }
    }

    @ViewBuilder
    private func section(title: String, items: [Achievement], emptyText: String?) -> some View {
        if !items.isEmpty {
            Section(title) {
                ForEach(items) { milestoneRow($0) }
            }
        } else if let emptyText {
            Section(title) {
                Text(emptyText)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private func milestoneRow(_ milestone: Achievement) -> some View {
        HStack(alignment: .top, spacing: AppSpacing.medium) {
            Image(systemName: milestone.systemImage)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(milestone.isUnlocked ? AppColors.accent : AppColors.tertiaryText)
                .frame(width: 44, height: 44)
                .background(
                    milestone.isUnlocked ? AppColors.accent.opacity(0.14) : AppColors.tertiaryText.opacity(0.10),
                    in: RoundedRectangle(cornerRadius: 14, style: .continuous)
                )

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(milestone.title)
                        .font(AppTypography.headline())
                        .foregroundStyle(AppColors.primaryText)
                    Text(milestone.category.displayTitle.uppercased())
                        .font(.system(size: 9, weight: .bold))
                        .foregroundStyle(AppColors.tertiaryText)
                }

                Text(milestone.description)
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)

                if let scriptureReference = milestone.scriptureReference {
                    Text(scriptureReference)
                        .font(AppTypography.caption())
                        .italic()
                        .foregroundStyle(AppColors.tertiaryText)
                }

                if let unlockDate = milestone.unlockDate {
                    Text("Earned \(unlockDate.formatted(date: .abbreviated, time: .omitted))")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.secondaryText)
                } else if milestone.target > 1 {
                    ProgressView(value: milestone.fractionComplete)
                        .tint(AppColors.accent)
                    Text("\(milestone.progress) of \(milestone.target)")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                }
            }

            Spacer(minLength: 0)

            Image(systemName: milestone.isUnlocked ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(milestone.isUnlocked ? AppColors.accent : AppColors.tertiaryText)
                .accessibilityHidden(true)
        }
        .padding(.vertical, AppSpacing.small)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabel(for: milestone))
    }

    private func accessibilityLabel(for milestone: Achievement) -> String {
        let scripture = milestone.scriptureReference.map { ", \($0)" } ?? ""
        if let unlockDate = milestone.unlockDate {
            return "\(milestone.title), \(milestone.category.displayTitle), earned \(unlockDate.formatted(date: .long, time: .omitted)). \(milestone.description)\(scripture)"
        }
        return "\(milestone.title), \(milestone.category.displayTitle), \(milestone.progress) of \(milestone.target). \(milestone.description)\(scripture)"
    }

    private var unlockDates: [String: Date] {
        PrayerStorageCodec.decodeValue([String: Date].self, from: unlockDatesRawValue) ?? [:]
    }

    private var progress: AchievementProgress {
        let completedDaysByPlan = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
        let completedJourneyCount = PrayerPlansRepository.availableJourneyPlans.reduce(into: 0) { count, plan in
            let requiredDays = Set(plan.days.map(\.dayNumber))
            let completedDays = completedDaysByPlan[plan.id] ?? []
            if !requiredDays.isEmpty && requiredDays.isSubset(of: completedDays) {
                count += 1
            }
        }
        return AchievementProgress(
            completedPrayerCount: completedDaysByPlan.values.reduce(0) { $0 + $1.count },
            longestStreak: longestStreak,
            completedJourneyCount: completedJourneyCount,
            savedPrayerCount: PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue).count
        )
    }
}

#Preview {
    NavigationStack {
        FaithMilestonesView()
    }
}

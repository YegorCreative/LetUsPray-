import SwiftUI

struct AchievementsView: View {
    @AppStorage(PrayerStorageKeys.achievementUnlockDates) private var unlockDatesRawValue = "{}"

    private let service = AchievementService()

    var body: some View {
        List {
            Section {
                if earnedAchievements.isEmpty {
                    Text("Your prayer milestones will appear here as your journey unfolds.")
                        .font(AppTypography.body())
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                } else {
                    ForEach(earnedAchievements) { achievement in
                        achievementRow(achievement)
                    }
                }
            } header: {
                Text("Earned")
            } footer: {
                Text("A quiet reflection of the steps you have taken in prayer.")
            }

            Section("Still Ahead") {
                ForEach(lockedAchievements) { achievement in
                    achievementRow(achievement)
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(PrayerBackground())
        .navigationTitle("Achievements")
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var achievements: [Achievement] {
        service.achievements(unlockDates: unlockDates)
    }

    private var earnedAchievements: [Achievement] {
        achievements.filter(\.isUnlocked)
    }

    private var lockedAchievements: [Achievement] {
        achievements.filter { !$0.isUnlocked }
    }

    private var unlockDates: [String: Date] {
        PrayerStorageCodec.decodeValue(
            [String: Date].self,
            from: unlockDatesRawValue
        ) ?? [:]
    }

    private func achievementRow(_ achievement: Achievement) -> some View {
        HStack(alignment: .top, spacing: AppSpacing.medium) {
            Image(systemName: achievement.systemImage)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(achievement.isUnlocked ? Color.accentColor : Color.secondary)
                .frame(width: 44, height: 44)
                .background(
                    achievement.isUnlocked
                        ? Color.accentColor.opacity(0.14)
                        : Color.secondary.opacity(0.10),
                    in: RoundedRectangle(cornerRadius: 14, style: .continuous)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(achievement.title)
                    .font(AppTypography.headline())
                    .foregroundStyle(.primary)

                Text(achievement.description)
                    .font(AppTypography.footnote())
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)

                if let unlockDate = achievement.unlockDate {
                    Text("Earned \(unlockDate.formatted(date: .abbreviated, time: .omitted))")
                        .font(AppTypography.caption())
                        .foregroundStyle(.secondary)
                } else {
                    Text("Not yet earned")
                        .font(AppTypography.caption())
                        .foregroundStyle(.tertiary)
                }
            }

            Spacer(minLength: 0)

            Image(systemName: achievement.isUnlocked ? "checkmark.circle.fill" : "lock.fill")
                .foregroundStyle(achievement.isUnlocked ? Color.accentColor : Color.secondary)
                .accessibilityHidden(true)
        }
        .padding(.vertical, AppSpacing.small)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabel(for: achievement))
    }

    private func accessibilityLabel(for achievement: Achievement) -> String {
        if let unlockDate = achievement.unlockDate {
            return "\(achievement.title), earned \(unlockDate.formatted(date: .long, time: .omitted)). \(achievement.description)"
        }
        return "\(achievement.title), not yet earned. \(achievement.description)"
    }
}

#Preview {
    NavigationStack {
        AchievementsView()
    }
}

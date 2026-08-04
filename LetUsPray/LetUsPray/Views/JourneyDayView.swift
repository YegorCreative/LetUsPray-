import SwiftUI

struct JourneyDayView: View {
    let day: JourneyDay

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                themeSection
                primaryScriptureSection
                devotionalSection

                ForEach(Array(day.reflections.enumerated()), id: \.element.id) { index, reflection in
                    reflectionSection(reflection, number: index + 1)
                }

                closingPrayerSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle("Day \(day.dayNumber)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var themeSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            sectionLabel("Theme")

            Text(day.title)
                .font(AppTypography.largeDisplay())
                .foregroundStyle(AppColors.textPrimary)

            Text(day.chapterReference)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.accent)

            Text(day.summary)
                .font(AppTypography.body())
                .foregroundStyle(AppColors.secondaryText)
                .lineSpacing(4)
        }
    }

    private var primaryScriptureSection: some View {
        scriptureCard(
            label: "Primary Scripture",
            scripture: day.primaryScripture
        )
    }

    private var devotionalSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            sectionLabel("Journey Devotional")

            Text(day.devotional)
                .font(AppTypography.body())
                .foregroundStyle(AppColors.secondaryText)
                .lineSpacing(7)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func reflectionSection(_ reflection: JourneyReflection, number: Int) -> some View {
        GlassCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                sectionLabel("Reflection \(number)")

                Text(reflection.scripture.reference)
                    .font(AppTypography.sectionHeader())
                    .foregroundStyle(AppColors.accent)

                Text(reflection.scripture.text)
                    .font(.system(.title3, design: .serif))
                    .foregroundStyle(AppColors.primaryText)
                    .lineSpacing(9)
                    .fixedSize(horizontal: false, vertical: true)

                Divider().opacity(0.5)

                Text("Prayer")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
                    .textCase(.uppercase)

                Text(reflection.prayer)
                    .font(AppTypography.body())
                    .fontWeight(.medium)
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private var closingPrayerSection: some View {
        GlassCard(padding: AppSpacing.large) {
            VStack(alignment: .center, spacing: AppSpacing.medium) {
                sectionLabel("Closing Prayer")

                Text(day.closingPrayer)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.primaryText)
                    .multilineTextAlignment(.center)
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: true)

                Image(systemName: "hands.sparkles.fill")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(AppColors.accent)
            }
            .frame(maxWidth: .infinity)
        }
    }

    private func scriptureCard(label: String, scripture: JourneyScripture) -> some View {
        GlassCard(padding: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                sectionLabel(label)

                Text(scripture.reference)
                    .font(AppTypography.sectionHeader())
                    .foregroundStyle(AppColors.accent)

                Text(scripture.text)
                    .font(.system(.title3, design: .serif))
                    .foregroundStyle(AppColors.primaryText)
                    .lineSpacing(9)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private func sectionLabel(_ title: String) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(AppColors.accent)
            .textCase(.uppercase)
    }
}

import SwiftUI

struct JourneyPlanDetailView: View {
    let plan: JourneyPlan
    @AppStorage(PrayerStorageKeys.completedDaysByPlan) private var completedDaysByPlanRawValue = "{}"

    private var completedDayNumbers: Set<Int> {
        PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)[plan.id] ?? []
    }

    var body: some View {
        if let introduction = plan.introduction {
            JourneyIntroductionView(plan: plan, introduction: introduction)
        } else {
            dayList
        }
    }

    private var dayList: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HeroCard(gradient: plan.category.brandGradient) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        Image(systemName: plan.coverIcon)
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(AppColors.brightTextOnAccent)

                        Text(plan.title)
                            .font(AppTypography.largeDisplay())
                            .foregroundStyle(AppColors.brightTextOnAccent)

                        Text(plan.subtitle)
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.88))
                    }
                }

                Text(plan.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(4)

                if plan.days.isEmpty {
                    EmptyStateView(
                        title: "Journey Coming Soon",
                        message: "This guided devotional journey is being prepared.",
                        systemImage: plan.coverIcon
                    )
                } else {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text("Journey Days")
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)

                        ForEach(plan.days) { day in
                            NavigationLink {
                                JourneyDayView(plan: plan, day: day)
                            } label: {
                                GlassCard(padding: AppSpacing.medium) {
                                    HStack(spacing: AppSpacing.medium) {
                                        Text("\(day.dayNumber)")
                                            .font(AppTypography.headline())
                                            .foregroundStyle(AppColors.brightTextOnAccent)
                                            .frame(width: 40, height: 40)
                                            .background(plan.category.brandAccent, in: Circle())

                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(day.title)
                                                .font(AppTypography.headline())
                                                .foregroundStyle(AppColors.textPrimary)

                                            Text(day.chapterReference)
                                                .font(AppTypography.caption())
                                                .foregroundStyle(AppColors.textTertiary)
                                        }

                                        Spacer(minLength: AppSpacing.small)

                                        Image(systemName: completedDayNumbers.contains(day.dayNumber) ? "checkmark.circle.fill" : "chevron.right")
                                            .font(.system(size: completedDayNumbers.contains(day.dayNumber) ? 18 : 14, weight: .semibold))
                                            .foregroundStyle(completedDayNumbers.contains(day.dayNumber) ? AppColors.success : plan.category.brandAccent)
                                            .accessibilityLabel(completedDayNumbers.contains(day.dayNumber) ? "Completed" : "Open day")
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle(plan.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct JourneyIntroductionView: View {
    let plan: JourneyPlan
    let introduction: JourneyIntroduction

    private var firstDay: JourneyDay? { plan.days.first }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HeroCard(gradient: plan.category.brandGradient) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        Image(systemName: plan.coverIcon)
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(AppColors.brightTextOnAccent)
                        Text(plan.title)
                            .font(AppTypography.largeDisplay())
                            .foregroundStyle(AppColors.brightTextOnAccent)
                        Text(plan.subtitle)
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.88))
                    }
                }
                scriptureSection
                introductionSection
                informationSection
                experiencesSection
                if let mission = introduction.mission { missionSection(mission) }
                if !beforeYouBeginParagraphs.isEmpty { beforeYouBeginSection }
                if let firstDay {
                    NavigationLink {
                        JourneyDayView(plan: plan, day: firstDay)
                    } label: {
                        Text("Begin Journey")
                    }
                    .buttonStyle(PrayerButtonStyle(variant: .primary))
                    .accessibilityHint("Opens Day 1 of this journey")
                } else {
                    Button("Begin Journey") {}
                        .buttonStyle(PrayerButtonStyle(variant: .primary))
                        .disabled(true)
                        .accessibilityHint("Unavailable until journey days are added")
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle(plan.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var scriptureSection: some View {
        GlassCard(padding: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("SCRIPTURE THEME")
                    .font(AppTypography.caption())
                    .foregroundStyle(plan.category.brandAccent)
                    .textCase(.uppercase)
                Text(introduction.themeVerse.reference)
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                Text(introduction.themeVerse.text)
                    .font(.system(.title3, design: .serif))
                    .foregroundStyle(AppColors.primaryText)
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private var introductionSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Journey Introduction")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            ForEach(Array(introduction.paragraphs.enumerated()), id: \.offset) { _, paragraph in
                Text(paragraph)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(5)
            }
        }
    }

    private var informationSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Journey Information")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            GlassCard(padding: AppSpacing.medium) {
                infoRow(title: "Days", value: "\(plan.durationDays)")
                Divider().opacity(0.35)
                infoRow(title: "Daily Prayer", value: introduction.estimatedDailyPrayerTime)
                Divider().opacity(0.35)
                infoRow(title: "Difficulty", value: introduction.difficulty.rawValue)
                Divider().opacity(0.35)
                infoRow(title: "Category", value: introduction.categoryTitle)
            }
        }
    }

    private var experiencesSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(experienceSectionTitle)
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            GlassCard(padding: AppSpacing.medium) {
                let visibleExperiences = introduction.experiences.filter { !$0.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
                ForEach(Array(visibleExperiences.enumerated()), id: \.element.id) { index, experience in
                    if index > 0 { Divider().opacity(0.35) }
                    VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                        Label(experience.title, systemImage: "checkmark.circle.fill")
                            .font(AppTypography.body())
                            .foregroundStyle(AppColors.secondaryText)
                            .tint(plan.category.brandAccent)

                        if let description = experience.description?.trimmingCharacters(in: .whitespacesAndNewlines), !description.isEmpty {
                            Text(description)
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.tertiaryText)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
        }
    }

    private var experienceSectionTitle: String {
        guard let sectionTitle = introduction.sectionTitle?.trimmingCharacters(in: .whitespacesAndNewlines),
              !sectionTitle.isEmpty else {
            return "Throughout This Journey You Will"
        }
        return sectionTitle
    }

    private var beforeYouBeginParagraphs: [String] {
        introduction.beforeYouBeginContent.filter {
            !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    private var beforeYouBeginSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text(introduction.beforeYouBeginTitle?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
                 ? introduction.beforeYouBeginTitle ?? "Before You Begin"
                 : "Before You Begin")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            ForEach(Array(beforeYouBeginParagraphs.enumerated()), id: \.offset) { _, paragraph in
                Text(paragraph)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(5)
            }
        }
    }

    private func missionSection(_ mission: JourneyMissionInformation) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Mission Focus")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            GlassCard(padding: AppSpacing.medium) {
                infoRow(title: "Country or People Group", value: mission.countryOrPeopleGroup)
                Divider().opacity(0.35)
                infoRow(title: "Approximate Population", value: mission.approximatePopulation)
                Divider().opacity(0.35)
                infoRow(title: "Approximate Christian Percentage", value: mission.approximateChristianPercentage)
                Divider().opacity(0.35)
                VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                    Text("Prayer Focus")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                    Text(mission.prayerFocus)
                        .font(AppTypography.body())
                        .foregroundStyle(AppColors.secondaryText)
                        .lineSpacing(4)
                }
            }
        }
    }

    private func infoRow(title: String, value: String) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .font(AppTypography.body())
                .foregroundStyle(AppColors.secondaryText)
            Spacer(minLength: AppSpacing.small)
            Text(value)
                .font(AppTypography.body())
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.textPrimary)
                .multilineTextAlignment(.trailing)
        }
    }
}

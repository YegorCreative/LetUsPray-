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
    @AppStorage(PrayerStorageKeys.completedDaysByPlan) private var completedDaysByPlanRawValue = "{}"

    private var firstDay: JourneyDay? { plan.days.first }
    private var completedDayNumbers: Set<Int> {
        PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)[plan.id] ?? []
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            // Spacing is a deliberate two-tier rhythm, not uniform: tight gaps (.medium) keep
            // narratively-linked sections feeling like one beat, wide gaps (.xLarge) mark a real
            // change of topic. See each `.padding(.top, ...)` below for the rationale at that seam.
            VStack(alignment: .leading, spacing: 0) {
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
                    .padding(.top, AppSpacing.medium) // close: Scripture supports the Hero, not a peer of it

                introductionSection
                    .padding(.top, AppSpacing.medium) // tight: the verse's own explanation

                informationSection
                    .padding(.top, AppSpacing.xLarge) // topic change: narrative → structured facts

                experiencesSection
                    .padding(.top, AppSpacing.medium) // tight: still "facts about this journey"

                if let mission = introduction.mission {
                    missionSection(mission)
                        .padding(.top, AppSpacing.xLarge) // topic change: facts → invitation
                }

                if !beforeYouBeginParagraphs.isEmpty {
                    beforeYouBeginSection
                        .padding(.top, AppSpacing.xLarge) // a deliberate pause before the close
                }

                if !plan.days.isEmpty {
                    journeyDaysSection
                        .padding(.top, AppSpacing.xLarge)
                }

                Group {
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
                .padding(.top, AppSpacing.medium) // tight: the reflection leads directly into this
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

    private var journeyDaysSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Journey Days")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            ForEach(plan.days) { day in
                if day.hasPlaceholderContent {
                    journeyDayRow(day, isAvailable: false)
                } else {
                    NavigationLink {
                        JourneyDayView(plan: plan, day: day)
                    } label: {
                        journeyDayRow(day, isAvailable: true)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private func journeyDayRow(_ day: JourneyDay, isAvailable: Bool) -> some View {
        GlassCard(padding: AppSpacing.medium) {
            HStack(spacing: AppSpacing.medium) {
                Text("\(day.dayNumber)")
                    .font(AppTypography.headline())
                    .foregroundStyle(isAvailable ? AppColors.brightTextOnAccent : AppColors.textTertiary)
                    .frame(width: 40, height: 40)
                    .background(
                        isAvailable ? plan.category.brandAccent : AppColors.textTertiary.opacity(0.14),
                        in: Circle()
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("Day \(day.dayNumber)")
                        .font(AppTypography.caption())
                        .foregroundStyle(isAvailable ? plan.category.brandAccent : AppColors.textTertiary)

                    Text(isAvailable ? day.title : "Coming Soon")
                        .font(AppTypography.headline())
                        .foregroundStyle(isAvailable ? AppColors.textPrimary : AppColors.textSecondary)
                }

                Spacer(minLength: AppSpacing.small)

                if isAvailable {
                    let isCompleted = completedDayNumbers.contains(day.dayNumber)
                    Image(systemName: isCompleted ? "checkmark.circle.fill" : "chevron.right")
                        .font(.system(size: isCompleted ? 18 : 14, weight: .semibold))
                        .foregroundStyle(isCompleted ? AppColors.success : plan.category.brandAccent)
                        .accessibilityHidden(true)
                } else {
                    Image(systemName: "clock")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(AppColors.textTertiary)
                        .accessibilityHidden(true)
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            isAvailable
                ? "Day \(day.dayNumber), \(day.title)\(completedDayNumbers.contains(day.dayNumber) ? ", Completed" : "")"
                : "Day \(day.dayNumber), Coming Soon"
        )
        .accessibilityHint(isAvailable ? "Opens this journey day" : "This journey day is not yet available")
    }

    /// Deliberately quieter than a section header: the reference drops from headline to body
    /// weight and the quote drops one text-style step (title3 → callout) so this supports the
    /// Hero above it instead of reading as a second title of equal rank.
    private var scriptureSection: some View {
        GlassCard(padding: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("SCRIPTURE THEME")
                    .font(AppTypography.caption())
                    .foregroundStyle(plan.category.brandAccent)
                    .textCase(.uppercase)
                Text(introduction.themeVerse.reference)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textPrimary)
                Text(introduction.themeVerse.text)
                    .font(.system(.callout, design: .serif))
                    .foregroundStyle(AppColors.primaryText)
                    .lineSpacing(6)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private var introductionSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("About This Journey")
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

    /// The grid itself, its spacing, and its typography are unchanged from the previous pass —
    /// this only wraps it in the existing GlassCard so the four facts read as one grouped block.
    /// The card gets one addition on top of GlassCard's stock look: a near-invisible brand-lime
    /// tint (`AppColors.accent` at 7% opacity), layered as an `.overlay` matching the card's own
    /// corner radius so it sits flush with GlassCard's existing material, border, and shadow
    /// rather than replacing any of them. It's `.overlay` rather than `.background` because
    /// GlassCard's own surface fill is opaque — anything layered behind it would be fully hidden.
    private var informationSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("JOURNEY INFORMATION")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
            GlassCard(padding: AppSpacing.medium) {
                LazyVGrid(
                    columns: [GridItem(.flexible(), spacing: AppSpacing.large), GridItem(.flexible())],
                    alignment: .leading,
                    spacing: AppSpacing.large
                ) {
                    informationStat(title: "Days", value: "\(plan.durationDays)", systemImage: "calendar")
                    informationStat(title: "Daily Prayer", value: introduction.estimatedDailyPrayerTime, systemImage: "clock")
                    informationStat(title: "Difficulty", value: introduction.difficulty.rawValue, systemImage: "chart.bar.fill")
                    informationStat(title: "Category", value: introduction.categoryTitle, systemImage: "tag.fill")
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .fill(AppColors.accent.opacity(0.07))
            }
        }
    }

    private func informationStat(title: String, value: String, systemImage: String) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.xs) {
            Image(systemName: systemImage)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(plan.category.brandAccent)
            Text(value)
                .font(AppTypography.cardTitle())
                .foregroundStyle(AppColors.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    /// Also card-free: six identical icons on six identical rows was the single biggest
    /// contributor to the "stack of cards" feeling, so each experience now gets its own
    /// meaningful symbol instead of a repeated checkmark, and generous spacing (not a border)
    /// does the grouping.
    private var experiencesSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text(experienceSectionTitle)
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                let visibleExperiences = introduction.experiences.filter { !$0.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
                ForEach(visibleExperiences) { experience in
                    experienceRow(experience)
                }
            }
        }
    }

    private func experienceRow(_ experience: JourneyExperience) -> some View {
        HStack(alignment: .top, spacing: AppSpacing.medium) {
            Image(systemName: experienceSymbol(for: experience.title))
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(plan.category.brandAccent)
                .frame(width: 22, height: 22)

            VStack(alignment: .leading, spacing: 2) {
                Text(experience.title)
                    .font(AppTypography.body())
                    .fontWeight(.medium)
                    .foregroundStyle(AppColors.textPrimary)

                if let description = experience.description?.trimmingCharacters(in: .whitespacesAndNewlines), !description.isEmpty {
                    Text(description)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }

    /// Maps each experience to a symbol that communicates its meaning (reading, reflecting,
    /// praying, global awareness, missionary support). Falls back to a neutral mark for any
    /// future experience title this journey — or another journey's introduction — doesn't cover,
    /// so the mapping stays reusable rather than tied to exactly six hardcoded items.
    private func experienceSymbol(for title: String) -> String {
        switch title {
        case "Read God's Word": return "book.closed"
        case "Reflect on Scripture": return "lightbulb"
        case "Pray with Purpose": return "hands.sparkles"
        case "Pray for the Nations": return "person.3.fill"
        case "Gain a Global Perspective": return "globe.americas.fill"
        case "Support Missionaries": return "hand.raised.fill"
        default: return "checkmark.circle"
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

    /// The emotional threshold before "Begin Journey": no card, no serif (serif stays reserved
    /// for Scripture), just an unhurried reading rhythm and the wide pause above it (set at the
    /// call site) doing the work of making this feel deliberate rather than one more section.
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
                    .lineSpacing(6)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    /// Leads with an inviting sentence and the prayer focus itself — the emotional payload —
    /// rather than opening with a label/value table. The country/population/% facts only appear
    /// as compact stat chips when they actually differ from one another; today's data reuses one
    /// shared "shown with each day" sentence for all three, and rendering that identical string
    /// three times would look like a broken table rather than an invitation. This keeps the
    /// section reusable: a future journey with real distinct mission stats gets the chips for free.
    private func missionSection(_ mission: JourneyMissionInformation) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("Mission Focus")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            GlassCard(padding: AppSpacing.medium) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    Text("Every day of this journey turns your attention to a real country or people group — someone you can carry before God by name.")
                        .font(AppTypography.secondaryBody())
                        .foregroundStyle(AppColors.secondaryText)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)

                    if hasDistinctMissionStats(mission) {
                        HStack(alignment: .top, spacing: AppSpacing.large) {
                            missionStat(title: "Focus", value: mission.countryOrPeopleGroup)
                            missionStat(title: "Population", value: mission.approximatePopulation)
                            missionStat(title: "Christian", value: mission.approximateChristianPercentage)
                        }
                    }

                    VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                        Text("PRAYER FOCUS")
                            .font(AppTypography.caption())
                            .foregroundStyle(plan.category.brandAccent)
                        Text(mission.prayerFocus)
                            .font(AppTypography.body())
                            .foregroundStyle(AppColors.secondaryText)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
    }

    private func missionStat(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(value)
                .font(AppTypography.cardTitle())
                .foregroundStyle(AppColors.textPrimary)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func hasDistinctMissionStats(_ mission: JourneyMissionInformation) -> Bool {
        Set([mission.countryOrPeopleGroup, mission.approximatePopulation, mission.approximateChristianPercentage]).count > 1
    }
}

private extension JourneyDay {
    var hasPlaceholderContent: Bool {
        devotional == "Devotional Placeholder"
            || primaryScripture.text == "Scripture Text Placeholder"
    }
}

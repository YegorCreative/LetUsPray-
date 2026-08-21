import SwiftUI

private enum JourneyJournalField: Hashable {
    case personalPrayer
    case reflection
}

struct JourneyDayView: View {
    @Environment(\.dismiss) private var dismiss
    let plan: JourneyPlan
    let day: JourneyDay

    @AppStorage(PrayerStorageKeys.completedDaysByPlan) private var completedDaysByPlanRawValue = "{}"
    @AppStorage(PrayerStorageKeys.savedVerseIDs) private var savedVerseIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.prayerJournalEntries) private var prayerJournalEntriesRawValue = "{}"
    @AppStorage(PrayerStorageKeys.completedPrayersCount) private var completedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.savedPrayersCount) private var savedPrayersCount = 0
    @AppStorage("settings.readingSpeed") private var readingSpeedRawValue = PrayerReadingSpeed.reflective.rawValue
    @AppStorage("settings.autoContinueJourney") private var autoContinueJourneyEnabled = false

    @State private var completionPulse = false
    @State private var journalScrollTarget: JourneyJournalField?
    @State private var autoContinueDay: JourneyDay?
    @StateObject private var speechController = PrayerSpeechController.shared
    @FocusState private var focusedJournalField: JourneyJournalField?
    private let streakService = StreakService()

    private var readingSpeed: PrayerReadingSpeed {
        PrayerReadingSpeed(rawValue: readingSpeedRawValue) ?? .reflective
    }

    private var completedDayNumbers: Set<Int> {
        PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)[plan.id] ?? []
    }

    private var savedReflectionIDs: Set<String> {
        PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue)
    }

    private var isCompleted: Bool {
        completedDayNumbers.contains(day.dayNumber)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                themeSection
                primaryScriptureSection
                devotionalSection
                if let missionFocus = day.missionFocus {
                    missionFocusSection(missionFocus)
                }

                ForEach(Array(day.reflections.enumerated()), id: \.element.id) { index, reflection in
                    reflectionSection(reflection, number: index + 1)
                }

                closingCard
                readAloudControls
                personalResponseSection
                completionSection
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
            .frame(maxWidth: 720)
            .frame(maxWidth: .infinity)
            .scrollTargetLayout()
        }
        .scrollDismissesKeyboard(.interactively)
        .scrollPosition(id: $journalScrollTarget, anchor: .center)
        .background(PrayerBackground())
        .navigationTitle("Day \(day.dayNumber)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { focusedJournalField = nil }
            }
        }
        .navigationDestination(item: $autoContinueDay) { nextDay in
            JourneyDayView(plan: plan, day: nextDay)
        }
        .onAppear {
            PrayerJourneyProgressStore.markOpened(planID: plan.id, session: day.dayNumber)
        }
        .onDisappear {
            speechController.stop()
        }
        .onChange(of: journalEntryKey) {
            speechController.stop()
        }
        .onChange(of: focusedJournalField) {
            guard let focusedJournalField else { return }
            withAnimation(.easeInOut(duration: 0.25)) {
                journalScrollTarget = focusedJournalField
            }
        }
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
        scriptureCard(label: "Primary Scripture", scripture: day.primaryScripture)
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

    private func missionFocusSection(_ mission: JourneyMissionInformation) -> some View {
        InfoCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Mission Focus", systemImage: "globe.americas.fill")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                missionRow("Country / People Group", mission.countryOrPeopleGroup)
                missionRow("Approximate Population", mission.approximatePopulation)
                missionRow("Approximate Christian Percentage", mission.approximateChristianPercentage)

                VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                    Text("Prayer Focus")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                    Text(mission.prayerFocus)
                        .font(AppTypography.body())
                        .foregroundStyle(AppColors.secondaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }

    private func missionRow(_ title: String, _ value: String) -> some View {
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

    private func reflectionSection(_ reflection: JourneyReflection, number: Int) -> some View {
        InfoCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                sectionLabel("Reflection \(number)")

                PrayerCardView(
                    verse: PrayerVerse(
                        id: reflection.id,
                        reference: reflection.scripture.reference,
                        text: reflection.scripture.text,
                        prayer: reflection.prayer
                    ),
                    isSaved: savedReflectionIDs.contains(reflection.id),
                    onToggleSaved: { toggleSaved(reflectionID: reflection.id) }
                )
            }
        }
    }

    private var closingCard: some View {
        InfoCard(padding: AppSpacing.heroPadding) {
            VStack(spacing: AppSpacing.small) {
                sectionLabel("Closing")

                Text("In Jesus' name, Amen.")
                    .font(.system(.title3, design: .serif, weight: .medium))
                    .foregroundStyle(AppColors.primaryText)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)

                Image(systemName: "hands.sparkles.fill")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(AppColors.accent)
            }
            .frame(maxWidth: .infinity)
        }
    }

    private var readAloudControls: some View {
        InfoCard(padding: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Label("Read Aloud", systemImage: speechController.state.systemImage)
                        .font(AppTypography.metadata())
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColors.secondaryText)
                    Spacer()
                    Text(speechController.state.title)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                }

                HStack(spacing: AppSpacing.medium) {
                    Button {
                        switch speechController.state {
                        case .stopped:
                            speechController.play(readAloudText, rateMultiplier: readingSpeed.rateMultiplier)
                        case .playing:
                            speechController.pause()
                        case .paused:
                            speechController.resume()
                        }
                    } label: {
                        Image(systemName: speechController.state == .playing ? "pause.fill" : "play.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(AppColors.accentCyan)
                    .accessibilityLabel(speechController.state == .playing ? "Pause reading" : "Play reading")

                    if speechController.state != .stopped {
                        Button(role: .cancel) { speechController.stop() } label: {
                            Image(systemName: "stop.fill")
                        }
                        .buttonStyle(PrayerIconButtonStyle())
                        .accessibilityLabel("Stop reading")
                    }

                    Spacer(minLength: 0)

                    Picker("Reading speed", selection: $readingSpeedRawValue) {
                        ForEach(PrayerReadingSpeed.allCases) { speed in
                            Text(speed.title).tag(speed.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(AppColors.accentCyan)
                    .accessibilityHint("Chooses the pace for voice reading.")
                }

                if speechController.state != .stopped {
                    ProgressView()
                        .tint(AppColors.accentCyan)
                        .accessibilityLabel("Reading in progress")
                }
            }
        }
    }

    private var personalResponseSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.large) {
            journalEditorSection(
                title: "My Prayer",
                placeholder: "Write your own prayer...",
                systemImage: "hands.sparkles.fill",
                field: .personalPrayer,
                text: personalPrayerBinding
            )

            journalEditorSection(
                title: "Reflection Notes",
                placeholder: "Reflect on today's Scripture...",
                systemImage: "heart.text.square.fill",
                field: .reflection,
                text: reflectionBinding
            )
        }
    }

    private func journalEditorSection(
        title: String,
        placeholder: String,
        systemImage: String,
        field: JourneyJournalField,
        text: Binding<String>
    ) -> some View {
        InfoCard(padding: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Label(title, systemImage: systemImage)
                    .font(AppTypography.metadata())
                    .fontWeight(.semibold)
                    .foregroundStyle(AppColors.secondaryText)

                ZStack(alignment: .topLeading) {
                    if text.wrappedValue.isEmpty {
                        Text(placeholder)
                            .font(AppTypography.body())
                            .foregroundStyle(AppColors.textTertiary)
                            .padding(.horizontal, AppSpacing.small)
                            .padding(.vertical, 10)
                            .allowsHitTesting(false)
                    }

                    TextEditor(text: text)
                        .font(AppTypography.body())
                        .foregroundStyle(AppColors.textPrimary)
                        .scrollContentBackground(.hidden)
                        .frame(minHeight: 100)
                        .padding(AppSpacing.small)
                        .focused($focusedJournalField, equals: field)
                        .accessibilityLabel(title)
                        .accessibilityHint(placeholder)
                }
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(AppColors.glassStroke, lineWidth: 1)
                }

                Text("Saved automatically")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(AppColors.textTertiary)
            }
        }
        .id(field)
    }

    @ViewBuilder
    private var completionSection: some View {
        if isCompleted {
            completionExperience
        } else {
            continueConversationCard
        }
    }

    private var continueConversationCard: some View {
        InfoCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Continue the conversation", systemImage: "heart.text.square.fill")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                Text("Take a quiet moment to respond to God in your own words. You may reflect, pray silently, or simply rest before continuing.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                Button(action: completePrayer) {
                    PrimaryPrayerButton(
                        title: "Complete Prayer",
                        systemImage: "checkmark.circle"
                    )
                    .scaleEffect(completionPulse ? 1.02 : 1.0)
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                .accessibilityHint("Marks this prayer complete after reflection.")
            }
        }
    }

    private var completionExperience: some View {
        VStack(alignment: .leading, spacing: AppSpacing.large) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    ZStack {
                        Circle()
                            .fill(AppColors.success.opacity(0.16))
                            .frame(width: 52, height: 52)
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(AppColors.success)
                    }
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Prayer Complete")
                            .font(AppTypography.sectionHeader())
                            .foregroundStyle(AppColors.primaryText)
                        Text("You made space to pray today.")
                            .font(AppTypography.metadata())
                            .foregroundStyle(AppColors.secondaryText)
                    }
                    Spacer(minLength: 0)
                }

                Text("Carry this quiet moment with you.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(AppSpacing.large)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: AppSpacing.heroCornerRadius, style: .continuous)
                    .fill(AppColors.success.opacity(0.08))
            )
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.heroCornerRadius, style: .continuous)
                    .stroke(AppColors.success.opacity(0.24), lineWidth: 1)
            }

            VStack(spacing: AppSpacing.small) {
                if let nextDay = plan.days.first(where: { $0.dayNumber > day.dayNumber }) {
                    Button { autoContinueDay = nextDay } label: {
                        PrimaryPrayerButton(title: "Continue Journey", systemImage: "arrow.right.circle.fill")
                    }
                    .buttonStyle(.plain)
                }

                Button { dismiss() } label: {
                    PrimaryPrayerButton(title: "Return to Journey", systemImage: "arrow.left", isSecondary: true)
                }
                .buttonStyle(.plain)
            }
        }
        .transition(.opacity.combined(with: .scale(scale: 0.98)))
        .accessibilityElement(children: .contain)
    }

    private func scriptureCard(label: String, scripture: JourneyScripture) -> some View {
        InfoCard(padding: AppSpacing.heroPadding) {
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

    private var readAloudText: String {
        let reflections = day.reflections.enumerated().map { index, reflection in
            """
            Reflection \(index + 1). \(reflection.scripture.reference).
            \(reflection.scripture.text)

            Prayer.
            \(reflection.prayer)
            """
        }.joined(separator: "\n\n")

        return """
        \(day.title). \(day.chapterReference).
        \(day.summary)

        Primary Scripture. \(day.primaryScripture.reference).
        \(day.primaryScripture.text)

        Journey Devotional.
        \(day.devotional)

        \(day.missionFocus.map { mission in
            "Mission Focus. \(mission.countryOrPeopleGroup). \(mission.approximatePopulation). \(mission.approximateChristianPercentage). \(mission.prayerFocus)"
        } ?? "")

        \(reflections)

        Closing Prayer.
        \(day.closingPrayer)
        """
    }

    private var journalEntryKey: String {
        "\(plan.id)::\(day.dayNumber)"
    }

    private var journalEntries: [String: PrayerJournalEntry] {
        PrayerStorageCodec.decodeValue(
            [String: PrayerJournalEntry].self,
            from: prayerJournalEntriesRawValue
        ) ?? [:]
    }

    private var personalPrayerBinding: Binding<String> {
        Binding(
            get: { journalEntries[journalEntryKey]?.prayerText ?? "" },
            set: { newValue in
                var entries = journalEntries
                var entry = entries[journalEntryKey] ?? .empty
                entry.prayerText = newValue
                entries[journalEntryKey] = entry
                prayerJournalEntriesRawValue = PrayerStorageCodec.encodeValue(entries)
            }
        )
    }

    private var reflectionBinding: Binding<String> {
        Binding(
            get: { journalEntries[journalEntryKey]?.reflectionText ?? "" },
            set: { newValue in
                var entries = journalEntries
                var entry = entries[journalEntryKey] ?? .empty
                entry.reflectionText = newValue
                entries[journalEntryKey] = entry
                prayerJournalEntriesRawValue = PrayerStorageCodec.encodeValue(entries)
            }
        )
    }

    private func toggleSaved(reflectionID: String) {
        var savedIDs = savedReflectionIDs
        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
            if savedIDs.contains(reflectionID) {
                savedIDs.remove(reflectionID)
                HapticsService.unsavePrayer()
            } else {
                savedIDs.insert(reflectionID)
                HapticsService.savePrayer()
            }
            savedVerseIDsRawValue = PrayerStorageCodec.encodeStringSet(savedIDs)
            savedPrayersCount = savedIDs.count
        }
    }

    private func completePrayer() {
        focusedJournalField = nil
        speechController.stop()
        guard !isCompleted else { return }

        var completedByPlan = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
        var updatedDays = completedByPlan[plan.id] ?? []
        updatedDays.insert(day.dayNumber)
        completedByPlan[plan.id] = updatedDays

        withAnimation(.spring(response: 0.34, dampingFraction: 0.76)) {
            completedDaysByPlanRawValue = PrayerStorageCodec.encodeCompletedDaysByPlan(completedByPlan)
            completedPrayersCount += 1
            completionPulse = true
        }

        PrayerJourneyProgressStore.markCompleted(planID: plan.id, session: day.dayNumber)
        updateStoredStreak()
        HapticsService.markPrayerCompleted()

        if autoContinueJourneyEnabled,
           let nextDay = plan.days.first(where: {
               $0.dayNumber > day.dayNumber && !updatedDays.contains($0.dayNumber)
           }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                autoContinueDay = nextDay
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            withAnimation(.spring(response: 0.36, dampingFraction: 0.84)) {
                completionPulse = false
            }
        }
    }

    private func updateStoredStreak() {
        let defaults = UserDefaults.standard
        let lastCompletedTimeInterval = defaults.double(forKey: PrayerStorageKeys.lastCompletedDate)
        let existing = PrayerStreak(
            currentStreak: defaults.integer(forKey: PrayerStorageKeys.currentStreak),
            longestStreak: defaults.integer(forKey: PrayerStorageKeys.longestStreak),
            lastCompletedDate: lastCompletedTimeInterval > 0 ? Date(timeIntervalSince1970: lastCompletedTimeInterval) : nil
        )
        let updated = streakService.updateStreak(from: existing)

        defaults.set(updated.currentStreak, forKey: PrayerStorageKeys.currentStreak)
        defaults.set(updated.longestStreak, forKey: PrayerStorageKeys.longestStreak)
        defaults.set(updated.lastCompletedDate?.timeIntervalSince1970 ?? 0, forKey: PrayerStorageKeys.lastCompletedDate)
    }

    private func sectionLabel(_ title: String) -> some View {
        Text(title)
            .font(AppTypography.caption())
            .foregroundStyle(AppColors.accent)
            .textCase(.uppercase)
    }
}

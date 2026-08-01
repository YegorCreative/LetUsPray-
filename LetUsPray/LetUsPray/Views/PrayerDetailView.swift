import AVFoundation
import Combine
import SwiftUI
import UIKit

private enum PrayerSpeechState {
    case stopped
    case playing
    case paused

    var title: String {
        switch self {
        case .stopped: "Stopped"
        case .playing: "Playing"
        case .paused: "Paused"
        }
    }

    var systemImage: String {
        switch self {
        case .stopped: "speaker.wave.2"
        case .playing: "speaker.wave.2.fill"
        case .paused: "pause.circle.fill"
        }
    }
}

private enum PrayerJournalField: Hashable {
    case personalPrayer
    case reflection
}

@MainActor
private final class PrayerSpeechController: NSObject, ObservableObject, @preconcurrency AVSpeechSynthesizerDelegate {
    static let shared = PrayerSpeechController()

    @Published private(set) var state: PrayerSpeechState = .stopped
    private let synthesizer = AVSpeechSynthesizer()

    private override init() {
        super.init()
        synthesizer.delegate = self
    }

    func play(_ text: String, rateMultiplier: Float) {
        stop()

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = preferredVoice
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate * rateMultiplier
        utterance.pitchMultiplier = 0.98
        utterance.preUtteranceDelay = 0.15
        utterance.postUtteranceDelay = 0.2

        state = .playing
        synthesizer.speak(utterance)
    }

    func replay(_ text: String, rateMultiplier: Float) {
        play(text, rateMultiplier: rateMultiplier)
    }

    func pause() {
        guard synthesizer.isSpeaking, !synthesizer.isPaused else { return }
        synthesizer.pauseSpeaking(at: .word)
        state = .paused
    }

    func resume() {
        guard synthesizer.isPaused else { return }
        synthesizer.continueSpeaking()
        state = .playing
    }

    func stop() {
        if synthesizer.isSpeaking || synthesizer.isPaused {
            synthesizer.stopSpeaking(at: .immediate)
        }
        state = .stopped
    }

    func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        didFinish utterance: AVSpeechUtterance
    ) {
        state = .stopped
    }

    func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        didCancel utterance: AVSpeechUtterance
    ) {
        state = .stopped
    }

    private var preferredVoice: AVSpeechSynthesisVoice? {
        if let deviceLanguage = Locale.preferredLanguages.first,
           deviceLanguage.hasPrefix("en"),
           let deviceVoice = AVSpeechSynthesisVoice(language: deviceLanguage) {
            return deviceVoice
        }

        return AVSpeechSynthesisVoice(language: "en-US")
    }
}

struct PrayerDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let plan: PrayerPlan
    let day: PrayerDay
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    @AppStorage(PrayerStorageKeys.prayerJournalEntries) private var prayerJournalEntriesRawValue = "{}"
    @AppStorage("settings.readingSpeed") private var readingSpeedRawValue = PrayerReadingSpeed.reflective.rawValue
    @AppStorage("settings.autoContinueJourney") private var autoContinueJourneyEnabled = true

    @State private var completionPulse = false
    @State private var copyConfirmationVisible = false
    @State private var journalScrollTarget: PrayerJournalField?
    @State private var autoContinueDay: PrayerDay?
    @StateObject private var speechController = PrayerSpeechController.shared
    @FocusState private var focusedJournalField: PrayerJournalField?
    private let streakService = StreakService()

    private var accentColor: Color {
        AppColors.planAccent(named: plan.accentColorName)
    }

    private var readingSpeed: PrayerReadingSpeed {
        PrayerReadingSpeed(rawValue: readingSpeedRawValue) ?? .reflective
    }

    private var isCompleted: Bool {
        completedDayNumbers.contains(day.dayNumber)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                headerCard

                if day.verses.isEmpty {
                    placeholderCard
                } else {
                    ForEach(day.verses) { verse in
                        PrayerCardView(
                            verse: verse,
                            isSaved: savedVerseIDs.contains(verse.id),
                            onToggleSaved: {
                                toggleSaved(verseID: verse.id)
                            }
                        )
                    }

                    readAloudControls
                    personalResponseSection
                    reflectionCompletionSection
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
            .scrollTargetLayout()
        }
        .scrollDismissesKeyboard(.interactively)
        .scrollPosition(id: $journalScrollTarget, anchor: .center)
        .background(PrayerBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            if !day.verses.isEmpty {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: copyPrayer) {
                        Image(systemName: "doc.on.doc")
                    }
                    .accessibilityLabel("Copy prayer")
                    .accessibilityHint("Copies the Scripture reference, Scripture text, and guided prayer.")

                    ShareLink(item: sharePrayerText) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .accessibilityLabel("Share prayer")
                    .accessibilityHint("Opens the iOS share sheet with the Scripture and guided prayer.")
                }
            }
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { focusedJournalField = nil }
            }
        }
        .navigationDestination(item: $autoContinueDay) { nextDay in
            PrayerDetailView(
                plan: plan,
                day: nextDay,
                completedDayNumbers: $completedDayNumbers,
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics
            )
        }
        .overlay(alignment: .top) {
            if copyConfirmationVisible {
                Label("Prayer copied", systemImage: "checkmark")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textPrimary)
                    .padding(.horizontal, AppSpacing.medium)
                    .padding(.vertical, AppSpacing.small)
                    .background(.regularMaterial, in: Capsule())
                    .overlay {
                        Capsule()
                            .stroke(AppColors.glassStroke, lineWidth: 1)
                    }
                    .padding(.top, AppSpacing.small)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .accessibilityAddTraits(.isStaticText)
            }
        }
        .onDisappear {
            speechController.stop()
        }
        .onAppear {
            PrayerJourneyProgressStore.markOpened(planID: plan.id, session: day.dayNumber)
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

    private var readAloudControls: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack {
                    Label("Read Aloud", systemImage: speechController.state.systemImage)
                        .font(AppTypography.sectionHeader())
                        .foregroundStyle(AppColors.primaryText)
                    Spacer()
                    Text(speechController.state.title)
                        .font(AppTypography.metadata())
                        .foregroundStyle(AppColors.secondaryText)
                }

                if speechController.state != .stopped {
                    ProgressView()
                        .tint(accentColor)
                        .accessibilityLabel("Reading in progress")
                }

                HStack(spacing: AppSpacing.large) {
                    Button {
                        speechController.replay(readAloudText, rateMultiplier: readingSpeed.rateMultiplier)
                    } label: {
                        Image(systemName: "gobackward.10")
                    }
                    .buttonStyle(PrayerIconButtonStyle())
                    .accessibilityLabel("Skip back 10 seconds")

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
                            .font(.system(size: 22, weight: .semibold))
                            .frame(width: 52, height: 52)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(accentColor)
                    .accessibilityLabel(speechController.state == .playing ? "Pause reading" : "Play reading")
                    .accessibilityHint("Reads the Scripture and guided prayer aloud.")

                    Button {
                        speechController.replay(readAloudText, rateMultiplier: readingSpeed.rateMultiplier)
                    } label: {
                        Image(systemName: "goforward.10")
                    }
                    .buttonStyle(PrayerIconButtonStyle())
                    .accessibilityLabel("Skip forward 10 seconds")

                    if speechController.state != .stopped {
                        Button(role: .cancel) { speechController.stop() } label: {
                            Image(systemName: "stop.fill")
                        }
                        .buttonStyle(PrayerIconButtonStyle())
                        .accessibilityLabel("Stop reading")
                    }
                }
                .frame(maxWidth: .infinity)

                Picker("Reading speed", selection: $readingSpeedRawValue) {
                    ForEach(PrayerReadingSpeed.allCases) { speed in
                        Text(speed.title).tag(speed.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .accessibilityHint("Chooses the pace for voice reading.")
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
                title: "Reflection",
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
        field: PrayerJournalField,
        text: Binding<String>
    ) -> some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label(title, systemImage: systemImage)
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

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
                        .frame(minHeight: 140)
                        .padding(AppSpacing.small)
                        .focused($focusedJournalField, equals: field)
                        .accessibilityLabel(title)
                        .accessibilityHint(placeholder)
                }
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(AppColors.glassStroke, lineWidth: 1)
                }

                Text("Saved automatically")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textTertiary)
            }
        }
        .id(field)
    }

    private var journalEntryKey: String {
        "\(plan.id)::\(day.dayNumber)"
    }

    private var copyPrayerText: String {
        day.verses
            .map { verse in
                """
                \(verse.reference)

                “\(verse.text)”

                Guided Prayer

                “\(verse.prayer)”
                """
            }
            .joined(separator: "\n\n")
    }

    private var sharePrayerText: String {
        """
        \(copyPrayerText)

        Shared from LetUsPray
        """
    }

    private var readAloudText: String {
        day.verses
            .map { verse in
                """
                \(verse.reference).
                \(verse.text)

                Guided Prayer.
                \(verse.prayer)
                """
            }
            .joined(separator: "\n\n")
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

    @ViewBuilder
    private var reflectionCompletionSection: some View {
        if isCompleted {
            completionExperience
        } else {
            reflectionPrompt
        }
    }

    private var reflectionPrompt: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Continue the conversation", systemImage: isCompleted ? "checkmark.circle.fill" : "heart.text.square.fill")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                Text("Take a quiet moment to respond to God in your own words. You may reflect, pray silently, or simply rest before continuing.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                Button(action: completePrayer) {
                    PrimaryPrayerButton(
                        title: isCompleted ? "Prayer Completed" : "Complete Prayer",
                        systemImage: isCompleted ? "checkmark.circle.fill" : "checkmark.circle",
                        isSecondary: isCompleted
                    )
                    .scaleEffect(completionPulse ? 1.02 : 1.0)
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                .disabled(isCompleted)
                .accessibilityHint(isCompleted ? "This prayer has already been completed." : "Marks this prayer complete after reflection.")
            }
        }
    }

    private var completionExperience: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Prayer complete", systemImage: "checkmark.seal.fill")
                    .font(AppTypography.screenTitle())
                    .foregroundStyle(AppColors.success)

                Text("You made space to pray today. Carry this quiet moment with you.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)

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

    private var headerCard: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text(plan.title)
                    .font(AppTypography.caption())
                    .foregroundStyle(accentColor)
                    .textCase(.uppercase)

                Text("Day \(day.dayNumber)")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textTertiary)
                    .textCase(.uppercase)

                Text(day.title)
                    .font(AppTypography.title())
                    .foregroundStyle(AppColors.textPrimary)

                Text(day.chapterReference)
                    .font(AppTypography.callout())
                    .foregroundStyle(AppColors.textSecondary)

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
            }
        }
    }

    private var placeholderCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("Prayer content is coming soon", systemImage: "sparkles")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                Text("This journey day has been prepared as a placeholder for the next stage of content creation. The plan structure is already in place.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
            }
        }
    }

    private func completePrayer() {
        focusedJournalField = nil
        speechController.stop()
        guard !isCompleted else { return }

        var updatedDays = completedDayNumbers
        updatedDays.insert(day.dayNumber)

        withAnimation(.spring(response: 0.34, dampingFraction: 0.76)) {
            completedDayNumbers = updatedDays
            completionPulse = true
        }

        updateAnalytics(completedDaysCount: updatedDays.count)
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

    private func copyPrayer() {
        UIPasteboard.general.string = copyPrayerText

        withAnimation(.easeInOut(duration: 0.2)) {
            copyConfirmationVisible = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(.easeInOut(duration: 0.2)) {
                copyConfirmationVisible = false
            }
        }
    }

    private func toggleSaved(verseID: String) {
        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
            if savedVerseIDs.contains(verseID) {
                savedVerseIDs.remove(verseID)
                HapticsService.unsavePrayer()
            } else {
                savedVerseIDs.insert(verseID)
                HapticsService.savePrayer()
            }
        }

        analytics = PrayerAnalyticsSnapshot(
            completedPrayersCount: analytics.completedPrayersCount,
            savedPrayersCount: savedVerseIDs.count,
            activePlanID: analytics.activePlanID,
            completedDaysByPlan: analytics.completedDaysByPlan
        )
    }

    private func updateAnalytics(completedDaysCount: Int) {
        var completedDaysByPlan = analytics.completedDaysByPlan
        completedDaysByPlan[plan.id] = completedDaysCount

        analytics = PrayerAnalyticsSnapshot(
            completedPrayersCount: analytics.completedPrayersCount + 1,
            savedPrayersCount: analytics.savedPrayersCount,
            activePlanID: analytics.activePlanID,
            completedDaysByPlan: completedDaysByPlan
        )
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
}

#Preview {
    NavigationStack {
        PrayerDetailView(
            plan: ProverbsPrayerData.plan,
            day: ProverbsPrayerData.plan.days[0],
            completedDayNumbers: .constant([]),
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(completedPrayersCount: 0, savedPrayersCount: 0, activePlanID: ProverbsPrayerData.plan.id, completedDaysByPlan: [:]))
        )
    }
}

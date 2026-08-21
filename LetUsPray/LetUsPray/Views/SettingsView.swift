import AuthenticationServices
import SwiftUI
import UserNotifications
import UIKit

private enum SettingsDestinations {
    static let appStoreID = "REPLACE_WITH_APP_STORE_ID"
    static let supportEmail = "support@letuspray.app"
    static let privacyPolicyURL = URL(string: "https://letuspray.app/privacy")!
    static let termsOfServiceURL = URL(string: "https://letuspray.app/terms")!

    static let contactSupportURL = URL(string: "mailto:\(supportEmail)")!
    static let sendFeedbackURL = URL(
        string: "mailto:\(supportEmail)?subject=LetUsPray%20Feedback"
    )!
    static let reportProblemURL = URL(
        string: "mailto:\(supportEmail)?subject=LetUsPray%20Problem%20Report"
    )!
    static let writeReviewURL = URL(
        string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review"
    )!
    static let notificationSettingsURL = URL(
        string: UIApplication.openNotificationSettingsURLString
    )!
}

enum PrayerReadingSpeed: String, CaseIterable, Identifiable {
    case reflective
    case balanced
    case flowing

    var id: Self { self }

    var title: String {
        switch self {
        case .reflective: "Reflective"
        case .balanced: "Balanced"
        case .flowing: "Flowing"
        }
    }

    var rateMultiplier: Float {
        switch self {
        case .reflective: 0.72
        case .balanced: 0.82
        case .flowing: 0.94
        }
    }
}

struct SettingsView: View {
    let onOpenSaved: () -> Void
    let onResetOnboarding: () -> Void

    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("settings.dailyReminder") private var dailyReminderEnabled = false
    @AppStorage("settings.reminderTime") private var reminderTimeInterval = 8 * 60 * 60.0
    @AppStorage("settings.readingSpeed") private var readingSpeedRawValue = PrayerReadingSpeed.reflective.rawValue
    @AppStorage("settings.hapticFeedback") private var hapticFeedbackEnabled = true
    @AppStorage("settings.autoContinueJourney") private var autoContinueJourneyEnabled = false
    @AppStorage("settings.startOnHome") private var startOnHomeEnabled = true
    @AppStorage(PrayerStorageKeys.currentStreak) private var currentStreak = 0
    @AppStorage(PrayerStorageKeys.longestStreak) private var longestStreak = 0
    @AppStorage(PrayerStorageKeys.completedPrayersCount) private var completedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.savedVerseIDs) private var savedVerseIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.achievementUnlockDates) private var achievementUnlockDatesRawValue = "{}"

    @State private var notificationAuthorizationStatus: UNAuthorizationStatus = .notDetermined
    @State private var permissionRequestInProgress = false
    @State private var reminderErrorMessage: String?
    @State private var reminderRequestGeneration = 0
    @ObservedObject private var accountService = AccountService.shared
    @ObservedObject private var prayerSyncService = PrayerSyncService.shared

    var body: some View {
        Form {
            appIdentitySection
            accountSection
            dailyPrayerSection
            prayerExperienceSection
            progressSection
            supportSection
            legalSection
            aboutSection
        }
        .formStyle(.grouped)
        .tint(.blue)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await refreshReminderState()
        }
        .onChange(of: reminderTimeInterval) {
            guard dailyReminderEnabled else { return }
            reminderRequestGeneration += 1
            let generation = reminderRequestGeneration
            Task {
                await scheduleReminder(generation: generation)
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            guard newPhase == .active else { return }
            Task {
                await refreshReminderState()
            }
        }
    }

    private var appIdentitySection: some View {
        Section {
            HStack(spacing: AppSpacing.medium) {
                Image(systemName: "hands.sparkles.fill")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(BrandGradients.prayerProgress, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 3) {
                    Text(AppMetadata.appName)
                        .font(AppTypography.title2())
                        .foregroundStyle(.primary)

                    Text("Prayer, thoughtfully supported")
                        .font(AppTypography.footnote())
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, AppSpacing.small)
            .accessibilityElement(children: .combine)
        }
    }

    private var accountSection: some View {
        Section {
            LabeledContent {
                Text(accountService.identityLabel)
                    .foregroundStyle(.secondary)
            } label: {
                settingsLabel("Account", systemImage: "person.crop.circle.fill", color: .blue)
            }

            if accountService.isSignedIn {
                if let lastSuccessfulSync = prayerSyncService.lastSuccessfulSync {
                    LabeledContent {
                        Text(lastSuccessfulSync.formatted(date: .abbreviated, time: .shortened))
                            .foregroundStyle(.secondary)
                    } label: {
                        settingsLabel("Last Sync", systemImage: "arrow.triangle.2.circlepath", color: .green)
                    }
                }

                Button {
                    Task { await accountService.signOut() }
                } label: {
                    settingsLabel("Sign Out", systemImage: "rectangle.portrait.and.arrow.right.fill", color: .orange)
                }
                .disabled(accountService.isBusy)
                .accessibilityHint("Signs out of the optional account. Prayer on this device continues.")
            } else {
                SignInWithAppleButton(.signIn) { request in
                    accountService.prepareAppleRequest(request)
                } onCompletion: { result in
                    Task { await accountService.completeAppleSignIn(result) }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(maxWidth: .infinity, minHeight: 44)
                .disabled(accountService.isBusy || !SupabaseConfig.isConfigured)
                .accessibilityLabel("Sign in with Apple")

                Button {
                    Task { await accountService.signInWithGoogle() }
                } label: {
                    settingsLabel("Sign in with Google", systemImage: "g.circle.fill", color: .blue)
                }
                .disabled(accountService.isBusy || !SupabaseConfig.isConfigured)
                .accessibilityHint("Creates or signs into an optional account using Google.")
            }

            if let lastErrorMessage = accountService.lastErrorMessage {
                Text(lastErrorMessage)
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.error)
            } else if let lastSyncMessage = prayerSyncService.lastSyncMessage, accountService.isSignedIn {
                Text(lastSyncMessage)
                    .font(AppTypography.footnote())
                    .foregroundStyle(AppColors.secondaryText)
            }
        } header: {
            Text("Account")
        } footer: {
            Text(accountFooterText)
        }
    }

    private var accountFooterText: String {
        if !SupabaseConfig.isConfigured {
            return "Cloud services are unavailable. You can keep using LetUsPray on this device."
        }
        if accountService.isSignedIn {
            return "Your prayer progress, saved prayers, and journals can sync to this account. Signing out does not remove what is stored on this device."
        }
        return "Prayer on this device does not require an account. Signing in is optional and enables sync of your progress, saved prayers, and journals."
    }

    private var dailyPrayerSection: some View {
        Section {
            Toggle(isOn: dailyReminderBinding) {
                settingsLabel("Daily Reminder", systemImage: "bell.fill", color: .orange)
            }
            .disabled(permissionRequestInProgress)
            .accessibilityHint(dailyReminderAccessibilityHint)

            DatePicker(
                selection: reminderTime,
                displayedComponents: .hourAndMinute
            ) {
                settingsLabel("Reminder Time", systemImage: "clock.fill", color: .blue)
            }
            .disabled(!dailyReminderEnabled)
            .accessibilityHint("Sets the time for your daily prayer reminder.")

            LabeledContent {
                Text(notificationStatusTitle)
                    .foregroundStyle(notificationStatusColor)
            } label: {
                settingsLabel("Notification Status", systemImage: notificationStatusImage, color: notificationStatusColor)
            }

            if notificationAuthorizationStatus == .denied {
                Link(destination: SettingsDestinations.notificationSettingsURL) {
                    settingsLabel("Open Notification Settings", systemImage: "arrow.up.forward.app.fill", color: .blue)
                }
            }
        } header: {
            Text("Daily Prayer")
        } footer: {
            if let reminderErrorMessage {
                Text(reminderErrorMessage)
            } else {
                Text(notificationFooterText)
            }
        }
    }

    private var prayerExperienceSection: some View {
        Section {
            Picker(selection: $readingSpeedRawValue) {
                ForEach(PrayerReadingSpeed.allCases) { speed in
                    Text(speed.title)
                        .tag(speed.rawValue)
                }
            } label: {
                settingsLabel("Reading Speed", systemImage: "gauge.with.dots.needle.50percent", color: .indigo)
            }
            .pickerStyle(.navigationLink)
            .accessibilityHint("Chooses the pace used for voice reading.")

            Toggle(isOn: $hapticFeedbackEnabled) {
                settingsLabel("Haptic Feedback", systemImage: "hand.tap.fill", color: .pink)
            }
            .accessibilityHint("Controls gentle tactile feedback for prayer actions.")

            Toggle(isOn: $autoContinueJourneyEnabled) {
                settingsLabel("Auto Continue Journey", systemImage: "arrow.right.circle.fill", color: .green)
            }
            .accessibilityHint("Opens the next available prayer after completing the current one.")

            Toggle(isOn: $startOnHomeEnabled) {
                settingsLabel("Start on Home", systemImage: "house.fill", color: .cyan)
            }
            .accessibilityHint("Opens LetUsPray on Home instead of the most recently used tab.")
        } header: {
            Text("Prayer Experience")
        } footer: {
            Text("Choose how LetUsPray supports your prayer without changing the prayer itself.")
        }
    }

    private var progressSection: some View {
        Section {
            LabeledContent {
                Text("\(currentStreak) day\(currentStreak == 1 ? "" : "s")")
            } label: {
                settingsLabel("Current Streak", systemImage: "flame.fill", color: .orange)
            }

            LabeledContent {
                Text("\(longestStreak) day\(longestStreak == 1 ? "" : "s")")
            } label: {
                settingsLabel("Longest Streak", systemImage: "calendar.badge.checkmark", color: .green)
            }

            NavigationLink {
                FaithMilestonesView()
            } label: {
                settingsNavigationLabel(
                    "Faith Milestones",
                    detail: "\(earnedAchievementCount) of \(AchievementService().totalCount) earned",
                    systemImage: "sparkles",
                    color: .yellow
                )
            }

            Button(action: onOpenSaved) {
                settingsNavigationLabel(
                    "Saved Prayers",
                    detail: "\(savedPrayerCount)",
                    systemImage: "bookmark.fill",
                    color: .blue
                )
            }
            .foregroundStyle(.primary)
            .accessibilityHint("Opens Saved prayers.")

            LabeledContent {
                Text("\(completedPrayersCount)")
            } label: {
                settingsLabel("Prayers Completed", systemImage: "checkmark.circle.fill", color: .green)
            }
        } header: {
            Text("Progress")
        } footer: {
            Text("A private reflection of your prayer journey, stored on this device.")
        }
    }

    private var supportSection: some View {
        Section("Support") {
            Link(destination: SettingsDestinations.contactSupportURL) {
                settingsLabel("Contact Support", systemImage: "envelope.fill", color: .blue)
            }

            Link(destination: SettingsDestinations.sendFeedbackURL) {
                settingsLabel("Send Feedback", systemImage: "bubble.left.and.text.bubble.right.fill", color: .purple)
            }

            Link(destination: SettingsDestinations.reportProblemURL) {
                settingsLabel("Report a Problem", systemImage: "exclamationmark.bubble.fill", color: .orange)
            }
        }
    }

    private var legalSection: some View {
        Section("Legal") {
            Link(destination: SettingsDestinations.privacyPolicyURL) {
                settingsLabel("Privacy Policy", systemImage: "hand.raised.fill", color: .blue)
            }

            Link(destination: SettingsDestinations.termsOfServiceURL) {
                settingsLabel("Terms of Service", systemImage: "doc.text.fill", color: .gray)
            }
        }
    }

    private var aboutSection: some View {
        Section {
            LabeledContent("App Name", value: AppMetadata.appName)
            LabeledContent("Version", value: appVersion)
            LabeledContent("Build", value: appBuild)

            Button(action: onResetOnboarding) {
                settingsLabel("View Welcome Again", systemImage: "arrow.counterclockwise.circle.fill", color: .blue)
            }
            .foregroundStyle(.primary)
            .accessibilityHint("Shows the welcome journey again.")
        } header: {
            Text("About")
        } footer: {
            Text("Made to support quiet, consistent time in prayer.")
        }
    }

    private var earnedAchievementCount: Int {
        let unlockDates = PrayerStorageCodec.decodeValue(
            [String: Date].self,
            from: achievementUnlockDatesRawValue
        ) ?? [:]
        return AchievementService().earnedCount(unlockDates: unlockDates)
    }

    private var savedPrayerCount: Int {
        PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue).count
    }

    private var notificationStatusTitle: String {
        switch notificationAuthorizationStatus {
        case .authorized, .provisional, .ephemeral:
            dailyReminderEnabled ? "Scheduled" : "Available"
        case .denied:
            "Disabled"
        case .notDetermined:
            "Not Requested"
        @unknown default:
            "Unavailable"
        }
    }

    private var notificationStatusImage: String {
        switch notificationAuthorizationStatus {
        case .authorized, .provisional, .ephemeral: "checkmark.circle.fill"
        case .denied: "xmark.circle.fill"
        case .notDetermined: "bell.badge.fill"
        @unknown default: "questionmark.circle.fill"
        }
    }

    private var notificationStatusColor: Color {
        switch notificationAuthorizationStatus {
        case .authorized, .provisional, .ephemeral: .green
        case .denied: .red
        case .notDetermined: .secondary
        @unknown default: .secondary
        }
    }

    private var notificationFooterText: String {
        if notificationAuthorizationStatus == .denied {
            return "Notifications are disabled in iOS Settings. LetUsPray will never request permission without your action."
        }
        if dailyReminderEnabled {
            return "One gentle reminder will arrive each day at your chosen time."
        }
        return "Permission is requested only when you turn on Daily Reminder."
    }

    private var reminderTime: Binding<Date> {
        Binding(
            get: {
                Calendar.current.startOfDay(for: Date())
                    .addingTimeInterval(reminderTimeInterval)
            },
            set: { newValue in
                let components = Calendar.current.dateComponents([.hour, .minute], from: newValue)
                reminderTimeInterval = Double(
                    (components.hour ?? 8) * 60 * 60
                    + (components.minute ?? 0) * 60
                )
            }
        )
    }

    private var dailyReminderBinding: Binding<Bool> {
        Binding(
            get: { dailyReminderEnabled },
            set: { isEnabled in
                if isEnabled {
                    reminderRequestGeneration += 1
                    let generation = reminderRequestGeneration
                    Task {
                        await enableDailyReminder(generation: generation)
                    }
                } else {
                    reminderRequestGeneration += 1
                    dailyReminderEnabled = false
                    reminderErrorMessage = nil
                    DailyReminderService.shared.cancelDailyReminder()
                }
            }
        )
    }

    private var dailyReminderAccessibilityHint: String {
        if notificationAuthorizationStatus == .denied {
            return "Notifications are disabled for LetUsPray in iOS Settings."
        }
        return dailyReminderEnabled
            ? "Turns off the daily prayer reminder."
            : "Requests permission and schedules one daily prayer reminder."
    }

    private func settingsLabel(_ title: String, systemImage: String, color: Color) -> some View {
        Label {
            Text(title)
        } icon: {
            Image(systemName: systemImage)
                .foregroundStyle(color)
                .frame(width: 24)
        }
    }

    private func settingsNavigationLabel(
        _ title: String,
        detail: String,
        systemImage: String,
        color: Color
    ) -> some View {
        HStack {
            settingsLabel(title, systemImage: systemImage, color: color)
            Spacer()
            Text(detail)
                .foregroundStyle(.secondary)
        }
    }

    private func enableDailyReminder(generation: Int) async {
        permissionRequestInProgress = true
        reminderErrorMessage = nil
        defer { permissionRequestInProgress = false }

        do {
            let granted = try await DailyReminderService.shared.requestAuthorizationIfNeeded()
            notificationAuthorizationStatus = await DailyReminderService.shared.authorizationStatus()

            guard generation == reminderRequestGeneration, granted else {
                dailyReminderEnabled = false
                DailyReminderService.shared.cancelDailyReminder()
                return
            }

            try await DailyReminderService.shared.scheduleDailyReminder(at: reminderTimeInterval)
            guard generation == reminderRequestGeneration else { return }
            dailyReminderEnabled = true
        } catch {
            guard generation == reminderRequestGeneration else { return }
            dailyReminderEnabled = false
            DailyReminderService.shared.cancelDailyReminder()
            reminderErrorMessage = "The daily reminder could not be scheduled. Please try again."
        }
    }

    private func scheduleReminder(generation: Int? = nil) async {
        if let generation, generation != reminderRequestGeneration {
            return
        }

        do {
            try await DailyReminderService.shared.scheduleDailyReminder(at: reminderTimeInterval)
            if let generation, generation != reminderRequestGeneration {
                return
            }
            reminderErrorMessage = nil
        } catch {
            if let generation, generation != reminderRequestGeneration {
                return
            }
            dailyReminderEnabled = false
            DailyReminderService.shared.cancelDailyReminder()
            reminderErrorMessage = "The daily reminder could not be updated. Please try again."
        }
    }

    private func refreshReminderState() async {
        notificationAuthorizationStatus = await DailyReminderService.shared.authorizationStatus()

        switch notificationAuthorizationStatus {
        case .authorized, .provisional, .ephemeral:
            if dailyReminderEnabled {
                await scheduleReminder()
            }
        case .denied, .notDetermined:
            if dailyReminderEnabled {
                dailyReminderEnabled = false
                DailyReminderService.shared.cancelDailyReminder()
            }
        @unknown default:
            dailyReminderEnabled = false
            DailyReminderService.shared.cancelDailyReminder()
        }
    }

    private var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
            ?? AppMetadata.version
    }

    private var appBuild: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
            ?? "—"
    }
}

#Preview {
    NavigationStack {
        SettingsView(
            onOpenSaved: {},
            onResetOnboarding: {}
        )
    }
}

import SwiftUI

private enum SettingsDestinations {
    static let appStoreID = "REPLACE_WITH_APP_STORE_ID"
    static let supportEmail = "support@letuspray.app"
    static let privacyPolicyURL = URL(string: "https://letuspray.app/privacy")!
    static let termsOfServiceURL = URL(string: "https://letuspray.app/terms")!

    static let contactSupportURL = URL(string: "mailto:\(supportEmail)")!
    static let writeReviewURL = URL(
        string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review"
    )!
}

enum AppAppearance: String, CaseIterable, Identifiable {
    case system
    case light
    case dark

    var id: Self { self }

    var title: String {
        switch self {
        case .system:
            "Follow System"
        case .light:
            "Light"
        case .dark:
            "Dark"
        }
    }

    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            nil
        case .light:
            .light
        case .dark:
            .dark
        }
    }
}

struct SettingsView: View {
    let onResetOnboarding: () -> Void

    @AppStorage("settings.dailyReminder") private var dailyReminderEnabled = false
    @AppStorage("settings.reminderTime") private var reminderTimeInterval = 8 * 60 * 60.0
    @AppStorage("settings.readAloud") private var readAloudEnabled = false
    @AppStorage("settings.hapticFeedback") private var hapticFeedbackEnabled = true
    @AppStorage("settings.appearance") private var appearanceRawValue = AppAppearance.system.rawValue
    @AppStorage("settings.autoContinueJourney") private var autoContinueJourneyEnabled = true
    @AppStorage("settings.startOnHome") private var startOnHomeEnabled = true

    var body: some View {
        Form {
            generalSection
            appearanceSection
            prayerSection
            supportSection
            onboardingSection
            aboutSection
        }
        .formStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(PrayerBackground())
        .navigationTitle("Settings")
        .toolbarBackground(.hidden, for: .navigationBar)
        .preferredColorScheme(selectedAppearance.colorScheme)
    }

    private var generalSection: some View {
        Section("General") {
            Toggle(isOn: $dailyReminderEnabled) {
                Label("Daily Reminder", systemImage: "bell.fill")
            }
            .accessibilityHint("Stores your daily reminder preference. Notifications are not scheduled yet.")

            DatePicker(
                "Reminder Time",
                selection: reminderTime,
                displayedComponents: .hourAndMinute
            )
            .disabled(!dailyReminderEnabled)
            .accessibilityHint("Sets the preferred time for the daily reminder.")

            Toggle(isOn: $readAloudEnabled) {
                Label("Read Aloud", systemImage: "speaker.wave.2.fill")
            }
            .accessibilityHint("Controls whether prayers begin with read aloud enabled.")

            Toggle(isOn: $hapticFeedbackEnabled) {
                Label("Haptic Feedback", systemImage: "hand.tap.fill")
            }
            .accessibilityHint("Controls tactile feedback for prayer interactions.")
        }
    }

    private var appearanceSection: some View {
        Section("Appearance") {
            Picker("Appearance", selection: $appearanceRawValue) {
                ForEach(AppAppearance.allCases) { appearance in
                    Text(appearance.title)
                        .tag(appearance.rawValue)
                }
            }
            .pickerStyle(.inline)
            .accessibilityHint("Chooses whether LetUsPray follows the system appearance or uses Light or Dark mode.")
        }
    }

    private var prayerSection: some View {
        Section("Prayer") {
            Toggle(isOn: $autoContinueJourneyEnabled) {
                Label("Auto Continue Journey", systemImage: "arrow.forward.circle.fill")
            }
            .accessibilityHint("Controls whether your active journey continues automatically.")

            Toggle(isOn: $startOnHomeEnabled) {
                Label("Start on Home", systemImage: "house.fill")
            }
            .accessibilityHint("Controls whether LetUsPray opens on Home.")
        }
    }

    private var supportSection: some View {
        Section("Support") {
            Link(destination: SettingsDestinations.contactSupportURL) {
                Label("Contact Support", systemImage: "envelope.fill")
            }

            Link(destination: SettingsDestinations.privacyPolicyURL) {
                Label("Privacy Policy", systemImage: "hand.raised.fill")
            }

            Link(destination: SettingsDestinations.termsOfServiceURL) {
                Label("Terms of Service", systemImage: "doc.text.fill")
            }

            Link(destination: SettingsDestinations.writeReviewURL) {
                Label("Rate LetUsPray", systemImage: "star.fill")
            }
        }
    }

    private var onboardingSection: some View {
        Section {
            Button(action: onResetOnboarding) {
                Label("Reset Onboarding", systemImage: "arrow.counterclockwise.circle.fill")
            }
            .accessibilityHint("Shows the welcome journey again.")
        } header: {
            Text("Onboarding")
        } footer: {
            Text("Show the welcome journey again on next entry.")
        }
    }

    private var aboutSection: some View {
        Section("About") {
            LabeledContent("App Name", value: AppMetadata.appName)
            LabeledContent("Version", value: appVersion)
            LabeledContent("Build", value: appBuild)
        }
    }

    private var selectedAppearance: AppAppearance {
        AppAppearance(rawValue: appearanceRawValue) ?? .system
    }

    private var reminderTime: Binding<Date> {
        Binding(
            get: {
                Calendar.current.startOfDay(for: Date())
                    .addingTimeInterval(reminderTimeInterval)
            },
            set: { newValue in
                let components = Calendar.current.dateComponents(
                    [.hour, .minute],
                    from: newValue
                )
                reminderTimeInterval = Double(
                    (components.hour ?? 8) * 60 * 60
                    + (components.minute ?? 0) * 60
                )
            }
        )
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
        SettingsView(onResetOnboarding: {})
    }
}

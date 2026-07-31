import Foundation
import UserNotifications

@MainActor
final class DailyReminderService {
    static let shared = DailyReminderService()

    static let notificationIdentifier = "daily-prayer-reminder"

    private let notificationCenter: UNUserNotificationCenter

    private init(notificationCenter: UNUserNotificationCenter = .current()) {
        self.notificationCenter = notificationCenter
    }

    func authorizationStatus() async -> UNAuthorizationStatus {
        await notificationCenter.notificationSettings().authorizationStatus
    }

    func requestAuthorizationIfNeeded() async throws -> Bool {
        switch await authorizationStatus() {
        case .authorized, .provisional, .ephemeral:
            return true
        case .denied:
            return false
        case .notDetermined:
            return try await notificationCenter.requestAuthorization(options: [.alert, .sound])
        @unknown default:
            return false
        }
    }

    func scheduleDailyReminder(at timeInterval: TimeInterval) async throws {
        cancelDailyReminder()

        let normalizedInterval = max(0, min(timeInterval, 24 * 60 * 60 - 1))
        let totalMinutes = Int(normalizedInterval) / 60
        var dateComponents = DateComponents()
        dateComponents.hour = totalMinutes / 60
        dateComponents.minute = totalMinutes % 60

        let content = UNMutableNotificationContent()
        content.title = "Time to Pray"
        content.body = "Take a few quiet moments with God today."
        content.sound = .default

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true
        )
        let request = UNNotificationRequest(
            identifier: Self.notificationIdentifier,
            content: content,
            trigger: trigger
        )

        try await notificationCenter.add(request)
    }

    func cancelDailyReminder() {
        notificationCenter.removePendingNotificationRequests(
            withIdentifiers: [Self.notificationIdentifier]
        )
    }
}

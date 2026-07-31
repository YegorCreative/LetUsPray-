import Foundation
import UserNotifications

@MainActor
final class DailyReminderService {
    static let shared = DailyReminderService()

    static let notificationIdentifier = "daily-prayer-reminder"

    private let notificationCenter: UNUserNotificationCenter
    private var desiredReminderTime: TimeInterval?
    private var changeGeneration = 0
    private var reconciliationTask: Task<Void, Never>?
    private var reconciliationError: Error?

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
        changeGeneration += 1
        desiredReminderTime = timeInterval
        reconciliationError = nil
        startReconciliationIfNeeded()

        await reconciliationTask?.value

        if let reconciliationError {
            throw reconciliationError
        }
    }

    func cancelDailyReminder() {
        changeGeneration += 1
        desiredReminderTime = nil
        reconciliationError = nil
        notificationCenter.removePendingNotificationRequests(
            withIdentifiers: [Self.notificationIdentifier]
        )
        startReconciliationIfNeeded()
    }

    private func startReconciliationIfNeeded() {
        guard reconciliationTask == nil else { return }

        reconciliationTask = Task { [weak self] in
            await self?.reconcileDesiredState()
        }
    }

    private func reconcileDesiredState() async {
        while true {
            let generation = changeGeneration
            let reminderTime = desiredReminderTime

            notificationCenter.removePendingNotificationRequests(
                withIdentifiers: [Self.notificationIdentifier]
            )

            if let reminderTime {
                do {
                    try await notificationCenter.add(
                        notificationRequest(at: reminderTime)
                    )
                } catch {
                    if generation == changeGeneration {
                        reconciliationError = error
                    }
                }
            }

            guard generation == changeGeneration else {
                continue
            }

            reconciliationTask = nil
            return
        }
    }

    private func notificationRequest(at timeInterval: TimeInterval) -> UNNotificationRequest {
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
        return UNNotificationRequest(
            identifier: Self.notificationIdentifier,
            content: content,
            trigger: trigger
        )
    }
}

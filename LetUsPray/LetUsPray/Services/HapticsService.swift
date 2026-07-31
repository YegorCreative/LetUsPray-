import UIKit

enum HapticsService {
    static func markPrayerCompleted() {
        guard isEnabled else { return }
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)
    }

    static func savePrayer() {
        guard isEnabled else { return }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred(intensity: 0.75)
    }

    static func unsavePrayer() {
        guard isEnabled else { return }
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.prepare()
        generator.impactOccurred(intensity: 0.65)
    }

    private static var isEnabled: Bool {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: "settings.hapticFeedback") != nil else {
            return true
        }
        return defaults.bool(forKey: "settings.hapticFeedback")
    }
}

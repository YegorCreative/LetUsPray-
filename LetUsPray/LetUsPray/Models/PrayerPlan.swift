import Foundation

struct PrayerPlan: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let category: PrayerPlanCategory
    let durationDays: Int
    let accentColorName: String
    let coverIcon: String
    let days: [PrayerDay]

    var duration: Int { durationDays }
    var supportsJourneyStart: Bool { !days.isEmpty }
    var isPreviewPlaceholder: Bool { days.isEmpty }
}

struct PrayerPlanProgress: Hashable {
    enum Status: String {
        case notStarted = "Not Started"
        case inProgress = "In Progress"
        case completed = "Completed"
    }

    let completedDays: Int
    let totalDays: Int

    init(completedDays: Int, totalDays: Int) {
        self.totalDays = max(totalDays, 0)
        self.completedDays = min(max(completedDays, 0), self.totalDays)
    }

    var remainingDays: Int {
        max(totalDays - completedDays, 0)
    }

    var fractionCompleted: Double {
        guard totalDays > 0 else { return 0 }
        return Double(completedDays) / Double(totalDays)
    }

    var percentage: Int {
        Int((fractionCompleted * 100).rounded())
    }

    var status: Status {
        if completedDays == 0 {
            return .notStarted
        }
        if completedDays >= totalDays, totalDays > 0 {
            return .completed
        }
        return .inProgress
    }
}

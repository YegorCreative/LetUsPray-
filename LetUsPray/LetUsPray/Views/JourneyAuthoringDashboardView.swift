import SwiftUI

/// Internal catalog health presentation. It reads authoring metadata only and does not alter user data.
struct JourneyAuthoringDashboardView: View {
    private let metadata = PrayerJourneyCatalog.metadata
    private let report = PrayerJourneyCatalog.validationReport

    private var approvedCount: Int {
        metadata.filter { $0.reviewStatus == .approved }.count
    }

    private var readyCount: Int {
        metadata.filter { $0.contentState == .available || $0.contentState == .seasonal }.count
    }

    private var completionPercentage: Int {
        guard !metadata.isEmpty else { return 0 }
        return metadata.reduce(0) { $0 + $1.contentCompletionPercentage } / metadata.count
    }

    var body: some View {
        List {
            Section("Catalog Health") {
                healthRow("Journeys", value: "\(metadata.count)", systemImage: "square.stack.3d.up.fill")
                healthRow("Launch ready", value: "\(readyCount)", systemImage: "checkmark.circle.fill")
                healthRow("Approved", value: "\(approvedCount)", systemImage: "checkmark.seal.fill")
                healthRow("Content completion", value: "\(completionPercentage)%", systemImage: "chart.bar.fill")
                Label(report.isValid ? "Validation passed" : "Validation needs attention", systemImage: report.isValid ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.isValid ? .green : .orange)
            }

            Section("Content Pipeline") {
                healthRow("Ready for QA", value: "\(count(.readyForQA))", systemImage: "checklist")
                healthRow("Ready for Release", value: "\(count(.readyForRelease))", systemImage: "shippingbox.fill")
                healthRow("Released", value: "\(count(.released))", systemImage: "checkmark.seal.fill")
                healthRow("Blocked", value: "\(metadata.filter { $0.blockingIssuesCount > 0 }.count)", systemImage: "exclamationmark.octagon.fill")
                healthRow("Pipeline progress", value: "\(pipelineProgress)%", systemImage: "chart.line.uptrend.xyaxis")
            }

            Section("Localization Health") {
                healthRow("Source language", value: "en", systemImage: "character.book.closed.fill")
                healthRow("Supported languages", value: "\(languageCodes.count)", systemImage: "globe")
                healthRow("Published versions", value: "\(publishedLocalizationCount)", systemImage: "checkmark.circle.fill")
                healthRow("Translation progress", value: "\(translationProgress)%", systemImage: "text.bubble.fill")
                Label(report.localizationIssues.isEmpty ? "Localization validation passed" : "Localization needs attention", systemImage: report.localizationIssues.isEmpty ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.localizationIssues.isEmpty ? .green : .orange)
            }

            Section("Collections") {
                ForEach(PrayerJourneyCatalog.collections) { collection in
                    let journeys = metadata.filter { $0.collection == collection.id }
                    let completion = journeys.isEmpty ? 0 : journeys.reduce(0) { $0 + $1.contentCompletionPercentage } / journeys.count
                    HStack {
                        Label(collection.title, systemImage: collection.iconName)
                        Spacer()
                        Text("\(journeys.count) · \(completion)%")
                            .foregroundStyle(.secondary)
                    }
                    .accessibilityElement(children: .combine)
                }
            }
        }
        .navigationTitle("Authoring Health")
        .navigationBarTitleDisplayMode(.large)
    }

    private func healthRow(_ title: String, value: String, systemImage: String) -> some View {
        HStack {
            Label(title, systemImage: systemImage)
            Spacer()
            Text(value).foregroundStyle(.secondary)
        }
        .accessibilityElement(children: .combine)
    }

    private func count(_ stage: PrayerJourneyWorkflowStage) -> Int {
        metadata.filter { $0.workflowStage == stage }.count
    }

    private var pipelineProgress: Int {
        guard !metadata.isEmpty else { return 0 }
        let maximum = PrayerJourneyWorkflowStage.released.order
        return metadata.reduce(0) { total, item in
            total + min(item.workflowStage.order, maximum) * 100 / max(maximum, 1)
        } / metadata.count
    }

    private var languageCodes: Set<String> {
        Set(metadata.flatMap { $0.supportedLanguages })
    }

    private var publishedLocalizationCount: Int {
        metadata.reduce(0) { $0 + $1.localizations.filter { $0.status == .published }.count }
    }

    private var translationProgress: Int {
        let values = metadata.flatMap(\.localizations).map(\.completionPercentage)
        guard !values.isEmpty else { return 0 }
        return values.reduce(0, +) / values.count
    }
}

#Preview {
    NavigationStack { JourneyAuthoringDashboardView() }
}

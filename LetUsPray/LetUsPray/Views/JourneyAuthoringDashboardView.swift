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

            Section("Developer Platform") {
                healthRow("Platform", value: PrayerJourneyCatalog.platform.platformVersion, systemImage: "hammer.fill")
                healthRow("Schema / model", value: "\(PrayerJourneyCatalog.platform.schemaVersion) / \(PrayerJourneyCatalog.platform.modelVersion)", systemImage: "square.stack.3d.up.fill")
                healthRow("Migration", value: "\(PrayerJourneyCatalog.platform.migrationVersion)", systemImage: "arrow.triangle.2.circlepath")
                healthRow("API compatibility", value: PrayerJourneyCatalog.platform.apiCompatibilityVersion, systemImage: "link")
                healthRow("Minimum app", value: PrayerJourneyCatalog.platform.minimumSupportedAppVersion, systemImage: "iphone")
                Label(report.documentationIssues.isEmpty ? "Documentation validation passed" : "Documentation needs attention", systemImage: report.documentationIssues.isEmpty ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.documentationIssues.isEmpty ? .green : .orange)
            }

            Section("Platform Documentation") {
                Text(PrayerJourneyDeveloperDocumentation.architectureOverview)
                Text(PrayerJourneyDeveloperDocumentation.dataModelSummary)
                Text(PrayerJourneyDeveloperDocumentation.schemaSummary)
                healthRow("Collections", value: "\(PrayerJourneyCatalog.collections.count)", systemImage: "square.grid.2x2.fill")
                healthRow("Journeys", value: "\(metadata.count)", systemImage: "books.vertical.fill")
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

            Section("Asset Health") {
                healthRow("Asset completion", value: "\(assetCompletion)%", systemImage: "photo.stack.fill")
                healthRow("Published assets", value: "\(assetCount(.published))", systemImage: "checkmark.circle.fill")
                healthRow("Under review", value: "\(assetCount(.underReview))", systemImage: "eye.fill")
                healthRow("Missing or placeholder", value: "\(metadata.filter { $0.assets.contains { $0.status == .missing || $0.status == .placeholder } }.count)", systemImage: "exclamationmark.triangle.fill")
                Label(report.assetIssues.isEmpty ? "Asset validation passed" : "Assets need attention", systemImage: report.assetIssues.isEmpty ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.assetIssues.isEmpty ? .green : .orange)
            }

            Section("QA Health") {
                healthRow("Approved", value: "\(qaCount(.approved))", systemImage: "checkmark.seal.fill")
                healthRow("Ready for review", value: "\(qaCount(.readyForReview))", systemImage: "eye.fill")
                healthRow("Failed", value: "\(qaCount(.failed))", systemImage: "xmark.octagon.fill")
                healthRow("Blocked", value: "\(qaCount(.blocked))", systemImage: "exclamationmark.octagon.fill")
                healthRow("Release readiness", value: "\(qaReadiness)%", systemImage: "shippingbox.fill")
                Label(report.qaIssues.isEmpty ? "QA validation passed" : "QA needs attention", systemImage: report.qaIssues.isEmpty ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.qaIssues.isEmpty ? .green : .orange)
            }

            Section("Release Health") {
                healthRow("Production releases", value: "\(releaseCount(.production))", systemImage: "shippingbox.fill")
                healthRow("Upcoming releases", value: "\(metadata.filter { $0.release?.status == .planned || $0.release?.status == .scheduled }.count)", systemImage: "calendar.badge.clock")
                healthRow("Release candidates", value: "\(metadata.filter { $0.release?.status == .releaseCandidate }.count)", systemImage: "checklist")
                healthRow("Release readiness", value: "\(releaseReadiness)%", systemImage: "chart.bar.fill")
                Label(report.releaseIssues.isEmpty ? "Release validation passed" : "Release needs attention", systemImage: report.releaseIssues.isEmpty ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.releaseIssues.isEmpty ? .green : .orange)
            }

            Section("Publishing Health") {
                healthRow("Draft journeys", value: "\(publishingCount(.draft))", systemImage: "doc.text")
                healthRow("Ready to publish", value: "\(publishingCount(.readyToPublish))", systemImage: "arrow.up.circle.fill")
                healthRow("Published", value: "\(publishingCount(.published))", systemImage: "checkmark.seal.fill")
                healthRow("Rollback available", value: "\(metadata.filter { $0.publication.rollbackVersion != nil }.count)", systemImage: "arrow.uturn.backward.circle.fill")
                healthRow("Publishing health", value: "\(publishingHealth)%", systemImage: "chart.bar.fill")
                Label(report.publicationIssues.isEmpty ? "Publishing validation passed" : "Publishing needs attention", systemImage: report.publicationIssues.isEmpty ? "checkmark.circle" : "exclamationmark.triangle")
                    .foregroundStyle(report.publicationIssues.isEmpty ? .green : .orange)
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

    private func assetCount(_ status: PrayerJourneyAssetStatus) -> Int {
        metadata.flatMap(\.assets).filter { $0.status == status }.count
    }

    private var assetCompletion: Int {
        let assets = metadata.flatMap(\.assets)
        guard !assets.isEmpty else { return 0 }
        return assets.reduce(0) { total, asset in
            total + (asset.status == .published || asset.status == .approved ? 100 : asset.status == .missing ? 0 : 50)
        } / assets.count
    }

    private func qaCount(_ status: PrayerJourneyQAStatus) -> Int {
        metadata.filter { $0.qa.status == status }.count
    }

    private var qaReadiness: Int {
        guard !metadata.isEmpty else { return 0 }
        return metadata.reduce(0) { total, item in
            let qa = item.qa
            let categoryScore = qa.completedCategories.count * 100 / PrayerJourneyQACategory.allCases.count
            let statusScore = qa.status == .approved ? 100 : qa.status == .readyForReview ? 75 : qa.status == .inProgress ? 50 : 0
            return total + min(categoryScore, statusScore)
        } / metadata.count
    }

    private func releaseCount(_ channel: PrayerJourneyReleaseChannel) -> Int {
        metadata.filter { $0.release?.channel == channel && $0.release?.status == .released }.count
    }

    private var releaseReadiness: Int {
        guard !metadata.isEmpty else { return 0 }
        return metadata.reduce(0) { total, item in
            let value: Int
            if item.release?.status == .released && item.qa.status == .approved && item.release?.channel == .production {
                value = 100
            } else if item.release != nil {
                value = 50
            } else {
                value = 0
            }
            return total + value
        } / metadata.count
    }

    private func publishingCount(_ state: PrayerJourneyPublishingState) -> Int {
        metadata.filter { $0.publication.state == state }.count
    }

    private var publishingHealth: Int {
        guard !metadata.isEmpty else { return 0 }
        return metadata.reduce(0) { total, item in
            total + (item.publication.contentIntegrityStatus == "Verified" ? 100 : item.publication.state == .draft ? 0 : 50)
        } / metadata.count
    }
}

#Preview {
    NavigationStack { JourneyAuthoringDashboardView() }
}

import WidgetKit
import SwiftUI

struct PrayerWidgetSnapshot: TimelineEntry {
    let date: Date
    let title: String
    let subtitle: String
    let progress: Int
    let streak: Int
}

struct PrayerWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> PrayerWidgetSnapshot {
        PrayerWidgetSnapshot(date: .now, title: "Continue Your Journey", subtitle: "A quiet moment awaits.", progress: 0, streak: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (PrayerWidgetSnapshot) -> Void) {
        completion(snapshot())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<PrayerWidgetSnapshot>) -> Void) {
        let entry = snapshot()
        completion(Timeline(entries: [entry], policy: .after(.now.addingTimeInterval(15 * 60))))
    }

    private func snapshot() -> PrayerWidgetSnapshot {
        let defaults = UserDefaults.standard
        let streak = defaults.integer(forKey: "currentPrayerStreak")
        let progress = defaults.integer(forKey: "completedPrayersCount")
        return PrayerWidgetSnapshot(
            date: .now,
            title: "Continue Your Journey",
            subtitle: streak > 0 ? "You're on a \(streak)-day prayer journey." : "A quiet moment awaits.",
            progress: min(max(progress, 0), 100),
            streak: streak
        )
    }
}

struct PrayerJourneyWidgetView: View {
    @Environment(\.widgetFamily) private var family
    let entry: PrayerWidgetSnapshot

    var body: some View {
        Group {
        if family == .accessoryInline {
            Label(entry.title, systemImage: "hands.sparkles.fill")
        } else if family == .accessoryCircular {
            Gauge(value: Double(entry.progress), in: 0...100) {
                Image(systemName: "hands.sparkles.fill")
            } currentValueLabel: {
                Text("\(entry.progress)%")
            }
            .gaugeStyle(.accessoryCircular)
        } else if family == .accessoryRectangular {
            VStack(alignment: .leading) {
                Text(entry.title).font(.headline).lineLimit(1)
                Text("\(entry.progress)% complete · \(entry.streak)-day streak")
                    .font(.caption2)
                    .lineLimit(1)
            }
        } else {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "hands.sparkles.fill")
                .foregroundStyle(.yellow)
            Text(entry.title)
                .font(.headline)
                .lineLimit(2)
            Text(entry.subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            if family != .systemSmall {
                Spacer(minLength: 0)
                ProgressView(value: Double(entry.progress), total: 100)
                Text("\(entry.streak)-day streak")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        }
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

struct PrayerJourneyWidget: Widget {
    let kind = "PrayerJourneyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PrayerWidgetProvider()) { entry in
            PrayerJourneyWidgetView(entry: entry)
        }
        .configurationDisplayName("Prayer Journey")
        .description("Continue your journey and see your prayer progress.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .accessoryInline, .accessoryCircular, .accessoryRectangular])
    }
}

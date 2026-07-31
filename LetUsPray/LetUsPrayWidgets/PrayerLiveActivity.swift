import ActivityKit
import WidgetKit
import SwiftUI

struct PrayerSessionActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var currentSession: Int
        var completedSessions: Int
        var totalSessions: Int
        var isComplete: Bool
    }

    var journeyTitle: String
}

struct PrayerSessionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PrayerSessionActivityAttributes.self) { context in
            HStack {
                Label(context.attributes.journeyTitle, systemImage: "hands.sparkles.fill")
                Spacer()
                Text("Session \(context.state.currentSession)")
            }
            .padding()
            .activityBackgroundTint(.black)
            .activitySystemActionForegroundColor(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) { Text(context.attributes.journeyTitle).lineLimit(1) }
                DynamicIslandExpandedRegion(.trailing) { Text("\(context.state.completedSessions)/\(context.state.totalSessions)") }
                DynamicIslandExpandedRegion(.bottom) { ProgressView(value: Double(context.state.completedSessions), total: Double(max(context.state.totalSessions, 1))) }
            } compactLeading: { Image(systemName: "hands.sparkles.fill") }
            compactTrailing: { Text("\(context.state.currentSession)") }
            minimal: { Image(systemName: "hands.sparkles.fill") }
        }
    }
}

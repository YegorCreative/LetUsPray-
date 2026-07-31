import WidgetKit
import SwiftUI

@main
struct LetUsPrayWidgetBundle: WidgetBundle {
    var body: some Widget {
        PrayerJourneyWidget()
        PrayerSessionLiveActivity()
    }
}

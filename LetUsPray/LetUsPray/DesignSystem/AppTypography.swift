import SwiftUI

/// A small, semantic type scale. Body styles intentionally use the system design for reading comfort.
enum AppTypography {
    static func largeDisplay() -> Font { .system(.largeTitle, design: .rounded, weight: .bold) }
    static func screenTitle() -> Font { .system(.title, design: .rounded, weight: .bold) }
    static func sectionHeader() -> Font { .system(.headline, design: .default, weight: .semibold) }
    static func cardTitle() -> Font { .system(.headline, design: .default, weight: .semibold) }
    static func body() -> Font { .system(.body, design: .default, weight: .regular) }
    static func secondaryBody() -> Font { .system(.callout, design: .default, weight: .regular) }
    static func caption() -> Font { .system(.caption, design: .default, weight: .medium) }
    static func metadata() -> Font { .system(.footnote, design: .default, weight: .regular) }

    // Compatibility names used throughout the existing screens.
    static func largeTitle() -> Font { largeDisplay() }
    static func title() -> Font { screenTitle() }
    static func title2() -> Font { .system(.title2, design: .rounded, weight: .semibold) }
    static func headline() -> Font { cardTitle() }
    static func callout() -> Font { secondaryBody() }
    static func footnote() -> Font { metadata() }
}

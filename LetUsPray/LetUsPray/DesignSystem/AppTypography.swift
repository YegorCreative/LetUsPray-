import SwiftUI

enum AppTypography {
    static func largeTitle() -> Font {
        .system(.largeTitle, design: .rounded, weight: .bold)
    }

    static func title() -> Font {
        .system(.title, design: .rounded, weight: .bold)
    }

    static func title2() -> Font {
        .system(.title2, design: .rounded, weight: .semibold)
    }

    static func headline() -> Font {
        .system(.headline, design: .rounded, weight: .semibold)
    }

    static func body() -> Font {
        .system(.body, design: .rounded, weight: .regular)
    }

    static func callout() -> Font {
        .system(.callout, design: .rounded, weight: .medium)
    }

    static func caption() -> Font {
        .system(.caption, design: .rounded, weight: .medium)
    }

    static func footnote() -> Font {
        .system(.footnote, design: .rounded, weight: .regular)
    }
}

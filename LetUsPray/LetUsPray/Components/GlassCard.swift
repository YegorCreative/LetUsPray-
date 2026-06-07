import SwiftUI

struct GlassCard<Content: View>: View {
    private let padding: CGFloat
    @ViewBuilder private let content: Content

    init(padding: CGFloat = AppSpacing.large, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.content = content()
    }

    var body: some View {
        content
            .padding(padding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .prayerSurface()
    }
}

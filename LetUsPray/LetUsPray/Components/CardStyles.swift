import SwiftUI

/// The single, unmistakable focal point for a screen. Fills its background with a saturated
/// brand gradient instead of translucent glass so it visually outranks every other card.
struct HeroCard<Background: View, Content: View>: View {
    private let gradient: Background
    @ViewBuilder private let content: Content

    init(gradient: Background, @ViewBuilder content: () -> Content) {
        self.gradient = gradient
        self.content = content()
    }

    var body: some View {
        content
            .padding(AppSpacing.heroPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                ZStack {
                    gradient
                    LinearGradient(
                        colors: [Color.black.opacity(0.16), .clear, Color.black.opacity(0.10)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: AppSpacing.heroCornerRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.heroCornerRadius, style: .continuous)
                    .stroke(Color.white.opacity(0.22), lineWidth: 1)
            }
            .shadow(color: AppColors.shadow, radius: 26, x: 0, y: 16)
    }
}

/// A compact, secondary-weight surface for supporting stats or intros — smaller radius and
/// padding than a hero, quieter than the hero's saturated fill.
struct InfoCard<Content: View>: View {
    private let padding: CGFloat
    @ViewBuilder private let content: Content

    init(padding: CGFloat = AppSpacing.medium, @ViewBuilder content: () -> Content) {
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

/// A container for a native, grouped-list feel: one elevated surface holding many flat rows
/// separated by hairlines, instead of stacking a separate card per row.
struct GroupedCard<Content: View>: View {
    @ViewBuilder private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: { content })
            .background(
                RoundedRectangle(cornerRadius: AppSpacing.compactCornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .background(
                        RoundedRectangle(cornerRadius: AppSpacing.compactCornerRadius, style: .continuous)
                            .fill(AppColors.surface)
                    )
            )
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.compactCornerRadius, style: .continuous)
                    .stroke(AppColors.glassStroke, lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: AppSpacing.compactCornerRadius, style: .continuous))
    }
}

/// A single flat row inside a `GroupedCard`. Pass `showsDivider: false` for the last row.
struct GroupedRow<Content: View>: View {
    private let showsDivider: Bool
    @ViewBuilder private let content: Content

    init(showsDivider: Bool = true, @ViewBuilder content: () -> Content) {
        self.showsDivider = showsDivider
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
                .padding(.horizontal, AppSpacing.medium)
                .padding(.vertical, AppSpacing.small + 2)
            if showsDivider {
                Divider()
                    .padding(.leading, AppSpacing.medium + 46)
                    .opacity(0.6)
            }
        }
    }
}

/// A browsable, image-forward tile sized for a horizontal shelf (App Store / Podcasts style),
/// used so collections read as a shelf to swipe through rather than a stacked list.
struct ShelfCard<Content: View>: View {
    @ViewBuilder private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(AppSpacing.medium)
            .frame(width: AppSpacing.shelfCardWidth, alignment: .leading)
            .frame(minHeight: 168, alignment: .topLeading)
            .prayerSurface()
    }
}

/// Horizontal scrolling shelf wrapper with consistent edge bleed.
struct HorizontalShelf<Content: View>: View {
    @ViewBuilder private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: AppSpacing.medium) {
                content
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.vertical, AppSpacing.xs)
        }
        .padding(.horizontal, -AppSpacing.large)
    }
}

/// A single dock-style navigation action: icon-in-circle above a caption, no bounding square.
/// Sized and weighted individually so a row of these never reads as identical tiles.
struct DockAction: View {
    let title: String
    let systemImage: String
    let tint: Color
    var isPrimary: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: AppSpacing.xs) {
                ZStack {
                    Circle()
                        .fill(tint.opacity(isPrimary ? 1 : 0.14))
                        .frame(width: isPrimary ? 52 : 44, height: isPrimary ? 52 : 44)
                    Image(systemName: systemImage)
                        .font(.system(size: isPrimary ? 20 : 17, weight: .semibold))
                        .foregroundStyle(isPrimary ? AppColors.brightTextOnAccent : tint)
                }
                Text(title)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
    }
}

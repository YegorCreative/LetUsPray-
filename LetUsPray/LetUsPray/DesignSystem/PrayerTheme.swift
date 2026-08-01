import SwiftUI

enum PrayerTheme {
    static let pageGradient = LinearGradient(
        colors: [
            AppColors.background,
            AppColors.secondaryBackground,
            AppColors.background,
            AppColors.secondaryBackground.opacity(0.72),
            AppColors.background
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let heroGradient = BrandGradients.activityHero

    static let buttonGradient = LinearGradient(
        colors: [AppColors.accent, AppColors.electricCyan],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

enum PrayerMotion {
    static let standard = Animation.easeInOut(duration: 0.22)
    static let spring = Animation.spring(response: 0.34, dampingFraction: 0.86)
    static let reduced = Animation.linear(duration: 0.01)
}

struct PrayerBackground: View {
    var body: some View {
        ZStack {
            PrayerTheme.pageGradient
                .ignoresSafeArea()

            AppColors.background.opacity(0.12)
                .ignoresSafeArea()

            LinearGradient(
                colors: [AppColors.accent.opacity(0.16), AppColors.electricCyan.opacity(0.10), .clear],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            LinearGradient(
                colors: [.clear, AppColors.electricCyan.opacity(0.08), AppColors.accent.opacity(0.10)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(AppColors.accent.opacity(0.19))
                .frame(width: 330, height: 330)
                .blur(radius: 42)
                .offset(x: -120, y: -260)

            Circle()
                .fill(AppColors.electricCyan.opacity(0.16))
                .frame(width: 290, height: 290)
                .blur(radius: 46)
                .offset(x: 150, y: 260)

            Circle()
                .fill(AppColors.premiumGold.opacity(0.055))
                .frame(width: 220, height: 220)
                .blur(radius: 34)
                .offset(x: 130, y: -150)
        }
        .allowsHitTesting(false)
    }
}

struct PrayerSurfaceModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .background(
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .fill(AppColors.surface)
                    )
                    .overlay {
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .fill(AppColors.glassHighlight)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                            .stroke(AppColors.glassStroke, lineWidth: 1)
                    }
                    .shadow(color: AppColors.shadow, radius: 18, x: 0, y: 8)
                    .shadow(color: AppColors.accent.opacity(0.07), radius: 12, x: 0, y: 4)
            )
    }
}

extension View {
    func prayerSurface() -> some View {
        modifier(PrayerSurfaceModifier())
    }
}

enum PrayerButtonVariant {
    case primary, secondary, tertiary, destructive
}

struct PrayerButtonStyle: ButtonStyle {
    let variant: PrayerButtonVariant

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.secondaryBody())
            .fontWeight(.semibold)
            .foregroundStyle(foreground)
            .frame(minHeight: 44)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, AppSpacing.medium)
            .background(background, in: RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous)
                    .stroke(AppColors.separator, lineWidth: variant == .tertiary ? 1 : 0)
            }
            .opacity(configuration.isPressed ? 0.72 : 1)
            .animation(PrayerMotion.standard, value: configuration.isPressed)
    }

    private var foreground: Color {
        switch variant {
        case .primary: AppColors.brightTextOnAccent
        case .secondary, .tertiary: AppColors.primaryText
        case .destructive: AppColors.error
        }
    }

    private var background: some ShapeStyle {
        switch variant {
        case .primary: AnyShapeStyle(PrayerTheme.buttonGradient)
        case .secondary: AnyShapeStyle(AppColors.elevatedSurface)
        case .tertiary: AnyShapeStyle(Color.clear)
        case .destructive: AnyShapeStyle(AppColors.error.opacity(0.12))
        }
    }
}

struct PrayerIconButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 44, height: 44)
            .background(AppColors.elevatedSurface, in: Circle())
            .overlay { Circle().stroke(AppColors.separator, lineWidth: 1) }
            .opacity(configuration.isPressed ? 0.72 : 1)
    }
}

struct PrayerBadgeStyle: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(AppTypography.caption())
            .foregroundStyle(color)
            .padding(.horizontal, AppSpacing.small)
            .padding(.vertical, AppSpacing.xSmall)
            .background(color.opacity(0.12), in: Capsule())
    }
}

extension View {
    func prayerBadge(color: Color = AppColors.accent) -> some View {
        modifier(PrayerBadgeStyle(color: color))
    }
}

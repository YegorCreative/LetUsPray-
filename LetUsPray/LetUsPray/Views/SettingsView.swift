import SwiftUI

struct SettingsView: View {
    let onResetOnboarding: () -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                Text("Settings")
                    .font(AppTypography.largeTitle())
                    .foregroundStyle(AppColors.textPrimary)
                    .padding(.top, AppSpacing.small)

                appInfoSection

                settingsSection(
                    title: "Notifications",
                    items: [
                        ("Daily Prayer Reminder", "bell.badge.fill"),
                        ("Quiet Morning Prompt", "sunrise.fill")
                    ]
                )

                settingsSection(
                    title: "Appearance",
                    items: [
                        ("Prayer Theme", "circle.lefthalf.filled"),
                        ("Text Size", "textformat.size")
                    ]
                )

                resetOnboardingSection

                settingsSection(
                    title: "About",
                    items: [
                        ("Mission", "heart.text.square.fill"),
                        ("Version \(AppMetadata.version)", "info.circle.fill")
                    ]
                )
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var appInfoSection: some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            HStack(alignment: .center, spacing: AppSpacing.medium) {
                Image(systemName: "hands.sparkles.fill")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundStyle(AppColors.brightTextOnAccent)
                    .frame(width: 64, height: 64)
                    .background(BrandGradients.activityHero, in: RoundedRectangle(cornerRadius: 22, style: .continuous))

                VStack(alignment: .leading, spacing: 6) {
                    Text(AppMetadata.appName)
                        .font(AppTypography.title2())
                        .foregroundStyle(AppColors.textPrimary)

                    Text(AppMetadata.tagline)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Version \(AppMetadata.version)")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.premiumGold)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(BrandGradients.activityHero.opacity(0.18))
                .blur(radius: 18)
        )
    }

    private var resetOnboardingSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text("Onboarding")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                Button(action: onResetOnboarding) {
                    HStack(spacing: AppSpacing.medium) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(AppColors.textPrimary)
                            .frame(width: 36, height: 36)
                            .background(BrandGradients.onboardingCard, in: RoundedRectangle(cornerRadius: 13, style: .continuous))

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Reset Onboarding")
                                .font(AppTypography.body())
                                .foregroundStyle(AppColors.textPrimary)

                            Text("Show the welcome journey again on next entry.")
                                .font(AppTypography.footnote())
                                .foregroundStyle(AppColors.textSecondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(AppColors.textTertiary)
                    }
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
            }
        }
    }

    private func settingsSection(title: String, items: [(String, String)]) -> some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text(title)
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)

                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    HStack(spacing: AppSpacing.medium) {
                        Image(systemName: item.1)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(AppColors.premiumGold)
                            .frame(width: 32, height: 32)
                            .background(AppColors.cardDarkSurface.opacity(0.72), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(AppColors.glassStroke, lineWidth: 1)
                            }

                        Text(item.0)
                            .font(AppTypography.body())
                            .foregroundStyle(AppColors.textSecondary)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(AppColors.textTertiary)
                    }

                    if index < items.count - 1 {
                        Divider()
                            .overlay(AppColors.glassStroke)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(onResetOnboarding: {})
    }
}

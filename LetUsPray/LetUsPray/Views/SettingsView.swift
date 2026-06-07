import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                Text("Settings")
                    .font(AppTypography.largeTitle())
                    .foregroundStyle(AppColors.textPrimary)
                    .padding(.top, AppSpacing.small)

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

                settingsSection(
                    title: "About LetUsPray",
                    items: [
                        ("Mission", "heart.text.square.fill"),
                        ("Version 1.0", "info.circle.fill")
                    ]
                )
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
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
                            .foregroundStyle(AppColors.accent)
                            .frame(width: 32, height: 32)
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))

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
        SettingsView()
    }
}

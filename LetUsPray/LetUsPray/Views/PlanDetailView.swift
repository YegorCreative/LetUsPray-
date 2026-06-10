import SwiftUI

struct PlanDetailView: View {
    let plan: PrayerPlan
    let isActive: Bool
    let onStartJourney: () -> Void

    var body: some View {
        ZStack {
            PrayerBackground()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: AppSpacing.large) {
                    coverSection
                    metadataSection
                    actionSection
                }
                .padding(.horizontal, AppSpacing.large)
                .padding(.top, AppSpacing.medium)
                .padding(.bottom, AppSpacing.xxLarge)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var planAccent: Color {
        plan.category.brandAccent
    }

    private var coverSection: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius + 6, style: .continuous)
                .fill(plan.category.brandGradient)
                .overlay {
                    RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius + 6, style: .continuous)
                        .fill(BrandGradients.onboardingCard.opacity(0.28))
                }
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(AppColors.voltLime.opacity(0.24))
                        .frame(width: 150, height: 150)
                        .blur(radius: 24)
                        .offset(x: 46, y: -54)
                }
                .shadow(color: planAccent.opacity(0.24), radius: 28, x: 0, y: 18)

            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(plan.category.displayTitle)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textPrimary.opacity(0.86))
                            .textCase(.uppercase)

                        Text(plan.title)
                            .font(AppTypography.title())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(plan.subtitle)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Spacer()

                    Image(systemName: plan.category.brandIcon)
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                        .frame(width: 78, height: 78)
                        .background(AppColors.cardDarkSurface.opacity(0.36), in: Circle())
                        .overlay {
                            Circle()
                                .stroke(AppColors.glassStroke, lineWidth: 1)
                        }
                }

                HStack(spacing: AppSpacing.medium) {
                    metadataPill(title: "Status", value: plan.days.isEmpty ? "Preview" : "Ready")
                    metadataPill(title: "Focus", value: plan.category.displayTitle)
                }
            }
            .padding(AppSpacing.heroPadding)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .stroke(AppColors.glassStroke, lineWidth: 1)
            }
            .padding(AppSpacing.small)
        }
    }


    private var metadataSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Text(plan.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                HStack(spacing: AppSpacing.medium) {
                    metadataPill(title: "Category", value: plan.category.displayTitle)
                    metadataPill(title: "Duration", value: "\(plan.durationDays) Days")
                }
            }
        }
    }

    private var actionSection: some View {
        VStack(spacing: AppSpacing.medium) {
            if plan.days.isEmpty {
                EmptyStateView(
                    title: "Coming Soon",
                    message: "This prayer journey is being prepared with the same premium guided experience. You’ll be able to begin it in a future release.",
                    systemImage: "sparkles"
                )
            } else {
                Button(action: onStartJourney) {
                    PrimaryPrayerButton(
                        title: isActive ? "Continue Journey" : "Start Journey",
                        systemImage: isActive ? "arrow.right.circle.fill" : "play.circle.fill"
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func metadataPill(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textTertiary)
            Text(value)
                .font(AppTypography.footnote())
                .foregroundStyle(AppColors.textPrimary)
        }
        .padding(.vertical, AppSpacing.small)
        .padding(.horizontal, AppSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(AppColors.glassStroke, lineWidth: 1)
        }
    }
}

#Preview {
    NavigationStack {
        PlanDetailView(plan: ProverbsPrayerData.plan, isActive: true, onStartJourney: {})
    }
}

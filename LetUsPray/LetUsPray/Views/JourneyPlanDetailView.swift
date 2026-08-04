import SwiftUI

struct JourneyPlanDetailView: View {
    let plan: JourneyPlan

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HeroCard(gradient: plan.category.brandGradient) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        Image(systemName: plan.coverIcon)
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(AppColors.brightTextOnAccent)

                        Text(plan.title)
                            .font(AppTypography.largeDisplay())
                            .foregroundStyle(AppColors.brightTextOnAccent)

                        Text(plan.subtitle)
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.88))
                    }
                }

                Text(plan.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(4)

                if plan.days.isEmpty {
                    EmptyStateView(
                        title: "Journey Coming Soon",
                        message: "This guided devotional journey is being prepared.",
                        systemImage: plan.coverIcon
                    )
                } else {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text("Journey Days")
                            .font(AppTypography.headline())
                            .foregroundStyle(AppColors.textPrimary)

                        ForEach(plan.days) { day in
                            NavigationLink {
                                JourneyDayView(day: day)
                            } label: {
                                GlassCard(padding: AppSpacing.medium) {
                                    HStack(spacing: AppSpacing.medium) {
                                        Text("\(day.dayNumber)")
                                            .font(AppTypography.headline())
                                            .foregroundStyle(AppColors.brightTextOnAccent)
                                            .frame(width: 40, height: 40)
                                            .background(plan.category.brandAccent, in: Circle())

                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(day.title)
                                                .font(AppTypography.headline())
                                                .foregroundStyle(AppColors.textPrimary)

                                            Text(day.chapterReference)
                                                .font(AppTypography.caption())
                                                .foregroundStyle(AppColors.textTertiary)
                                        }

                                        Spacer(minLength: AppSpacing.small)

                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(plan.category.brandAccent)
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle(plan.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

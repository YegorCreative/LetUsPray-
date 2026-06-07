import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: PrayerPlanViewModel
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    let onOpenDay: (PrayerDay) -> Void

    var body: some View {
        let todayDay = viewModel.nextUnprayedDay(completedDayNumbers: completedDayNumbers)

        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                introSection
                heroCard(for: todayDay)
                journeySection(for: todayDay)
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var introSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text("LetUsPray")
                .font(AppTypography.largeTitle())
                .foregroundStyle(AppColors.textPrimary)

            Text(viewModel.todaySubtitle)
                .font(AppTypography.callout())
                .foregroundStyle(AppColors.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, AppSpacing.small)
    }

    private func heroCard(for day: PrayerDay) -> some View {
        GlassCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(viewModel.plan.title)
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.prayerGold)
                            .textCase(.uppercase)

                        Text(day.title)
                            .font(AppTypography.title())
                            .foregroundStyle(AppColors.textPrimary)

                        Text(day.chapterReference)
                            .font(AppTypography.callout())
                            .foregroundStyle(AppColors.textSecondary)
                    }

                    Spacer()

                    Image(systemName: "book.pages.fill")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundStyle(AppColors.textPrimary)
                        .padding(14)
                        .background(PrayerTheme.heroGradient, in: Circle())
                }

                Text(day.summary)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)

                HStack(spacing: AppSpacing.medium) {
                    statPill(title: "Today's Journey", value: "Day \(day.dayNumber)")
                    statPill(title: "Progress", value: viewModel.progressLabel(completedDayNumbers: completedDayNumbers))
                }

                VStack(spacing: AppSpacing.medium) {
                    Button(action: { onOpenDay(day) }) {
                        PrimaryPrayerButton(title: "Open Today's Prayer", systemImage: "arrow.right.circle.fill")
                    }
                    .buttonStyle(.plain)

                    Button(action: { toggleCompleted(dayNumber: day.dayNumber) }) {
                        PrimaryPrayerButton(
                            title: completedDayNumbers.contains(day.dayNumber) ? "Marked as Prayed" : "Mark as Prayed",
                            systemImage: completedDayNumbers.contains(day.dayNumber) ? "checkmark.circle.fill" : "checkmark.circle",
                            isSecondary: true
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(PrayerTheme.heroGradient.opacity(0.28))
                .blur(radius: 18)
        )
    }

    private func journeySection(for day: PrayerDay) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Today's Journey Day")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)

            Button(action: { onOpenDay(day) }) {
                JourneyDayCard(day: day, isCompleted: completedDayNumbers.contains(day.dayNumber))
            }
            .buttonStyle(.plain)
        }
    }

    private func statPill(title: String, value: String) -> some View {
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

    private func toggleCompleted(dayNumber: Int) {
        if completedDayNumbers.contains(dayNumber) {
            completedDayNumbers.remove(dayNumber)
        } else {
            completedDayNumbers.insert(dayNumber)
        }
    }
}

#Preview {
    TodayView(
        viewModel: PrayerPlanViewModel(),
        completedDayNumbers: .constant([]),
        savedVerseIDs: .constant([]),
        onOpenDay: { _ in }
    )
    .background(PrayerBackground())
}

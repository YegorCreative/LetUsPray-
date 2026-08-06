import SwiftUI

struct OnboardingView: View {
    let onComplete: () -> Void

    @State private var currentPage = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private let pageCount = 5
    private var isLastPage: Bool { currentPage == pageCount - 1 }

    /// Real plans, looked up read-only from the existing repositories — never mutated, never
    /// re-declared. If a title ever changes upstream, this preview follows it automatically
    /// instead of silently drifting out of sync.
    private var previewJourneyPlans: [PrayerPlan] {
        [
            ProverbsPrayerData.plan,
            JourneyPlansRepository.planByID("pray-for-missionaries")?.metadata,
            PrayerPlansRepository.allPlans.first(where: { $0.id == "anxiety-and-peace" })
        ].compactMap { $0 }
    }

    var body: some View {
        ZStack {
            PrayerBackground()

            OnboardingAtmosphere(page: currentPage)
                .animation(reduceMotion ? nil : .easeInOut(duration: 0.6), value: currentPage)

            VStack(spacing: AppSpacing.large) {
                topBar
                TabView(selection: $currentPage) {
                    OnboardingPageContent(
                        title: "Welcome to LetUsPray",
                        emphasis: nil,
                        message: "Build a daily habit of praying through God's Word.",
                        isActive: currentPage == 0,
                        topSpacerMaxHeight: 32
                    ) {
                        OnboardingHeroMedallion(systemImage: "hands.sparkles.fill")
                    }
                    .tag(0)

                    OnboardingPageContent(
                        title: "Scripture First",
                        emphasis: "Every prayer begins with Scripture.",
                        message: "Read God's Word before every guided prayer.",
                        isActive: currentPage == 1
                    ) {
                        OnboardingScripturePreview()
                    }
                    .tag(1)

                    OnboardingPageContent(
                        title: "Guided Prayer Journeys",
                        emphasis: nil,
                        message: "Journey through Proverbs, Psalms, Gratitude, Missions, The Lord's Prayer, and many more.",
                        isActive: currentPage == 2
                    ) {
                        OnboardingJourneyStackPreview(plans: previewJourneyPlans)
                    }
                    .tag(2)

                    OnboardingPageContent(
                        title: "Grow Every Day",
                        emphasis: "Prayer is not about perfection. It is about faithfully returning to God, one day at a time.",
                        message: "Track your progress, build consistency, and deepen your relationship with Christ.",
                        isActive: currentPage == 3,
                        topSpacerMaxHeight: 28
                    ) {
                        OnboardingGrowthPreview()
                    }
                    .tag(3)

                    OnboardingPageContent(
                        title: "Begin Your Journey",
                        emphasis: "Prayer doesn't have to be complicated.",
                        message: "Start with today's prayer.",
                        isActive: currentPage == 4,
                        contentSpacing: AppSpacing.small
                    ) {
                        OnboardingTodayPreview()
                    }
                    .tag(4)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut(duration: 0.28), value: currentPage)

                VStack(spacing: AppSpacing.medium) {
                    OnboardingPageIndicator(currentPage: currentPage, pageCount: pageCount)
                    Button(action: advance) {
                        PrimaryPrayerButton(
                            title: isLastPage ? "Begin Using LetUsPray" : "Next",
                            systemImage: isLastPage ? "arrow.right.circle.fill" : "chevron.right.circle.fill"
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, AppSpacing.large)
                }
            }
            .padding(.vertical, AppSpacing.large)
        }
    }

    /// No app-name label — Skip is the only thing that ever occupies this row. It keeps a fixed
    /// minimum height so the row doesn't collapse and shift the page below it when Skip itself
    /// disappears on the last page.
    private var topBar: some View {
        HStack {
            Spacer()
            if !isLastPage {
                Button("Skip") { finish() }
                    .font(AppTypography.callout())
                    .foregroundStyle(AppColors.textSecondary)
                    .accessibilityHint("Skips setup and opens LetUsPray")
            }
        }
        .frame(minHeight: 24)
        .padding(.horizontal, AppSpacing.large)
    }

    private func advance() {
        if isLastPage { finish(); return }
        withAnimation(.spring(response: 0.34, dampingFraction: 0.86)) { currentPage += 1 }
    }

    private func finish() {
        withAnimation(.easeInOut(duration: 0.28)) { onComplete() }
    }
}

#Preview { OnboardingView(onComplete: {}) }

 import SwiftUI

struct OnboardingView: View {
    let onComplete: () -> Void

    @State private var currentPage = 0

    private let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "Welcome to LetUsPray",
            subtitle: AppMetadata.tagline,
            description: "Discover guided prayer journeys inspired by God's Word.",
            systemImage: "hands.sparkles.fill",
            gradient: BrandGradients.primaryHero
        ),
        OnboardingPage(
            title: "Build a Daily Prayer Habit",
            subtitle: nil,
            description: "Track your progress, grow your streak, and stay consistent in prayer.",
            systemImage: "flame.fill",
            gradient: BrandGradients.streakCard
        ),
        OnboardingPage(
            title: "Journey Through Scripture",
            subtitle: nil,
            description: "Pray through Proverbs, Psalms, the Gospels, and future guided plans.",
            systemImage: "book.pages.fill",
            gradient: BrandGradients.planCard
        ),
        OnboardingPage(
            title: "Begin Your First Journey",
            subtitle: nil,
            description: "Start with 30 Days in Proverbs and take your first step today.",
            systemImage: "sparkles",
            gradient: BrandGradients.onboardingCard
        )
    ]

    private var isLastPage: Bool {
        currentPage == pages.count - 1
    }

    var body: some View {
        ZStack {
            PrayerBackground()

            VStack(spacing: AppSpacing.large) {
                header

                TabView(selection: $currentPage) {
                    ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                        OnboardingCard(
                            title: page.title,
                            subtitle: page.subtitle,
                            description: page.description,
                            systemImage: page.systemImage,
                            gradient: page.gradient,
                            isActive: currentPage == index
                        )
                        .padding(.horizontal, AppSpacing.large)
                        .opacity(currentPage == index ? 1 : 0.72)
                        .scaleEffect(currentPage == index ? 1 : 0.96)
                        .offset(y: currentPage == index ? 0 : 12)
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut(duration: 0.28), value: currentPage)

                VStack(spacing: AppSpacing.medium) {
                    OnboardingPageIndicator(currentPage: currentPage, pageCount: pages.count)

                    Button(action: handlePrimaryAction) {
                        PrimaryPrayerButton(
                            title: isLastPage ? "Start My Journey" : "Continue",
                            systemImage: isLastPage ? "arrow.right.circle.fill" : "chevron.right.circle.fill"
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, AppSpacing.large)
                    .scaleEffect(isLastPage ? 1.02 : 1)
                    .animation(.spring(response: 0.34, dampingFraction: 0.84), value: isLastPage)
                }
            }
            .padding(.vertical, AppSpacing.xxLarge)
        }
    }

    private var header: some View {
        VStack(spacing: AppSpacing.small) {
            Text(AppMetadata.appName)
                .font(AppTypography.largeTitle())
                .foregroundStyle(AppColors.textPrimary)

            Text("A quieter way to begin in prayer")
                .font(AppTypography.callout())
                .foregroundStyle(AppColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, AppSpacing.large)
        .transition(.opacity.combined(with: .move(edge: .top)))
    }

    private func handlePrimaryAction() {
        if isLastPage {
            withAnimation(.easeInOut(duration: 0.28)) {
                onComplete()
            }
        } else {
            withAnimation(.spring(response: 0.34, dampingFraction: 0.86)) {
                currentPage += 1
            }
        }
    }
}

private struct OnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String?
    let description: String
    let systemImage: String
    let gradient: LinearGradient
}

#Preview {
    OnboardingView(onComplete: {})
}

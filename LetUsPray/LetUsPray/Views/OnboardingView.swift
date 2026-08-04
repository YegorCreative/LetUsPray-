import SwiftUI

struct OnboardingView: View {
    let onComplete: (Set<PrayerCollectionID>) -> Void

    @State private var currentPage = 0
    @State private var interests = Set<PrayerCollectionID>()

    private let pages: [OnboardingPage] = [
        .init(title: "Welcome to LetUsPray", subtitle: AppMetadata.tagline, description: "A quiet place to meet God in prayer, one meaningful step at a time.", systemImage: "hands.sparkles.fill", gradient: BrandGradients.activityHero),
        .init(title: "A private prayer rhythm", subtitle: "Your journey belongs to you.", description: "LetUsPray keeps your progress and preferences on your device. Nothing here requires an account or a social feed.", systemImage: "lock.shield.fill", gradient: BrandGradients.planCard),
        .init(title: "Pray through a journey", subtitle: "Small, guided steps add up.", description: "Explore Scripture and practical prayer journeys at your own pace. Pause, return, and continue whenever you are ready.", systemImage: "book.pages.fill", gradient: BrandGradients.prayerProgress),
        .init(title: "What would you like to pray about?", subtitle: "Choose as many as you like.", description: "We’ll use these interests to shape your first recommendation. You can change direction anytime.", systemImage: "sparkles", gradient: BrandGradients.activityHero),
        .init(title: "A gentle reminder, when you want it", subtitle: "Always optional.", description: "Daily reminders are available in Settings. We’ll explain them before iOS asks for permission, and we never enable them automatically.", systemImage: "bell.badge.fill", gradient: BrandGradients.streakGlow),
        .init(title: "Keep prayer close", subtitle: "Widgets need no permission.", description: "Add a LetUsPray widget later to continue a journey or see your progress from the Home Screen or Lock Screen.", systemImage: "square.grid.2x2.fill", gradient: BrandGradients.planCard),
        .init(title: "Your first step", subtitle: "A recommendation made for you.", description: "Start with a focused journey, or browse every collection before you begin.", systemImage: "arrow.right.circle.fill", gradient: BrandGradients.prayerProgress)
    ]

    private var isInterestsPage: Bool { currentPage == 3 }
    private var isLastPage: Bool { currentPage == pages.count - 1 }
    private var recommendation: PrayerJourney? {
        let journeys = PrayerJourneyCatalog.collections.flatMap { collection in
            PrayerJourneyCatalog.journeys(in: collection.id, plans: PrayerPlansRepository.allPlans)
        }
        return PrayerJourneyRecommendationService.sections(
            journeys: journeys,
            completedDaysByPlan: [:],
            activePlanID: "",
            preferredCollections: interests
        ).recommended.first ?? journeys.first(where: { $0.isFeatured })
    }

    var body: some View {
        ZStack {
            PrayerBackground()
            VStack(spacing: AppSpacing.large) {
                topBar
                TabView(selection: $currentPage) {
                    ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                        pageView(page, index: index)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut(duration: 0.28), value: currentPage)

                VStack(spacing: AppSpacing.medium) {
                    OnboardingPageIndicator(currentPage: currentPage, pageCount: pages.count)
                    Button(action: advance) {
                        PrimaryPrayerButton(title: isLastPage ? "Begin My Journey" : "Continue", systemImage: isLastPage ? "arrow.right.circle.fill" : "chevron.right.circle.fill")
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, AppSpacing.large)
                }
            }
            .padding(.vertical, AppSpacing.large)
        }
    }

    private var topBar: some View {
        HStack {
            Text(AppMetadata.appName)
                .font(AppTypography.callout())
                .foregroundStyle(AppColors.textPrimary)
            Spacer()
            if currentPage > 0 && !isLastPage {
                Button("Skip") { finish() }
                    .font(AppTypography.callout())
                    .foregroundStyle(AppColors.electricCyan)
                    .accessibilityHint("Skips setup and opens LetUsPray")
            }
        }
        .padding(.horizontal, AppSpacing.large)
    }

    @ViewBuilder
    private func pageView(_ page: OnboardingPage, index: Int) -> some View {
        if isInterestsPage && index == 3 {
            InterestSelectionView(interests: $interests)
                .padding(.horizontal, AppSpacing.large)
        } else if isLastPage && index == pages.count - 1 {
            RecommendationView(journey: recommendation, hasInterests: !interests.isEmpty)
                .padding(.horizontal, AppSpacing.large)
        } else {
            OnboardingCard(title: page.title, subtitle: page.subtitle, description: page.description, systemImage: page.systemImage, gradient: page.gradient, isActive: currentPage == index)
                .padding(.horizontal, AppSpacing.large)
        }
    }

    private func advance() {
        if isLastPage { finish(); return }
        withAnimation(.spring(response: 0.34, dampingFraction: 0.86)) { currentPage += 1 }
    }

    private func finish() {
        let value = interests.map(\.rawValue).sorted().joined(separator: ",")
        UserDefaults.standard.set(value, forKey: PrayerStorageKeys.onboardingInterests)
        withAnimation(.easeInOut(duration: 0.28)) { onComplete(interests) }
    }
}

private struct InterestSelectionView: View {
    @Binding var interests: Set<PrayerCollectionID>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                Text("Choose what feels close to your heart")
                    .font(AppTypography.title())
                    .foregroundStyle(AppColors.textPrimary)
                Text("Your selections only shape recommendations. They are always editable later.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: AppSpacing.medium) {
                    ForEach(PrayerCollectionID.allCases) { collection in
                        Button {
                            if interests.contains(collection) { interests.remove(collection) } else { interests.insert(collection) }
                        } label: {
                            Label(collection.title, systemImage: collection.iconName)
                                .font(AppTypography.callout())
                                .foregroundStyle(interests.contains(collection) ? Color.white : AppColors.textPrimary)
                                .frame(maxWidth: .infinity, minHeight: 56)
                                .padding(.horizontal, 10)
                                .background(interests.contains(collection) ? AppColors.electricCyan : Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 16))
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(collection.title)
                        .accessibilityValue(interests.contains(collection) ? "Selected" : "Not selected")
                    }
                }
            }
            .padding(.vertical, AppSpacing.large)
        }
    }
}

private struct RecommendationView: View {
    let journey: PrayerJourney?
    let hasInterests: Bool

    var body: some View {
        VStack(spacing: AppSpacing.large) {
            Image(systemName: journey?.heroImageName ?? "sparkles")
                .font(.system(size: 52, weight: .medium))
                .foregroundStyle(AppColors.electricCyan)
            Text(journey?.title ?? "A journey is waiting")
                .font(AppTypography.title())
                .foregroundStyle(AppColors.textPrimary)
                .multilineTextAlignment(.center)
            Text(hasInterests ? "Recommended from the areas you selected." : "A featured starting point for your first quiet moment.")
                .font(AppTypography.body())
                .foregroundStyle(AppColors.textSecondary)
                .multilineTextAlignment(.center)
            if let journey {
                Text("\(journey.estimatedDurationDays) days · \(journey.estimatedPrayerMinutes) minutes a day")
                    .font(AppTypography.callout())
                    .foregroundStyle(AppColors.electricCyan)
            }
            Text("You can skip this and browse all collections anytime.")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accessibilityElement(children: .combine)
    }
}

private struct OnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String?
    let description: String
    let systemImage: String
    let gradient: Color
}

#Preview { OnboardingView(onComplete: { _ in }) }

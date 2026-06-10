import SwiftUI

struct OnboardingPageIndicator: View {
    let currentPage: Int
    let pageCount: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<pageCount, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? AppColors.voltLime : AppColors.glassFill)
                    .frame(width: index == currentPage ? 28 : 8, height: 8)
                    .overlay {
                        Capsule()
                            .stroke(AppColors.glassStroke.opacity(index == currentPage ? 0.8 : 0.4), lineWidth: 1)
                    }
                    .animation(.spring(response: 0.36, dampingFraction: 0.82), value: currentPage)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Onboarding page \(currentPage + 1) of \(pageCount)")
    }
}

#Preview {
    OnboardingPageIndicator(currentPage: 1, pageCount: 4)
        .padding()
        .background(PrayerBackground())
}

import SwiftUI

/// Circular progress indicator using the locked ring gradient (Guide §12): Green → Cyan → Blue.
struct ProgressRingView: View {
    var progress: Double
    var lineWidth: CGFloat = 8

    private var clampedProgress: Double {
        min(max(progress, 0), 1)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(AppColors.glassFill, lineWidth: lineWidth)

            Circle()
                .trim(from: 0, to: clampedProgress)
                .stroke(BrandGradients.ringGradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(PrayerMotion.spring, value: clampedProgress)
        }
    }
}

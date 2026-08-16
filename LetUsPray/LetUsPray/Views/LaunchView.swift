import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color(red: 0.02745, green: 0.06667, blue: 0.03922)
                .ignoresSafeArea()

            VStack(spacing: 26) {
                Image("SplashIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 172, height: 172)

                Text("LetUsPray")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.94))
            }
        }
    }
}

#Preview {
    LaunchView()
}

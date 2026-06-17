import SwiftUI

struct LaunchView: View {
    @State private var contentOpacity: Double = 0
    @State private var contentScale: CGFloat = 0.92
    @State private var glassOffset1: CGFloat = 0
    @State private var glassOffset2: CGFloat = 0
    @State private var glassOffset3: CGFloat = 0
    
    var body: some View {
        ZStack {
            // Clean ivory background
            Color(red: 0.98, green: 0.97, blue: 0.96)
                .ignoresSafeArea()
            
            // Large liquid glass element - Top Left
            Ellipse()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.45, green: 0.85, blue: 0.88).opacity(0.25),
                            Color(red: 0.35, green: 0.75, blue: 0.82).opacity(0.15)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 450, height: 500)
                .blur(radius: 40)
                .offset(x: -180, y: -320 + glassOffset1)
                .opacity(0.8)
            
            // Large liquid glass element - Right Side
            Ellipse()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.3, green: 0.65, blue: 0.95).opacity(0.22),
                            Color(red: 0.4, green: 0.75, blue: 0.92).opacity(0.12)
                        ],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    )
                )
                .frame(width: 400, height: 550)
                .blur(radius: 45)
                .offset(x: 200, y: -180 + glassOffset2)
                .opacity(0.75)
            
            // Large liquid glass element - Bottom
            Ellipse()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.38, green: 0.78, blue: 0.85).opacity(0.2),
                            Color(red: 0.32, green: 0.68, blue: 0.88).opacity(0.1)
                        ],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                )
                .frame(width: 500, height: 480)
                .blur(radius: 50)
                .offset(x: -100, y: 450 + glassOffset3)
                .opacity(0.7)
            
            // Central content
            VStack(spacing: 28) {
                // Glass icon with sparkle
                ZStack(alignment: .topTrailing) {
                    // Icon glow
                    RoundedRectangle(cornerRadius: 38, style: .continuous)
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color(red: 0.4, green: 0.82, blue: 0.86).opacity(0.4),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 20,
                                endRadius: 90
                            )
                        )
                        .frame(width: 140, height: 140)
                        .blur(radius: 20)
                    
                    // Main glass icon
                    ZStack {
                        // Background fill
                        RoundedRectangle(cornerRadius: 38, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.42, green: 0.82, blue: 0.85).opacity(0.9),
                                        Color(red: 0.38, green: 0.76, blue: 0.82).opacity(0.85)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 120, height: 120)
                        
                        // Glass refraction overlay
                        RoundedRectangle(cornerRadius: 38, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.5),
                                        Color.white.opacity(0.1),
                                        Color.clear
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .center
                                )
                            )
                            .frame(width: 120, height: 120)
                        
                        // Inner glow
                        RoundedRectangle(cornerRadius: 38, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.6),
                                        Color.white.opacity(0.2)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                            .frame(width: 120, height: 120)
                        
                        // White sparkle in center
                        Text("✦")
                            .font(.system(size: 52, weight: .medium))
                            .foregroundColor(.white)
                            .shadow(color: Color.white.opacity(0.5), radius: 8, x: 0, y: 0)
                    }
                    .shadow(color: Color(red: 0.4, green: 0.8, blue: 0.85).opacity(0.3), radius: 20, x: 0, y: 10)
                    .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 6)
                    
                    // Small yellow sparkle accent
                    Text("✦")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(red: 1.0, green: 0.88, blue: 0.2))
                        .shadow(color: Color(red: 1.0, green: 0.88, blue: 0.2).opacity(0.6), radius: 6, x: 0, y: 0)
                        .offset(x: 12, y: -8)
                }
                .frame(width: 140, height: 140)
                
                // Typography
                VStack(spacing: 10) {
                    Text("LetUsPray")
                        .font(.system(size: 44, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(red: 0.12, green: 0.28, blue: 0.48))
                        .tracking(-0.8)
                    
                    Text("Pray Through Scripture")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.38, green: 0.75, blue: 0.82))
                        .tracking(0.2)
                }
            }
            .scaleEffect(contentScale)
            .opacity(contentOpacity)
        }
        .onAppear {
            // Smooth fade and scale entrance
            withAnimation(.easeOut(duration: 0.8).delay(0.1)) {
                contentOpacity = 1.0
                contentScale = 1.0
            }
            
            // Gentle floating liquid glass motion
            withAnimation(.easeInOut(duration: 6.0).repeatForever(autoreverses: true)) {
                glassOffset1 = 30
            }
            
            withAnimation(.easeInOut(duration: 7.0).repeatForever(autoreverses: true).delay(0.5)) {
                glassOffset2 = -25
            }
            
            withAnimation(.easeInOut(duration: 6.5).repeatForever(autoreverses: true).delay(1.0)) {
                glassOffset3 = 28
            }
        }
    }
}

#Preview {
    LaunchView()
}

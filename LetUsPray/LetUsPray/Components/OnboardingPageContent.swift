import SwiftUI

// MARK: - Background atmosphere

/// An almost-invisible per-page tint, layered between the shared `PrayerBackground()` and page
/// content — never a new background color of its own, just a faint accent of light unique to
/// each page's mood (soft light from above on Welcome, a side light on Journeys, and so on). If
/// it's consciously noticeable, the opacity is tuned too high; these sit in the 0.02–0.06 range.
struct OnboardingAtmosphere: View {
    let page: Int

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            Group {
                switch page {
                case 0:
                    RadialGradient(
                        colors: [AppColors.accent.opacity(0.05), .clear],
                        center: .top,
                        startRadius: 0,
                        endRadius: size.height * 0.45
                    )
                case 1:
                    LinearGradient(
                        colors: [.clear, AppColors.accent.opacity(0.03), .clear],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                case 2:
                    LinearGradient(
                        colors: [AppColors.accentCyan.opacity(0.035), .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                case 3:
                    RadialGradient(
                        colors: [AppColors.accent.opacity(0.04), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: size.width * 0.65
                    )
                default:
                    RadialGradient(
                        colors: [AppColors.accent.opacity(0.06), .clear],
                        center: UnitPoint(x: 0.5, y: 0.6),
                        startRadius: 0,
                        endRadius: size.width * 0.6
                    )
                }
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

/// The shared onboarding page shell: a distinct visual preview above a centered title/body.
/// Deliberately card-free at the page level — a boxed card per page reads as a generic
/// onboarding template — but the `visual` slot itself is free to use real app card components
/// (`GlassCard`, `HeroCard`, `PrayerCardView`, `JourneyProgressCard`, `PrayerCalendarStrip`...),
/// so each page can preview a different real part of the product instead of repeating one
/// icon-medallion layout five times.
struct OnboardingPageContent<Visual: View>: View {
    let title: String
    let emphasis: String?
    let message: String
    let isActive: Bool
    /// Caps how far the top spacer can grow, biasing the whole composition upward instead of
    /// perfectly centering it — a smaller cap reads as a more deliberately "composed" page,
    /// closer to a top-weighted layout than a centered slide. Tuned per page at the call site.
    var topSpacerMaxHeight: CGFloat = 56
    /// Gap between the visual and the text block. Default matches the rhythm used everywhere
    /// else; pages that want their visual and text to read as one connected unit (Page 5) pass
    /// something tighter.
    var contentSpacing: CGFloat = AppSpacing.large
    @ViewBuilder let visual: () -> Visual

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
                .frame(maxHeight: topSpacerMaxHeight)

            visual()
                .scaleEffect(isActive ? 1 : 0.94)
                .opacity(isActive ? 1 : 0.55)
                .animation(reduceMotion ? nil : .spring(response: 0.5, dampingFraction: 0.82), value: isActive)
                .padding(.bottom, contentSpacing)

            textBlock
                .padding(.horizontal, AppSpacing.large)

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accessibilityElement(children: .combine)
    }

    /// Deliberate, non-uniform rhythm rather than one repeated gap: the highlight line reads as
    /// a continuation of the title (tight), while the supporting body gets a touch more room to
    /// separate it as its own thought.
    private var textBlock: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(AppTypography.title())
                .foregroundStyle(AppColors.textPrimary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            if let emphasis {
                Text(emphasis)
                    .font(AppTypography.secondaryBody())
                    .fontWeight(.semibold)
                    .foregroundStyle(AppColors.accent)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 6)
            }

            Text(message)
                .font(AppTypography.body())
                .foregroundStyle(AppColors.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, emphasis != nil ? 10 : 8)
        }
    }
}

// MARK: - Page 1: brand medallion

/// The one page that keeps the icon-medallion treatment — Page 1 is the app's brand moment, not
/// a feature preview, so it earns a distinct treatment from pages 2–5. Adds a slow, restrained
/// "breathing" scale so it feels alive without becoming a decorative animation; fully static
/// when Reduce Motion is on.
struct OnboardingHeroMedallion: View {
    let systemImage: String

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isBreathing = false

    var body: some View {
        ZStack {
            Circle()
                .fill(AppColors.accent.opacity(0.22))
                .frame(width: 200, height: 200)
                .blur(radius: 38)

            Circle()
                .fill(
                    LinearGradient(
                        colors: [AppColors.accent.opacity(0.32), AppColors.accentCyan.opacity(0.15)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 180, height: 180)
                .overlay {
                    Circle().stroke(AppColors.glassStroke, lineWidth: 1)
                }

            Image(systemName: systemImage)
                .font(.system(size: 66, weight: .semibold))
                .foregroundStyle(AppColors.accent)
        }
        .scaleEffect(isBreathing ? 1.035 : 1)
        .onAppear {
            guard !reduceMotion else { return }
            withAnimation(.easeInOut(duration: 2.6).repeatForever(autoreverses: true)) {
                isBreathing = true
            }
        }
        .accessibilityHidden(true)
    }
}

// MARK: - Page 2: Scripture card preview

/// A non-interactive preview of the real `PrayerCardView` — same component the app uses for
/// every guided Scripture reading, not a lookalike. Hit-testing is disabled so its copy/share/
/// save controls render (for visual honesty) but can't be triggered during onboarding.
struct OnboardingScripturePreview: View {
    private let sampleVerse = PrayerVerse(
        id: "onboarding-preview-scripture",
        reference: "Philippians 4:6",
        text: "Do not be anxious about anything, but in every situation, by prayer and petition, with thanksgiving, present your requests to God.",
        prayer: "Lord, quiet my anxious heart and remind me that You are near in every moment."
    )

    var body: some View {
        GlassCard(padding: AppSpacing.medium) {
            PrayerCardView(verse: sampleVerse, isSaved: false, onToggleSaved: {})
        }
        // Supplementary "floating" treatment layered on top of GlassCard's own material — not a
        // change to GlassCard itself, just this one instance reading as more elevated: a soft
        // top-edge highlight (as if catching light from above) and a wider, softer drop shadow.
        .overlay {
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .stroke(
                    LinearGradient(
                        colors: [Color.white.opacity(0.14), .clear],
                        startPoint: .top,
                        endPoint: .center
                    ),
                    lineWidth: 1
                )
        }
        .shadow(color: AppColors.shadow.opacity(0.4), radius: 30, x: 0, y: 20)
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

// MARK: - Page 3: Journey card stack preview

/// A small, self-contained preview row that mirrors the plan-card visual language used across
/// `PrayerCollectionsView` (icon-tinted square, title, duration) without depending on that
/// view's private row builders.
struct OnboardingJourneyPreviewRow: View {
    let plan: PrayerPlan

    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: plan.coverIcon)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.planAccent(named: plan.accentColorName))
                .frame(width: 42, height: 42)
                .background(AppColors.planIconGradient(named: plan.accentColorName), in: RoundedRectangle(cornerRadius: 13, style: .continuous))

            VStack(alignment: .leading, spacing: 2) {
                Text(plan.title)
                    .font(AppTypography.cardTitle())
                    .foregroundStyle(AppColors.primaryText)
                    .lineLimit(1)
                Text("\(plan.durationDays) days")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
            }

            Spacer(minLength: 0)
        }
        .padding(AppSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .prayerSurface()
        .shadow(color: AppColors.shadow.opacity(0.3), radius: 16, x: 0, y: 10)
    }
}

/// Three real journeys previewed as a stack of books rather than a plain list: each card tucks
/// visually behind the one in front of it (negative top padding pulls it upward into overlap),
/// with `zIndex` keeping the front card correctly on top. Text stays fully readable throughout —
/// only the top sliver of each back card is covered, the same way a real stack of books overlaps.
/// Saturation and the accent-tinted icon fills are untouched from the live plan-card language.
struct OnboardingJourneyStackPreview: View {
    let plans: [PrayerPlan]

    private let overlap: CGFloat = 30

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(plans.enumerated()), id: \.element.id) { index, plan in
                OnboardingJourneyPreviewRow(plan: plan)
                    .scaleEffect(1 - CGFloat(index) * 0.035)
                    .opacity(1 - Double(index) * 0.16)
                    .zIndex(Double(plans.count - index))
                    .padding(.top, index == 0 ? 0 : -overlap)
            }
        }
        .allowsHitTesting(false)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Preview of journeys: \(plans.map(\.title).joined(separator: ", "))")
    }
}

// MARK: - Page 4: Growth preview

/// Combines a real, already-presentational component — `JourneyProgressCard` (prayer progress
/// toward a plan) — with a compact calendar/streak preview built specifically for this page.
///
/// The calendar half is *not* the live `PrayerCalendarStrip`: that component's day grid is a
/// `LazyVGrid`, and `LazyVGrid` reliably renders only a partial row when hosted inside a
/// `TabView(.page)` page (confirmed by comparing against the real Today screen, where the same
/// component renders its full 2-row grid correctly — this is a hosting-context issue, not a bug
/// in the shared component, so it was left untouched). `OnboardingCalendarPreview` mirrors its
/// exact visual language — same header treatment, weekday row, day-circle/checkmark styling, and
/// card background recipe — using plain `HStack`s instead, which lay out correctly anywhere.
struct OnboardingGrowthPreview: View {
    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            JourneyProgressCard(planTitle: "31 Days in Proverbs", completedDays: 12, totalDays: 31)

            // The ring above is the hero; the calendar is supporting detail, so it recedes
            // slightly in scale and opacity rather than competing at full visual weight.
            OnboardingCalendarPreview()
                .scaleEffect(0.92, anchor: .top)
                .opacity(0.82)
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

/// A static stand-in for `PrayerCalendarStrip`, visually matched but built from plain `HStack`
/// rows. See `OnboardingGrowthPreview` for why: `LazyVGrid` mis-renders inside `TabView(.page)`.
struct OnboardingCalendarPreview: View {
    private let weekdaySymbols = ["S", "M", "T", "W", "T", "F", "S"]
    private let dayNumbers = [23, 24, 25, 26, 27, 28, 29, 30, 31, 1, 2, 3, 4, 5]
    private let completedIndices: Set<Int> = [0, 1, 2, 4, 5, 7, 8, 10, 11, 12]
    private let todayIndex = 13

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack(alignment: .firstTextBaseline) {
                Text("Prayer Calendar")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.primaryText)
                Spacer()
                Text("5 Days of Prayer")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
            }

            HStack(spacing: 4) {
                ForEach(Array(weekdaySymbols.enumerated()), id: \.offset) { _, symbol in
                    Text(symbol)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(AppColors.tertiaryText)
                        .frame(maxWidth: .infinity)
                }
            }

            VStack(spacing: 10) {
                dayRow(0..<7)
                dayRow(7..<14)
            }
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                .fill(AppColors.surface)
                .overlay {
                    RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                        .stroke(AppColors.separator, lineWidth: 1)
                }
                .shadow(color: AppColors.shadow, radius: 14, x: 0, y: 6)
        )
    }

    private func dayRow(_ range: Range<Int>) -> some View {
        HStack(spacing: 4) {
            ForEach(Array(range), id: \.self) { index in
                dayCell(index)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    private func dayCell(_ index: Int) -> some View {
        let completed = completedIndices.contains(index)
        let isToday = index == todayIndex

        return ZStack {
            if completed {
                Circle().fill(AppColors.accent).frame(width: 30, height: 30)
            }
            if isToday {
                Circle().stroke(AppColors.accent, lineWidth: 1.5).frame(width: 30, height: 30)
            }
            if completed {
                Image(systemName: "checkmark")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(AppColors.brightTextOnAccent)
            } else {
                Text("\(dayNumbers[index])")
                    .font(.system(size: 13, weight: isToday ? .semibold : .regular))
                    .foregroundStyle(AppColors.secondaryText)
            }
        }
        .frame(minHeight: 34)
    }
}

// MARK: - Page 5: Today hero preview

/// A compact, static echo of `TodayView`'s real hero card (same `HeroCard` fill, kicker/title
/// layout, and pill-button styling) so the last page shows users exactly what greets them after
/// onboarding. The CTA-styled pill is plain text, not a `Button` — no fake navigation.
struct OnboardingTodayPreview: View {
    var body: some View {
        HeroCard(gradient: AppColors.accent) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(alignment: .top, spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                        Text("TODAY'S PRAYER")
                            .font(AppTypography.caption())
                            .fontWeight(.bold)
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))

                        Text("Come As You Are")
                            .font(AppTypography.title2())
                            .foregroundStyle(AppColors.brightTextOnAccent)

                        Text("A Gentle Start")
                            .font(AppTypography.secondaryBody())
                            .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.82))
                    }

                    Spacer(minLength: AppSpacing.small)

                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(AppColors.brightTextOnAccent)
                        .frame(width: 46, height: 46)
                        .background(Color.white.opacity(0.18), in: Circle())
                }

                Text("Begin with a short, guided moment of Scripture and prayer.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.brightTextOnAccent.opacity(0.92))
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: AppSpacing.small) {
                    Text("Start Today's Prayer")
                        .font(AppTypography.callout())
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .bold))
                }
                .foregroundStyle(AppColors.accent)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.medium)
                .background(AppColors.elevatedSurface, in: RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous))
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

#Preview {
    OnboardingPageContent(
        title: "Welcome to LetUsPray",
        emphasis: nil,
        message: "Build a daily habit of praying through God's Word.",
        isActive: true
    ) {
        OnboardingHeroMedallion(systemImage: "hands.sparkles.fill")
    }
    .background(PrayerBackground())
}

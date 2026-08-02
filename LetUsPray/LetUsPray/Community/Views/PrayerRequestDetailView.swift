import SwiftUI

struct PrayerRequestDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var request: PrayerRequest
    let onChange: () -> Void

    @State private var hasPrayed = false
    @State private var isPraying = false
    @State private var showingEdit = false
    @State private var showingAnswerForm = false
    @State private var showingDeleteConfirmation = false
    @State private var showingReopenConfirmation = false
    @State private var errorMessage: String?

    private let service = PrayerWallService()

    init(request: PrayerRequest, onChange: @escaping () -> Void) {
        _request = State(initialValue: request)
        self.onChange = onChange
    }

    private var isOwnRequest: Bool {
        request.userId == SupabaseService.shared.currentUserID
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                if request.isAnswered {
                    timelineLabel("Original Request")
                }
                originalRequestCard

                if request.isAnswered {
                    timelineLabel("People Prayed")
                }
                prayerButton

                if request.isAnswered {
                    timelineLabel("God Answered")
                    answeredCard
                }

                if let errorMessage {
                    Text(errorMessage)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.error)
                }

                if isOwnRequest {
                    ownerActions
                }
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .task {
            hasPrayed = (try? await service.hasPrayed(requestID: request.id)) ?? false
        }
        .sheet(isPresented: $showingEdit) {
            NavigationStack {
                CreatePrayerRequestView(existingRequest: request) { updated in
                    request = updated
                    onChange()
                }
            }
        }
        .sheet(isPresented: $showingAnswerForm) {
            NavigationStack {
                AnswerPrayerRequestView(request: request) { updated in
                    request = updated
                    onChange()
                }
            }
        }
        .alert("Delete this prayer request?", isPresented: $showingDeleteConfirmation) {
            Button("Delete", role: .destructive) { Task { await delete() } }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This can't be undone.")
        }
        .alert("Reopen this prayer request?", isPresented: $showingReopenConfirmation) {
            Button("Reopen", role: .destructive) { Task { await reopen() } }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This clears the answer and marks the request open again.")
        }
    }

    // MARK: - Sections

    private var originalRequestCard: some View {
        InfoCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                HStack(spacing: 6) {
                    Label(request.category.displayTitle, systemImage: request.category.systemImage)
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.accent)
                    if request.visibility == .private {
                        Label("Private", systemImage: "lock.fill")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.tertiaryText)
                    }
                }

                Text(request.title)
                    .font(AppTypography.title2())
                    .foregroundStyle(AppColors.primaryText)

                Text(request.description)
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.secondaryText)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)

                Text(request.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
            }
        }
    }

    private var prayerButton: some View {
        Button {
            Task { await markPrayed() }
        } label: {
            HStack {
                Text(hasPrayed ? "🙏 You Prayed" : "🙏 I Prayed")
                    .font(AppTypography.callout())
                    .fontWeight(.semibold)
                Spacer()
                Text("\(request.prayerCount) prayed")
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.tertiaryText)
            }
            .foregroundStyle(hasPrayed ? AppColors.tertiaryText : AppColors.accent)
            .padding(.horizontal, AppSpacing.medium)
            .frame(minHeight: 44)
            .background(AppColors.elevatedSurface, in: RoundedRectangle(cornerRadius: AppSpacing.buttonCornerRadius, style: .continuous))
        }
        .buttonStyle(.plain)
        .disabled(hasPrayed || isPraying)
        .accessibilityHint(hasPrayed ? "You've already prayed for this request." : "Records that you prayed for this request.")
    }

    /// Calm, static indicator — no celebration animation, no confetti. Just a checkmark and
    /// the answer, in the same card language as the rest of the app.
    private var answeredCard: some View {
        InfoCard(padding: AppSpacing.heroPadding) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Label("Answered Prayer", systemImage: "checkmark.circle.fill")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.success)

                if let summary = request.answerSummary {
                    Text(summary)
                        .font(AppTypography.body())
                        .foregroundStyle(AppColors.primaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }

                if let details = request.answerDetails, !details.isEmpty {
                    Text(details)
                        .font(AppTypography.footnote())
                        .foregroundStyle(AppColors.secondaryText)
                        .lineSpacing(3)
                        .fixedSize(horizontal: false, vertical: true)
                }

                if let answeredAt = request.answeredAt {
                    Text(answeredAt.formatted(date: .abbreviated, time: .omitted))
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.tertiaryText)
                }

                gratitudeFooter
            }
        }
    }

    /// A quiet closing line, not a headline — smaller than the answer itself, secondary
    /// color, no accent, no icon. The testimony stays the focus; this just settles under it.
    private var gratitudeFooter: some View {
        VStack(alignment: .leading, spacing: 2) {
            Divider().opacity(0.4).padding(.top, 4)
            Text("“Give thanks to the Lord, for He is good.”")
                .font(AppTypography.footnote())
                .italic()
                .foregroundStyle(AppColors.secondaryText)
                .padding(.top, AppSpacing.xs)
            Text("— Psalm 107:1")
                .font(AppTypography.caption())
                .foregroundStyle(AppColors.tertiaryText)
        }
    }

    private func timelineLabel(_ title: String) -> some View {
        Text(title.uppercased())
            .font(.system(size: 10, weight: .bold))
            .foregroundStyle(AppColors.tertiaryText)
    }

    private var ownerActions: some View {
        HStack(spacing: AppSpacing.medium) {
            Button("Edit") { showingEdit = true }
                .buttonStyle(.bordered)

            if request.isAnswered {
                Button("Edit Answer") { showingAnswerForm = true }
                    .buttonStyle(.bordered)
                Button("Reopen") { showingReopenConfirmation = true }
                    .buttonStyle(.bordered)
            } else {
                Button("Mark as Answered") { showingAnswerForm = true }
                    .buttonStyle(.borderedProminent)
                    .tint(AppColors.accent)
            }

            Button("Delete", role: .destructive) { showingDeleteConfirmation = true }
                .buttonStyle(.bordered)
        }
    }

    // MARK: - Actions

    private func markPrayed() async {
        guard !hasPrayed else { return }
        isPraying = true
        do {
            try await service.markPrayed(requestID: request.id)
            hasPrayed = true
            request.prayerCount += 1
            onChange()
        } catch {
            errorMessage = error.localizedDescription
        }
        isPraying = false
    }

    private func reopen() async {
        do {
            try await service.reopenRequest(id: request.id)
            request.status = .open
            request.answerSummary = nil
            request.answerDetails = nil
            request.answeredAt = nil
            onChange()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func delete() async {
        do {
            try await service.deleteRequest(id: request.id)
            onChange()
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

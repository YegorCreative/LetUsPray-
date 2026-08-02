import SwiftUI

struct PrayerRequestDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var request: PrayerRequest
    let onChange: () -> Void

    @State private var hasPrayed = false
    @State private var isPraying = false
    @State private var showingEdit = false
    @State private var showingDeleteConfirmation = false
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

                prayerButton

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
        .alert("Delete this prayer request?", isPresented: $showingDeleteConfirmation) {
            Button("Delete", role: .destructive) { Task { await delete() } }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This can't be undone.")
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

    private var ownerActions: some View {
        HStack(spacing: AppSpacing.medium) {
            Button("Edit") { showingEdit = true }
                .buttonStyle(.bordered)
            Button("Delete", role: .destructive) { showingDeleteConfirmation = true }
                .buttonStyle(.bordered)
        }
    }

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

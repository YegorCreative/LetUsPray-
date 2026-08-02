import SwiftUI

/// Marks a Prayer Request answered, or edits an existing answer — the same form either way,
/// same reasoning as `CreatePrayerRequestView` doubling as its own edit form.
struct AnswerPrayerRequestView: View {
    @Environment(\.dismiss) private var dismiss

    let request: PrayerRequest
    let onSave: (PrayerRequest) -> Void

    @State private var summary: String
    @State private var details: String
    @State private var date: Date
    @State private var isSaving = false
    @State private var errorMessage: String?

    private let service = PrayerWallService()

    init(request: PrayerRequest, onSave: @escaping (PrayerRequest) -> Void) {
        self.request = request
        self.onSave = onSave
        _summary = State(initialValue: request.answerSummary ?? "")
        _details = State(initialValue: request.answerDetails ?? "")
        _date = State(initialValue: request.answeredAt ?? Date())
    }

    private var canSave: Bool {
        !summary.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        Form {
            Section("How did God answer?") {
                TextField("Answer Summary", text: $summary)
                TextField("Answer Details (optional)", text: $details, axis: .vertical)
                    .lineLimit(4...8)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }

            if let errorMessage {
                Section {
                    Text(errorMessage)
                        .foregroundStyle(AppColors.error)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(PrayerBackground())
        .navigationTitle(request.isAnswered ? "Edit Answered Prayer" : "Mark as Answered")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .confirmationAction) {
                if isSaving {
                    ProgressView()
                } else {
                    Button("Save") { Task { await save() } }
                        .disabled(!canSave)
                }
            }
        }
    }

    private func save() async {
        isSaving = true
        errorMessage = nil
        do {
            let trimmedSummary = summary.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedDetails = details.trimmingCharacters(in: .whitespacesAndNewlines)
            try await service.markAnswered(
                requestID: request.id,
                summary: trimmedSummary,
                details: trimmedDetails,
                answeredAt: date
            )

            var updated = request
            updated.status = .answered
            updated.answerSummary = trimmedSummary
            updated.answerDetails = trimmedDetails
            updated.answeredAt = date
            onSave(updated)
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
        }
        isSaving = false
    }
}

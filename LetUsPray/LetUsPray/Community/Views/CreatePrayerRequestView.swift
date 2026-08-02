import SwiftUI

/// Doubles as the edit form: pass `existingRequest` to edit in place, or `nil` to create new —
/// avoids a second, near-identical view for editing.
struct CreatePrayerRequestView: View {
    @Environment(\.dismiss) private var dismiss

    let existingRequest: PrayerRequest?
    let onSave: (PrayerRequest) -> Void

    @State private var title: String
    @State private var description: String
    @State private var category: PrayerRequestCategory
    @State private var visibility: PrayerRequestVisibility
    @State private var isAnonymous: Bool
    @State private var isSaving = false
    @State private var errorMessage: String?

    private let service = PrayerWallService()

    init(existingRequest: PrayerRequest?, onSave: @escaping (PrayerRequest) -> Void) {
        self.existingRequest = existingRequest
        self.onSave = onSave
        _title = State(initialValue: existingRequest?.title ?? "")
        _description = State(initialValue: existingRequest?.description ?? "")
        _category = State(initialValue: existingRequest?.category ?? .other)
        _visibility = State(initialValue: existingRequest?.visibility ?? .public)
        _isAnonymous = State(initialValue: existingRequest?.isAnonymous ?? false)
    }

    private var isEditing: Bool { existingRequest != nil }

    private var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        Form {
            Section("What's on your heart?") {
                TextField("Title", text: $title)
                TextField("Share as much or as little as you'd like", text: $description, axis: .vertical)
                    .lineLimit(4...8)
            }

            Section("Category") {
                Picker("Category", selection: $category) {
                    ForEach(PrayerRequestCategory.allCases) { category in
                        Label(category.displayTitle, systemImage: category.systemImage).tag(category)
                    }
                }
                .pickerStyle(.navigationLink)
            }

            Section {
                Picker("Visibility", selection: $visibility) {
                    ForEach(PrayerRequestVisibility.allCases) { Text($0.displayTitle).tag($0) }
                }
                .pickerStyle(.segmented)

                Toggle("Post anonymously", isOn: $isAnonymous)
            } footer: {
                Text("Private requests are only visible to you. Anonymous requests hide your identity from others who can see them.")
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
        .navigationTitle(isEditing ? "Edit Request" : "Share a Prayer Request")
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
            let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedDescription = description.trimmingCharacters(in: .whitespacesAndNewlines)

            if var existingRequest {
                existingRequest.title = trimmedTitle
                existingRequest.description = trimmedDescription
                existingRequest.category = category
                existingRequest.visibility = visibility
                existingRequest.isAnonymous = isAnonymous
                try await service.updateRequest(existingRequest)
                onSave(existingRequest)
            } else {
                let created = try await service.createRequest(
                    title: trimmedTitle,
                    description: trimmedDescription,
                    category: category,
                    visibility: visibility,
                    isAnonymous: isAnonymous
                )
                onSave(created)
            }
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
        }
        isSaving = false
    }
}

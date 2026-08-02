import SwiftUI

/// Version 1 of the Prayer Wall. Not a social feed: no comments, no shares, no followers,
/// no trending/ranking, no infinite scroll tricks — a calm, chronological list of requests
/// with one faith-centered action: "🙏 I Prayed."
struct PrayerWallView: View {
    private enum Scope: String, CaseIterable {
        case everyone = "Public"
        case mine = "Mine"
    }

    @State private var scope: Scope = .everyone
    @State private var publicRequests: [PrayerRequest] = []
    @State private var myRequests: [PrayerRequest] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showingCreate = false

    private let service = PrayerWallService()

    var body: some View {
        Group {
            if isLoading && requests.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage {
                EmptyStateView(title: "Couldn't load the Prayer Wall", message: errorMessage, systemImage: "wifi.slash")
            } else if requests.isEmpty {
                EmptyStateView(
                    title: scope == .mine ? "You haven't shared a prayer request yet" : "The Prayer Wall is quiet right now",
                    message: scope == .mine ? "Share what's on your heart and invite others to pray with you." : "Be the first to share something to pray for.",
                    systemImage: "hands.sparkles"
                )
            } else {
                List {
                    ForEach(requests) { request in
                        NavigationLink {
                            PrayerRequestDetailView(request: request, onChange: { refresh() })
                        } label: {
                            PrayerRequestCard(request: request)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                .refreshable { await load() }
            }
        }
        .background(PrayerBackground())
        .navigationTitle("Prayer Wall")
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Picker("Scope", selection: $scope) {
                    ForEach(Scope.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(.segmented)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    showingCreate = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Share a prayer request")
            }
        }
        .sheet(isPresented: $showingCreate) {
            NavigationStack {
                CreatePrayerRequestView(existingRequest: nil, onSave: { _ in refresh() })
            }
        }
        .task { await load() }
        .onChange(of: scope) { _, _ in
            Task { await load() }
        }
    }

    private var requests: [PrayerRequest] {
        scope == .mine ? myRequests : publicRequests
    }

    private func refresh() {
        Task { await load() }
    }

    private func load() async {
        isLoading = true
        errorMessage = nil
        do {
            switch scope {
            case .everyone:
                publicRequests = try await service.fetchPublicRequests()
            case .mine:
                myRequests = try await service.fetchMyRequests()
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

#Preview {
    NavigationStack {
        PrayerWallView()
    }
}

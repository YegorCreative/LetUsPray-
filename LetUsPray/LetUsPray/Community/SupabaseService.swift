import Foundation
import Supabase

/// Single shared Supabase client for the whole app.
///
/// CURRENT IMPLEMENTATION, NOT A FINALIZED ARCHITECTURAL DECISION:
/// `ensureSession()` uses Supabase's anonymous auth (`signInAnonymously`) to obtain the
/// `auth.uid()` that Prayer Wall's ownership model and Row Level Security policies require.
/// This was the minimal way to unblock Prayer Wall Version 1 given no sign-up/sign-in UI was
/// in that task's scope — it is a stand-in, not a chosen authentication strategy for the
/// Community platform. Docs/CommunityPlatform-Architecture.md §6 still marks the
/// authentication provider as TBD; that remains the source of truth.
///
/// TODO: Finalize the real authentication strategy (Sign in with Apple, email, or otherwise)
/// before production. Anonymous sessions have no recovery path across reinstalls/devices and
/// should not be the permanent identity model for Community features.
@MainActor
final class SupabaseService {
    static let shared = SupabaseService()

    let client: SupabaseClient

    private init() {
        client = SupabaseClient(supabaseURL: SupabaseConfig.projectURL, supabaseKey: SupabaseConfig.publishableKey)
    }

    /// Ensures an authenticated (currently: anonymous) session exists. Call before any
    /// Prayer Wall read/write that requires auth.uid(). See the type-level TODO above.
    func ensureSession() async throws {
        if client.auth.currentSession == nil {
            try await client.auth.signInAnonymously()
        }
    }

    var currentUserID: UUID? {
        client.auth.currentSession?.user.id
    }
}

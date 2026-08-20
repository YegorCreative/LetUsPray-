import AuthenticationServices
import Foundation
import Supabase

enum CloudServiceError: LocalizedError {
    case unavailable
    case notSignedIn
    case missingAppleToken

    var errorDescription: String? {
        switch self {
        case .unavailable:
            "Cloud services are unavailable. You can keep using LetUsPray on this device."
        case .notSignedIn:
            "You need to be signed in to do that."
        case .missingAppleToken:
            "Sign in with Apple could not be completed."
        }
    }
}

/// Shared Supabase client. Created only when configuration is present.
/// Does not sign in anonymously. A missing or unreachable project must not
/// prevent local prayer from working.
@MainActor
final class SupabaseService {
    static let shared = SupabaseService()

    let client: SupabaseClient?

    var currentUserID: UUID? {
        client?.auth.currentSession?.user.id
    }

    var currentSession: Session? {
        client?.auth.currentSession
    }

    var isSignedIn: Bool {
        currentSession != nil
    }

    private init() {
        if let url = SupabaseConfig.projectURL, let key = SupabaseConfig.publishableKey {
            client = SupabaseClient(
                supabaseURL: url,
                supabaseKey: key,
                options: SupabaseClientOptions(
                    auth: .init(redirectToURL: SupabaseConfig.redirectURL)
                )
            )
        } else {
            client = nil
        }
    }

    func requireClient() throws -> SupabaseClient {
        guard let client else { throw CloudServiceError.unavailable }
        return client
    }

    func requireSignedInUserID() throws -> UUID {
        guard let currentUserID else { throw CloudServiceError.notSignedIn }
        return currentUserID
    }

    /// Restores a previously saved session if one exists. Never creates an anonymous session.
    func restoreSession() async {
        guard let client else { return }
        _ = try? await client.auth.session
    }

    func signInWithApple(idToken: String, nonce: String?) async throws {
        let client = try requireClient()
        _ = try await client.auth.signInWithIdToken(
            credentials: OpenIDConnectCredentials(
                provider: .apple,
                idToken: idToken,
                nonce: nonce
            )
        )
    }

    func signInWithGoogle() async throws {
        let client = try requireClient()
        _ = try await client.auth.signInWithOAuth(
            provider: .google,
            redirectTo: SupabaseConfig.redirectURL
        ) { session in
            session.prefersEphemeralWebBrowserSession = true
        }
    }

    func signOut() async throws {
        let client = try requireClient()
        try await client.auth.signOut()
    }

    func handleRedirect(_ url: URL) async {
        guard let client, url.scheme == SupabaseConfig.redirectURL.scheme else { return }
        _ = try? await client.auth.session(from: url)
    }
}

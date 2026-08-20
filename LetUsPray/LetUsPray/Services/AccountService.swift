import AuthenticationServices
import Combine
import CryptoKit
import Foundation
import Supabase

/// Optional account state. Sign-in is user-initiated; guests keep using local prayer.
@MainActor
final class AccountService: ObservableObject {
    static let shared = AccountService()

    @Published private(set) var session: Session?
    @Published private(set) var isBusy = false
    @Published var lastErrorMessage: String?

    private var appleNonce: String?
    private var didStart = false
    private var authListenerTask: Task<Void, Never>?

    var isSignedIn: Bool { session != nil }

    var identityLabel: String {
        if let email = session?.user.email, !email.isEmpty {
            return email
        }
        if session != nil {
            return "Signed in"
        }
        return "Not signed in"
    }

    private init() {}

    func start() async {
        guard !didStart else { return }
        didStart = true
        await SupabaseService.shared.restoreSession()
        session = SupabaseService.shared.currentSession
        listenForAuthChanges()
        if isSignedIn {
            await PrayerSyncService.shared.synchronize()
        }
    }

    func prepareAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        let nonce = Self.randomNonce()
        appleNonce = nonce
        request.requestedScopes = [.email]
        request.nonce = Self.sha256(nonce)
    }

    func completeAppleSignIn(_ result: Result<ASAuthorization, Error>) async {
        switch result {
        case .failure(let error):
            if isCancellation(error) { return }
            lastErrorMessage = error.localizedDescription
        case .success(let authorization):
            await signInWithApple(authorization)
        }
    }

    func signInWithGoogle() async {
        guard !isBusy else { return }
        isBusy = true
        lastErrorMessage = nil
        defer { isBusy = false }

        do {
            try await SupabaseService.shared.signInWithGoogle()
            session = SupabaseService.shared.currentSession
            await PrayerSyncService.shared.synchronize()
        } catch {
            if isCancellation(error) { return }
            lastErrorMessage = mappedErrorMessage(error)
        }
    }

    func signOut() async {
        guard !isBusy else { return }
        isBusy = true
        lastErrorMessage = nil
        defer { isBusy = false }

        do {
            try await SupabaseService.shared.signOut()
            session = nil
            PrayerSyncService.shared.clearCloudStatus()
        } catch {
            lastErrorMessage = mappedErrorMessage(error)
        }
    }

    private func signInWithApple(_ authorization: ASAuthorization) async {
        guard !isBusy else { return }
        isBusy = true
        lastErrorMessage = nil
        defer {
            isBusy = false
            appleNonce = nil
        }

        do {
            guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
                  let tokenData = credential.identityToken,
                  let idToken = String(data: tokenData, encoding: .utf8) else {
                throw CloudServiceError.missingAppleToken
            }

            try await SupabaseService.shared.signInWithApple(idToken: idToken, nonce: appleNonce)
            session = SupabaseService.shared.currentSession
            await PrayerSyncService.shared.synchronize()
        } catch {
            if isCancellation(error) { return }
            lastErrorMessage = mappedErrorMessage(error)
        }
    }

    private func listenForAuthChanges() {
        authListenerTask?.cancel()
        guard let client = SupabaseService.shared.client else { return }

        authListenerTask = Task { [weak self] in
            for await (event, session) in client.auth.authStateChanges {
                guard !Task.isCancelled else { return }
                self?.session = session
                if event == .signedOut {
                    PrayerSyncService.shared.clearCloudStatus()
                }
            }
        }
    }

    private func mappedErrorMessage(_ error: Error) -> String {
        if error is CloudServiceError {
            return error.localizedDescription
        }
        return CloudServiceError.unavailable.localizedDescription
    }

    private func isCancellation(_ error: Error) -> Bool {
        if error is CancellationError { return true }
        let nsError = error as NSError
        if nsError.domain == ASAuthorizationError.errorDomain,
           nsError.code == ASAuthorizationError.canceled.rawValue {
            return true
        }
        if nsError.domain == ASWebAuthenticationSessionError.errorDomain,
           nsError.code == ASWebAuthenticationSessionError.canceledLogin.rawValue {
            return true
        }
        return false
    }

    private static func randomNonce(length: Int = 32) -> String {
        let charset = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        result.reserveCapacity(length)
        while result.count < length {
            var bytes = [UInt8](repeating: 0, count: 16)
            let status = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
            if status != errSecSuccess {
                bytes = (0..<16).map { _ in UInt8.random(in: 0...255) }
            }
            for byte in bytes where result.count < length {
                result.append(charset[Int(byte) % charset.count])
            }
        }
        return result
    }

    private static func sha256(_ value: String) -> String {
        let digest = SHA256.hash(data: Data(value.utf8))
        return digest.map { String(format: "%02x", $0) }.joined()
    }
}

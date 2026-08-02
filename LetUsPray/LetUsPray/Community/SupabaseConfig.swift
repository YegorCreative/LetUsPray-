import Foundation

/// Supabase project credentials for the Community platform backend (see
/// Docs/CommunityPlatform-Architecture.md). Values live in Config/Supabase.xcconfig, not here —
/// this only reads what Xcode's auto-generated Info.plist exposes from that build config.
/// The publishable/anon key is designed by Supabase to be safe inside a client app — unlike a
/// service_role key, which must never appear here.
enum SupabaseConfig {
    static let projectURL: URL = {
        guard let host = Bundle.main.object(forInfoDictionaryKey: "SupabaseProjectHost") as? String,
              !host.isEmpty,
              let url = URL(string: "https://\(host)") else {
            fatalError("Missing or invalid SupabaseProjectHost in Info.plist — check Config/Supabase.xcconfig.")
        }
        return url
    }()

    static let publishableKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "SupabasePublishableKey") as? String,
              !key.isEmpty else {
            fatalError("Missing SupabasePublishableKey in Info.plist — check Config/Supabase.xcconfig.")
        }
        return key
    }()
}

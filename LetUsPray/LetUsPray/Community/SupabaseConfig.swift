import Foundation

/// Client-side Supabase configuration. Values come from `Config/Supabase.xcconfig`
/// via Info.plist substitution. Missing or unsubstituted values must not crash the app —
/// guest/local prayer has to keep working.
enum SupabaseConfig {
    static let redirectURL = URL(string: "com.letuspray.app://auth-callback")!

    static var projectURL: URL? {
        guard let host = sanitizedInfoValue("SupabaseProjectHost"),
              let url = URL(string: "https://\(host)") else {
            return nil
        }
        return url
    }

    static var publishableKey: String? {
        sanitizedInfoValue("SupabasePublishableKey")
    }

    static var isConfigured: Bool {
        projectURL != nil && publishableKey != nil
    }

    private static func sanitizedInfoValue(_ key: String) -> String? {
        guard let raw = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            return nil
        }
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty || trimmed.contains("$(") || trimmed.hasPrefix("$") {
            return nil
        }
        return trimmed
    }
}

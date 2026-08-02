//
//  LetUsPrayApp.swift
//  LetUsPray
//
//  Created by Yegor Hambaryan on 6/5/26.
//

/// The main entry point for the Let Us Pray application.
/// This file sets up the application's initial structure and window configuration.
import AppIntents
import SwiftUI

@main
struct LetUsPrayApp: App {
    /// Defines the scene that represents the application's user interface.
    /// Configures a single window group that displays the main content view.
    ///
    /// Appearance is applied inside `ContentView` (a `View`), not here. `@AppStorage` on an
    /// `App` conformer does not reliably re-trigger a `Scene` body re-evaluation when the
    /// value changes from elsewhere in the running app — confirmed by testing: a fresh
    /// launch respected a changed value, but the already-running app did not update live
    /// when the App struct owned this modifier. `ContentView` already has ~16 other
    /// `@AppStorage` properties with proven-working live reactivity throughout this codebase,
    /// so moving the modifier there uses the same, already-trusted mechanism.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

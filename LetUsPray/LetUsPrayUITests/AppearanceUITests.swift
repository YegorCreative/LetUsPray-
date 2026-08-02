import XCTest

/// Drives a real, OS-injected tap on the Settings Appearance segmented control and captures
/// a screenshot immediately after each tap, so the resulting evidence shows what the running
/// app actually rendered in response to user input — not what the source code implies it does.
final class AppearanceUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testTappingAppearanceSegmentsChangesUIImmediately() throws {
        let app = XCUIApplication()
        app.launch()

        let settingsTab = app.tabBars.buttons["Settings"]
        XCTAssertTrue(settingsTab.waitForExistence(timeout: 10), "Settings tab not found after launch")
        settingsTab.tap()

        attach(app, name: "01-settings-before-any-tap")

        let darkSegment = app.segmentedControls.buttons["Dark"]
        XCTAssertTrue(darkSegment.waitForExistence(timeout: 5), "Dark segment not found")
        darkSegment.tap()
        attach(app, name: "02-immediately-after-tap-Dark")

        let lightSegment = app.segmentedControls.buttons["Light"]
        XCTAssertTrue(lightSegment.waitForExistence(timeout: 5), "Light segment not found")
        lightSegment.tap()
        attach(app, name: "03-immediately-after-tap-Light")

        let systemSegment = app.segmentedControls.buttons["System"]
        XCTAssertTrue(systemSegment.waitForExistence(timeout: 5), "System segment not found")
        systemSegment.tap()
        attach(app, name: "04-immediately-after-tap-System")
    }

    private func attach(_ app: XCUIApplication, name: String) {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

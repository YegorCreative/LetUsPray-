import XCTest

final class FinalPolishScreenshotTests: XCTestCase {
    @MainActor
    func testCaptureAllFivePages() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-hasCompletedOnboarding", "NO"]
        app.launch()

        Thread.sleep(forTimeInterval: 1)
        attach(app.screenshot(), name: "page-1")

        let nextButton = app.buttons["Next"]
        let pageNames = ["page-2", "page-3", "page-4", "page-5"]
        for name in pageNames {
            XCTAssertTrue(nextButton.waitForExistence(timeout: 5))
            nextButton.tap()
            Thread.sleep(forTimeInterval: 1.0)
            attach(app.screenshot(), name: name)
        }

        XCTAssertFalse(app.buttons["Skip"].exists)
        let beginButton = app.buttons["Begin Using LetUsPray"]
        XCTAssertTrue(beginButton.waitForExistence(timeout: 5))
        beginButton.tap()

        let plansTab = app.tabBars.buttons["Plans"]
        XCTAssertTrue(plansTab.waitForExistence(timeout: 10))
    }

    @MainActor
    private func attach(_ screenshot: XCUIScreenshot, name: String) {
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

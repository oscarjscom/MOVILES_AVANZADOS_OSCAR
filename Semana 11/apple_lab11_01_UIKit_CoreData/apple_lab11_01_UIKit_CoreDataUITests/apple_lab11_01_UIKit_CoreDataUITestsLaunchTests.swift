//
//  apple_lab11_01_UIKit_CoreDataUITestsLaunchTests.swift
//  apple_lab11_01_UIKit_CoreDataUITests
//
//  Created by oscarolano15@gmail.com on 5/11/26.
//

import XCTest

final class apple_lab11_01_UIKit_CoreDataUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

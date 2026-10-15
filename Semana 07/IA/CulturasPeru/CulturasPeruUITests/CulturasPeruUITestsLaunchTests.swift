//
//  CulturasPeruUITestsLaunchTests.swift
//  CulturasPeruUITests
//
//  Created by oscarolano15@gmail.com on 13/10/26.
//

import XCTest

final class CulturasPeruUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

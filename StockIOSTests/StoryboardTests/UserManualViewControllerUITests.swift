//
//  UserManualViewControllerUITests.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

import Foundation
import XCTest

final class UserManualViewControllerUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testNavigatesToUserManualScreen() {
        let manualButton = app.buttons["userManualButton"]
        XCTAssertTrue(manualButton.waitForExistence(timeout: 3))
        manualButton.tap()

        let manualTitle = app.staticTexts["User Manual"]
        XCTAssertTrue(manualTitle.waitForExistence(timeout: 3), "Nie znaleziono tekstu 'User Manual'")
    }
}

//
//  MenuViewControllerUITests.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

import Foundation
import XCTest

final class MenuViewControllerUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testThemeSwitchExists() {
        let themeSwitch = app.switches["themeSwitch"]
        XCTAssertTrue(themeSwitch.exists)
    }

    func testNavigationToStockSymbols() {
        let stockSymbolsButton = app.buttons["stockSymbolsButton"]
        XCTAssertTrue(stockSymbolsButton.exists)
        stockSymbolsButton.tap()

        let symbolsTable = app.tables["SymbolsTable"]
        XCTAssertTrue(symbolsTable.waitForExistence(timeout: 2))
    }
}

//
//  StockSymbolsViewControllerUITests.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

@testable import StockIOS
import Foundation
import XCTest

final class StockSymbolsViewControllerUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testNavigationToStockSymbolsViewController() {
        let stockSymbolsButton = app.buttons["stockSymbolsButton"]
        XCTAssertTrue(stockSymbolsButton.exists, "Przycisk Stock Symbols nie istnieje")

        stockSymbolsButton.tap()

        let table = app.tables["SymbolsTable"]
        XCTAssertTrue(table.waitForExistence(timeout: 3), "Tabela nie pojawiła się")
    }
}

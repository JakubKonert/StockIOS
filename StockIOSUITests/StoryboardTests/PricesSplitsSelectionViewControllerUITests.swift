//
//  PricesSplitsSelectionViewControllerUITests.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

@testable import StockIOS
import Foundation
import XCTest

final class PricesSplitsSelectionViewControllerUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testFlowToPricesSplitsSelectionScreen() {
        let stockSymbolsButton = app.buttons["stockSymbolsButton"]
        XCTAssertTrue(stockSymbolsButton.waitForExistence(timeout: 3))
        stockSymbolsButton.tap()

        let symbolsTable = app.tables["SymbolsTable"]
        XCTAssertTrue(symbolsTable.waitForExistence(timeout: 3))

        let firstCell = symbolsTable.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3))
        firstCell.tap()

        let stockPricesButton = app.buttons["stockPricesButton"]
        let stockSplitsButton = app.buttons["stockSplitsButton"]

        XCTAssertTrue(stockPricesButton.waitForExistence(timeout: 3), "Nie znaleziono przycisku Stock Prices")
        XCTAssertTrue(stockSplitsButton.exists, "Nie znaleziono przycisku Stock Splits")
    }
}

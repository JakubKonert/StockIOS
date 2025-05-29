//
//  StockSymbolsTableViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//
@testable import StockIOS
import Foundation
import XCTest
import UIKit

final class StockSymbolsTableViewControllerTests: XCTestCase {

    class MockViewModel: StockSymbolsViewModel {
        override var stockSymbols: [StockSymbolViewModel] {
            return [
                StockSymbolViewModel(stockSymbol: StockSymbolResponse(trading_symbol: "AAPL", registrant_name: "Apple")),
                StockSymbolViewModel(stockSymbol: StockSymbolResponse(trading_symbol: "TSLA", registrant_name: "Tesla"))
            ]
        }
    }

    func testNumberOfRowsMatchesViewModel() {
        let controller = StockSymbolsTableViewController()
        controller.loadViewIfNeeded()
        
        controller.setValue(MockViewModel(), forKey: "vm")

        let rowCount = controller.tableView(controller.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 2)
    }

    func testCellContentConfiguration() {
        let controller = StockSymbolsTableViewController()
        controller.loadViewIfNeeded()

        controller.setValue(MockViewModel(), forKey: "vm")
        controller.tableView.reloadData()

        let indexPath = IndexPath(row: 0, section: 0)
        let cell = controller.tableView(controller.tableView, cellForRowAt: indexPath)

        let config = cell.contentConfiguration as? UIListContentConfiguration
        XCTAssertEqual(config?.text, "AAPL")
        XCTAssertEqual(config?.secondaryText, "Apple")
    }
}

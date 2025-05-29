//
//  StockSymbolsViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//
@testable import StockIOS
import Foundation
import XCTest

final class StockSymbolsViewControllerTests: XCTestCase {

    func testViewLoads() {
        let vc = StockSymbolsViewController()
        XCTAssertNotNil(vc.view)
    }

    func testEmbeddingChildTableViewController() {
        let vc = StockSymbolsViewController()
        _ = vc.view

        let child = vc.children.first
        XCTAssertTrue(child is StockSymbolsTableViewController)
    }
}

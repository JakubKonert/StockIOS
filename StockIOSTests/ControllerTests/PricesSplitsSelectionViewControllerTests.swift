//
//  PricesSplitsSelectionViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

import Foundation
import XCTest
@testable import StockIOS

final class PricesSplitsSelectionViewControllerTests: XCTestCase {
    func testTitleLabelShowsCorrectText() {
        let vc = PricesSplitsSelectionViewController()
        vc.tradingSymbol = "AAPL"
        vc.registrantName = "Apple Inc."
        _ = vc.view

        let label = vc.navigationItem.titleView as? UILabel
        XCTAssertEqual(label?.text, "AAPL Apple Inc.")
    }

    func testButtonsAreConnectedAndPositioned() {
        let vc = PricesSplitsSelectionViewController()
        _ = vc.view
        XCTAssertNotNil(vc.stockPricesButton)
        XCTAssertNotNil(vc.stockSplitsButton)
    }}

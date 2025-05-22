//
//  StockSplitsViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

import Foundation
import XCTest
@testable import StockIOS

final class StockSplitsViewControllerTests: XCTestCase {

    func testViewLoads() {
        let vc = StockSplitsViewController()
        XCTAssertNotNil(vc.view)
    }

    func testClassType() {
        let vc = StockSplitsViewController()
        XCTAssertTrue(vc is BaseViewController)
    }
}

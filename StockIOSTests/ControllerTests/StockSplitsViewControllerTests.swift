//
//  StockSplitsViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

@testable import StockIOS
import Foundation
import XCTest


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

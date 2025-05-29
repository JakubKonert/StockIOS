//
//  StockPricesViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

@testable import StockIOS
import Foundation
import XCTest


final class StockPricesViewControllerTests: XCTestCase {

    func testViewLoads() {
        let vc = StockPricesViewController()
        XCTAssertNotNil(vc.view)
    }

    func testViewControllerIsSubclassOfBase() {
        let vc = StockPricesViewController()
        XCTAssertTrue(vc is BaseViewController)
    }
}

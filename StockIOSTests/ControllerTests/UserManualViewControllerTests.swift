//
//  UserManualViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//
@testable import StockIOS
import Foundation
import XCTest


final class UserManualViewControllerTests: XCTestCase {

    func testViewLoadsWithoutCrashing() {
        let vc = UserManualViewController()
        XCTAssertNotNil(vc.view)
    }

    func testInheritance() {
        let vc = UserManualViewController()
        XCTAssertTrue(vc is BaseViewController)
    }
}

//
//  MenuViewControllerTests.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

import Foundation
import XCTest
@testable import StockIOS

final class MenuViewControllerTests: XCTestCase {

    func testThemeSwitchChangesStyleToDark() {
        let vc = MenuViewController()
        _ = vc.view
        vc.themeSwitch.isOn = false
        vc.changeTheme(vc.themeSwitch)
        XCTAssertEqual(vc.overrideUserInterfaceStyle, .dark)
    }

    func testThemeSwitchChangesStyleToLight() {
        let vc = MenuViewController()
        _ = vc.view
        vc.themeSwitch.isOn = true
        vc.changeTheme(vc.themeSwitch)
        XCTAssertEqual(vc.overrideUserInterfaceStyle, .light)
    }
}

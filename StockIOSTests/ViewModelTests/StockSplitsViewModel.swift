//
//  StockSplitsViewModel.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

import XCTest
import Foundation
@testable import StockIOS

final class StockSplitsViewModelTests: XCTestCase {

    func testStockSplitViewModelMapping() {
        let response = StockSplitResponse(
            trading_symbol: "NVDA",
            central_index_key: "00007890",
            registrant_name: "NVIDIA Corp.",
            execution_date: "2023-12-15",
            multiplier: 2.0
        )

        let viewModel = StockSplitViewModel(stockSplit: response)

        XCTAssertEqual(viewModel.tradingSymbol, "NVDA")
        XCTAssertEqual(viewModel.centralIndexKey, "00007890")
        XCTAssertEqual(viewModel.registrantName, "NVIDIA Corp.")
        XCTAssertEqual(viewModel.executionDate, "2023-12-15")
        XCTAssertEqual(viewModel.multipier, 2.0)
    }

    func testPopulateStockSplitsLoadsData() async {
        let mockService = WebServiceMock()
        let viewModel = StockSplitsViewModel(webService: mockService)

        await viewModel.populateStockSplits(url: "mock-url", apiKey: "mock-key", identifier: "MOCK")

        XCTAssertEqual(viewModel.stockSplits.count, 1)
        XCTAssertEqual(viewModel.stockSplits.first?.tradingSymbol, "GOOG")
    }

}


    



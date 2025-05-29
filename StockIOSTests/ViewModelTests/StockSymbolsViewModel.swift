//
//  StockSymbolsViewModel.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

@testable import StockIOS
import Foundation
import XCTest



final class StockSymbolsViewModelTests: XCTestCase{
    
    func testStockSymbolViewModelMapping() {
        let response = StockSymbolResponse(trading_symbol: "MSFT", registrant_name: "Microsoft Corp.")
        let viewModel = StockSymbolViewModel(stockSymbol: response)

        XCTAssertEqual(viewModel.tradingSymbol, "MSFT")
        XCTAssertEqual(viewModel.registrantName, "Microsoft Corp.")
    }

    func testPopulateStockSymbolsLoadsData() async {
        let mockService = WebServiceMock()
        let viewModel = StockSymbolsViewModel(webService: mockService)

        await viewModel.populateStockSymbols(url: "mock-url", apiKey: "mock-key")

        XCTAssertEqual(viewModel.stockSymbols.count, 1)
        XCTAssertEqual(viewModel.stockSymbols.first?.tradingSymbol, "AAPL")
    }
}

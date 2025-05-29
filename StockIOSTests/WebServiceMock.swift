//
//  WebServiceMock.swift
//  StockIOSTests
//
//  Created by student on 22/05/2025.
//

@testable import StockIOS
import XCTest
import Foundation


class WebServiceMock: WebServiceProtocol {
    func getStockPrices(url: String, apiKey: String, identifier: String) async throws -> [StockPriceResponse] {
        return []
    }
    
    func getStockSymbols(url: String, apiKey: String) async throws -> [StockSymbolResponse] {
        return [
            StockSymbolResponse(trading_symbol:"TEST", registrant_name:"MOCK")]
    }
    
    func getStockSplits(url: String, apiKey: String, identifier: String) async throws -> [StockSplitResponse] {
        return [
            StockSplitResponse(trading_symbol:"TEST", central_index_key:"TEST", registrant_name:"MOCK", execution_date:"22/05/2025", multiplier:2.0)]
    }
}

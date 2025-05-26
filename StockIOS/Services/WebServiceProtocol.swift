//
//  WebServiceProtocol.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

import Foundation

protocol WebServiceProtocol{
    func getStockSymbols(url:String, apiKey:String) async throws -> [StockSymbolResponse]
    func getStockSplits(url: String, apiKey:String, identifier: String) async throws -> [StockSplitResponse]
    func getStockPrices(url: String, apiKey: String, identifier: String) async throws -> [StockPriceResponse]
}

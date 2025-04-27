//
//  StockSymbolResponse.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation

struct StockSymbolResponse: Decodable {
    let trading_symbol : String
    let registrant_name : String
}

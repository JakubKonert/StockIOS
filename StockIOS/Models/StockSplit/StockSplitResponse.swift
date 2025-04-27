//
//  StockSplitResponse.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation

struct StockSplitResponse : Decodable {
    let trading_symbol: String
    let central_index_key: String //because we have leading zero
    let registrant_name: String
    let execution_date: String
    let multiplier: Double
}

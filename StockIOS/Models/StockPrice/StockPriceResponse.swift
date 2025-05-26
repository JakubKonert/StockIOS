//
//  StockPriceResponse.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation

struct StockPriceResponse : Decodable {
    let trading_symbol : String
    let date : String
    let open : Double
    let high : Double
    let low : Double
    let close : Double
    let volume : Double
}

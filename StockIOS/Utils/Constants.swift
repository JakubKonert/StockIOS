//
//  Constants.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let stockSymbolsUrl = "https://financialdata.net/api/v1/stock-symbols"
        static let stockPricesUrl = "https://financialdata.net/api/v1/stock-prices"
        static let stockSplitsUrl = "https://financialdata.net/api/v1/stock-splits"
    }
    
    struct APIcredentials {
        static let apiKey = "?key=3431a17e471b5fefb4741fd5cfdcbe66" // apiKey for StockSymbols
        static let apiKeyForQueryParams = "&key=3431a17e471b5fefb4741fd5cfdcbe66" // apiKey for StockPrices and StockSplits (used with other query params)
    }
    
    struct UrlParams{
        static let identifier = "?identifier="
        static let offset = "?offset="
    }
    
    static let userManual = "Select a stock from a list of Stock Symbols to navigate to details page. There, you can choose to display either Stock Splits or Stock Prices history. "
    
    
}

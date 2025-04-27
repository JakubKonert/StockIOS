//
//  StockSplitsViewModel.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation

class StockSplitsViewModel {
    
    private(set) var stockSplits: [StockSplitViewModel] = []
    
    func populateStockSplits(url: String, apiKey: String, identifier: String)
    async {
        do {
           let stockSplits = try await
            WebService().getStockSplits(url: url, apiKey: apiKey, identifier: identifier)
            self.stockSplits =
            stockSplits.map(StockSplitViewModel.init)
        }
        catch{
            print(error)
        }
    }
    
}

struct StockSplitViewModel {
    
    private let stockSplit: StockSplitResponse
    
    init(stockSplit: StockSplitResponse){
        self.stockSplit = stockSplit
    }
    
    var tradingSymbol: String {
        stockSplit.trading_symbol
    }
    
    var centralIndexKey: String {
        stockSplit.central_index_key
    }
    
    var registrantName: String {
        stockSplit.registrant_name
    }
    
    var executionDate: String {
        stockSplit.execution_date
    }
    
    var multipier: Double {
        stockSplit.multiplier
    }
    
}

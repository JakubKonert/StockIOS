//
//  StockSymbolsViewModel.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

class StockSymbolsViewModel {
    
    private(set) var stockSymbols: [StockSymbolViewModel] = []
    
    func populateStockSymbols(url: String, apiKey: String) async {
        do {
            let stockSymbols = try await WebService().getStockSymbols(url: url, apiKey: apiKey)
            self.stockSymbols = stockSymbols.map(StockSymbolViewModel.init)
        }
        catch{
            print(error)
        }
    }
}

struct StockSymbolViewModel {
    
    private let stockSymbol: StockSymbolResponse
    
    init(stockSymbol: StockSymbolResponse){
        self.stockSymbol = stockSymbol
    }
    
    var tradingSymbol: String {
        stockSymbol.trading_symbol
    }
    
    var registrantName: String {
        stockSymbol.registrant_name
    }
    
}

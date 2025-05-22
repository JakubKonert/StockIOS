//
//  StockSymbolsViewModel.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

class StockSymbolsViewModel {
    
    private let webService: WebServiceProtocol
    private(set) var stockSymbols: [StockSymbolViewModel] = []
    
    init(webService:WebServiceProtocol = WebService()){
        self.webService = webService
    }
    
    func populateStockSymbols(url: String, apiKey: String) async {
        do {
            let stockSymbols = try await webService.getStockSymbols(url: url, apiKey: apiKey)
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

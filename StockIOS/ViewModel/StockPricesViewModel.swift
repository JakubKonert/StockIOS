//
//  StockPricesViewModel.swift
//  StockIOS
//
//  Created by Weronika Redlinska on 22/05/2025.
//
import Foundation

class StockPricesViewModel {
    
    private let webService: WebServiceProtocol
    private(set) var stockPrices: [StockPriceViewModel] = []
    
    init(webService:WebServiceProtocol = WebService()){
        self.webService = webService
    }
    
    func populateStockPrices(url: String, apiKey: String, identifier: String)
    async{
        do {
            let stockPrices = try await
                webService.getStockPrices(url: url, apiKey: apiKey, identifier: identifier)
            self.stockPrices =
            stockPrices.map(StockPriceViewModel.init)
            
        }
        catch{
            print(error)
        }
    }
}

struct StockPriceViewModel {
    
    private let stockPrice: StockPriceResponse
    
    init(stockPrice: StockPriceResponse){
        self.stockPrice = stockPrice
    }
    
    var trading_symbol: String {
        stockPrice.tradingSymbol
    }
    
    var date: String{
        stockPrice.date
    }
    
    var open: Double{
        stockPrice.open
    }
    
    var high: Double {
        stockPrice.high
    }
    
    var low: Double{
        stockPrice.low
    }
    
    var close: Double{
        stockPrice.close
    }
    
    var voulme: Double{
        stockPrice.volume
    }
}

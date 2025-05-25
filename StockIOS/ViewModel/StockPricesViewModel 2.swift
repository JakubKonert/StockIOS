
import Foundation

class StockPricesViewModel {
    
    private let webService: WebServiceProtocol
    private(set) var stockPrices: [StockPriceViewModel] = []
    
    init(webService:WebServiceProtocol = WebService()){
        self.webService = webService
    }
    
    func populateStockPrices(url: String, apiKey: String, identifier: String, offset: Int)
    async{
        do {
            let stockPrices = try await
            WebService().getStockPrices(url: url, apiKey: apiKey, identifier: identifier, offset: offset)
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
    
    var tradingSymbol: String {
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

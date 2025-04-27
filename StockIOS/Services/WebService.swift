//
//  WebService.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation

class WebService {
    
    enum FinancialAPIError: Error {
        case invalidServerResponse
    }
    
    func getStockSymbols(url: String, apiKey: String) async throws -> [StockSymbolResponse]{
        
        let urlWithKey = URL(string: (url + apiKey))
        
        let (data, response) = try await URLSession.shared.data(from: urlWithKey!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw FinancialAPIError.invalidServerResponse
            }
        
        return try JSONDecoder().decode([StockSymbolResponse].self,from: data)
    }
    
    
    func getStockSplits(url: String, apiKey: String, identifier: String) async throws -> [StockSplitResponse]{
        
        
        let urlWithKeyAndParam = URL(string : url + Constants.UrlParams.identifier + identifier + apiKey)
        
        
        let (data, response) = try await
        URLSession.shared.data(from: urlWithKeyAndParam!)
        
        guard let httpResponse = response as?
                HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw FinancialAPIError.invalidServerResponse
        }
        
        return try
        JSONDecoder().decode([StockSplitResponse].self, from: data)
        
    }
    
    
}

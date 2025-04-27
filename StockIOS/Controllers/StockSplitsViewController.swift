//
//  StockSplitsViewController.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import UIKit
import Foundation

class StockSplitsViewController: UITableViewController {
    
    private let vm = StockSplitsViewModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        Task{
            await populateStockSplits()
        }
    }
    
    private func populateStockSplits() async {
        
        await vm.populateStockSplits(url: Constants.Urls.stockSplitsUrl, apiKey: Constants.APIcredentials.apiKeyForQueryParams, identifier: "AAPL")
        
        print(vm.stockSplits)
    }
}

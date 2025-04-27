//
//  StockSymbolsViewController.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import Foundation
import UIKit

class StockSymbolsViewController: UITableViewController {
    
    private let vm = StockSymbolsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        Task {
            await populateStockSymbols()
        }
    }
    
    private func configureUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Stock symbols"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StockCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.stockSymbols.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell",for:
                indexPath)
        let stock = vm.stockSymbols[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = stock.tradingSymbol
        content.secondaryText = stock.registrantName
        cell.contentConfiguration = content
        
        return cell
    }
    
    private func populateStockSymbols() async {
        await vm.populateStockSymbols(url: Constants.Urls.stockSymbolsUrl, apiKey: Constants.APIcredentials.apiKey)
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}

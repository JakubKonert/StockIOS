//
//  StockSymbolsTableViewController.swift
//  StockIOS
//
//  Created by student on 05/05/2025.
//

import Foundation
import UIKit

class StockSymbolsTableViewController: UITableViewController {
    
    private let vm = StockSymbolsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        configureUI()
        
        Task {
            await populateStockSymbols()
        }
    }
    
    private func configureUI(){
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let stock = vm.stockSymbols[indexPath.row]
        
        let storyboard = UIStoryboard(name: "PricesSplitsSelection", bundle: nil)
        
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: "PricesSplitsSelection") as? PricesSplitsSelectionViewController {
            detailsVC.tradingSymbol = stock.tradingSymbol
            detailsVC.registrantName = stock.registrantName
            
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

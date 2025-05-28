//
//  StockPricesTableViewController.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

import Foundation
import UIKit

class StockPricesTableViewController: UITableViewController {
    private let vm = StockPricesViewModel()
    var tradingSymbol: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tableView.register(StockPriceCell.self, forCellReuseIdentifier: "StockPriceCell")
        
        tableView.addSubview(noDataLabel)
        NSLayoutConstraint.activate([
            noDataLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            noDataLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
        
        
        Task {
            await populateStockPrices()
        }
    }
    
    private func populateStockPrices() async {
        guard let tradingSymbol = tradingSymbol else { return }
        await vm.populateStockPrices(url: Constants.Urls.stockPricesUrl, apiKey: Constants.APIcredentials.apiKeyForQueryParams, identifier: tradingSymbol)
        
        DispatchQueue.main.async {
            self.noDataLabel.isHidden = !self.vm.stockPrices.isEmpty
            self.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.stockPrices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StockPriceCell", for: indexPath) as? StockPriceCell else {
            return UITableViewCell()
        }
        
        let stockVM = vm.stockPrices[indexPath.row]
        let stock = StockPriceResponse(
            trading_symbol: stockVM.tradingSymbol,
            date: stockVM.date,
            open: stockVM.open,
            high: stockVM.high,
            low: stockVM.low,
            close: stockVM.close,
            volume: stockVM.volume
        )
        
        cell.configure(with: stock)
        
        return cell
    }
    
    private let noDataLabel: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return  label
    }()
}

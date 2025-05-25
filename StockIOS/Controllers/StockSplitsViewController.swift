//
//  StockSplitsViewController.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import UIKit
import Foundation

class StockSplitsViewController: UIViewController {
    @IBOutlet var splitsTableContainerView: UIView!
    @IBOutlet weak var stockSymbolLabel: UILabel!
    
    var tradingSymbol: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        embedSplitsTableViewController()
        stockSymbolLabel.text = tradingSymbol
        stockSymbolLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func embedSplitsTableViewController(){
        let tableVC = StockSplitsTableViewController()
        
        tableVC.tradingSymbol = tradingSymbol
        addChild(tableVC)
        tableVC.view.translatesAutoresizingMaskIntoConstraints = false
        splitsTableContainerView.addSubview(tableVC.view)
    }
    
}


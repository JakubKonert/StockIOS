//
//  StockPricesViewController.swift
//  StockIOS
//
//  Created by student on 05/05/2025.
//

import Foundation
import UIKit

class StockPricesViewController: BaseViewController {
    var tradingSymbol : String?
    var registrantName: String?
    
    @IBOutlet weak var stockPricesContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
        if let tradingSymbol = tradingSymbol, let registrantName = registrantName {
            titleLabel.text = "\(tradingSymbol)\n\(registrantName)"
        } else {
            titleLabel.text = "Ceny"
        }
        
        self.navigationItem.titleView = titleLabel
        embedPricesTableViewController()
    }
    
    private func embedPricesTableViewController(){
        let tableVC = StockPricesTableViewController(style: .plain)
        tableVC.tradingSymbol = tradingSymbol
        
        addChild(tableVC)
        tableVC.view.translatesAutoresizingMaskIntoConstraints = false
        stockPricesContainerView.addSubview(tableVC.view)
        
        NSLayoutConstraint.activate([
            tableVC.view.topAnchor.constraint(equalTo: stockPricesContainerView.topAnchor),
            tableVC.view.bottomAnchor.constraint(equalTo: stockPricesContainerView.bottomAnchor),
            tableVC.view.leadingAnchor.constraint(equalTo: stockPricesContainerView.leadingAnchor),
            tableVC.view.trailingAnchor.constraint(equalTo: stockPricesContainerView.trailingAnchor)
        ])
    }
}

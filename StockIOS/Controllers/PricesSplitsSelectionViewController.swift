//
//  PricesSplitsSelectionViewController.swift
//  StockIOS
//
//  Created by student on 05/05/2025.
//


import Foundation
import UIKit

class PricesSplitsSelectionViewController: BaseViewController {
    @IBOutlet weak var stockPricesButton: UIButton!
    @IBOutlet weak var stockSplitsButton: UIButton!
    
    var tradingSymbol: String?
    var registrantName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        
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
            titleLabel.text = "Unknown"
        }
        
        self.navigationItem.titleView = titleLabel
    }
    
    
    func setupButtons()
    {
        stockPricesButton.translatesAutoresizingMaskIntoConstraints = false
        stockSplitsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stockPricesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stockPricesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            stockPricesButton.widthAnchor.constraint(equalToConstant: 230),
            stockPricesButton.heightAnchor.constraint(equalToConstant: 60),
            
            stockSplitsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stockSplitsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45),
            stockSplitsButton.widthAnchor.constraint(equalToConstant: 230),
            stockSplitsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
        
        
    @IBAction func stockSplitsButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "StockSplits", bundle: nil)
        if let splitsVC =
            storyboard.instantiateViewController(withIdentifier: "StockSplits") as? StockSplitsViewController
        {
            splitsVC.tradingSymbol = tradingSymbol
            navigationController?.pushViewController( splitsVC, animated: true)
        }
    }
    
    
    @IBAction func stockPricesButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "StockPrices", bundle: nil)
        if let pricesVC =
            storyboard.instantiateViewController(withIdentifier: "StockPrices") as? StockPricesViewController
        {
            pricesVC.tradingSymbol = tradingSymbol
            navigationController?.pushViewController(pricesVC, animated: true)
        }
    }
    
        
    }

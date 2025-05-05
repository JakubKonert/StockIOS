//
//  StockSymbolsViewController.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//
import Foundation
import UIKit

class StockSymbolsViewController: BaseViewController {
    @IBOutlet var symbolsTableContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        embedSymbolsTableViewController()
    }
    
    private func embedSymbolsTableViewController()
    {
        let tableVC = StockSymbolsTableViewController(style: .plain)
        
        addChild(tableVC)
        tableVC.view.translatesAutoresizingMaskIntoConstraints = false
        symbolsTableContainerView.addSubview(tableVC.view)
        
        NSLayoutConstraint.activate([
            tableVC.view.topAnchor.constraint(equalTo: symbolsTableContainerView.topAnchor),
            tableVC.view.bottomAnchor.constraint(equalTo: symbolsTableContainerView.bottomAnchor),
            tableVC.view.leadingAnchor.constraint(equalTo: symbolsTableContainerView.leadingAnchor),
            tableVC.view.trailingAnchor.constraint(equalTo: symbolsTableContainerView.trailingAnchor)
        ])
        
        tableVC.view.alpha = 0
        
        tableVC.didMove(toParent: self)
    
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseInOut], animations: {tableVC.view.alpha = 1}, completion: nil)
    }
}

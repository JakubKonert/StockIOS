//
//  StockSplitsTableViewController.swift
//  StockIOS
//
//  Created by student on 05/05/2025.
//

import Foundation
import UIKit

class StockSplitsTableViewController: UITableViewController {
    
var tradingSymbol: String?
    
private let vm = StockSplitsViewModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.edgesForExtendedLayout = []

        Task {
            await populateStockSplits()
        }
        setupViews()
    }
    
    private func populateStockSplits() async {
        await vm.populateStockSplits(url: Constants.Urls.stockSplitsUrl, apiKey: Constants.APIcredentials.apiKeyForQueryParams, identifier: tradingSymbol ?? "")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.stockSplits.count
    }
    

    func setupViews(){
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
        
        for split in vm.stockSplits {
            let label = UILabel()
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 14)
            label.text = "Date: \( split.executionDate)   Multiplier: x\(split.multipier) Registrant: \(split.registrantName)"
            stackView.addArrangedSubview(label)
        }
    }
    
    
    
}


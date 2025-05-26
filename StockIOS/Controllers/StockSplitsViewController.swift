//
//  StockSplitsViewController.swift
//  StockIOS
//
//  Created by student on 27/04/2025.
//

import UIKit
import Foundation

class StockSplitsViewController: UIViewController {
    @IBOutlet var stockSplitsContainerView: UIView!
    
    private let vm = StockSplitsViewModel()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    
    var tradingSymbol: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        Task {
            await populateStockSplits()
        }
    }
    
    private func populateStockSplits() async {
        await vm.populateStockSplits(url: Constants.Urls.stockSplitsUrl, apiKey: Constants.APIcredentials.apiKeyForQueryParams, identifier: tradingSymbol ?? "")
        DispatchQueue.main.async{
            self.displaySplits()
        }
    }
    
    private func displaySplits() {
            for split in vm.stockSplits {
                
                let container = UIView()
                container.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.15)
                container.layer.cornerRadius = 16
                container.layer.masksToBounds = true
                
                let label = UILabel()
                label.numberOfLines = 0
                label.font = .systemFont(ofSize: 16, weight: .medium)
                label.textColor = .white
                label.textAlignment = .center
                label.text = "📅 \(split.executionDate)   ✖️ \((split.multiplier).rounded())   🧾 \(split.registrantName)"

                label.translatesAutoresizingMaskIntoConstraints = false
                container.addSubview(label)

                
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                    label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8),
                    label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
                    label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12)
                ])
                
                self.stackView.addArrangedSubview(container)
            }
    }
    
    func setupViews(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

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
    }
    
   
    
}


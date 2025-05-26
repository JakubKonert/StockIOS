//
//  StockPriceCell.swift
//  StockIOS
//
//  Created by student on 26/05/2025.
//

import Foundation
import UIKit


class StockPriceCell: UITableViewCell{
    private let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder){
        super.init(coder:coder)
        setup()
    }
    
    private func setup(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate(
        [
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure(with stock: StockPriceResponse)
    {
        let change = stock.close - stock.open
        let formattedChange = String(format: "%.2f", change)
        label.text = "\(stock.date) | \(formattedChange)"
        
        if change > 0 {
            backgroundColor = UIColor.systemGreen.withAlphaComponent(0.1)
        }
        else if change < 0 {
            backgroundColor = UIColor.systemRed.withAlphaComponent(0.1)
        }
        else {
            backgroundColor = UIColor.systemBackground
        }
    }
}

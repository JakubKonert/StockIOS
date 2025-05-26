//
//  UserManualViewController.swift
//  StockIOS
//
//  Created by student on 28/04/2025.
//

import Foundation
import UIKit


class UserManualViewController: UIViewController
{
    @IBOutlet weak var manualText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        manualText.isEditable = false
        manualText.isSelectable = true
        manualText.isScrollEnabled = true

        manualText.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.15)
        manualText.font = .systemFont(ofSize: 20, weight: .medium)
        manualText.textAlignment = .left
        manualText.textColor = .label

        manualText.layer.cornerRadius = 12
        manualText.layer.masksToBounds = true

        manualText.textContainerInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)

        manualText.text = Constants.userManual
    }
}

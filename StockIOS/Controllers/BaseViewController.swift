//
//  BaseViewController.swift
//  StockIOS
//
//  Created by student on 28/04/2025.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        overrideUserInterfaceStyle = ThemeManager.current == .light ? .light : .dark        
    }
}

//
//  MenuViewController.swift
//  StockIOS
//
//  Created by student on 28/04/2025.
//

import Foundation
import UIKit

class MenuViewController: BaseViewController {
    

    @IBOutlet weak var userManualButton: UIButton!
    @IBOutlet weak var stockSymbolsButton: UIButton!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupModeSwitch()
        setupButtons()
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        themeSwitch.isOn = ThemeManager.current == .light
        
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        let selectedTheme: AppTheme = themeSwitch.isOn ? .light : .dark

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            ThemeManager.current = selectedTheme

            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = windowScene.delegate as? SceneDelegate,
               let window = delegate.window {

                let storyboard = UIStoryboard(name: "Menu", bundle: nil)
                let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController")

                let nav = UINavigationController(rootViewController: menuVC)
                window.rootViewController = nav
                window.makeKeyAndVisible()
            }
        }    }
    
    
    @IBAction func goToStockSymbols(_ sender: Any) {
        let storyboard = UIStoryboard(name:"StockSymbols", bundle: nil)
        if let stockSymbolsViewController = storyboard.instantiateViewController(withIdentifier: "StockSymbolsViewController") as? StockSymbolsViewController {
            
            navigationController?.pushViewController(stockSymbolsViewController, animated: true)
        }
    }
    
    
    @IBAction func goToUserManual(_ sender: Any) {
        let storyboard = UIStoryboard(name:"UserManual", bundle: nil)
        if let userManualViewController = storyboard.instantiateViewController(withIdentifier: "UserManualViewController") as? UserManualViewController {
            
            navigationController?.pushViewController(userManualViewController, animated: true)
        }
        
    }

    
    func setupModeSwitch()
    {
        themeSwitch.translatesAutoresizingMaskIntoConstraints = false
        themeSwitch.isOn = true

    }
    
    func setupButtons()
    {
        stockSymbolsButton.translatesAutoresizingMaskIntoConstraints = false
        userManualButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stockSymbolsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stockSymbolsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            stockSymbolsButton.widthAnchor.constraint(equalToConstant: 230),
            stockSymbolsButton.heightAnchor.constraint(equalToConstant: 60),
            
            userManualButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userManualButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45),
            userManualButton.widthAnchor.constraint(equalToConstant: 230),
            userManualButton.heightAnchor.constraint(equalToConstant: 60),
        
            themeSwitch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            themeSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ])
        
    }
}

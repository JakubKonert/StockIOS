//
//  ThemeManager.swift
//  StockIOS
//
//  Created by student on 29/05/2025.
//

import Foundation
import UIKit

enum AppTheme: Int {
    case light = 0
    case dark = 1
}

class ThemeManager{
    private static let themeKey = "userInterfaceStyle"
    
    static var current: AppTheme{
        get {
            let rawValue = UserDefaults.standard.integer(forKey: themeKey)
            return AppTheme(rawValue: rawValue) ?? .light
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: themeKey)
            apply(theme: newValue)
        }
    }
    
    static func apply(theme: AppTheme) {
        let style: UIUserInterfaceStyle = (theme == .light) ? .light : .dark
        
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows }
            .flatMap { $0 }
            .forEach { $0.overrideUserInterfaceStyle = style }
        
    }
    
    static func loadSavedTheme() {
        apply(theme: current)
    }
    
    
    
}

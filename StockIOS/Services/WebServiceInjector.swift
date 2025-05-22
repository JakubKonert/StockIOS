//
//  WebServiceInjector.swift
//  StockIOS
//
//  Created by student on 22/05/2025.
//

import Foundation

class WebServiceInjector {
    static var service: WebService = WebService()
}

extension WebService {
    static var shared: WebService {
        return WebServiceInjector.service
    }
}

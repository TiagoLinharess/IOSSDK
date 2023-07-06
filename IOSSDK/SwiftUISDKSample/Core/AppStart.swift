//
//  AppStart.swift
//  SDKSample
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation
import SDKCloud

enum AppStart {
    
    static func setupApp() {
        SDKCloudConfiguration.shared.baseUrl = "https://api.github.com"
    }
}

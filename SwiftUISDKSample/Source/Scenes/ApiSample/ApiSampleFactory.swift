//
//  ApiSampleFactory.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import SwiftUI

enum ApiSampleFactory {
    
    // MARK: - View Configuration
    
    static func configure() -> any View {
        let appState = ApiSampleState()
        let presenter = ApiSamplePresenter(appState: appState)
        let interactor = ApiSampleInteractor(presenter: presenter)
        let view = ApiSampleView(appState: appState, interactor: interactor)
        
        return view
    }
}

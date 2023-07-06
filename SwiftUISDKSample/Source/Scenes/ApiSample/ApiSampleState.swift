//
//  ApiSampleState.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation
import SDKCore

final class ApiSampleState: ObservableObject {
    
    // MARK: - App States
    
    @Published var viewStatus: ViewStatus = .none
    @Published var repository: Repository.ViewModel? = nil
    @Published var textFieldValue: String = ""
}

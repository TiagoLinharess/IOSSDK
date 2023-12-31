//
//  ApiSamplePresenter.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation
import SDKCloud

protocol ApiSamplePresenterInput {
    
    // MARK: - Protocol
    
    func presentSuccess(from response: Repository.Response)
    func presentLoading()
    func presentError(error: Error)
}

struct ApiSamplePresenter {
    
    // MARK: - Properties
    
    private let appState: ApiSampleState
    
    // MARK: - Init
    
    init(appState: ApiSampleState) {
        self.appState = appState
    }
}

extension ApiSamplePresenter: ApiSamplePresenterInput {
    
    // MARK: - Public Methods
    
    func presentSuccess(from response: Repository.Response) {
        let viewModel = Repository.ViewModel(from: response)
        
        DispatchQueue.main.sync {
            self.appState.repository = viewModel
            self.appState.viewStatus = .success
        }
    }
    
    func presentLoading() {
        DispatchQueue.main.sync {
            self.appState.viewStatus = .loading
        }
    }
    
    func presentError(error: Error) {
        DispatchQueue.main.sync {
            let errorResponse = error.parseError(Repository.ResponseError.self)
            self.appState.viewStatus = .error(errorResponse.response?.message ?? errorResponse.defaultMessage)
        }
    }
}

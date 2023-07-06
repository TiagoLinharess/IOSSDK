//
//  ApiSampleInteractor.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

protocol ApiSampleInteractorInput {
    
    // MARK: - Protocol
    
    func perform(repositoryName: String) async
}

struct ApiSampleInteractor {
    
    // MARK: - Properties
    
    private let worker: ApiSampleWorkerInput
    private let presenter: ApiSamplePresenterInput
    
    // MARK: - Init
    
    init(presenter: ApiSamplePresenterInput, worker: ApiSampleWorkerInput = ApiSampleWorker()) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension ApiSampleInteractor: ApiSampleInteractorInput {
    
    // MARK: - Public Methods
    
    func perform(repositoryName: String) async {
        presenter.presentLoading()
        do {
            let response = try await worker.searchRepository(with: repositoryName)
            presenter.presentSuccess(from: response)
        } catch {
            presenter.presentError(error: error)
        }
    }
}

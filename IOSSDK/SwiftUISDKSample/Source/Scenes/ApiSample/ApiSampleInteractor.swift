//
//  ApiSampleInteractor.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

protocol ApiSampleInteractorInput {
    func perform(repositoryName: String) async
}

struct ApiSampleInteractor {
    
    let worker: ApiSampleWorkerInput
    let presenter: ApiSamplePresenterInput
    
    init(presenter: ApiSamplePresenterInput, worker: ApiSampleWorkerInput = ApiSampleWorker()) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension ApiSampleInteractor: ApiSampleInteractorInput {
    
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

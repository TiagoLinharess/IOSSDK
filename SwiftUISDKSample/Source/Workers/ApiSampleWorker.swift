//
//  ApiSampleWorker.swift
//  SDKSample
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation
import SDKCloud

protocol ApiSampleWorkerInput {
    func searchRepository(with name: String) async throws -> Repository.Response
}

final class ApiSampleWorker {
    
    private let worker: ApiWorkerInput
    
    init(worker: ApiWorkerInput = ApiWorker()) {
        self.worker = worker
    }
}

extension ApiSampleWorker: ApiSampleWorkerInput {
    
    func searchRepository(with name: String) async throws -> Repository.Response {
        let request = ApiRequest<ApiEmptyRequest>(method: .get, endpoint: "/repos/\(name)", headers: nil, data: nil)
        return try await worker.perform(Repository.Response.self, request: request)
    }
}

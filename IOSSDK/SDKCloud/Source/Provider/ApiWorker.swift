//
//  ApiWorker.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - ApiWorkerInput

/// Worker Protocol.
public protocol ApiWorkerInput {
    
    // MARK: - Protocol Mehtods
    
    /// Perform request.
    func perform<Response: Decodable>(_ type: Response.Type, request: ApiRequestInput) async throws -> Response
}

// MARK: - ApiWorker

/// Object thats perform request.
public final class ApiWorker: NSObject {
    
    // MARK: - Properties
    
    /// Request provider.
    private let apiProvider: ApiProviderInput
    
    // MARK: - Public Init
    
    /// Initialize.
    public override init() {
        self.apiProvider = ApiProvider()
    }
    
    // MARK: - Init
    
    /// Initialize.
    init(apiProvider: ApiProviderInput = ApiProvider()) {
        self.apiProvider = apiProvider
    }
}

extension ApiWorker: ApiWorkerInput {
    
    // MARK: - Request
    
    /// Perform request.
    public func perform<Response: Decodable>(_ type: Response.Type, request: ApiRequestInput) async throws -> Response {
        let data = try await apiProvider.callMethod(request: request)
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response
    }
}

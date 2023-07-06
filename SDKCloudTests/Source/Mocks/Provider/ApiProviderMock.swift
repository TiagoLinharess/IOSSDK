//
//  ApiProviderMock.swift
//  SDKCloudTests
//
//  Created by Tiago Linhares on 06/07/23.
//

import Foundation
@testable import SDKCloud

struct ApiProviderMock: ApiProviderInput {
    
    struct Model: Codable {}
    
    enum Status {
        case success(Model)
        case error
    }
    
    var status: Status
    
    func callMethod(request: ApiRequestInput) async throws -> Data {
        if case .success(let model) = status {
            return try JSONEncoder().encode(model)
        }
        
        throw ApiError.genericError
    }
}

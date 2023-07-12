//
//  ApiProvider.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - ApiProviderInput

/// ApiProvider Protocol.
public protocol ApiProviderInput {
    
    /// Perform HTTP request provider.
    func callMethod(request: ApiRequestInput) async throws -> Data
}

// MARK: - ApiProvider

/// ApiProvider.
public final class ApiProvider {
    
    // MARK: - Public Init
    
    /// Initialize provider.
    public init() {}
}

extension ApiProvider: ApiProviderInput {
    
    // MARK: - Provider Request
    
    /// Perform HTTP request provider.
    public func callMethod(request: ApiRequestInput) async throws -> Data {
        let urlRequest = try getURL(request: request)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw ApiError.customError(CloudConstants.Provider.noResponseFromServer)
        }
        
        guard statusCode >= CloudConstants.Provider.successStatusCode &&
              statusCode < CloudConstants.Provider.errorStatusCode
        else { throw ApiError.httpError(data, statusCode) }
        
        return data
    }
}

private extension ApiProvider {
    
    // MARK: - Build URL
    
    /// Get URL request
    func getURL(request: ApiRequestInput) throws -> URLRequest {
        guard let urlString = SDKCloudConfiguration.shared.baseUrl,
              let url = URL(string: urlString + request.endpoint)
        else {
            throw ApiError.customError(CloudConstants.Provider.noAvailableURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        request.headers?.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if request.method != .get {
            urlRequest.httpBody = request.requestBody
        } else {
            urlRequest.url?.append(queryItems: request.requestParams ?? [])
        }
        
        return urlRequest
    }
}

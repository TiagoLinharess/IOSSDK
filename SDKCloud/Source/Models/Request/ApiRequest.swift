//
//  ApiRequest.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - ApiRequestInput

/// ApiRequest protocol.
public protocol ApiRequestInput {
    
    // MARK: - Protocol Properties
    
    /// Endpoint path.
    var endpoint: String { get }
    
    /// HTTP Method.
    var method: HTTPMethod { get }
    
    /// Request Headers.
    var headers: [String: String]? { get }
    
    /// Request query params.
    var requestParams: [URLQueryItem]? { get }
    
    /// Request body.
    var requestBody: Data? { get }
}

// MARK: - ApiRequestInput

/// ApiRequest object.
public struct ApiRequest<T: Encodable>: ApiRequestInput {
    
    // MARK: - Public Properties
    
    /// Endpoint path.
    public let endpoint: String
    
    /// HTTP Method.
    public let method: HTTPMethod
    
    /// Request Headers.
    public let headers: [String: String]?
    
    /// Request query params.
    public let requestParams: [URLQueryItem]?
    
    /// Request body.
    public let requestBody: Data?
    
    // MARK: - Init
    
    public init(method: HTTPMethod, endpoint: String, headers: [String: String]?, data: T?) {
        let requestData = try? JSONEncoder().encode(data)
        
        self.method = method
        self.endpoint = endpoint
        self.headers = headers
        self.requestParams = ApiParams.getUrlParamsFromData(data: requestData)
        self.requestBody = requestData
    }
}

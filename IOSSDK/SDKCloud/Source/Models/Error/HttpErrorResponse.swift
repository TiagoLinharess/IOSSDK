//
//  HttpErrorResponse.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation

// MARK: - HttpErrorResponse

/// This is a object thats recieve a generic type "T", witch handle the object error from provider.
public struct HttpErrorResponse<T: Decodable> {
    
    // MARK: - Public Properties
    
    /// Generic type.
    public let response: T?
    
    /// Defaul Message.
    public let defaultMessage: String
    
    /// HTTP status code.
    public let statusCode: Int?
    
    // MARK: - Init
    
    /// Initialize object.
    public init(response: T?, defaultMessage: String, statusCode: Int?) {
        self.response = response
        self.defaultMessage = defaultMessage
        self.statusCode = statusCode
    }
}

//
//  HTTPMethod.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation

// MARK: - HTTPMethod

/// HTTP Methods.
public enum HTTPMethod: String {
    
    /// GET Method.
    case get = "GET"
    
    /// POST Method.
    case post = "POST"
    
    /// PATCH Method.
    case patch = "PATCH"
    
    /// PUT Method.
    case put = "PUT"
    
    /// DELETE Method.
    case delete = "DELETE"
}

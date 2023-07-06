//
//  ApiError.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - Api Error

public enum ApiError: Error {
    
    /// Generic Error.
    /// message value: SDKCloud.ApiError error 2.
    case genericError
    
    /// HTTP Error.
    /// Params: (Data, Int).
    /// message value: SDKCloud.ApiError error 0.
    case httpError(Data, Int)
    
    /// HTTP Error.
    /// Params: (String).
    /// message value: param String value.
    case customError(String)
    
    // MARK: - Public Properties
    
    /// ApiError Message.
    public var message: String {
        switch self {
        case .genericError, .httpError(_, _):
            return localizedDescription
        case .customError(let string):
            return string
        }
    }
}

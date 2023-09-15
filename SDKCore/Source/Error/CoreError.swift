//
//  CoreError.swift
//  SDKCore
//
//  Created by Tiago Linhares on 15/09/23.
//

import Foundation

// MARK: - Api Error

public enum CoreError: Error {
    
    /// Generic Error.
    /// message value: Something went wrong, please try again later.
    case genericError
    
    /// Parse Error.
    /// message value: Something went wrong while searching for information, please try again later.
    case parseError
    
    /// HTTP Error.
    /// Params: (String).
    /// message value: param String value.
    case customError(String)
    
    // MARK: - Public Properties
    
    /// ApiError Message.
    public var message: String {
        switch self {
        case .genericError:
            return CoreConstants.CoreError.genericErrorMessage
        case .parseError:
            return CoreConstants.CoreError.parseErrorMessage
        case .customError(let string):
            return string
        }
    }
}

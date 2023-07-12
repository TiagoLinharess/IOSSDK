//
//  Error+extensions.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation

// MARK: - Error extension

extension Error {
    
    // MARK: - Public Properties
    
    /// Creates a defaul ApiError.
    public var defaultApiError: ApiError {
        .customError(CloudConstants.Error.defaultMessage)
    }
    
    // MARK: - Public Methods
    
    /// Returns a HttpErrorResponse.
    /// If HttpErrorResponse generic type is not valid, response is going to be nil.
    public func parseError<T: Decodable>(_ type: T.Type) -> HttpErrorResponse<T> {
        guard let response = try? getHttpResponse(T.self) else {
            return HttpErrorResponse(
                response: nil,
                defaultMessage: defaultApiError.message,
                statusCode: nil
            )
        }
        
        return response
    }
    
    // MARK: - Private Mehtods
    
    /// Transform Error in HttpErrorResponse.
    private func getHttpResponse<T: Decodable>(_ type: T.Type) throws -> HttpErrorResponse<T> {
        let apiError = self as? ApiError ?? defaultApiError
        switch apiError {
        case .httpError(let data, let statusCode):
            let response = try JSONDecoder().decode(T.self, from: data)
            return HttpErrorResponse<T>(response: response, defaultMessage: defaultApiError.message, statusCode: statusCode)
        default:
            break
        }
        throw defaultApiError
    }
}

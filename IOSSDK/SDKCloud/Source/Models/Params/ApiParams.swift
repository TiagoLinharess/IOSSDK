//
//  ApiParams.swift
//  SDKCore
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - ApiParams

/// Object that creates the HTTP query params.
enum ApiParams {
    
    // MARK: - Public Static Method
    
    /// Recieves Foundation.Data object and transforms this in a optional Array of Foundation.URLQueryItem.
    static func getUrlParamsFromData(data: Data?) -> [URLQueryItem]? {
        guard let data,
              let params = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        else { return nil }
        
        
        return params.map { (key, value) -> URLQueryItem in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}

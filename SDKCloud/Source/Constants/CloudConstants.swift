//
//  CloudConstants.swift
//  SDKCloud
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation

// MARK: - Constants

enum CloudConstants {
    
    // MARK: - Provider
    
    /// Provider Constants.
    enum Provider {
        
        /// Success status code.
        /// value: 200.
        static let successStatusCode: Int = 200
        
        /// Error status code.
        /// value: 400.
        static let errorStatusCode: Int = 400
        
        /// No Available URL.
        /// value: No Available URL.
        static let noAvailableURL: String = "No Available URL"
        
        /// No response from server.
        /// value: No response from server.
        static let noResponseFromServer: String = "No response from server"
    }
    
    // MARK: - Error
    
    /// Error Constants
    enum Error {
        
        /// Default error message.
        /// value: Ops, something went wrong, please try again later
        static let defaultMessage: String = "Ops, something went wrong, please try again later"
    }
}

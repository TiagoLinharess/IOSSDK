//
//  CoreConstants.swift
//  SDKCore
//
//  Created by Tiago Linhares on 11/07/23.
//

import Foundation

// MARK: - Constants

enum CoreConstants {
    
    // MARK: - UIKit
    
    /// UIKit Constants.
    enum UIKit {
        
        /// String for system image.
        /// value: exclamationmark.octagon.
        static let defaultURLImageName: String = "exclamationmark.octagon"
    }
    
    // MARK: - Core Error
    
    enum CoreError {
        
        /// String for generic error.
        /// value: Something went wrong, please try again later.
        static let genericErrorMessage: String = "Something went wrong, please try again later"
        
        /// String for parse error.
        /// value: Something went wrong while searching for information, please try again later.
        static let parseErrorMessage: String = "Something went wrong while searching for information, please try again later"
    }
}

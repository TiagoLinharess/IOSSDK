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
        
        /// String for nscoder initialize.
        /// value: init(coder:) has not been implemented
        static let coderInitMessage: String = "init(coder:) has not been implemented"
        
        /// String for system image.
        /// value: exclamationmark.octagon
        static let defaultURLImageName: String = "exclamationmark.octagon"
    }
}

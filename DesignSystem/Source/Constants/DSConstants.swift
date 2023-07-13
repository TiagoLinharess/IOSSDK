//
//  DSConstants.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 13/07/23.
//

import Foundation

// MARK: - Constants

enum DSConstants {
    
    // MARK: - Fonts
    
    /// Fonts Constants.
    enum Fonts {
        
        /// RobotoMono-Bold
        static let robotoMonoBoldFont: String = "RobotoMono-Bold"
        
        /// RobotoMono-Medium
        static let robotoMonoMediumFont: String = "RobotoMono-Medium"
        
        /// RobotoMono-Regular
        static let robotoMonoRegularFont: String = "RobotoMono-Regular"
        
        /// Montserrat-Bold
        static let montserratBoldFont: String = "Montserrat-Bold"
        
        /// Montserrat-Bold
        static let montserratMediumFont: String = "Montserrat-Medium"
        
        /// Montserrat-Regular
        static let montserratRegularFont: String = "Montserrat-Regular"
        
        /// Fonts extension
        static let fontsExtension: String = "ttf"
    }
    
    // MARK: - UIKit
    
    /// UIKit Constants.
    enum UIKit {
        
        /// String for nscoder initialize.
        /// value: init(coder:) has not been implemented
        static let coderInitMessage: String = "init(coder:) has not been implemented"
    }
}

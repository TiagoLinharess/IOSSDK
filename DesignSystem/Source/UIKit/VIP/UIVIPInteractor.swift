//
//  UIVIPInteractor.swift
//  SDKCore
//
//  Created by Tiago Linhares on 12/07/23.
//

import Foundation

open class UIVIPInteractor<Presenter> {
    
    // MARK: - Public Properties
    
    /// presenter
    public let presenter: Presenter
    
    // MARK: - Init
    
    /// Initialize
    public init(presenter: Presenter) {
        self.presenter = presenter
    }
}

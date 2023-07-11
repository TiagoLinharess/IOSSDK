//
//  UIBaseCoordinator.swift
//  SDKCore
//
//  Created by Tiago Linhares on 10/07/23.
//

import UIKit

open class UIBaseCoordinator: NSObject {
    
    // MARK: - Private Properties
    
    /// Main Coordinator UINavigationController
    private var baseNavigationController: UINavigationController?
    
    // MARK: - Public Properties
    
    /// UINavigationController
    public let navigationController: UINavigationController = UINavigationController()
    
    // MARK: - Public Methods
    
    /// Start Method
    open func start() { /* No implementation */ }
    
    /// Start Child Coordinator Method
    public func startChild(from baseNavigationController: UINavigationController, animated: Bool = true) {
        self.baseNavigationController = baseNavigationController
        self.baseNavigationController?.present(navigationController, animated: animated)
        start()
    }
    
    public func removeChild(animated: Bool = true) {
        baseNavigationController?.dismiss(animated: animated)
    }
}

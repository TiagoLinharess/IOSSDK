//
//  UIVIPBaseViewController.swift
//  SDKCore
//
//  Created by Tiago Linhares on 12/07/23.
//

import UIKit

open class UIVIPBaseViewController<CustomView: UIView, Interactor, Router>: UIViewController {
    
    // MARK: - Public Properties
    
    /// Interactor
    public let interactor: Interactor
    
    /// CustomView
    public let customView: CustomView
    
    /// Router
    public let router: Router
    
    // MARK: - Init
    
    /// View Code Init
    required public init(customView: CustomView, interactor: Interactor, router: Router) {
        self.customView = customView
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Unavailable Init
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError(DSConstants.UIKit.coderInitMessage)
    }
    
    // MARK: - View Life Cicle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }
}

//
//  UIMVVMBaseViewController.swift
//  SDKCore
//
//  Created by Tiago Linhares on 11/07/23.
//

import UIKit

open class UIMVVMBaseViewController<ViewModel>: UIViewController {
    
    // MARK: - Public Properties
    
    /// ViewModel
    public let viewModel: ViewModel
    
    // MARK: - Init
    
    /// View Code Init
    required public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Unavailable Init
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError(DSConstants.UIKit.coderInitMessage)
    }
}

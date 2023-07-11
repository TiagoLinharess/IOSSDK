//
//  UIImageFromURLFactory.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import UIKit

enum UIImageFromURLFactory {
    
    static func configure() -> UIViewController {
        let viewModel = UIImageFromURLViewModel()
        let controller = UIImageFromURLViewController(viewModel: viewModel)
        
        return controller
    }
}

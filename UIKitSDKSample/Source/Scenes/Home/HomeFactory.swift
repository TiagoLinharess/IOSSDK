//
//  HomeFactory.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import UIKit

enum HomeFactory {
    
    static func configure(onSelectSample: @escaping (SampleItem) -> Void) -> UIViewController {
        let viewModel = HomeViewModel()
        let controller = HomeViewController(viewModel: viewModel)
        
        viewModel.onSelectSample = { sample in
            onSelectSample(sample)
        }
        
        return controller
    }
}

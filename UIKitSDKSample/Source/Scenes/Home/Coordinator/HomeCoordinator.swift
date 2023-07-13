//
//  HomeCoordinator.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 10/07/23.
//

import DesignSystem
import UIKit

final class HomeCoordinator: UIBaseCoordinator {
    
    override func start() {
        let controller = HomeFactory.configure { sample in
            self.navigateToSampleDetail(sample: sample)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func navigateToSampleDetail(sample: SampleItem) {
        navigationController.pushViewController(sample.controller, animated: true)
    }
}

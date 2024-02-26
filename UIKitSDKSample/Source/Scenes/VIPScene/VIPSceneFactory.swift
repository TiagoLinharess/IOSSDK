//
//  VIPSceneFactory.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import UIKit

enum VIPSceneFactory {
    
    static func configure() -> UIViewController {
        let view = VIPSceneView()
        let router = VIPSceneRouter()
        let presenter = VIPScenePresenter()
        let interactor = VIPSceneInteractor(presenter: presenter)
        let controller = VIPSceneViewController(customView: view, interactor: interactor, router: router)
        
        router.viewController = controller
        presenter.viewController = controller
        
        return controller
    }
}

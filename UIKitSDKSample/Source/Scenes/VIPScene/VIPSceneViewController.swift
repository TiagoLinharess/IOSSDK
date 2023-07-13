//
//  VIPSceneViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import DesignSystem
import UIKit

protocol VIPSceneViewControllerInput { }

final class VIPSceneViewController: UIVIPBaseViewController<VIPSceneView, VIPSceneInteractorInput, VIPSceneRouterInput> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VIP Clean Scene"
    }
}

extension VIPSceneViewController: VIPSceneViewControllerInput { }

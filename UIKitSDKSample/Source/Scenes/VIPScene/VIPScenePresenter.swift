//
//  VIPScenePresenter.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import DesignSystem
import Foundation

protocol VIPScenePresenterInput { }

final class VIPScenePresenter: UIVIPPresenter<VIPSceneViewControllerInput> { }

extension VIPScenePresenter: VIPScenePresenterInput { }

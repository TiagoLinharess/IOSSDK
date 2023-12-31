//
//  VIPSceneInteractor.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import DesignSystem
import Foundation

protocol VIPSceneInteractorInput { }

final class VIPSceneInteractor: UIVIPInteractor<VIPScenePresenterInput> { }

extension VIPSceneInteractor: VIPSceneInteractorInput { }

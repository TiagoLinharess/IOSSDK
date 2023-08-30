//
//  LoadingDialogSampleViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 21/08/23.
//

import DesignSystem
import UIKit

final class LoadingDialogSampleViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentLoadingDialog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightContent
    }
}


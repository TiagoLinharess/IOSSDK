//
//  FeedbackDialogSampleViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 21/08/23.
//

import DesignSystem
import UIKit

final class FeedbackDialogSampleViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentFeedbackDialog(with: .init(
            title: "Feedback Dialog!",
            description: "This is a feedback dialog",
            buttons: [
                .init(title: "Action 1", style: .default, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }),
                .init(title: "Action 2", style: .cancel, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }),
                .init(title: "Action 3", style: .destructive, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }),
            ]
        ))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightContent
    }
}

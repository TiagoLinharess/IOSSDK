//
//  UIViewController+FeedbackDialog.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 21/08/23.
//

import UIKit

public struct FeedbackModel {
    
    // MARK: - Feedback Model
    
    /// Alert title.
    let title: String
    
    /// Alert description.
    let description: String
    
    /// Alert actions.
    let buttons: [UIAlertAction]
    
    /// Model Init.
    public init(title: String, description: String, buttons: [UIAlertAction]) {
        self.title = title
        self.description = description
        self.buttons = buttons
    }
}

public extension UIViewController {
    
    // MARK: - Feedback Dialog Presentation
    
    /// Method for dialog presentation.
    func presentFeedbackDialog(with model: FeedbackModel) {
        let feedbackDialog = UIAlertController(title: model.title, message: model.description, preferredStyle: .alert)
        
        model.buttons.forEach { alertAction in
            feedbackDialog.addAction(alertAction)
        }
        
        present(feedbackDialog, animated: true, completion: nil)
    }
}

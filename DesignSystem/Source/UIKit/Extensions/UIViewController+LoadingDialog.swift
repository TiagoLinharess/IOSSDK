//
//  UIViewController+LoadingDialog.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 21/08/23.
//

import UIKit

public extension UIViewController {
    
    // MARK: - Loading Dialog Presentation
    
    /// Method for loading dialog presentation.
    func presentLoadingDialog() {
        let alert = UIAlertController(title: nil, message: String(), preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
        
        alert.view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            alert.view.heightAnchor.constraint(equalToConstant: .superLarge),
            alert.view.widthAnchor.constraint(equalToConstant: .superLarge),
            activityIndicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor)
        ])
        
        present(alert, animated: true)
    }
    
    /// Method to hide loading dialog.
    func hideLoadingDialog() {
        dismiss(animated: true)
    }
}

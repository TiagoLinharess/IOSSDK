//
//  UIImageView+extensions.swift
//  SDKCore
//
//  Created by Tiago Linhares on 06/07/23.
//

import UIKit

extension UIImageView {
    
    // MARK: - URL Image View
    
    /// Transforms URL in to UIImageView
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else {
                self?.image = UIImage(systemName: "exclamationmark.octagon")
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

extension UIImageView {
    
    // MARK: - Make Rounded

    /// Make image rounded
    func makeRounded() {
        self.layer.borderWidth = .one
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / .two
        self.clipsToBounds = true
    }
}

//
//  UIImageView+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 06/07/23.
//

import UIKit

extension UIImageView {
    
    // MARK: - Make Rounded

    /// Make image rounded
    public func makeRounded() {
        self.layer.borderWidth = .one
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / .two
        self.clipsToBounds = true
    }
}

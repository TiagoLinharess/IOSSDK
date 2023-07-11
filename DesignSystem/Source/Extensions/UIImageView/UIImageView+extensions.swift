//
//  UIImageView+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 06/07/23.
//

import UIKit

extension UIImageView {
    
    // MARK: - Corner Radius

    /// Make image rounded
    public func cornerRadius(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}

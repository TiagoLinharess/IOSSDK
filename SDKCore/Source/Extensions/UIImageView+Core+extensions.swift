//
//  UIImageView+Core+extensions.swift
//  SDKCore
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
    
    // MARK: - URL Image View
    
    /// Transforms URL in to UIImageView
    public func load(url: URL?) {
        guard let url else {
            image = UIImage(systemName: CoreConstants.UIKit.defaultURLImageName)
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else {
                self?.image = UIImage(systemName: CoreConstants.UIKit.defaultURLImageName)
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

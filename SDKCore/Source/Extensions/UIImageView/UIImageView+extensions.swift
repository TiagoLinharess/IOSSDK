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
    public func load(url: URL) {
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

//
//  UIViewCode.swift
//  SDKCore
//
//  Created by Tiago Linhares on 11/07/23.
//

import UIKit

public protocol UIViewCode {
    
    func setup()
    func setupView()
    func setupBinding()
    func setupHierarchy()
    func setupConstraints()
}

public extension UIViewCode {
    
    func setup() {
        setupView()
        setupBinding()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupBinding() { /* No Implementation */ }
}

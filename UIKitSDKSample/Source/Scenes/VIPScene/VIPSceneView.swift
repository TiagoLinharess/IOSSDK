//
//  VIPSceneView.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import DesignSystem
import SDKCore
import SnapKit
import UIKit

final class VIPSceneView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a VIP Clean architecture Scene."
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VIPSceneView: UIViewCode {
    
    // MARK: - View Setup

    func setupView() {
        backgroundColor = .lightContent
    }
    
    func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(CGFloat.small)
        }
    }
}

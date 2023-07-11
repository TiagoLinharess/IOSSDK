//
//  HomeTableViewCell.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import DesignSystem
import SDKCore
import SnapKit
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "HomeTableViewCell"
    
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(text: String) {
        self.titleLabel.text = text
    }
}

extension HomeTableViewCell: UIViewCode {
    
    // MARK: - View Setup
    
    func setupView() {
        selectionStyle = .none
    }
    
    func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(CGFloat.small)
        }
    }
}

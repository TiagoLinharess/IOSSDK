//
//  UIImageFromURLViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import DesignSystem
import SDKCore
import SnapKit
import UIKit

final class UIImageFromURLViewController: UIMVVMBaseViewController<UIImageFromURLViewModelProtocol> {
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        load()
    }
    
    // MARK: - Private Methods
    
    private func load() {
        guard let url = URL(string: "https://avatars.githubusercontent.com/u/10639145?s=200&v=4") else { return }
        imageView.load(url: url)
        imageView.cornerRadius(radius: .xBig)
    }
}

extension UIImageFromURLViewController: UIViewCode {
    
    // MARK: - View Setup
    
    func setupView() {
        title = "UIImageView from url"
        view.backgroundColor = .gray
    }
    
    func setupHierarchy() {
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.small)
            make.trailing.lessThanOrEqualToSuperview().inset(CGFloat.small)
        }
    }
}

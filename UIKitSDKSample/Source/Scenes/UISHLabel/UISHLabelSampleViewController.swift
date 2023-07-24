//
//  UISHLabelSampleViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 20/07/23.
//

import DesignSystem
import UIKit

final class UISHLabelSampleViewController: UIViewController, UIViewCode {
    
    private lazy var label1: UISHLabel = UISHLabel(
        text: "Hello UISHLabel 1",
        style: .init(color: .darkContent, font: .title1(.poppins, .bold))
    )
    
    private lazy var label2: UISHLabel = {
        let label = UISHLabel()
        label.text = "Hello UISHLabel 2"
        label.font = .title1(.montserrat, .medium)
        label.textColor = .blue100
        return label
    }()
    
    private lazy var label3: UISHLabel = {
        let label = UISHLabel()
        label.text = "Hello UISHLabel 3"
        label.style = .init(color: .red100, font: .title1(.poppins, .medium))
        label.onClick = {
            print("CLick UISHLabel 3")
        }
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setupView() {
        title = "UISHLabel"
        view.backgroundColor = .lightContent
    }
    
    func setupHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

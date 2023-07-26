//
//  UISHButtonSampleViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 26/07/23.
//

import DesignSystem
import UIKit

final class UISHButtonSampleViewController: UIViewController, UIViewCode {
    
    private lazy var button1: UISHButton = UISHButton(
        text: "Button 1",
        style: .init(
            type: .primary,
            mainColor: .blue100,
            alternativeColor: .lightContent,
            font: .body(.poppins, .regular)
        ), action: .init(handler: { _ in
            print("Button1 Action")
        }))
    
    private lazy var button2: UISHButton = {
        let button = UISHButton()
        button.text = "Button 2"
        button.style = .init(type: .secondary, mainColor: .green100, alternativeColor: .lightContent, font: .subtitle(.montserrat, .medium))
        button.action = .init(handler: { _ in
            print("Button2 action")
        })
        return button
    }()
    
    private lazy var button3: UISHButton = {
        let button = UISHButton()
        button.text = "Button 3"
        button.style = .init(type: .ghost, mainColor: .red100, alternativeColor: .lightContent, font: .title3(.poppins, .bold))
        button.action = .init(handler: { _ in
            print("Button3 action")
        })
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = .smaller
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
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


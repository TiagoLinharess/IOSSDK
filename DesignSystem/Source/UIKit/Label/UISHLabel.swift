//
//  UISHLabel.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 20/07/23.
//

import SnapKit
import UIKit

public class UISHLabel: UIView {
    
    // MARK: - Public Properties
    
    /// Public propertie to get and set label text.
    public var text: String? = .init() {
        didSet { label.text = text }
    }
    
    /// Public propertie to get and set label color.
    public var textColor: UIColor = .init() {
        didSet { label.textColor = textColor }
    }
    
    /// Public propertie to get and set label font.
    public var font: UIFont = .init() {
        didSet { label.font = font }
    }
    
    /// Public propertie to get and set label style.
    public var style: Style? = nil {
        didSet {
            label.textColor = style?.color
            label.font = style?.font
        }
    }
    
    /// Public propertie to get the label click event.
    public var onClick: (() -> Void)?
    
    // MARK: - UI Elements
    
    /// UILabel
    private lazy var label: UILabel = .init()
    
    /// Component Container View
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Init
    
    /// Required init for component.
    public required init(text: String? = nil, style: Style = Style(color: .black, font: .body(.montserrat, .regular))) {
        super.init(frame: .zero)
        setup()
        setupAction()
        configure(text: text, style: style)
    }
    
    /// Unavailable init for component.
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError(DSConstants.UIKit.coderInitMessage)
    }
}

extension UISHLabel: UIViewCode {
    
    // MARK: - View Setup
    
    /// Public propertie for label configuration.
    public func configure(text: String?, style: Style) {
        self.text = text
        self.font = style.font
        self.textColor = style.color
    }

    /// Propertie for component setup.
    public func setupView() {
        backgroundColor = .clear
        label.isUserInteractionEnabled = true
    }
    
    /// Component hierarchy.
    public func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
    }
    
    /// Component constraints.
    public func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension UISHLabel {
    
    /// Setup component action.
    private func setupAction() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelAction))
        label.addGestureRecognizer(gestureRecognizer)
    }
    
    /// Component Action.
    @objc
    public func labelAction() {
        onClick?()
    }
}

public extension UISHLabel {
    
    // MARK: - Style
    
    /// Component style.
    struct Style {
        
        var color: UIColor
        var font: UIFont
        
        public init(color: UIColor, font: UIFont) {
            self.color = color
            self.font = font
        }
    }
}

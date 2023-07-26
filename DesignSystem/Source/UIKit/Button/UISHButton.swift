//
//  UISHButton.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 24/07/23.
//

import SnapKit
import UIKit

public final class UISHButton: UIView {
    
    // MARK: - Public Properties
    
    /// Public propertie to get and set button text.
    public var text: String? = nil {
        didSet { configure(text: text, style: style) }
    }
    
    /// Public propertie to get and set button style.
    public var style: Style? = nil {
        didSet { configure(text: text, style: style) }
    }
    
    /// Public propertie to get and set button action.
    public var action: UIAction? = nil {
        didSet { setupAction(action: action) }
    }
    
    // MARK: - UI Elements
    
    /// UIButton
    private lazy var button: UIButton = {
        let button = UIButton(configuration: .plain())
        button.layer.cornerRadius = .extraSmall
        button.configuration?.contentInsets = .init(
            top: .smaller,
            leading: .smaller,
            bottom: .smaller,
            trailing: .smaller
        )
        return button
    }()
    
    // MARK: - Init
    
    /// Required init for component.
    public required init(
        text: String? = nil,
        style: Style? = nil,
        action: UIAction? = nil
    ) {
        super.init(frame: .zero)
        setup()
        configure(text: text, style: style)
        setupAction(action: action)
    }
    
    /// Unavailable init for component.
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError(DSConstants.UIKit.coderInitMessage)
    }
}

private extension UISHButton {
    
    // MARK: - View Setup
    
    /// Method for view setup.
    func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }

    /// Method for component setup.
    func setupView() {
        backgroundColor = .clear
    }
    
    /// Method for component hierarchy.
    func setupHierarchy() {
        addSubview(button)
    }
    
    /// Method for component constraints.
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

private extension UISHButton {
    
    // MARK: - View Configuration
    
    /// Method for label configuration.
    func configure(text: String?, style: Style?) {
        guard let style, let text else { return }
        
        var container = AttributeContainer()
        container.font = style.font
        
        button.setTitleColor(style.titleColor, for: .normal)
        button.backgroundColor = style.backgroundColor
        button.configuration?.baseForegroundColor = style.titleColor
        button.layer.borderWidth = style.borderWidth
        button.layer.borderColor = style.borderColor
        button.configuration?.attributedTitle = AttributedString(text, attributes: container)
    }
    
    /// Set button action.
    func setupAction(action: UIAction?) {
        guard let action else { return }
        button.addAction(action, for: .touchUpInside)
    }
}

public extension UISHButton {
    
    // MARK: - Style
    
    /// Component style.
    struct Style {
        
        /// Properties.
        var type: ButtonType
        var mainColor: UIColor
        var alternativeColor: UIColor
        var font: UIFont
        
        /// Title color.
        var titleColor: UIColor {
            switch type {
            case .primary:
                return alternativeColor
            case .secondary, .ghost:
                return mainColor
            }
        }
        
        /// Background color.
        var backgroundColor: UIColor {
            switch type {
            case .primary:
                return mainColor
            case .secondary, .ghost:
                return .clear
            }
        }
        
        /// Border width.
        var borderWidth: CGFloat {
            return type == .secondary ? .two : .zero
        }
        
        /// Border color.
        var borderColor: CGColor {
            return (type == .secondary ? mainColor : .clear).cgColor
        }
        
        /// Init.
        public init(type: ButtonType, mainColor: UIColor, alternativeColor: UIColor, font: UIFont) {
            self.type = type
            self.mainColor = mainColor
            self.alternativeColor = alternativeColor
            self.font = font
        }
    }
}

public extension UISHButton.Style {
    
    // MARK: - Button Style Type
    
    /// Component style type.
    enum ButtonType {
        
        case primary, secondary, ghost
    }
}

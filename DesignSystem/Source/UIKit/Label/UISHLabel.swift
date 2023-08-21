//
//  UISHLabel.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 20/07/23.
//

import UIKit

public final class UISHLabel: UIView {
    
    // MARK: - Public Properties
    
    /// Public propertie to get and set label text.
    public var text: String? = nil {
        didSet { label.text = text }
    }
    
    /// Public propertie to get and set label color.
    public var textColor: UIColor? = nil {
        didSet { label.textColor = textColor }
    }
    
    /// Public propertie to get and set label font.
    public var font: UIFont? = nil {
        didSet { label.font = font }
    }
    
    /// Public propertie to get and set label style.
    public var style: Style? = nil {
        didSet {
            textColor = style?.color
            font = style?.font
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    /// Required init for component.
    public required init(text: String? = nil, style: Style = Style(color: .black, font: .body(.montserrat, .regular))) {
        super.init(frame: .zero)
        setup()
        configure(text: text, style: style)
    }
    
    /// Unavailable init for component.
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError(DSConstants.UIKit.coderInitMessage)
    }
}

private extension UISHLabel {
    
    // MARK: - View Setup
    
    /// Method for view setup.
    func setup() {
        setupView()
        setupAction()
        setupHierarchy()
        setupConstraints()
    }
    
    /// Method for label configuration.
    func configure(text: String?, style: Style) {
        self.text = text
        self.font = style.font
        self.textColor = style.color
    }

    /// Method for component setup.
    func setupView() {
        backgroundColor = .clear
        label.isUserInteractionEnabled = true
    }
    
    /// Method for component hierarchy.
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
    }
    
    /// Method for component constraints.
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension UISHLabel {
    
    // MARK: - View Action
    
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

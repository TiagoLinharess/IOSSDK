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
    
    public var text: String? = .init() {
        didSet { label.text = text }
    }
    
    public var textColor: UIColor = .init() {
        didSet { label.textColor = textColor }
    }
    
    public var font: UIFont = .init() {
        didSet { label.font = font }
    }
    
    public var style: Style? = nil {
        didSet {
            label.textColor = style?.color
            label.font = style?.font
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var label: UILabel = .init()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Init
    
    public required init(text: String? = nil, style: Style = Style(color: .black, font: .body(.montserrat, .regular))) {
        super.init(frame: .zero)
        setup()
        configure(text: text, style: style)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError(DSConstants.UIKit.coderInitMessage)
    }
}

extension UISHLabel: UIViewCode {
    
    // MARK: - View Setup
    
    public func configure(text: String?, style: Style) {
        self.text = text
        self.font = style.font
        self.textColor = style.color
    }

    public func setupView() {
        backgroundColor = .clear
    }
    
    public func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
    }
    
    public func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

public extension UISHLabel {
    
    // MARK: - Style
    
    struct Style {
        
        var color: UIColor
        var font: UIFont
        
        public init(color: UIColor, font: UIFont) {
            self.color = color
            self.font = font
        }
    }
}

//
//  SHLabel.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 26/07/23.
//

import SwiftUI

public struct SHLabel: View {
    
    // MARK: - Public Properties
    
    /// Label value.
    private let text: String
    
    /// Label color.
    private let textColor: Color?
    
    /// Label font.
    private let font: Font?
    
    /// Label Action.
    private let onClick: (() -> Void)?
    
    // MARK: - Init
    
    /// Init with Color and Font parameters.
    public init(text: String, textColor: Color? = nil, font: Font? = nil, onClick: (() -> Void)? = nil) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.onClick = onClick
    }
    
    /// Init with UIColor and UIFont parameters.
    public init(text: String, textColor: UIColor? = nil, font: UIFont? = nil, onClick: (() -> Void)? = nil) {
        self.text = text
        self.textColor = textColor?.color
        self.font = font?.font
        self.onClick = onClick
    }
    
    // MARK: - Body
    
    /// Body view.
    public var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(font)
            .onTapGesture {
                onClick?()
            }
    }
}

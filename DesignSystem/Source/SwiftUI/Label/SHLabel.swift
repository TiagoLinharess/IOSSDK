//
//  SHLabel.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 26/07/23.
//

import SwiftUI

public struct SHLabelModifier: ViewModifier {
    
    // MARK: - Properties
    
    /// Label color.
    private let color: Color
    
    /// Label font.
    private let font: Font
    
    // MARK: - Init
    
    /// Init with Color and Font parameters.
    public init(color: Color, font: Font) {
        self.font = font
        self.color = color
    }
    
    // MARK: - Body
    
    /// Modifier body.
    public func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(font)
    }
}

extension View {
    
    // MARK: - Modifier Implementation
    
    /// Function for Color and Font parameters.
    public func configureWithSH(color: Color, font: Font) -> some View {
        modifier(SHLabelModifier(color: color, font: font))
    }
    
    /// Function for UIColor and UIFont parameters.
    public func configureWithSH(color: UIColor, font: UIFont) -> some View {
        modifier(SHLabelModifier(color: color.color, font: font.font))
    }
}

//
//  UIColor+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 06/07/23.
//

import SwiftUI
import UIKit

extension UIColor  {
    
    // MARK: - Colors
    
    /// Green Primary
    /// #68C151
    public static var greenPrimary: UIColor {
        return hexStringToUIColor(hex: "#68C151")
    }
    
    /// Ligh Gray
    /// #EBEDEF
    public static var lightGray: UIColor {
        return hexStringToUIColor(hex: "#EBEDEF")
    }
}

extension UIColor {
    
    // MARK: - UIColor to Color
    
    /// UIColor to SwiftUI Color
    public var color: Color {
        Color(uiColor: self)
    }
}

extension UIColor {
    
    // MARK: - Hex String to UIColor
    
    /// Transforms hex string colors in to UIColor object.
    public static func hexStringToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

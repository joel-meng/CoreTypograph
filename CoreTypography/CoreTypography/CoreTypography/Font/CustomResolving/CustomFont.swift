//
//  CustomFont.swift
//  CoreTypography
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A protocol that used for customing font which will resolve font by font family name.
public protocol CustomFont: CustomFontRepresentable {
    
    /// Will resolve a font by provided font family name and point size
    ///
    /// - Parameter pointSize: Font point size of type `CGFloat`.
    /// - Returns: A font with given family name and point size.
    func font(withSize pointSize: CGFloat) -> UIFont
}

extension CustomFont {
    func font(withSize pointSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: familyName, size: pointSize) else {
            preconditionFailure("Font with family name \(familyName) does not exists.")
        }
        return font
    }
}

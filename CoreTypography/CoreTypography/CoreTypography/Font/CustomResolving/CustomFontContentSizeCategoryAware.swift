//
//  CustomFontContentSizeCategoryAware.swift
//  CoreTypography
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A protocol to be used by custom font to acquire an font object by `UIFontTextStyle` and `UICotentSizeCategory`
public protocol CustomFontContentSizeCategoryAware: CustomFontRepresentable, FontContentSizeCategoryAware {
    
    /// Will resolve a font by `FontFace`, `FontTrait` by given `UITextStyle` and size by given `UICotentSizeCategory`
    ///
    /// - Parameters:
    ///   - textStyle: `UITextStyle` that custom font resolved by.
    ///   - contentSizeCategory: `UIContentSizeCategory` that custom font resolved by.
    /// - Returns: Custom font.
    func font(forTextStyle textStyle: UIFont.TextStyle, contentSizeCategory: UIContentSizeCategory) -> UIFont
}

public extension CustomFontContentSizeCategoryAware {
    
    func font(forTextStyle textStyle: UIFont.TextStyle, contentSizeCategory: UIContentSizeCategory) -> UIFont {
        let fontFace = face(forTextStyle: textStyle)
        let fontTrait = trait(forTextStyle: textStyle)
        let fontSize = fontPointSize(forTextStyle: textStyle, contentSizeCategory: contentSizeCategory)
        return UIFont(name: name(forFace: fontFace, trait: fontTrait), size: fontSize)!
    }
}

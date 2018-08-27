//
//   FontContentSizeCategoryAware.swift
//  CoreTypography
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A protocol which is used to custom font.
public protocol FontContentSizeCategoryAware: FontTextStyleAware {
    /// Resolve custom font size by given `UIFontTextStyle` and `UIContentSizeCategory`
    ///
    /// - Parameters:
    ///   - textStyle: `UITextStyle` to be used for resolving font point size.
    ///   - contentSizeCategory: `UICotentSizeCategory` to be used for resolving font point size.
    /// - Returns: Custom font point size in `CGFloat`
    func fontPointSize(forTextStyle textStyle: UIFont.TextStyle, contentSizeCategory: UIContentSizeCategory) -> CGFloat
}

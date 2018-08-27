//
//  Underline.swift
//  CoreTypography
//
//  Created by Joel on 26/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Underline {}

extension Underline {
    public typealias Style = NSUnderlineStyle

    /// Will return a TextStyler that set under line color. If not set, default to nil,
    /// indicating same as foreground color.
    ///
    /// - Parameter value: Platform Color
    /// - Returns: A new `TextStyler` with given functionality.
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.underlineColor: value])
        }
    }

    /// Will return a `TextStyler` that set under line styles with one of
    /// the constants described in Style. The default value for this attribute is styleNone.
    ///
    /// - Parameter value: OptionSet, `Underline.Style`
    /// - Returns: A new `TextStyler` with given functionality.
    public static func style(_ value: Style) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.underlineStyle: value.rawValue])
        }
    }
}

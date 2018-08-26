//
//  Strike.swift
//  CoreTypography
//
//  Created by Joel on 26/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Strikethrough {}


extension Strikethrough {
    
    public typealias Style = NSUnderlineStyle
    
    /// The value of this attribute is a PlatformColor object. The default value is nil,
    /// indicating same as foreground color.
    ///
    /// - Parameter value: Platform Color
    /// - Returns: A new `TextStyler` with given functionality.
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.strikethroughColor: value])
        }
    }
    
    /// This value indicates whether the text has a line through it and corresponds to one of
    /// the constants described in Style. The default value for this attribute is styleNone.
    ///
    /// - Parameter value: OptionSet, `Strikethrough.Style`
    /// - Returns: A new `TextStyler` with given functionality.
    public static func style(_ value: Style) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.strikethroughStyle: value.rawValue])
        }
    }
}

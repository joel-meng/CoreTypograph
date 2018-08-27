//
//  Pop.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Text {}

extension Text {
    
    public typealias TextEffect = NSAttributedString.TextEffectStyle
    
    /// Will return an `TextStyler` that can override given attributes's text color setting
    /// by the given parameter.
    ///
    /// - Parameter value: The text color value, such .red, .green, etc.
    /// - Returns: A new `TextStyler` with applying text color.
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.foregroundColor: value])
        }
    }
    
    /// Will return an `TextStyler` that can override given attributes's text effect setting
    /// by the given parameter.
    ///
    /// - Parameter value: The text effect value, such as letterpressStyle.
    /// - Returns: A new `TextStyler` with applying text effect.
    public static func effect(_ value: TextEffect) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.textEffect: value.rawValue])
        }
    }
}

//
//  Background.swift
//  CoreTypography
//
//  Created by Joel on 26/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Background {
    
    /// Will return an `TextStyler` that can override given attributes's text background color
    /// by the given parameter.
    ///
    /// - Parameter value: The text effect value, such as letterpressStyle.
    /// - Returns: A new `TextStyler` with applying text effect.
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.backgroundColor: value])
        }
    }
}

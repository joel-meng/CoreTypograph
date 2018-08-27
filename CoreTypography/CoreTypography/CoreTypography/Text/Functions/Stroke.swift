//
//  Stroke.swift
//  CoreTypography
//
//  Created by Joel on 26/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Stroke {}
extension Stroke {
    /// Will return an `TextStyler` that can override given attributes's text stroke width by the given parameter.
    ///
    /// - Parameter value: Interpreted as a percentage of font point size. This interpreted as a percentage
    /// of font point size, controls the text drawing mode:
    ///     - positive values effect drawing with stroke only;
    ///     - negative values are for stroke and fill.
    ///   A typical value for outlined text is 3.0
    /// - Returns: A new `TextStyler` that fullfilled the functionality of setting stroke width.
    public static func width(_ value: Float) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.strokeWidth: value])
        }
    }

    /// Will return an `TextStyler` that can override given attributes's text stroke color by the given parameter.
    ///
    /// - Parameter value: The `PlatformColor` type of stroke color.
    /// - Returns: A new `TextStyler` that fullfilled the functionality of setting stroke color.
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.strokeColor: value])
        }
    }
}

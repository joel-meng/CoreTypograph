//
//  Font.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text font setting
    /// by the given parameter.
    ///
    /// - Parameter value: The `PlatformFont` object.
    /// - Returns: A new `TextStyler` with applying text font.
    public static func font(_ value: PlatformFont) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.font: value])
        }
    }

    /// The type of ligatures to use. Arabic text, for example, requires ligatures for many character sequences but has a rich set of
    /// additional ligatures that combine characters. English text has no essential ligatures, and typically has only two standard ligatures,
    /// those for "fi" and "fl"—all others are considered more advanced or fancy.
    ///
    /// - essential: Only ligatures essential for proper rendering of text should be used.
    /// - standard:  Standard ligatures should be used.
    /// - all: All available ligatures should be used
    public enum LigatureStyle: Int {
        case essential = 0
        case standard = 1
        case all = 2
    }

    /// Will return an `TextStyler` that can override given attributes's text font ligature setting
    /// by the given parameter.
    ///
    /// - Parameter value: Ligature trait.
    /// - Returns: A new `TextStyler` who can could apply font ligature style distance.
    public static func ligature(_ value: LigatureStyle) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.ligature: value.rawValue])
        }
    }

    /// Will return an `TextStyler` that can override given attributes's text font kerning setting
    /// by the given parameter.
    ///
    /// - Parameter value: `Float` number, in points. The amount to kern the next character.
    /// Default is standard kerning. The kerning attribute indicates how many points the following character should be shifted
    /// from its default offset as defined by the current character's font in points: a positive kern indicates a shift farther
    /// away from and a negative kern indicates a shift closer to the current character.
    /// If this attribute is not present, standard kerning is used. If this attribute is set to 0.0, no kerning is done at all.
    /// - Returns: A new `TextStyler` who can could apply font kerning distance.
    public static func kerning(_ distance: ScreenPoint<CGFloat>) -> TextStyler {
        return { attributes in
            let value = Float(distance.rawValue)
            return attributes.aggressivelyMerging([.kern: value])
        }
    }
}

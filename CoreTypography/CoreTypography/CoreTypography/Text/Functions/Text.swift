//
//  Pop.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Text {}

// MARK: - Type Definition

extension Text {
    /// The `TextEffect` parameter used for `effect` function.
    public typealias TextEffect = NSAttributedString.TextEffectStyle

    /// The URL used for `link` function that is adding link to attributed string.
    public typealias URL = NSURL
}

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text color setting
    /// by the given parameter.
    ///
    /// - Parameter value: The text color value, such .red, .green, etc.
    /// - Returns: A new `TextStyler` with applying text color.
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.foregroundColor: value])
        }
    }
}

// MARK: - Text Effect

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text effect setting
    /// by the given parameter.
    ///
    /// - Parameter value: The text effect value, such as letterpressStyle.
    /// - Returns: A new `TextStyler` with applying text effect.
    public static func effect(_ value: TextEffect) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.textEffect: value.rawValue])
        }
    }
}

// MARK: - Shadow

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text shadow setting
    /// by the given parameter.
    ///
    /// - Parameters:
    ///   - offsetX: Offset in points for X of shadow.
    ///   - offsetY: Offset in points for Y of shadow.
    ///   - blurRadius: Blur radius of the shadow.
    ///   - color: Color of shadow.
    /// - Returns: A new `TextStyler` applying given shadow.
    public static func shadow(offsetX: ScreenPoint<CGFloat>,
                              offsetY: ScreenPoint<CGFloat>,
                              blurRadius: ScreenPoint<CGFloat>,
                              color: PlatformColor? = nil) -> TextStyler {
        return { attributes in
            let shadow = NSShadow()
            shadow.shadowOffset = CGSize(width: offsetX.rawValue, height: offsetY.rawValue)
            shadow.shadowBlurRadius = blurRadius.rawValue

            // Only apply color while color is non-nil.
            if let color = color {
                shadow.shadowColor = color
            }
            return attributes.aggressivelyMerging([.shadow: shadow])
        }
    }
}

// MARK: - Link

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text link setting
    /// by the given parameter.
    ///
    /// - Parameter value: The `URL` type that this link to.
    /// - Returns: A new `TextStyler` applying given shadow.
    public static func link(to value: NSURL) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.link: value])
        }
    }
}

// MARK: - Offset

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text link setting
    /// by the given parameter.
    ///
    /// - Parameter points: The value in screen points that the baseline offset for.
    /// - Returns: A new `TextStyler` applying given baseline offset.
    public static func offset(by points: ScreenPoint<CGFloat>) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.baselineOffset: points.rawValue])
        }
    }
}

// MARK: - Obliqueness

extension Text {
    /// Will return an `TextStyler` that can override given attributes's text link setting
    /// by the given parameter.
    ///
    /// - Parameter points: The value in screen points that the obliqueness by.
    /// - Returns: A new `TextStyler` applying given obliqueness in points.
    public static func oblique(by points: ScreenPoint<CGFloat>) -> TextStyler {
        return { attributes in
            attributes.aggressivelyMerging([.obliqueness: points.rawValue])
        }
    }
}

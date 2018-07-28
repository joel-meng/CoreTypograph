//
//  TextSpacing.swift
//  CoreTypography
//
//  Created by MENG, Joel on 21/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Text Spacing feature type is used to select between the proportional,
/// monospaced and half-width forms of characters in a font.
/// Use of this feature type is optional; for more precise control see the Kana
/// Spacing and Ideographic Spacing feature types.
/// Exclusive feature.
///
/// - proportional: Selects the proportional forms of letters.
/// - mono: Selects the monospace forms of letters.
/// - halfThirdWidth: Selects the half-width forms of letters.
/// - thirdWidth: Selects the third-width forms of letters.
/// - quarterWidth: Selects the quarter-width forms of letters.
/// - altProportional: Selects alternate proportional forms of letters.
/// - altHalfWidth: Selects alternate half-width forms of letters.
public enum TextSpacing: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .proportional:
            return attribute(feature: kTextSpacingType, selector: kProportionalTextSelector)
        case .mono:
            return attribute(feature: kTextSpacingType, selector: kMonospacedTextSelector)
        case .halfWidth:
            return attribute(feature: kTextSpacingType, selector: kHalfWidthTextSelector)
        case .thirdWidth:
            return attribute(feature: kTextSpacingType, selector: kThirdWidthTextSelector)
        case .quarterWidth:
            return attribute(feature: kTextSpacingType, selector: kQuarterWidthTextSelector)
        case .altProportional:
            return attribute(feature: kTextSpacingType, selector: kAltProportionalTextSelector)
        case .altHalfWidth:
            return attribute(feature: kTextSpacingType, selector: kAltHalfWidthTextSelector)
        }
    }
    
    case proportional
    case mono
    case halfWidth
    case thirdWidth
    case quarterWidth
    case altProportional
    case altHalfWidth
}

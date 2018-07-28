//
//  Fraction.swift
//  CoreTypography
//
//  Created by MENG, Joel on 21/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Fractions feature type controls the selection and/or generation of fractions.
/// Exclusive feature.
/// 
/// - no: This means fractions should not be formed automatically.
/// - vertical: Form vertical (pre-drawn) fractions present in the font.
/// - diagonal: Acts like the Vertical Fractions selector, but fractions will be synthesized
/// using superiors and inferiors (or special-purpose numerator and denominator forms, if present in the font).
public enum Fraction: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .no:
            return attribute(feature: kFractionsType, selector: kNoFractionsSelector)
        case .vertical:
            return attribute(feature: kFractionsType, selector: kVerticalFractionsSelector)
        case .diagonal:
            return attribute(feature: kFractionsType, selector: kDiagonalFractionsSelector)
        }
    }
    
    case no
    case vertical
    case diagonal
}

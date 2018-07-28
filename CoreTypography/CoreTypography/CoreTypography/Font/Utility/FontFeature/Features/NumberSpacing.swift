//
//  NumberSpacing.swift
//  CoreTypography
//
//  Created by MENG, Joel on 20/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// The Number Spacing feature type specifies a choice for the appearance of digits.(Exclusive)
///
/// - mono: Uniform width numbers, useful for displaying in columns. Sometimes known as "columnating" numbers.
/// - proportional: Numbers whose widths vary.
/// - thirdWidth: Thin numerals.
/// - quarterWidth: Very thin numerals.
public enum NumberSpacing: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .mono:
            return FontFeatureAttribute(featureIdentifier: kNumberSpacingType, selectorIdentifier: kMonospacedNumbersSelector)
        case .proportional:
            return FontFeatureAttribute(featureIdentifier: kNumberSpacingType, selectorIdentifier: kProportionalNumbersSelector)
        case .thirdWidth:
            return FontFeatureAttribute(featureIdentifier: kNumberSpacingType, selectorIdentifier: kThirdWidthNumbersSelector)
        case .quarterWidth:
            return FontFeatureAttribute(featureIdentifier: kNumberSpacingType, selectorIdentifier: kQuarterWidthNumbersSelector)
        }
    }
    
    case mono
    case proportional
    case thirdWidth
    case quarterWidth
}

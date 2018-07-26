//
//  NumberCase.swift
//  CoreTypography
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// Number Case is independent of Letter Case. Lower Case Numbers (also called "traditional" or "old style")
/// are digits which may descend below the baseline, as opposed to Upper Case Numbers (also called "lining"),
/// which do not descend below the baseline.
///
/// - lower: These forms of numbers may descend below the baseline. They are sometimes known as "traditional" or "old-style" numbers.
/// - upper: These forms of numbers do not descend below the baseline. They are sometimes known as "lining" numbers.

public enum NumberCase: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .lower:
            return FontFeatureAttribute(featureIdentifier: kNumberCaseType, selectorIdentifier: kLowerCaseNumbersSelector)
        case .upper:
            return FontFeatureAttribute(featureIdentifier: kNumberCaseType, selectorIdentifier: kUpperCaseNumbersSelector)
        }
    }
    
    case lower
    case upper
}

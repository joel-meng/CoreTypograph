//
//  UpperCase.swift
//  CoreTypography
//
//  Created by MENG, Joel on 20/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// Enumeration type that lists selectors for feature type kUpperCaseType
///
/// - `default`: Default upper case selector, kDefaultUpperCaseSelector
/// - smallCaps: Small capitals selector, kUpperCaseSmallCapsSelector. Small capitals (or just small caps) can be used in
/// bicameral scripts. They use the design of capital letters, but are smaller (roughly the size of the lowercase letters)
/// and usually replace the lowercase letters. See: https://typography.guru/term/small-caps-r98/
/// - petiteCaps: Petite capitals, kUpperCasePetiteCapsSelecto. Small caps will often be slightly or significantly larger
/// than the x-height of the font. Some typefaces have additional small caps which match the x-height and they are called
/// petite caps. Both types can be access through distinct OpenType features: SMCP (small caps) and PCAP (petite capitals).
/// See: https://typography.guru/term/petite-caps-r156/

public enum UpperCase: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .`default`:
            return FontFeatureAttribute(featureIdentifier: kUpperCaseType, selectorIdentifier: kDefaultUpperCaseSelector)
        case .smallCaps:
            return FontFeatureAttribute(featureIdentifier: kUpperCaseType, selectorIdentifier: kUpperCaseSmallCapsSelector)
        case .petiteCaps:
            return FontFeatureAttribute(featureIdentifier: kUpperCaseType, selectorIdentifier: kUpperCasePetiteCapsSelector)
        }
    }
    
    case `default`
    case smallCaps
    case petiteCaps
}

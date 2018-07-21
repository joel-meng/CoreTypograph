//
//  LowerCase.swift
//  CoreTypography
//
//  Created by MENG, Joel on 21/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// This feature replaces some of the functionality of the Letter Case feature.
/// It is used to alter the appearance of lower-case text to that either of small caps or petite caps.
/// [Some fonts contain an additional size of capital letters, shorter than the regular smallcaps and
/// whimsically referred to as petite caps. Such forms are most likely to be found in designs with a small
/// lowercase x-height, where they better harmonise with lowercase text than the taller smallcaps
/// [for examples of petite caps, see the Emigre type families Mrs Eaves and Filosofia].)
/// The display of actual upper-case glyphs for lower-case letters is discouraged.
///
/// - `default`: Use standard lower-case glyphs
/// - smallCaps: Display lower-case glyphs as small caps. (This is the most common way of displaying small caps.)
/// - petite: Display lower-case glyphs as petite caps
public enum LowerCase: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .`default`:
            return attribute(feature: kLowerCaseType, selector: kDefaultLowerCaseSelector)
        case .smallCaps:
            return attribute(feature: kLowerCaseType, selector: kLowerCaseSmallCapsSelector)
        case .petite:
            return attribute(feature: kLowerCaseType, selector: kLowerCasePetiteCapsSelector)
        }
    }
    
    case `default`
    case smallCaps
    case petite
}

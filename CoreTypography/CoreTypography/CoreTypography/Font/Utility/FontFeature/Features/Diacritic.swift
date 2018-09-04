//
//  Diacritic.swift
//  CoreTypography
//
//  Created by MENG, Joel on 21/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Diacritics feature type allows control over how diacritics (i.e. accent marks or applied vowels) appear in text.
///
/// - show: This is the default. It means to display the diacritics normally (that is, attached to their baseforms in the right place).
/// - hide: Don't show the diacritics. This is useful in Arabic children's book text,
/// where the same text can be shown with vowels for one reading audience and without vowels for another.
/// - decompose: Show the diacritics, but rather than attaching them to their baseforms, show them inline with the rest of the text.
public enum Diacritic: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .show:
            return attribute(feature: kDiacriticsType, selector: kShowDiacriticsSelector)
        case .hide:
            return attribute(feature: kDiacriticsType, selector: kHideDiacriticsSelector)
        case .decompose:
            return attribute(feature: kDiacriticsType, selector: kDecomposeDiacriticsSelector)
        }
    }

    case show
    case hide
    case decompose
}

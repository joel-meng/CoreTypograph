//
//  VerticalPosition.swift
//  CoreTypography
//
//  Created by MENG, Joel on 20/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Vertical Position feature type controls things like superscripts and subscripts.
///
/// - normal: This is the default. It means to display the text with no vertical displacement.
/// - superior: Changes any characters having superior forms in the font into those forms.
/// - inferior: Changes any characters having inferior forms in the font into those forms.
/// - ordinal: Contextually changes certain letters into their superior forms, like in Spanish changing from 1a to 1ª.
/// - scientificInferior: Changes any characters having them into inferior forms designed for a technical context (as in H2O).
public enum VerticalPosition: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .normal:
            return FontFeatureAttribute(featureIdentifier: kVerticalPositionType,
                                        selectorIdentifier: kNormalPositionSelector)
        case .superior:
            return FontFeatureAttribute(featureIdentifier: kVerticalPositionType,
                                        selectorIdentifier: kSuperiorsSelector)
        case .inferior:
            return FontFeatureAttribute(featureIdentifier: kVerticalPositionType,
                                        selectorIdentifier: kInferiorsSelector)
        case .ordinal:
            return FontFeatureAttribute(featureIdentifier: kVerticalPositionType,
                                        selectorIdentifier: kOrdinalsSelector)
        case .scientificInferior:
            return FontFeatureAttribute(featureIdentifier: kVerticalPositionType,
                                        selectorIdentifier: kScientificInferiorsSelector)
        }
    }

    case normal
    case superior
    case inferior
    case ordinal
    case scientificInferior
}

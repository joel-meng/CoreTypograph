//
//  FontFeatureAttribute.swift
//  CoreTypography
//
//  Created by MENG, Joel on 20/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

struct FontFeatureAttribute: Hashable {
    private let featureIdentifier: FeatureTypeIdentifier
    private let selectorIdentifier: FeatureSelectorIdentifier

    init(featureIdentifier: FeatureTypeIdentifier, selectorIdentifier: FeatureSelectorIdentifier) {
        self.featureIdentifier = featureIdentifier
        self.selectorIdentifier = selectorIdentifier
    }

    var hashValue: Int {
        return featureIdentifier.hashValue ^ selectorIdentifier.hashValue
    }

    func featureSetting() -> FontFeatureSetting {
        return [
            UIFontDescriptor.FeatureKey.featureIdentifier: featureIdentifier,
            UIFontDescriptor.FeatureKey.typeIdentifier: selectorIdentifier,
        ]
    }

    static func == (lhs: FontFeatureAttribute, rhs: FontFeatureAttribute) -> Bool {
        return (lhs.featureIdentifier == rhs.featureIdentifier) &&
            (lhs.selectorIdentifier == rhs.selectorIdentifier)
    }
}

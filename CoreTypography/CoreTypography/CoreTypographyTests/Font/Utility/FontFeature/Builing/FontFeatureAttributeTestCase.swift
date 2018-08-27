//
//  FontFeatureAttributeTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

@testable import CoreTypography
import XCTest

class FontFeatureAttributeTestCase: XCTestCase {
    func testGenerateFeatureSetting() {
        let featureSetting = FontFeatureAttribute(featureIdentifier: 1,
                                                  selectorIdentifier: 2).featureSetting()
        XCTAssertEqual(featureSetting[UIFontDescriptor.FeatureKey.featureIdentifier], 1)
        XCTAssertEqual(featureSetting[UIFontDescriptor.FeatureKey.typeIdentifier], 2)
    }

    func testEqual() {
        let fontFeatureOriginal = FontFeatureAttribute(featureIdentifier: 1,
                                                       selectorIdentifier: 2)
        let fontFeatureCopy = FontFeatureAttribute(featureIdentifier: 1,
                                                   selectorIdentifier: 2)
        XCTAssertEqual(fontFeatureOriginal, fontFeatureCopy)
    }

    func testNotEqualWhenFeatureIdentifierIsDifferent() {
        let fontFeatureOriginal = FontFeatureAttribute(featureIdentifier: 2,
                                                       selectorIdentifier: 2).featureSetting()
        let fontFeatureCopy = FontFeatureAttribute(featureIdentifier: 1,
                                                   selectorIdentifier: 2).featureSetting()
        XCTAssertNotEqual(fontFeatureOriginal, fontFeatureCopy)
    }

    func testNotEqualWhenSelectorIdentifierIsDifferent() {
        let fontFeatureOriginal = FontFeatureAttribute(featureIdentifier: 1,
                                                       selectorIdentifier: 2).featureSetting()
        let fontFeatureCopy = FontFeatureAttribute(featureIdentifier: 1,
                                                   selectorIdentifier: 1).featureSetting()
        XCTAssertNotEqual(fontFeatureOriginal, fontFeatureCopy)
    }

    func testNotEqualWhenNeitherSelectorIdentifierorFeatureIdentifierIsDifferent() {
        let fontFeatureOriginal = FontFeatureAttribute(featureIdentifier: 1,
                                                       selectorIdentifier: 2).featureSetting()
        let fontFeatureCopy = FontFeatureAttribute(featureIdentifier: 3,
                                                   selectorIdentifier: 4).featureSetting()
        XCTAssertNotEqual(fontFeatureOriginal, fontFeatureCopy)
    }
}

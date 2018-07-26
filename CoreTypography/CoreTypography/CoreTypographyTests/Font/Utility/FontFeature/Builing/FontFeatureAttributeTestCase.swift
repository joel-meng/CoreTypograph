//
//  FontFeatureAttributeTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class FontFeatureAttributeTestCase: XCTestCase {
    
    func testGenerateFeatureSetting() {
        let featureSetting = FontFeatureAttribute(featureIdentifier: 1,
                                                  selectorIdentifier: 2).featureSetting()
        XCTAssertEqual(featureSetting[UIFontDescriptor.FeatureKey.featureIdentifier], 1)
        XCTAssertEqual(featureSetting[UIFontDescriptor.FeatureKey.typeIdentifier], 2)
    }
    
    func testEqual() {
        let featureSettingOriginal = FontFeatureAttribute(featureIdentifier: 1,
                                                  selectorIdentifier: 2).featureSetting()
        let featureSettingCopy = FontFeatureAttribute(featureIdentifier: 1,
                                                  selectorIdentifier: 2).featureSetting()
        XCTAssertEqual(featureSettingOriginal, featureSettingCopy)
    }
    
    func testNotEqualWhenFeatureIdentifierIsDifferent() {
        let featureSettingOriginal = FontFeatureAttribute(featureIdentifier: 2,
                                                          selectorIdentifier: 2).featureSetting()
        let featureSettingCopy = FontFeatureAttribute(featureIdentifier: 1,
                                                      selectorIdentifier: 2).featureSetting()
        XCTAssertNotEqual(featureSettingOriginal, featureSettingCopy)
    }
    
    func testNotEqualWhenSelectorIdentifierIsDifferent() {
        let featureSettingOriginal = FontFeatureAttribute(featureIdentifier: 1,
                                                          selectorIdentifier: 2).featureSetting()
        let featureSettingCopy = FontFeatureAttribute(featureIdentifier: 1,
                                                      selectorIdentifier: 1).featureSetting()
        XCTAssertNotEqual(featureSettingOriginal, featureSettingCopy)
    }
    
    func testNotEqualWhenNeitherSelectorIdentifierorFeatureIdentifierIsDifferent() {
        let featureSettingOriginal = FontFeatureAttribute(featureIdentifier: 1,
                                                          selectorIdentifier: 2).featureSetting()
        let featureSettingCopy = FontFeatureAttribute(featureIdentifier: 3,
                                                      selectorIdentifier: 4).featureSetting()
        XCTAssertNotEqual(featureSettingOriginal, featureSettingCopy)
    }
}

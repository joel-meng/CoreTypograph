//
//  LowerCaseTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

@testable import CoreTypography
import XCTest

class LowerCaseTestCase: XCTestCase {
    func testLowerCaseDefault() {
        let fontFeature = LowerCase.default.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLowerCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kDefaultLowerCaseSelector)
    }

    func testLowerCaseSmallCaps() {
        let fontFeature = LowerCase.smallCaps.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLowerCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLowerCaseSmallCapsSelector)
    }

    func testLowerCasePetite() {
        let fontFeature = LowerCase.petite.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLowerCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLowerCasePetiteCapsSelector)
    }
}

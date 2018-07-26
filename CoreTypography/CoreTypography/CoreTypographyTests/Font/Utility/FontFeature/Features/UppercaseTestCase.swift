//
//  UppercaseTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class UppercaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUpperCaseDefault() {
        let fontFeature = UpperCase.default.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kUpperCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kDefaultUpperCaseSelector)
    }
    
    func testUpperCaseSmallCaps() {
        let fontFeature = UpperCase.smallCaps.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kUpperCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kUpperCaseSmallCapsSelector)
    }
    
    func testUpperCasePetiteCaps() {
        let fontFeature = UpperCase.petiteCaps.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kUpperCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kUpperCasePetiteCapsSelector)
    }
}

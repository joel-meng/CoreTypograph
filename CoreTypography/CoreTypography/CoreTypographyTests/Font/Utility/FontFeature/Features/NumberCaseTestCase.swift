//
//  NumberCaseTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class NumberCaseTestCase: XCTestCase {
    
    func testNumberCaseLower() {
        let fontFeature = NumberCase.lower.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kNumberCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLowerCaseNumbersSelector)
    }
    
    func testNumberCaseUpper() {
        let fontFeature = NumberCase.upper.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kNumberCaseType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kUpperCaseNumbersSelector)
    }
}

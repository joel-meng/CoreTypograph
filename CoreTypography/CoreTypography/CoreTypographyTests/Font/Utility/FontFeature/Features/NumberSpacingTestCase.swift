//
//  NumberSpacingTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class NumberSpacingTestCase: XCTestCase {
    
    func testNumberSpacingMono() {
        let fontFeature = NumberSpacing.mono.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kNumberSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kMonospacedNumbersSelector)
    }
    
    func testNumberSpacingProportional() {
        let fontFeature = NumberSpacing.proportional.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kNumberSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kProportionalNumbersSelector)
    }
    
    func testNumberSpacingThirdWidth() {
        let fontFeature = NumberSpacing.thirdWidth.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kNumberSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kThirdWidthNumbersSelector)
    }
    
    func testNumberSpacingQuarterWidth() {
        let fontFeature = NumberSpacing.quarterWidth.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kNumberSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kQuarterWidthNumbersSelector)
    }
}

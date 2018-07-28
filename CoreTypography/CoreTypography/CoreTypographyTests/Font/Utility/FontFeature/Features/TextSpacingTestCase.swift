//
//  TextSpacingTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class TextSpacingTestCase: XCTestCase {
    
    func testTextSpacingProportional() {
        let fontFeature = TextSpacing.proportional.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kProportionalTextSelector)
    }
    
    func testTextSpacingMono() {
        let fontFeature = TextSpacing.mono.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kMonospacedTextSelector)
    }
    
    func testTextSpacingHalfWidth() {
        let fontFeature = TextSpacing.halfWidth.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kHalfWidthTextSelector)
    }
    
    func testTextSpacingThirdWidth() {
        let fontFeature = TextSpacing.thirdWidth.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kThirdWidthTextSelector)
    }
    
    func testTextSpacingQuarterWidth() {
        let fontFeature = TextSpacing.quarterWidth.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kQuarterWidthTextSelector)
    }
    
    func testTextSpacingAlternateProportional() {
        let fontFeature = TextSpacing.altProportional.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kAltProportionalTextSelector)
    }
    
    func testTextSpacingAlternateWidth() {
        let fontFeature = TextSpacing.altHalfWidth.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kTextSpacingType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kAltHalfWidthTextSelector)
    }
}

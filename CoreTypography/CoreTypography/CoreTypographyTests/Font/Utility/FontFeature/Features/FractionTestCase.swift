//
//  FractionTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class FractionTestCase: XCTestCase {
    
    func testFractionNo() {
        let fontFeature = Fraction.no.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kFractionsType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kNoFractionsSelector)
    }
    
    func testFractionkVertical() {
        let fontFeature = Fraction.vertical.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kFractionsType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kVerticalFractionsSelector)
    }
    
    func testFractionkDiagonal() {
        let fontFeature = Fraction.diagonal.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kFractionsType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kDiagonalFractionsSelector)
    }
}

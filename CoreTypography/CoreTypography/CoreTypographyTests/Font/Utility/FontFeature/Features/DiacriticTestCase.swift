//
//  DiacriticTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class DiacriticTestCase: XCTestCase {
    
    func testDiacriticShow() {
        let fontFeature = Diacritic.show.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kDiacriticsType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kShowDiacriticsSelector)
    }
    
    func testDiacriticHide() {
        let fontFeature = Diacritic.hide.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kDiacriticsType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kHideDiacriticsSelector)
    }
    
    func testDiacriticDecompose() {
        let fontFeature = Diacritic.decompose.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kDiacriticsType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kDecomposeDiacriticsSelector)
    }
}

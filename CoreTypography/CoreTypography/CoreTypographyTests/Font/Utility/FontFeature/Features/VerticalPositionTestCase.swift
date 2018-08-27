//
//  VerticalPositionTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

@testable import CoreTypography
import XCTest

class VerticalPositionTestCase: XCTestCase {
    func testVerticalPositionNormal() {
        let fontFeature = VerticalPosition.normal.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kVerticalPositionType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kNormalPositionSelector)
    }

    func testVerticalPositionSuperiors() {
        let fontFeature = VerticalPosition.superior.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kVerticalPositionType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kSuperiorsSelector)
    }

    func testVerticalPositionInferiors() {
        let fontFeature = VerticalPosition.inferior.fontFeature().featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kVerticalPositionType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kInferiorsSelector)
    }
}

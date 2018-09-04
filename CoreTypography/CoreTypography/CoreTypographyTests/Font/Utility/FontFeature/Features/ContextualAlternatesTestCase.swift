//
//  ContextualAlternatesTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

@testable import CoreTypography
import XCTest

class ContextualAlternatesTestCase: XCTestCase {
    func testContextualAlternatesContextualOn() {
        let fontFeature = ContextualAlternates.contextualOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kContextualAlternatesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kContextualAlternatesOnSelector)
    }

    func testContextualAlternatesContextualOff() {
        let fontFeature = ContextualAlternates.contextualOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kContextualAlternatesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kContextualAlternatesOffSelector)
    }

    func testContextualAlternatesSwashOn() {
        let fontFeature = ContextualAlternates.swashOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kContextualAlternatesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kSwashAlternatesOnSelector)
    }

    func testContextualAlternatesSwashOff() {
        let fontFeature = ContextualAlternates.swashOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kContextualAlternatesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kSwashAlternatesOffSelector)
    }

    func testContextualAlternatesContextualSwashOn() {
        let fontFeature = ContextualAlternates.contextualSwashOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kContextualAlternatesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kContextualSwashAlternatesOnSelector)
    }

    func testContextualAlternatesContextualSwashOff() {
        let fontFeature = ContextualAlternates.contextualSwashOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kContextualAlternatesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kContextualSwashAlternatesOffSelector)
    }
}

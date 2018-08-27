//
//  SmartSwashTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

@testable import CoreTypography
import XCTest

class SmartSwashTestCase: XCTestCase {
    func testSmartSwashWordInitialOn() {
        let fontFeature = SmartSwash.wordInitialOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kWordInitialSwashesOnSelector)
    }

    func testSmartSwashWordInitialOff() {
        let fontFeature = SmartSwash.wordInitialOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kWordInitialSwashesOffSelector)
    }

    func testSmartSwashWordFinalOn() {
        let fontFeature = SmartSwash.wordFinalOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kWordFinalSwashesOnSelector)
    }

    func testSmartSwashWordFinalOff() {
        let fontFeature = SmartSwash.wordFinalOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kWordFinalSwashesOffSelector)
    }

    func testSmartSwashLineInitialOn() {
        let fontFeature = SmartSwash.lineInitialOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLineInitialSwashesOnSelector)
    }

    func testSmartSwashLineInitialOff() {
        let fontFeature = SmartSwash.lineInitialOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLineInitialSwashesOffSelector)
    }

    func testSmartSwashLineFinalOn() {
        let fontFeature = SmartSwash.lineFinalOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLineFinalSwashesOnSelector)
    }

    func testSmartSwashLineFinalOff() {
        let fontFeature = SmartSwash.lineFinalOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kLineFinalSwashesOffSelector)
    }

    func testSmartSwashNonFinalOn() {
        let fontFeature = SmartSwash.nonFinalOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kNonFinalSwashesOnSelector)
    }

    func testSmartSwashNonFinalOff() {
        let fontFeature = SmartSwash.nonFinalOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kSmartSwashType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kNonFinalSwashesOffSelector)
    }
}

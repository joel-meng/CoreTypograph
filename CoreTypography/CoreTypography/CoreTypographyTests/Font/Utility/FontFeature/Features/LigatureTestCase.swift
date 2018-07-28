//
//  LigatureTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 26/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class LigatureTestCase: XCTestCase {

    func testLigatureRequiredOn() {
        let fontFeature = Ligature.requiredOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kRequiredLigaturesOnSelector)
    }
    
    func testLigatureRequiredOff() {
        let fontFeature = Ligature.requiredOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kRequiredLigaturesOffSelector)
    }
    
    func testLigatureCommonOn() {
        let fontFeature = Ligature.commonOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kCommonLigaturesOnSelector)
    }
    
    func testLigatureCommonOff() {
        let fontFeature = Ligature.commonOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kCommonLigaturesOffSelector)
    }
    
    func testLigatureRareOn() {
        let fontFeature = Ligature.rareOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kRareLigaturesOnSelector)
    }
    
    func testLigatureRareOff() {
        let fontFeature = Ligature.rareOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kRareLigaturesOffSelector)
    }
    
    func testLigatureHistoricalOn() {
        let fontFeature = Ligature.historicalOn.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kHistoricalLigaturesOnSelector)
    }
    
    func testLigatureHistoryOff() {
        let fontFeature = Ligature.historicalOff.fontFeatures().first!.featureSetting()
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.featureIdentifier], kLigaturesType)
        XCTAssertEqual(fontFeature[UIFontDescriptor.FeatureKey.typeIdentifier], kHistoricalLigaturesOffSelector)
    }
    
    func testCombinations() {
        let ligatures: Ligature = [Ligature.historicalOn, Ligature.commonOff]
        let fontFeatures = ligatures.fontFeatures()
        XCTAssertEqual(fontFeatures.count, 2)
    }
}

//
//  FontTextStyleAwareTests.swift
//  CoreTypographyTests
//
//  Created by Joel on 3/9/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class FontTextStyleAwareTests: XCTestCase {

    var stubFont: CustomFontRepresentable!
    
    override func setUp() {
        stubFont = StubCustomFontRepresentable()
    }
    
    func testFamilyName() {
        XCTAssertEqual(stubFont.familyName, "StubFontFamilyName")
    }
    
    func testResolveRegular() {
        let fontName = stubFont.name(forFace: .regular, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-Regular")
        
        let fontNameWithTrait = stubFont.name(forFace: .regular, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-Italic")
    }
    
    func testResolveMedium() {
        let fontName = stubFont.name(forFace: .medium, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-Medium")
        
        let fontNameWithTrait = stubFont.name(forFace: .medium, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-MediumItalic")
    }
    
    func testResolveSemiBold() {
        let fontName = stubFont.name(forFace: .semiBold, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-SemiBold")
        
        let fontNameWithTrait = stubFont.name(forFace: .semiBold, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-SemiBoldItalic")
    }
    
    func testResolveBold() {
        let fontName = stubFont.name(forFace: .bold, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-Bold")
        
        let fontNameWithTrait = stubFont.name(forFace: .bold, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-BoldItalic")
    }
    
    func testResolveExtraBold() {
        let fontName = stubFont.name(forFace: .extraBold, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-ExtraBold")
        
        let fontNameWithTrait = stubFont.name(forFace: .extraBold, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-ExtraBoldItalic")
    }
    
    func testResolveBlack() {
        let fontName = stubFont.name(forFace: .black, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-Black")
        
        let fontNameWithTrait = stubFont.name(forFace: .black, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-BlackItalic")
    }
    
    func testResolveLight() {
        let fontName = stubFont.name(forFace: .light, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-Light")
        
        let fontNameWithTrait = stubFont.name(forFace: .light, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-LightItalic")
    }
    
    func testResolveExtraLight() {
        let fontName = stubFont.name(forFace: .extraLight, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-ExtraLight")
        
        let fontNameWithTrait = stubFont.name(forFace: .extraLight, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-ExtraLightItalic")
    }
    
    func testResolveThin() {
        let fontName = stubFont.name(forFace: .thin, trait: nil)
        XCTAssertEqual(fontName, "StubFontFamilyName-Thin")
        
        let fontNameWithTrait = stubFont.name(forFace: .thin, trait: .italic)
        XCTAssertEqual(fontNameWithTrait, "StubFontFamilyName-ThinItalic")
    }
}

private struct StubCustomFontRepresentable: CustomFontRepresentable {
    var familyName: String {
        return "StubFontFamilyName"
    }
}

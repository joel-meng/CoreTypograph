//
//  CustomFontTextStyleAwareSpec.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

@testable import CoreTypography
import Nimble
import Quick

class FontTextStyleAwareSpec: QuickSpec {
    override func spec() {
        describe("font text aware") {
            let stubFont = StubCustomFontRepresentable()

            it("has family name") {
                expect(stubFont.familyName) == "StubFontFamilyName"
            }

            context("without trait") {
                it("resolves regular") {
                    expect(stubFont.name(forFace: .regular, trait: nil)) == "StubFontFamilyName-Regular"
                }

                it("resolves Medium") {
                    expect(stubFont.name(forFace: .medium, trait: nil)) == "StubFontFamilyName-Medium"
                }

                it("resolves Semi Bold") {
                    expect(stubFont.name(forFace: .semiBold, trait: nil)) == "StubFontFamilyName-SemiBold"
                }

                it("resolves Bold") {
                    expect(stubFont.name(forFace: .bold, trait: nil)) == "StubFontFamilyName-Bold"
                }

                it("resolves Extra Bold") {
                    expect(stubFont.name(forFace: .extraBold, trait: nil)) == "StubFontFamilyName-ExtraBold"
                }

                it("resolves Black") {
                    expect(stubFont.name(forFace: .black, trait: nil)) == "StubFontFamilyName-Black"
                }

                it("resolves Light") {
                    expect(stubFont.name(forFace: .light, trait: nil)) == "StubFontFamilyName-Light"
                }

                it("resolves Extra Light") {
                    expect(stubFont.name(forFace: .extraLight, trait: nil)) == "StubFontFamilyName-ExtraLight"
                }

                it("resolves Thin") {
                    expect(stubFont.name(forFace: .thin, trait: nil)) == "StubFontFamilyName-Thin"
                }
            }

            context("has trait") {
                it("resolves regular") {
                    expect(stubFont.name(forFace: .regular, trait: .italic)) == "StubFontFamilyName-Italic"
                }

                it("resolves Medium") {
                    expect(stubFont.name(forFace: .medium, trait: .italic)) == "StubFontFamilyName-MediumItalic"
                }

                it("resolves Semi Bold") {
                    expect(stubFont.name(forFace: .semiBold, trait: .italic)) == "StubFontFamilyName-SemiBoldItalic"
                }

                it("resolves Bold") {
                    expect(stubFont.name(forFace: .bold, trait: .italic)) == "StubFontFamilyName-BoldItalic"
                }

                it("resolves Extra Bold") {
                    expect(stubFont.name(forFace: .extraBold, trait: .italic)) == "StubFontFamilyName-ExtraBoldItalic"
                }

                it("resolves Black") {
                    expect(stubFont.name(forFace: .black, trait: .italic)) == "StubFontFamilyName-BlackItalic"
                }

                it("resolves Light") {
                    expect(stubFont.name(forFace: .light, trait: .italic)) == "StubFontFamilyName-LightItalic"
                }

                it("resolves Extra Light") {
                    expect(stubFont.name(forFace: .extraLight, trait: .italic)) == "StubFontFamilyName-ExtraLightItalic"
                }

                it("resolves Thin") {
                    expect(stubFont.name(forFace: .thin, trait: .italic)) == "StubFontFamilyName-ThinItalic"
                }
            }
        }
    }
}

private struct StubCustomFontRepresentable: CustomFontRepresentable {
    var familyName: String {
        return "StubFontFamilyName"
    }
}

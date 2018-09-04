//
//  CustomFontLoader.swift
//  CoreTypography
//
//  Created by MENG, Joel on 24/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// Will register a font on the fly with given font name within givin bundle.
///
/// - Parameters:
///   - fontName: The font's name
///   - fontExtension: Font file extension, default to `.ttf`
///   - bundle: Bundle object that holds font files.
/// - Returns: Return true is font successfully registered, otherwise, false.
public func registerFont(withName fontName: String, fontExtension: String = ".ttf", inBundle bundle: Bundle = Bundle.main) -> Bool {
    let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension)! as CFURL
    return CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
}

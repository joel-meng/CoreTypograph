//
//  CustomFontRepresentable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A protocol that is used to define custom font
public protocol CustomFontRepresentable {
    /// A `String` type which represents font family name. Override this variable to provide a family name for custom font.
    var familyName: String { get }

    /// Will return a `String` type font name, which is used to resolve font for `UIFont`. Usually custom font will resolve a font name to
    /// provided font. For example, `Taviraj` regular will resolve to font `Taviraj-Regular`, `Taviraj` bold will resolve to font `Taviraj-Bold`, etc.
    /// Override this function to provide your own font name resolving with font face and font trait, or leave the default implemetation,
    /// which will resovle font name by convention.
    ///
    /// Note: A font name which is resolved in project, a custom font file should be provided in application's bundle.
    ///
    /// - Parameters:
    ///   - fontFace: Font face of type `FontFace`, which is used to resolve font name.
    ///   - trait: Font trait of `FontTrait`, which is used to resolve font name.
    /// - Returns: A string represents font name, for example, `Taviraj-Regular`, `Taviraj-BoldItalic`, etc.
    func name(forFace fontFace: FontFace, trait: FontTrait?) -> String
}

public extension CustomFontRepresentable {
    func name(forFace fontFace: FontFace, trait: FontTrait?) -> String {
        let defaultFontName = "\(familyName)-\(fontFace.rawValue)"
        guard let trait = trait else {
            return defaultFontName
        }

        if fontFace == .regular {
            return "\(familyName)-\(trait.rawValue)"
        }
        return defaultFontName + trait.rawValue
    }
}

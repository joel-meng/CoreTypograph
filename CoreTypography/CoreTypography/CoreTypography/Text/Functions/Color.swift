//
//  Pop.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Text {}

extension Text {
    
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.foregroundColor: value])
        }
    }
}

public enum Canvas {
    public static func background(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.backgroundColor: value])
        }
    }
}

public enum Stroke {}
extension Stroke {
    
    /// This attribute, interpreted as a percentage of font point size, controls the text drawing mode: positive values effect
    /// drawing with stroke only; negative values are for stroke and fill. A typical value for outlined text is 3.0.
    ///
    /// - Parameter value: Interpreted as a percentage of font point size
    /// - Returns: A new `TextStyler`
    public static func width(_ value: Float) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.strokeWidth: value])
        }
    }
    
    /// The stroke color.
    ///
    /// - Parameter value: Value must be a CGColorRef object. Default is the foreground color.
    /// - Returns: A new `TextStyler`
    public static func color(_ value: PlatformColor) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.strokeColor: value])
        }
    }
}

public enum Font {}

extension Font {
    
    public static func font(_ value: PlatformFont) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.font: value])
        }
    }
    
    /// The type of ligatures to use. Arabic text, for example, requires ligatures for many character sequences but has a rich set of
    /// additional ligatures that combine characters. English text has no essential ligatures, and typically has only two standard ligatures,
    /// those for "fi" and "fl"—all others are considered more advanced or fancy.
    ///
    /// - essential: Only ligatures essential for proper rendering of text should be used.
    /// - standard:  Standard ligatures should be used.
    /// - all: All available ligatures should be used
    public enum LigatureStyle: Int {
        case essential  = 0
        case standard   = 1
        case all        = 2
    }
    
    /// Apply ligatures style to text.
    ///
    /// - Parameter value: Ligature trait.
    /// - Returns: A new `TextStyler`
    public static func ligature(_ value: LigatureStyle) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.ligature: value.rawValue])
        }
    }
    
    /// The amount to kern the next character. The value associated with this attribute must be a CFNumber float.
    /// Default is standard kerning. The kerning attribute indicates how many points the following character should be shifted
    /// from its default offset as defined by the current character's font in points: a positive kern indicates a shift farther
    /// away from and a negative kern indicates a shift closer to the current character. If this attribute is not present,
    /// standard kerning is used. If this attribute is set to 0.0, no kerning is done at all.
    ///
    /// - Parameter value: `Float` number, in points
    /// - Returns: A new `TextStyler`
    public static func kern(_ value: Float) -> TextStyler {
        return { attributes in
            return attributes.aggressivelyMerging([.kern: value])
        }
    }
}


public enum Paragraph {
    
    public static func align(_ value: NSTextAlignment) -> TextStyler {
        return { attributes in
            let existingParagraphStyle = attributes[.paragraphStyle] as? NSMutableParagraphStyle
            return attributes.aggressivelyMerging([.paragraphStyle: align(value)(existingParagraphStyle)])
        }
    }
    
    public static func align(_ value: NSTextAlignment) -> ParagraphyStyler {
        return { paragraphStyler in
            let paragraphStyler = paragraphStyler ?? NSMutableParagraphStyle()
            paragraphStyler.alignment = value
            return paragraphStyler
        }
    }
}








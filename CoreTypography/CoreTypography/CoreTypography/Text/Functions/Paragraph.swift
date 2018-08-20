//
//  Paragraph.swift
//  CoreTypography
//
//  Created by Joel on 20/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation


public enum Paragraph {}

public typealias TextAlignment = NSTextAlignment

extension Paragraph {
    
    /// Will align text with given `TextAlignment`.
    ///
    /// - Parameter value: `TextAligment` object, which could be `left`, `center`, `right`, `justified`, `natural`
    /// - Returns: The `TextStyler`
    public static func align(_ value: TextAlignment) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: align)
    }
    
    /// Creates a new `ParagraphyStyler` to which sets the text alignment value.
    ///
    /// - Parameter value: The `TextAlignment` value
    /// - Returns: Newly created `ParagraphyStyler`
    static func align(_ value: TextAlignment) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.alignment = value
            return paragraphStyler
        }
    }
}

func paragraphStyle(fromAttributes attributes: AttributedStringAttributes) -> AttributedStringParagraphStyle {
    return (attributes[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle) ?? NSMutableParagraphStyle()
}

func overrideParagraphAttributes<T>(withValue value: T, stylerFactory factory: @escaping (T) -> ParagraphyStyler) -> TextStyler {
    return { attributes in
        let existingParagraphStyle: AttributedStringParagraphStyle = paragraphStyle(fromAttributes: attributes)
        return attributes.aggressivelyMerging([.paragraphStyle: factory(value)(existingParagraphStyle)])
    }
}

extension Paragraph {
    
    public static func firstlineIndent(_ value: DisplayUnit<Float>) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: firstlineIndent)
    }
    
    static func firstlineIndent(_ distance: DisplayUnit<Float>) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.firstLineHeadIndent = distance.rawValue
            return paragraphStyler
        }
    }
}


extension Paragraph {
    
    public typealias LineBreakMode = NSLineBreakMode
    
    public static func lineBreakMode(_ value: LineBreakMode) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: lineBreakMode)
    }
    
    static func lineBreakMode(_ value: LineBreakMode) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.lineBreakMode = value
            return paragraphStyler
        }
    }
}

extension Paragraph {
    
    /// Will add head intent to given attributes by given value `DisplayUnit`.
    ///
    /// - Parameter value: The indent value by points.
    /// - Returns: The `TextStyler`.
    public static func headIndent(_ value: DisplayUnit<CGFloat>) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: headIndent)
    }
    
    /// Creates a new `ParagraphyStyler` to which sets <#function#>
    ///
    /// - Parameter value: The head indent value by points.
    /// - Returns: Newly created `ParagraphyStyler`.
    static func headIndent(_ value: DisplayUnit<CGFloat>) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.headIndent = value.rawValue
            return paragraphStyler
        }
    }
}

extension Paragraph {
    
    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The display unit in points that overrides current setting.
    /// - Returns: A `TextStyler`
    public static func tailIndent(_ value: DisplayUnit<CGFloat>) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: tailIndent)
    }

    /// Creates a new `ParagraphyStyler` to which sets tail indent.
    ///
    /// - Parameter value: The tail indent point value
    /// - Returns: Newly created `ParagraphyStyler`
    static func tailIndent(_ value: DisplayUnit<CGFloat>) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.tailIndent = value.rawValue
            return paragraphStyler
        }
    }
}

extension Paragraph {
    
    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The line height multiple.
    /// - Returns: A `TextStyler`.
    public static func lineHeightMultiple(_ value: DisplayUnit<CGFloat>) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: lineHeightMultiple)
    }
    
    /// Creates a new `ParagraphyStyler` to which sets line height multiple.
    ///
    /// - Parameter value: The line height multiple.
    /// - Returns: Newly created `ParagraphyStyler`
    static func lineHeightMultiple(_ value: DisplayUnit<CGFloat>) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.lineHeightMultiple = value.rawValue
            return paragraphStyler
        }
    }
}

extension Paragraph {
    
    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The maximum line height value, in points.
    /// - Returns: A `TextStyler`.
    public static func maximumLineHeight(_ value: DisplayUnit<CGFloat>) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: maximumLineHeight)
    }
    
    /// Creates a new `ParagraphyStyler` to which sets maximum line height in points.
    ///
    /// - Parameter value: The maximum line height value, in points.
    /// - Returns: Newly created `ParagraphyStyler`
    static func maximumLineHeight(_ value: DisplayUnit<CGFloat>) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.maximumLineHeight = value.rawValue
            return paragraphStyler
        }
    }
}

extension Paragraph {
    
    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The minimum line height value, in points.
    /// - Returns: A `TextStyler`.
    public static func minimumLineHeight(_ value: DisplayUnit<CGFloat>) -> TextStyler {
        return overrideParagraphAttributes(withValue: value, stylerFactory: minimumLineHeight)
    }
    
    /// Creates a new `ParagraphyStyler` to which sets minimum line height value, in points.
    ///
    /// - Parameter value: The minimum line height value, in points.
    /// - Returns: Newly created `ParagraphyStyler`
    static func minimumLineHeight(_ value: DisplayUnit<CGFloat>) -> ParagraphyStyler {
        return { paragraphStyler in
            paragraphStyler.minimumLineHeight = value.rawValue
            return paragraphStyler
        }
    }
}

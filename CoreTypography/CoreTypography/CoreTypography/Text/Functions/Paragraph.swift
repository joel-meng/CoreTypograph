//
//  Paragraph.swift
//  CoreTypography
//
//  Created by Joel on 20/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Paragraph {}

/// Return obtained paragraph style from given attributes, or new `NSMutableParagraphStyle` object if not exits.
///
/// - Parameter attributes: The `AttributedStringAttributes` from which the `ParagraphStyle` to obtain from.
/// - Returns: `ParagraphStyle` that defined in `AttributedStringAttributes`
func paragraphStyle(fromAttributes attributes: Attributes) -> ParagraphStyle {
    return (attributes[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle) ?? NSMutableParagraphStyle()
}

/// A generic function that applies value to keyPath on given target. In this case, target must be reference type.
///
/// - Parameters:
///   - value: The value to assign to target.
///   - keyPath: The property to assign value to.
///   - target: The target to assign value to.
/// - Returns: The reference type target that with updated value.
@discardableResult
func assignValue<Value: RawRepresentable, ValueType, Target>(_ value: Value,
                                                             toKeyPath keyPath: ReferenceWritableKeyPath<Target, ValueType>,
                                                             onTarget target: Target) -> Target where Value.RawValue == ValueType {
    target[keyPath: keyPath] = value.rawValue
    return target
}

/// Will return a `TextStyler` who applies paragraph attributed value onto text attributes(overriding existing one).
///
/// - Parameters:
///   - value: The paragraph attribute value which must be `RawRepresentable`.
///   - keyPath: The paragraph attribute property.
/// - Returns: `TextStyler` who puts paragraph attribute value onto the property and adds to text attributes.
func textParagraphStyler<Value: RawRepresentable, ValueType>(withValue value: Value,
                                                             onKeyPath keyPath: ReferenceWritableKeyPath<ParagraphStyle, ValueType>)
    -> TextStyler where Value.RawValue == ValueType {
    return { attributes in
        let existingParagraphStyle = paragraphStyle(fromAttributes: attributes)
        let updatedParagraphStyle = assignValue(value, toKeyPath: keyPath, onTarget: existingParagraphStyle)
        return attributes.aggressivelyMerging([.paragraphStyle: updatedParagraphStyle])
    }
}

/// Will return a `TextStyler` who applies paragraph attributed value onto text attributes(overriding existing one).
///
/// - Parameters:
///   - value: The paragraph attribute value.
///   - keyPath: The paragraph attribute property.
/// - Returns: `TextStyler` who puts paragraph attribute value onto the property and adds to text attributes.
func textParagraphStyler<ValueType>(withValue value: ValueType,
                                    onKeyPath keyPath: ReferenceWritableKeyPath<ParagraphStyle, ValueType>) -> TextStyler {
    return { attributes in
        let existingParagraphStyle = paragraphStyle(fromAttributes: attributes)
        existingParagraphStyle[keyPath: keyPath] = value
        return attributes.aggressivelyMerging([.paragraphStyle: existingParagraphStyle])
    }
}

extension Paragraph {
    public typealias LineBreakMode = NSLineBreakMode

    public typealias TextAlignment = NSTextAlignment

    /// Will return a `TextStyler` who sets text attributes' `FirstLineIndent` with given value.
    ///
    /// - Parameter value: The display unit for `firstLineIndent`.
    /// - Returns: `TextStyler` who sets text attributes.
    public static func firstlineIndent<Unit: RawRepresentable>(_ value: Unit) -> TextStyler where Unit.RawValue == CGFloat {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.firstLineHeadIndent)
    }

    /// Will align text with given `TextAlignment`.
    ///
    /// - Parameter value: `TextAligment` object, which could be `left`, `center`, `right`, `justified`, `natural`
    /// - Returns: The `TextStyler`
    public static func align(_ value: TextAlignment) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.alignment)
    }

    /// Will add head intent to given attributes by given value `DisplayUnit`.
    ///
    /// - Parameter value: The indent value by points.
    /// - Returns: The `TextStyler`.
    public static func headIndent(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.headIndent)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The display unit in points that overrides current setting.
    /// - Returns: A `TextStyler`
    public static func tailIndent(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.tailIndent)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The line height multiple.
    /// - Returns: A `TextStyler`.
    public static func lineHeightMultiple(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.lineHeightMultiple)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph setting by the new value.
    ///
    /// - Parameter value: The maximum line height value, in points.
    /// - Returns: A `TextStyler`.
    public static func maximumLineHeight(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.maximumLineHeight)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph `minimumLineHeight` by the new value.
    ///
    /// - Parameter value: The minimum line height value, in points.
    /// - Returns: A `TextStyler`.
    public static func minimumLineHeight(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.minimumLineHeight)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph `lineSpace` setting
    /// which is the distance between the paragraph’s top and the beginning of its text content by the new value.
    ///
    /// - Parameter value: `Linespacing` value, in points.
    /// - Returns: A `TextStyler`.
    public static func lineSpacing(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.lineSpacing)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph `paragraphSpacing` setting
    /// which is the space after the end of the paragraph by the new value.
    ///
    /// - Parameter value: `ParagraphSpacing` value, in points. The space after the end of the paragraph.
    /// - Returns: A `TextStyler`.
    public static func paragraphSpacing(_ value: ScreenPoint<CGFloat>) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.paragraphSpacing)
    }

    /// Will return an `TextStyler` that can override given attributes's paragraph setting which is the mode that should be used
    /// to break lines in the paragraph, by the new value.
    ///
    /// - Parameter value: `LineBreakMode`, which is just a alias of `NSLineBreakMode`.
    /// - Returns: The `TextStyler`.
    public static func lineBreakMode(_ value: LineBreakMode) -> TextStyler {
        return textParagraphStyler(withValue: value, onKeyPath: \ParagraphStyle.lineBreakMode)
    }
}

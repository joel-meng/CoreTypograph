//
//  ContextualAlternates.swift
//  CoreTypography
//
//  Created by MENG, Joel on 25/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Ligatures feature type permits selection from different kinds of ligatures. It is a non-exclusive feature type.
public struct ContextualAlternates: OptionSet {
    public var rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let contextualOn = ContextualAlternates(rawValue: 1 << 0)
    public static let contextualOff = ContextualAlternates(rawValue: 1 << 1)
    public static let swashOn = ContextualAlternates(rawValue: 1 << 2)
    public static let swashOff = ContextualAlternates(rawValue: 1 << 3)
    public static let contextualSwashOn = ContextualAlternates(rawValue: 1 << 4)
    public static let contextualSwashOff = ContextualAlternates(rawValue: 1 << 5)
}

extension ContextualAlternates: FontFeaturesProviding {
    func fontFeatures() -> [FontFeatureAttribute] {
        var fontFeatureAttributes: [FontFeatureAttribute] = []

        if contains(.contextualOn) {
            fontFeatureAttributes.append(AlternatesContextual.on.fontFeature())
        }

        if contains(.contextualOff) {
            fontFeatureAttributes.append(AlternatesContextual.off.fontFeature())
        }

        if contains(.swashOn) {
            fontFeatureAttributes.append(AlternatesSwash.on.fontFeature())
        }

        if contains(.swashOff) {
            fontFeatureAttributes.append(AlternatesSwash.off.fontFeature())
        }

        if contains(.contextualSwashOn) {
            fontFeatureAttributes.append(AlternatesContextualSwash.on.fontFeature())
        }

        if contains(.contextualSwashOff) {
            fontFeatureAttributes.append(AlternatesContextualSwash.off.fontFeature())
        }

        return fontFeatureAttributes
    }
}

/// Turn alternates on or off for context-dependent glyphs
///
/// - on: Alternates on.
/// - off: Alternates off.
enum AlternatesContextual: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kContextualAlternatesType, selectorIdentifier: kContextualAlternatesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kContextualAlternatesType, selectorIdentifier: kContextualAlternatesOffSelector)
        }
    }

    case on
    case off
}

/// Turn alternates on or off for context-dependent swashes
///
/// - on: Alternates on.
/// - off: Alternates off.
enum AlternatesSwash: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kContextualAlternatesType, selectorIdentifier: kSwashAlternatesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kContextualAlternatesType, selectorIdentifier: kSwashAlternatesOffSelector)
        }
    }

    case on
    case off
}

/// Turn alternates on or off for context-dependent glyphs and swashes
///
/// - on: Alternates on.
/// - off: Alternates off.
enum AlternatesContextualSwash: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kContextualAlternatesType, selectorIdentifier: kContextualSwashAlternatesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kContextualAlternatesType, selectorIdentifier: kContextualSwashAlternatesOffSelector)
        }
    }

    case on
    case off
}

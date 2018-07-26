//
//  SmartSwash.swift
//  CoreTypography
//
//  Created by MENG, Joel on 21/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Smart Swashes feature type controls contextual swash substitution. These are swashes that
/// appear based on an analysis of context, rather than via simple substitution.
/// This is a non-exclusive feature type

public struct SmartSwash: OptionSet {
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let wordInitialOn = SmartSwash(rawValue: 1 << 0)
    public static let wordInitialOff = SmartSwash(rawValue: 1 << 1)
    public static let wordFinalOn = SmartSwash(rawValue: 1 << 2)
    public static let wordFinalOff = SmartSwash(rawValue: 1 << 3)
    public static let lineInitialOn = SmartSwash(rawValue: 1 << 4)
    public static let lineInitialOff = SmartSwash(rawValue: 1 << 5)
    public static let lineFinalOn = SmartSwash(rawValue: 1 << 6)
    public static let lineFinalOff = SmartSwash(rawValue: 1 << 7)
    public static let nonFinalOn = SmartSwash(rawValue: 1 << 8)
    public static let nonFinalOff = SmartSwash(rawValue: 1 << 9)
}

extension SmartSwash: FontFeaturesProviding {
    func fontFeatures() -> [FontFeatureAttribute] {
        var fontFeatureAttributes: [FontFeatureAttribute] = []
        
        if contains(.wordInitialOn) {
            fontFeatureAttributes.append(WordInitial.on.fontFeature())
        }
        
        if contains(.wordInitialOff) {
            fontFeatureAttributes.append(WordInitial.off.fontFeature())
        }
        
        if contains(.wordFinalOn) {
            fontFeatureAttributes.append(WordFinal.on.fontFeature())
        }
        
        if contains(.wordFinalOff) {
            fontFeatureAttributes.append(WordFinal.off.fontFeature())
        }
        
        if contains(.lineInitialOn) {
            fontFeatureAttributes.append(LineInitial.on.fontFeature())
        }
        
        if contains(.lineInitialOff) {
            fontFeatureAttributes.append(LineInitial.off.fontFeature())
        }
        
        if contains(.lineFinalOn) {
            fontFeatureAttributes.append(LineFinal.on.fontFeature())
        }
        
        if contains(.lineFinalOff) {
            fontFeatureAttributes.append(LineFinal.off.fontFeature())
        }
        
        if contains(.nonFinalOn) {
            fontFeatureAttributes.append(NonFinal.on.fontFeature())
        }
        
        if contains(.nonFinalOff) {
            fontFeatureAttributes.append(NonFinal.off.fontFeature())
        }
        
        return fontFeatureAttributes
    }
}

/// Special forms that can appear at the start of a word (or a line).
///
/// - on: Word initial SmartSwash on.
/// - off: Word initial SmartSwash off.
public enum WordInitial: FontFeatureProviding {
    
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return attribute(feature: kSmartSwashType, selector: kWordInitialSwashesOnSelector)
        case .off:
            return attribute(feature: kSmartSwashType, selector: kWordInitialSwashesOffSelector)
        }
    }
    
    case on
    case off
}

/// Special forms that can appear at the end of a word (or a line).
///
/// - on: Word final Swashes on.
/// - off: Word final Swashes off.
public enum WordFinal: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return attribute(feature: kSmartSwashType, selector: kWordFinalSwashesOnSelector)
        case .off:
            return attribute(feature: kSmartSwashType, selector: kWordFinalSwashesOffSelector)
        }
    }
    
    case on
    case off
}

/// Special forms that can appear only at the start of a line. This is unsupported in CoreText.
///
/// - on: Line initial Swashes on.
/// - off: Line initial Swashes off.
public enum LineInitial: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return attribute(feature: kSmartSwashType, selector: kLineInitialSwashesOnSelector)
        case .off:
            return attribute(feature: kSmartSwashType, selector: kLineInitialSwashesOffSelector)
        }
    }
    
    case on
    case off
}

/// Special forms that can appear only at the end of a line. This is unsupported in CoreText.
///
/// - on: Line final Swashes on.
/// - off: Line final Swashes off.
public enum LineFinal: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return attribute(feature: kSmartSwashType, selector: kLineFinalSwashesOnSelector)
        case .off:
            return attribute(feature: kSmartSwashType, selector: kLineFinalSwashesOffSelector)
        }
    }
    
    case on
    case off
}

/// Forms that are used at the beginning or middle of words. An example of this is the archaic
/// use of the long-s (ſ) for a medial s.
///
/// - on: NonFinal Swashes on.
/// - off: NonFinal Swashes off.
public enum NonFinal: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return attribute(feature: kSmartSwashType, selector: kNonFinalSwashesOnSelector)
        case .off:
            return attribute(feature: kSmartSwashType, selector: kNonFinalSwashesOffSelector)
        }
    }
    case on
    case off
}

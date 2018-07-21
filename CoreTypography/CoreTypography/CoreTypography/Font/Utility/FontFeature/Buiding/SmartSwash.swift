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

/// Special forms that can appear at the start of a word (or a line).
///
/// - on: Word initial SmartSwash on.
/// - off: Word initial SmartSwash off.
public enum WordInitialSmartSwash: FontFeatureProviding {
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
public enum WordFinalSwashes: FontFeatureProviding {
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
public enum LineInitialSwashes: FontFeatureProviding {
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
public enum LineFinalSwashes: FontFeatureProviding {
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
public enum NonFinalSwashes: FontFeatureProviding {
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

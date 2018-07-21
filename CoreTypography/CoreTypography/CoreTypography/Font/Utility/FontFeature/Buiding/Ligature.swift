//
//  Ligature.swift
//  CoreTypography
//
//  Created by MENG, Joel on 20/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// The Ligatures feature type permits selection from different kinds of ligatures. It is a non-exclusive feature type.

/// Required Ligatures. Those ligatures that are linguistically required, such as occur in Arabic or Hindi.
/// This should generally not be visible in the UI.
///
/// - on: Required ligatures on.
/// - off: Required ligatures off.
public enum RequiredLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRequiredLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRequiredLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// The ligatures that usually appear in well-set text, for instance the "fi" and "fl" ligatures in English.
/// (Note that such ligatures may be serpately encoded within Unicode, but only as compatibility characters.)
///
/// - on: Common ligatures on.
/// - off: Common ligatures off.
public enum CommonLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kCommonLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kCommonLigaturesOffSelector)
        }
    }
    
    case on
    case off
}


/// Ligatures in a font that are less common than those included in the Common category, for instance an "fj" ligature.
/// (Note that such ligatures may be serpately encoded within Unicode, but only as compatibility characters.)
///
/// - on: Rare ligatures on.
/// - off: Rare ligatures off.
public enum RareLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRareLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRareLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// Ligatures that are pictures representing words or syllables.
///
/// - on: Rebus pictures on.
/// - off: Rebus pictures off.
public enum RebusPictures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRebusPicturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRebusPicturesOffSelector)
        }
    }
    
    case on
    case off
}

/// Ligatures like Æ and æ. The use of this selector is strongly discouraged.
///
/// - on: Diphthong ligatures on
/// - off: Diphthong ligatures off
public enum DiphthongLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kDiphthongLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kDiphthongLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// These are ligatures where the component letters are arranged in a lattice, such that the ligature fits into the space of a single letter.
/// For examples, see Unicodes U+3300 through U+3357 and U+337B through U+337F.
///
/// - on: Squared ligatures on.
/// - off: Squared ligatures off.
public enum SquaredLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kSquaredLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kSquaredLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// These are similar to the previously described ligatures, but in abbreviated form.
///
/// - on: Abbreviated squared ligatures on.
/// - off: Abbreviated squared ligatures off.
public enum AbbreviatedSquaredLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kAbbrevSquaredLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kAbbrevSquaredLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// Ligatures displayed using a graphic (e.g., emoji)
///
/// - on: Symbol ligatures on.
/// - off: Symbol ligatures off.
public enum SymbolLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kSymbolLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kSymbolLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// Ligatures which appear in some context and not in others.
///
/// - on: Contextual ligatures on.
/// - off: Contextual ligatures off.
public enum ContextualLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kContextualLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kContextualLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

/// Ligatures which are generally not in current use.
///
/// - on: Historical ligatures on.
/// - off: Historical ligatures off.
public enum HistoricalLigatures: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .on:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kHistoricalLigaturesOnSelector)
        case .off:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kHistoricalLigaturesOffSelector)
        }
    }
    
    case on
    case off
}

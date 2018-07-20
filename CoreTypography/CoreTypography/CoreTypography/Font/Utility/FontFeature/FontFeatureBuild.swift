//
//  FontFeatureCreate.swift
//  CoreTypography
//
//  Created by MENG, Joel on 19/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation
import UIKit

public typealias FeatureTypeIdentifier = Int
public typealias FeatureSelectorIdentifier = Int
public typealias FontFeatureSetting = [UIFontDescriptor.FeatureKey: Int]

public class FontFeatureBuilder {
    
    private var fontFeatureAttributes: [FontFeatureAttribute] = []
    
    public init(building: (FontFeatureBuilder) -> Void) {
        building(self)
    }
    
    @discardableResult
    public func numberSpacing(_ setting: NumberSpacing) -> FontFeatureBuilder {
        fontFeatureAttributes.append(setting.fontFeature())
        return self
    }
    
    @discardableResult
    public func upperCase(_ setting: UpperCase) -> FontFeatureBuilder {
        fontFeatureAttributes.append(setting.fontFeature())
        return self
    }
    
    @discardableResult
    public func ligature(_ ligatureSelectors: Ligature) -> FontFeatureBuilder {
        fontFeatureAttributes.append(ligatureSelectors.fontFeature())
        return self
    }
    
    @discardableResult
    public func ligature(required `switch`: Switch) -> FontFeatureBuilder {
        let selector = `switch`.isOn ? kRequiredLigaturesOnSelector : kRequiredLigaturesOffSelector
        let feature = FontFeatureAttribute(featureIdentifier: kLigaturesType,
                                           selectorIdentifier: selector)
        fontFeatureAttributes.append(feature)
        return self
    }
    
    public func build() -> [FontFeatureSetting] {
        return fontFeatureAttributes.map { (attribute) -> FontFeatureSetting in
            attribute.featureSetting()
        }
    }
}

private protocol FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute
}


public enum Switch {
    case on
    case off
    
    var isOn: Bool {
        switch self {
        case .on:
            return true
        case .off:
            return false
        }
    }
    
    var isOff: Bool {
        return !isOn
    }
    
}

public enum LigatureRequired: FontFeatureProviding {
    fileprivate func fontFeature() -> FontFeatureAttribute {
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

public struct Ligature: OptionSet, FontFeatureProviding {
    fileprivate func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .requiredLigaturesOn:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRequiredLigaturesOnSelector)
        case .requiredLigaturesOff:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRequiredLigaturesOffSelector)
        case .commonLigaturesOn:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kCommonLigaturesOnSelector)
        case .commonLigaturesOff:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kCommonLigaturesOffSelector)
        case .rareLigaturesOn:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRareLigaturesOnSelector)
        case .rareLigaturesOff:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRareLigaturesOffSelector)
        default:
            return FontFeatureAttribute(featureIdentifier: kLigaturesType, selectorIdentifier: kRequiredLigaturesOffSelector)
        }
    }
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let requiredLigaturesOn  = Ligature(rawValue: 1 << 0)
    public static let requiredLigaturesOff = Ligature(rawValue: 1 << 1)
    
    public static let commonLigaturesOn    = Ligature(rawValue: 1 << 2)
    public static let commonLigaturesOff   = Ligature(rawValue: 1 << 3)
    
    public static let rareLigaturesOn      = Ligature(rawValue: 1 << 4)
    public static let rareLigaturesOff     = Ligature(rawValue: 1 << 5)
}

public enum UpperCase: FontFeatureProviding {
    func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .`default`:
            return FontFeatureAttribute(featureIdentifier: kUpperCaseType, selectorIdentifier: kDefaultUpperCaseSelector)
        case .smallCaps:
            return FontFeatureAttribute(featureIdentifier: kUpperCaseType, selectorIdentifier: kUpperCaseSmallCapsSelector)
        case .petiteCaps:
            return FontFeatureAttribute(featureIdentifier: kUpperCaseType, selectorIdentifier: kUpperCasePetiteCapsSelector)
        }
    }
    
    case `default`
    case smallCaps
    case petiteCaps
}

public enum NumberSpacing: FontFeatureProviding {
    
    fileprivate func fontFeature() -> FontFeatureAttribute {
        switch self {
        case .mono:
            return FontFeatureAttribute(featureIdentifier: kNumberSpacingType, selectorIdentifier: kMonospacedNumbersSelector)
        case .proportional:
            return FontFeatureAttribute(featureIdentifier: kNumberSpacingType, selectorIdentifier: kProportionalNumbersSelector)
        }
    }
    
    case mono
    case proportional
}

enum VerticalPosition {
    fileprivate static func normal() -> FontFeatureAttribute {
        return FontFeatureAttribute(featureIdentifier: kVerticalPositionType, selectorIdentifier: kNormalPositionSelector)
    }
    
    fileprivate static func superior() -> FontFeatureAttribute {
        return FontFeatureAttribute(featureIdentifier: kVerticalPositionType, selectorIdentifier: kSuperiorsSelector)
    }
    
    fileprivate static func inferior() -> FontFeatureAttribute {
        return FontFeatureAttribute(featureIdentifier: kVerticalPositionType, selectorIdentifier: kInferiorsSelector)
    }
    
    fileprivate static func ordinal() -> FontFeatureAttribute {
        return FontFeatureAttribute(featureIdentifier: kVerticalPositionType, selectorIdentifier: kOrdinalsSelector)
    }
    
    fileprivate static func scientificInferior() -> FontFeatureAttribute {
        return FontFeatureAttribute(featureIdentifier: kVerticalPositionType, selectorIdentifier: kScientificInferiorsSelector)
    }
}

struct FontFeatureAttribute: Hashable {
    
    private let featureIdentifier: FeatureTypeIdentifier
    private let selectorIdentifier: FeatureSelectorIdentifier
    
    fileprivate init(featureIdentifier: FeatureTypeIdentifier, selectorIdentifier: FeatureSelectorIdentifier) {
        self.featureIdentifier = featureIdentifier
        self.selectorIdentifier = selectorIdentifier
    }
    
    var hashValue: Int {
        return featureIdentifier.hashValue ^ selectorIdentifier.hashValue
    }
    
    static func ==(lhs: FontFeatureAttribute, rhs: FontFeatureAttribute) -> Bool {
        return (lhs.featureIdentifier == rhs.featureIdentifier) &&
            (lhs.selectorIdentifier == rhs.selectorIdentifier)
    }
    
    func featureSetting() -> FontFeatureSetting {
        return [
            UIFontDescriptor.FeatureKey.featureIdentifier: featureIdentifier,
            UIFontDescriptor.FeatureKey.typeIdentifier: selectorIdentifier,
        ]
    }
}

fileprivate typealias FontFeatureAttributeSet = Set<FontFeatureAttribute>

public final class FontFeatureBuildingNampeSpace {
    
    // MARK: -
    
    fileprivate static func composite(_ fontFeatureAttribute: FontFeatureAttribute, with fontFeatureAttributeSet: FontFeatureAttributeSet) -> FontFeatureAttributeSet {
        return fontFeatureAttributeSet.union(Set([fontFeatureAttribute]))
    }
    
//    fileprivate static func addingFeature(featureIdentifier: FeatureTypeIdentifier,
//                                   selectorIdentifier: FeatureSelectorIdentifier,
//                                   toFontFeatureAttributeSet fontFeatureAttributeSet: FontFeatureAttributeSet) -> FontFeatureAttributeSet {
//        let featureAttribute = Set([FontFeatureAttribute(featureIdentifier: featureIdentifier, selectorIdentifier: selectorIdentifier)])
//        return fontFeatureAttributeSet.union(featureAttribute)
//    }
    
//    fileprivate  static func adding(fontFeatureAttributeSet: FontFeatureAttributeSet) -> (FeatureTypeIdentifier, FeatureSelectorIdentifier)
//        -> FontFeatureAttributeSet {
//            return { featureIdentifier, selectorIdentifier in
//                let featureAttribute = Set([FontFeatureAttribute(featureIdentifier: featureIdentifier, selectorIdentifier: selectorIdentifier)])
//                return fontFeatureAttributeSet.union(featureAttribute)
//            }
//    }
}

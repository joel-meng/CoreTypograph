//
//  FontFeatureCreate.swift
//  CoreTypography
//
//  Created by MENG, Joel on 19/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

public typealias FeatureTypeIdentifier = Int
public typealias FeatureSelectorIdentifier = Int
public typealias FontFeatureSetting = [UIFontDescriptor.FeatureKey: Int]


/// OpenType features builder.
/// See https://helpx.adobe.com/typekit/using/open-type-syntax.html
/// https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html
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
    public func ligature(required `switch`: Switch) -> FontFeatureBuilder {
        let selector = `switch`.isOn ? kRequiredLigaturesOnSelector : kRequiredLigaturesOffSelector
        let feature = FontFeatureAttribute(featureIdentifier: kLigaturesType,
                                           selectorIdentifier: selector)
        fontFeatureAttributes.append(feature)
        return self
    }
    
    @discardableResult
    public func verticalPosition(_ verticalPosition: VerticalPosition) -> FontFeatureBuilder {
        fontFeatureAttributes.append(verticalPosition.fontFeature())
        return self
    }
    
    public func build() -> [FontFeatureSetting] {
        return fontFeatureAttributes.map { (attribute) -> FontFeatureSetting in
            attribute.featureSetting()
        }
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

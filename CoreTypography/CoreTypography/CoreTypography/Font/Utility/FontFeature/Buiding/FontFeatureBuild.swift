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
    public func numberSpacing(_ numberSpacing: NumberSpacing) -> FontFeatureBuilder {
        fontFeatureAttributes.append(numberSpacing.fontFeature())
        return self
    }
    
    @discardableResult
    public func upperCase(_ upperCase: UpperCase) -> FontFeatureBuilder {
        fontFeatureAttributes.append(upperCase.fontFeature())
        return self
    }
    
    @discardableResult
    public func requiredLigature(_ requiredLigatures: RequiredLigatures) -> FontFeatureBuilder {
        fontFeatureAttributes.append(requiredLigatures.fontFeature())
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

func attribute(feature: FeatureTypeIdentifier, selector: FeatureSelectorIdentifier) -> FontFeatureAttribute {
    return FontFeatureAttribute(featureIdentifier: feature, selectorIdentifier: selector)
}

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

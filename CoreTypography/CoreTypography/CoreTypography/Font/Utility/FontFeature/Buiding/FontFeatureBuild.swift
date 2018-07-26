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

public class FontBuilder {
    
    private var builder: FontFeatureBuilder = FontFeatureBuilder()
    
    public init(building: (FontFeatureBuilder) -> Void) {
        building(builder)
    }
    
    public func build() -> UIFont {
        let fontDescriptor = UIFontDescriptor(fontAttributes: builder.build())
        return UIFont(descriptor: fontDescriptor, size: 20)
    }
}

/// OpenType features builder.
/// See https://helpx.adobe.com/typekit/using/open-type-syntax.html
/// https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html
public class FontFeatureBuilder {
    
    private var fontFeatureAttributes: [FontFeatureAttribute] = []
    
    private var name: String?
    
    private var face: String?
    
    private var family: String?
    
    @discardableResult
    public func name(_ name: String) -> FontFeatureBuilder {
        self.name = name
        return self
    }
    
    @discardableResult
    public func face(_ face: String) -> FontFeatureBuilder {
        self.face = face
        return self
    }
    
    @discardableResult
    public func family(_ family: String) -> FontFeatureBuilder {
        self.family = family
        return self
    }
    
    @discardableResult
    public func textSpacing(_ textSpacing: TextSpacing) -> FontFeatureBuilder {
        fontFeatureAttributes.append(textSpacing.fontFeature())
        return self
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
    public func lowerCase(_ lowerCase: LowerCase) -> FontFeatureBuilder {
        fontFeatureAttributes.append(lowerCase.fontFeature())
        return self
    }
    
    @discardableResult
    public func fraction(_ fraction: Fraction) -> FontFeatureBuilder {
        fontFeatureAttributes.append(fraction.fontFeature())
        return self
    }
    
    @discardableResult
    public func verticalPosition(_ verticalPosition: VerticalPosition) -> FontFeatureBuilder {
        fontFeatureAttributes.append(verticalPosition.fontFeature())
        return self
    }
    
    @discardableResult
    public func ligatures(_ ligatures: Ligature) -> FontFeatureBuilder {
        fontFeatureAttributes += ligatures.fontFeatures()
        return self
    }
    
    @discardableResult
    public func swash(_ swash: SmartSwash) -> FontFeatureBuilder {
        fontFeatureAttributes += swash.fontFeatures()
        return self
    }
    
    @discardableResult
    public func contextualAlternates(_ contextualAlternates: ContextualAlternates) -> FontFeatureBuilder {
        fontFeatureAttributes += contextualAlternates.fontFeatures()
        return self
    }
    
    // MARK: - Building
    
    private func buildFeatures() -> [UIFontDescriptor.AttributeName: Any]? {
        let fontFeatures = fontFeatureAttributes.map { (attribute) -> FontFeatureSetting in
            attribute.featureSetting()
        }
        
        guard !fontFeatures.isEmpty else {
            return nil
        }
        return [UIFontDescriptor.AttributeName.featureSettings: fontFeatures]
    }
    
    private func familyAttribute() -> [UIFontDescriptor.AttributeName: String]? {
        return buildAttribute(with: UIFontDescriptor.AttributeName.family, value: family)
    }
    
    private func faceAttribute() -> [UIFontDescriptor.AttributeName: String]? {
        return buildAttribute(with: UIFontDescriptor.AttributeName.face, value: face)
    }
    
    private func nameAttribute() -> [UIFontDescriptor.AttributeName: String]? {
        return buildAttribute(with: UIFontDescriptor.AttributeName.name, value: name)
    }
    
    private func buildAttribute(with key: UIFontDescriptor.AttributeName, value: String?) -> [UIFontDescriptor.AttributeName: String]? {
        guard let value = value else {
            return nil
        }
        return [key: value]
    }
    
    func build() -> [UIFontDescriptor.AttributeName: Any] {
        var composingResult: [UIFontDescriptor.AttributeName: Any] = [:]
        
        if let fontFeatures = buildFeatures() {
            composingResult = composingResult.merging(fontFeatures){ (current, new) in current }
        }
        
        if let nameAttribute = nameAttribute() {
            composingResult = composingResult.merging(nameAttribute) { current, _ in current }
        }
        
        if let faceAttribute = faceAttribute() {
            composingResult = composingResult.merging(faceAttribute) { current, _ in current }
        }
        
        if let familyAttribute = familyAttribute() {
            composingResult = composingResult.merging(familyAttribute) { current, _ in current }
        }
        
        return composingResult
    }
}

fileprivate typealias FontFeatureAttributeSet = Set<FontFeatureAttribute>

func attribute(feature: FeatureTypeIdentifier, selector: FeatureSelectorIdentifier) -> FontFeatureAttribute {
    return FontFeatureAttribute(featureIdentifier: feature, selectorIdentifier: selector)
}

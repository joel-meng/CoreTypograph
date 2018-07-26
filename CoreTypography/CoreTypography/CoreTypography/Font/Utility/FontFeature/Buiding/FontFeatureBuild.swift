//
//  FontFeatureCreate.swift
//  CoreTypography
//
//  Created by MENG, Joel on 19/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

typealias FeatureTypeIdentifier = Int
typealias FeatureSelectorIdentifier = Int
typealias FontFeatureSetting = [UIFontDescriptor.FeatureKey: Int]
typealias FontAttributes = [UIFontDescriptor.AttributeName: Any]


/// A font builder that creates a `UIFont` object from `FontFeatureBuilder`'s result which is an array of `FontAttribute`.
public final class FontBuilder {
    
    private var builder: Builder = Builder()
    
    public init(building: (Builder) -> Void) {
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
public final class Builder {
    
    /// Storing an array of `FontFeatureAttribute` that passing into current builder.
    private var fontFeatureAttributes: [FontFeatureAttribute] = []
    
    /// Storing an optional `String` of font name
    private var name: String?
    
    /// Storing an optional `String` of font face
    private var face: String?
    
    /// Storing an optional `String` of font family
    private var family: String?
    
    /// Will put `String` type font name into consideration of creating a `UIFont`
    ///
    /// - Parameter name: `String` type font name
    /// - Returns: Current builder
    @discardableResult
    public func name(_ name: String) -> Builder {
        self.name = name
        return self
    }
    
    /// Will put `String` type font face into consideration of creating a `UIFont`
    ///
    /// - Parameter name: `String` type font face
    /// - Returns: Current builder
    @discardableResult
    public func face(_ face: String) -> Builder {
        self.face = face
        return self
    }
    
    /// Will put `String` type font family into consideration of creating a `UIFont`
    ///
    /// - Parameter name: `String` type font family
    /// - Returns: Current builder
    @discardableResult
    public func family(_ family: String) -> Builder {
        self.family = family
        return self
    }
    
    /// Text spacing font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter textSpacing: Text spacing type.
    /// - Returns: Current builder
    @discardableResult
    public func textSpacing(_ textSpacing: TextSpacing) -> Builder {
        fontFeatureAttributes.append(textSpacing.fontFeature())
        return self
    }
    
    /// Number spacing font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter numberSpacing: Number spacing type.
    /// - Returns: Current builder
    @discardableResult
    public func numberSpacing(_ numberSpacing: NumberSpacing) -> Builder {
        fontFeatureAttributes.append(numberSpacing.fontFeature())
        return self
    }
    
    /// Number case font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter numberCase: Number case type.
    /// - Returns: Current builder
    @discardableResult
    public func numberCase(_ numberCase: NumberCase) -> Builder {
        fontFeatureAttributes.append(numberCase.fontFeature())
        return self
    }
    
    /// Upper case font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter upperCase: Upper case type.
    /// - Returns: Current builder
    @discardableResult
    public func upperCase(_ upperCase: UpperCase) -> Builder {
        fontFeatureAttributes.append(upperCase.fontFeature())
        return self
    }
    
    /// Lower case font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter lowerCase: Lower case type.
    /// - Returns: Current builder
    @discardableResult
    public func lowerCase(_ lowerCase: LowerCase) -> Builder {
        fontFeatureAttributes.append(lowerCase.fontFeature())
        return self
    }
    
    /// Fraction font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter fraction: Fraction type.
    /// - Returns: Current builder
    @discardableResult
    public func fraction(_ fraction: Fraction) -> Builder {
        fontFeatureAttributes.append(fraction.fontFeature())
        return self
    }
    
    /// Vertical position font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter verticalPosition: VerticalPosition type.
    /// - Returns: Current builder
    @discardableResult
    public func verticalPosition(_ verticalPosition: VerticalPosition) -> Builder {
        fontFeatureAttributes.append(verticalPosition.fontFeature())
        return self
    }
    
    /// Ligatures font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter ligatures: Ligature type.
    /// - Returns: Current builder
    @discardableResult
    public func ligatures(_ ligatures: Ligature) -> Builder {
        fontFeatureAttributes += ligatures.fontFeatures()
        return self
    }
    
    /// SmartSwash font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter swash: SmartSwash type.
    /// - Returns: Current builder
    @discardableResult
    public func swash(_ swash: SmartSwash) -> Builder {
        fontFeatureAttributes += swash.fontFeatures()
        return self
    }
    
    /// ContextualAlternates font feature setting, if font supports, otherwise, current setting takes no effect.
    ///
    /// - Parameter contextualAlternates: ContextualAlternates type.
    /// - Returns: Current builder
    @discardableResult
    public func contextualAlternates(_ contextualAlternates: ContextualAlternates) -> Builder {
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
    
    fileprivate func build() -> FontAttributes {
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

func attribute(feature: FeatureTypeIdentifier, selector: FeatureSelectorIdentifier) -> FontFeatureAttribute {
    return FontFeatureAttribute(featureIdentifier: feature, selectorIdentifier: selector)
}

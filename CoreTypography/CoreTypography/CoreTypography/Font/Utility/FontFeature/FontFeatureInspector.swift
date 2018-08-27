//
//  FontFeatureInspector.swift
//  CoreTypography
//
//  Created by MENG, Joel on 16/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

typealias FontFeatureDictionary = [String: Any]

private func font(forName fontName: String) -> UIFont {
    let defaultFontSizePoint: CGFloat = 15
    return CTFontCreateWithName(fontName as CFString, defaultFontSizePoint, nil)
}

private func availableFeatures(forFont font: UIFont) -> [FontFeatureDictionary] {
    guard let fontFeatures = CTFontCopyFeatures(font) else {
        return [FontFeatureDictionary]()
    }

    guard let typedFeatures = fontFeatures as? [FontFeatureDictionary] else {
        fatalError("failed to convert to \([FontFeatureDictionary].self) from \(fontFeatures)")
    }

    return typedFeatures
}

fileprivate func fontFeatureName(from fontFeatureDictionary: FontFeatureDictionary) -> String? {
    return fontFeatureDictionary[kCTFontFeatureTypeNameKey as String] as? String
}

fileprivate func fontFeatureIdentifier(from fontFeatureDictionary: FontFeatureDictionary) -> Int? {
    return fontFeatureDictionary[kCTFontFeatureTypeIdentifierKey as String] as? Int
}

fileprivate func fontFeatureExclusive(from fontFeatureDictionary: FontFeatureDictionary) -> Bool? {
    return fontFeatureDictionary[kCTFontFeatureTypeExclusiveKey as String] as? Bool
}

fileprivate func fontFeatureOptions(from fontFeatureDictionary: FontFeatureDictionary) -> [FontFeature.Option] {
    guard let options = fontFeatureDictionary[kCTFontFeatureTypeSelectorsKey as String] as? [FontFeatureDictionary] else {
        print("There is no available font options for font feature \(fontFeatureDictionary)")
        return []
    }

    return options.compactMap({ (option) -> FontFeature.Option? in
        guard let name = option[kCTFontFeatureSelectorNameKey as String] as? String else {
            print("unable to get font feature option key")
            return nil
        }

        guard let value = option[kCTFontFeatureSelectorIdentifierKey as String] as? Int else {
            print("unable to get font feature option value")
            return nil
        }

        let isDefault = option[kCTFontFeatureSelectorDefaultKey as String] as? Bool
        return FontFeature.Option(key: name, value: value, isDefault: isDefault ?? false)
    })
}

public func availableFontFeatures(forFont fontName: String) -> [FontFeature]? {
    return availableFontFeatures(forFont: font(forName: fontName))
}

public func availableFontFeatures(forFont font: UIFont) -> [FontFeature] {
    return availableFeatures(forFont: font).compactMap { (fontFeatureDictionary) -> FontFeature? in
        guard let featureName = fontFeatureName(from: fontFeatureDictionary) else {
            print("Unable to extract feature name from font \(font)")
            return nil
        }

        guard let featureIdentifier = fontFeatureIdentifier(from: fontFeatureDictionary) else {
            print("Unable to extract feature featureIdentifier from font \(font)")
            return nil
        }

        let options = fontFeatureOptions(from: fontFeatureDictionary)
        return FontFeature(featureName: featureName,
                           featureIdentifier: featureIdentifier,
                           exclusive: fontFeatureExclusive(from: fontFeatureDictionary) ?? true,
                           options: options)
    }
}

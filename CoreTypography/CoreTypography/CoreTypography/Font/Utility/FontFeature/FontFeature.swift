//
//  FontFeature.swift
//  CoreTypography
//
//  Created by MENG, Joel on 16/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation
import UIKit

public struct FontFeature {
    public let featureName: String
    public let featureIdentifier: Int
    public let exclusive: Bool
    public let options: [Option]

    public init(featureName: String, featureIdentifier: Int, exclusive: Bool, options: [Option]) {
        self.featureName = featureName
        self.featureIdentifier = featureIdentifier
        self.exclusive = exclusive
        self.options = options
    }
    
    public func setting(forOption option: Option) -> [UIFontDescriptor.FeatureKey: Int] {
        return [
            UIFontDescriptor.FeatureKey.featureIdentifier: featureIdentifier,
            UIFontDescriptor.FeatureKey.typeIdentifier: option.identifier,
        ]
    }
    
    public struct Option {
        public let name: String
        public let identifier: Int
        public let isDefault: Bool
        
        public init(key: String, value: Int, isDefault: Bool) {
            self.name = key
            self.identifier = value
            self.isDefault = isDefault
        }
    }
}

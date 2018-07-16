//
//  FontFeature.swift
//  CoreTypography
//
//  Created by MENG, Joel on 16/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public struct FontFeature {
    public let featureName: String
    public let exclusive: Bool
    public let options: [Option]

    public init(featureName: String, exclusive: Bool, options: [Option]) {
        self.featureName = featureName
        self.exclusive = exclusive
        self.options = options
    }
    
    public struct Option {
        public let key: String
        public let value: Int
        public let isDefault: Bool
        
        public init(key: String, value: Int, isDefault: Bool) {
            self.key = key
            self.value = value
            self.isDefault = isDefault
        }
    }
}

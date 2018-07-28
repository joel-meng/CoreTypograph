//
//  FontFeatureProviding.swift
//  CoreTypography
//
//  Created by MENG, Joel on 20/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A protocol type that makes object/structs providing `FontFeatureAttribute`.
protocol FontFeatureProviding {
    
    /// Will return a `FontFeatureAttribute` struct value.
    ///
    /// - Returns: `FontFeatureAttribute` type, which can generate font feature setting.
    func fontFeature() -> FontFeatureAttribute
}

/// A protocol type that makes object/structs providing `FontFeatureAttribute`.
protocol FontFeaturesProviding {
    
    /// Will return a `FontFeatureAttribute` struct value.
    ///
    /// - Returns: `FontFeatureAttribute` type, which can generate font feature setting.
    func fontFeatures() -> [FontFeatureAttribute]
}

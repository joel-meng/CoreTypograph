//
//  AdjustmentAttributedTextStyle.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public typealias Points = Float

public enum AdjustmentAttributedStringStyleProvider {
    case kern(Points)
}

extension AdjustmentAttributedStringStyleProvider: Provider {
    
    var product: AttributedStringAttributes {
        switch self {
        case .kern(let points):
            return [NSAttributedStringKey.kern: points]
        }
    }
}


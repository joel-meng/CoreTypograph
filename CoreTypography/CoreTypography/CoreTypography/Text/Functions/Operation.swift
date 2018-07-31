//
//  Composition.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public enum Operation {}

extension Operation {
    
    public static func compose(textStyler1: @escaping TextStyler, textStyler2: @escaping TextStyler) -> TextStyler {
        return { attributes in
            return textStyler2(textStyler1(attributes))
        }
    }
}

infix operator +: AdditionPrecedence

public func +(textStyler1: @escaping TextStyler, textStyler2: @escaping TextStyler) -> TextStyler {
    return Operation.compose(textStyler1: textStyler1, textStyler2: textStyler2)
}


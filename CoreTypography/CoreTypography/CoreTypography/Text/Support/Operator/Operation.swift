//
//  Composition.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A namespace in which defines operator functions.
enum Operation {
    /// Will compose two `TextStyler` function into one `TextStyler`.
    /// Note: The second `TextStyler` will always override the first one if they conflicts.
    ///
    /// - Parameters:
    ///   - textStyler1: `TextStyler` object as the inner side function.
    ///   - textStyler2: `TextStyler` object as the outter side function.
    /// - Returns: A new `TextStyler` that combins 2 `TextStyler` together, however, if any coflicts, second one will take high priority.
    public static func compose(textStyler1: @escaping TextStyler, textStyler2: @escaping TextStyler) -> TextStyler {
        return { attributes in
            textStyler2(textStyler1(attributes))
        }
    }
}

// Customized `+` operator that infix two `TextStyer` together.
infix operator +: AdditionPrecedence

public func + (textStyler1: @escaping TextStyler, textStyler2: @escaping TextStyler) -> TextStyler {
    return Operation.compose(textStyler1: textStyler1, textStyler2: textStyler2)
}

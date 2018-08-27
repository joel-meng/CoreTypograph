//
//  Assign.swift
//  CoreTypography
//
//  Created by Joel on 27/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

enum Assign {}

extension Assign {
    /// A generic function that applies value to keyPath on given target. In this case, target must be reference type.
    ///
    /// - Parameters:
    ///   - value: The value to assign to target.
    ///   - keyPath: The property to assign value to.
    ///   - target: The target to assign value to.
    /// - Returns: The reference type target that with updated value.
    @discardableResult
    static func onTarget<Value: RawRepresentable, ValueType, Target>(_ target: Target,
                                                                     toKeyPath keyPath: ReferenceWritableKeyPath<Target, ValueType>,
                                                                     withValue value: Value)
        -> Target where Value.RawValue == ValueType {
        target[keyPath: keyPath] = value.rawValue
        return target
    }
}

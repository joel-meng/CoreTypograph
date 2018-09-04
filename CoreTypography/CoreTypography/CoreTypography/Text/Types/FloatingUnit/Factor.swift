//
//  Factor.swift
//  CoreTypography
//
//  Created by Joel on 27/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// `Factor` struct that used in defining `Attributes` for `AttributedString`.
public struct Factor<T: BinaryFloatingPoint>: FloatingUnit {
    // MARK: - Properties

    public private(set) var rawValue: T

    // MARK: - Lifecycle

    public init(rawValue: T) {
        self.rawValue = rawValue
    }

    public init(_ value: T) {
        rawValue = value
    }
}

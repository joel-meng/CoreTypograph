//
//  ScreenPoint.swift
//  CoreTypography
//
//  Created by Joel on 27/8/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// `ScreenPoint` struct that defines points displayed on screen.
public struct ScreenPoint<T: BinaryFloatingPoint>: FloatingUnit {
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

// Extension on floating literals to easily creating `ScreenPoint` objects(2.2.points).
public extension BinaryFloatingPoint {
    public var points: ScreenPoint<CGFloat> {
        return ScreenPoint(rawValue: CGFloat(floatLiteral: CGFloat.NativeType(self)))
    }
}

// Extension on `Integer` literals to easily creating `ScreenPoint` objects(3.points).
public extension Int {
    public var points: ScreenPoint<CGFloat> {
        return ScreenPoint(rawValue: CGFloat(self))
    }
}

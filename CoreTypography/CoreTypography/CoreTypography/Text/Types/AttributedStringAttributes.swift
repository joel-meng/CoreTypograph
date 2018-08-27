//
//  AttributedStringAttributes.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public typealias AttributedStringAttributes = [NSAttributedString.Key : Any]

public typealias AttributedStringParagraphStyle = NSMutableParagraphStyle

public protocol FloatingUnit: RawRepresentable {
    
    associatedtype T: BinaryFloatingPoint
    
    var rawValue: T { get }
}

public struct ScreenPoint<T: BinaryFloatingPoint>: FloatingUnit {
    
    private(set) public var rawValue: T
    
    public init(rawValue: T) {
        self.rawValue = rawValue
    }
    
    public init(_ value: T) {
        self.rawValue = value
    }
}

public extension BinaryFloatingPoint {
    public var points: ScreenPoint<CGFloat> {
        return ScreenPoint(rawValue: CGFloat(floatLiteral: CGFloat.NativeType(self)))
    }
}

public extension Int {
    public var points: ScreenPoint<CGFloat> {
        return ScreenPoint(rawValue: CGFloat(self))
    }
}

public struct Factor<T: BinaryFloatingPoint> : FloatingUnit {
    
    private(set) public var rawValue: T
    
    public init(rawValue: T) {
        self.rawValue = rawValue
    }
    
    public init(_ value: T) {
        self.rawValue = value
    }
}

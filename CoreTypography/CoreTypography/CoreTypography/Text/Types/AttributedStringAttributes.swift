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

public enum Bidirectional<T> {
    case natural(T)
    case opposite(T)
}

extension Bidirectional where T == Float {
    var rawValue: CGFloat {
        switch self {
        case .natural(let point):
            return CGFloat(point)
        case .opposite(let point):
            return CGFloat(-point)
        }
    }
}

public enum DisplayUnit<T: BinaryFloatingPoint> {
    case points(T)
}

extension DisplayUnit {
    var rawValue: CGFloat {
        switch self {
        case .points(let point):
            switch point {
            case let floatValue as Float:
                return CGFloat(floatValue)
            case let floatValue as Double:
                return CGFloat(floatValue)
            case let floatValue as CGFloat:
                return floatValue
            default:
                fatalError("")
            }
        }
    }
}

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

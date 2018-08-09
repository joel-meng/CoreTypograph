//
//  AttributedStringAttributes.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public typealias AttributedStringAttributes = [NSAttributedStringKey : Any]

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

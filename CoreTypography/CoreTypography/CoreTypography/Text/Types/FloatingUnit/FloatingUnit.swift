//
//  AttributedStringAttributes.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// A unit type that accepting floating numbers used in defining attributes.
public protocol FloatingUnit: RawRepresentable {
    
    associatedtype T: BinaryFloatingPoint
    
    var rawValue: T { get }
}

//
//  TextStyler.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation


/// Attributed string attributes. Basically, it is a dictionary of settings.
public typealias Attributes = [NSAttributedString.Key : Any]

/// `TextStyler` is an function object that takes `Attributes` in, make corresponding changes and returns `Attributes`.
public typealias TextStyler = (Attributes) -> Attributes

/// Platform independent paragraph style
public typealias ParagraphStyle = NSMutableParagraphStyle

/// `ParagraphStyler` is an function object that takes `ParagraphStyle` in, make corresponding changes and returns `ParagraphStyle`.
public typealias ParagraphyStyler = (ParagraphStyle) -> ParagraphStyle


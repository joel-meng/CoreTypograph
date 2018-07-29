//
//  TextStyle.swift
//  CoreTypography
//
//  Created by MENG, Joel on 28/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public typealias Color = UIColor

protocol ColorTextStyle {
    
    static func textColor(_ color: Color) -> Self
    
    static func backgroundColor(_ color: Color) -> Self
}

struct AttributedStringRenderer: ColorTextStyle {
    
    static func textColor(_ color: Color) -> AttributedStringRenderer {
        return AttributedStringRenderer(rendered: [.foregroundColor: color])
    }
    
    static func backgroundColor(_ color: Color) -> AttributedStringRenderer {
        return AttributedStringRenderer(rendered: [.backgroundColor: color])
    }
    
    let rendered: [NSAttributedStringKey: Any]
}

//protocol Style {
//
//}

public protocol StyleType {
    
    var styles: [NSAttributedStringKey: Any] { get }
}

public struct InitialStyle: StyleType {
    
    private (set) public var styles: [NSAttributedStringKey : Any]
    
    public init(style: [NSAttributedStringKey : Any]) {
        self.styles = style
    }
}

public struct EmptyStyle: StyleType {
    
    private (set) public var styles: [NSAttributedStringKey : Any]
    
    public init() {
        self.styles = [:]
    }
}

public protocol StyleDecorator: StyleType {
    
    var base: StyleType { get set }
    
    var style: [NSAttributedStringKey : Any] { get }
}

extension StyleDecorator {
    
    public var styles: [NSAttributedStringKey: Any] {
        return base.styles.merging(style) { baseStyleKey, selfStyleKey in
            selfStyleKey
        }
    }
}

public struct TextColorStyle: StyleDecorator {
    
    public var base: StyleType
    
    private let color: Color

    public init(color: Color, base: StyleType = EmptyStyle()) {
        self.base = base
        self.color = color
    }
    
    public var style: [NSAttributedStringKey : Any] {
        return [NSAttributedStringKey.foregroundColor: color]
    }
}

public struct BackgroundColorStyle: StyleDecorator {
    
    public var base: StyleType
    
    private let color: Color
    
    public init(color: Color, base: StyleType = EmptyStyle()) {
        self.base = base
        self.color = color
    }
    
    public var style: [NSAttributedStringKey : Any] {
        return [NSAttributedStringKey.backgroundColor: color]
    }
}

//
//  PopularAttributedTextStylable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public struct AnyAttributedStringAttributesProviderConsumer: Consumer {
    
    public let attributes: AttributedStringAttributes
    
    public init(_ attributes: AttributedStringAttributes = [:]) {
        self.attributes = attributes
    }
    
    public func consume<T>(productFrom provider: AnyProvider<AttributedStringAttributes>) -> T where T : Consumer, AnyProvider<AttributedStringAttributes> == T.ProductProvider {
        return AnyAttributedStringAttributesProviderConsumer(attributes.merging(provider.product) { $1 }) as! T
    }
    
    public func consume<T>(productsFrom providers: [AnyProvider<AttributedStringAttributes>]) -> T where T : Consumer, AnyProvider<AttributedStringAttributes> == T.ProductProvider {
        return providers.reduce(AnyAttributedStringAttributesProviderConsumer()) { (result, provider) in
            result.consume(productFrom: provider)
        } as! T
    }
}

//public struct PopularAttributedStringStyleConsumer: Consumer {
//
//    public let attributes: [NSAttributedStringKey: Any]
//
//    public init(attributes: [NSAttributedStringKey: Any] = [:]) {
//        self.attributes = attributes
//    }
//
//    public func style(with style: PopularAttributedTextStyle) -> PopularAttributedTextStylable {
//        return PopularAttributedTextStylable(attributes: attributes.merging(style.style) { $1 })
//    }
//}


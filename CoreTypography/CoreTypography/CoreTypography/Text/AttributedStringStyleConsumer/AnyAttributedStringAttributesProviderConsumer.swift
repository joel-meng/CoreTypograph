//
//  PopularAttributedTextStylable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public struct AnyAttributedStringAttributesProviderConsumer: Consumer {
    
    public let attributes: Attributes
    
    public init(_ attributes: Attributes = [:]) {
        self.attributes = attributes
    }
    
    public func consume<T>(productFrom provider: AnyProvider<Attributes>) -> T where T : Consumer, AnyProvider<Attributes> == T.ProductProvider {
        return AnyAttributedStringAttributesProviderConsumer(attributes.merging(provider.product) { $1 }) as! T
    }
}

public struct PopularAttributedStringAttributesConsumer: Consumer {

    public let attributes: [NSAttributedString.Key: Any]

    public init(_ attributes: [NSAttributedString.Key: Any] = [:]) {
        self.attributes = attributes
    }

    public func consume<T>(productFrom provider: PopularAttributedStringStyleProvider) -> T where T : Consumer, PopularAttributedStringStyleProvider == T.ProductProvider {
        return PopularAttributedStringAttributesConsumer(attributes.merging(provider.product) { $1 }) as! T
    }
}

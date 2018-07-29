//
//  Stylable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

public protocol Consumer {
    
    associatedtype ProductProvider: Provider
    
//    func consume<T>(productFrom provider: AnyProvider<AttributedStringAttributes>) -> T where T: Consumer
    
    func consume<T>(productFrom provider: ProductProvider) -> T where T: Consumer, T.ProductProvider == ProductProvider
}

class _AnyConsumerBase<P: Provider>: Consumer {
    
    init() {
        guard type(of: self) != _AnyConsumerBase.self else {
            fatalError()
        }
    }
    
    func consume<T>(productFrom provider: P) -> T where T: Consumer, T.ProductProvider == P {
        fatalError()
    }
}

fileprivate final class _AnyConsumerBox<Base: Consumer>: _AnyConsumerBase<Base.ProductProvider> {
    
    private let base: Base
    
    init(base: Base) {
        self.base = base
    }
    
    override func consume<T>(productFrom provider: Base.ProductProvider) -> T where T: Consumer, T.ProductProvider == Base.ProductProvider {
        return base.consume(productFrom: provider)
    }
}

public final class AnyConsumer<P: Provider>: Consumer {

    private let box: _AnyConsumerBase<P>
    
    init<Base: Consumer>(base: Base) where Base.ProductProvider == P  {
        box = _AnyConsumerBox(base: base)
    }
    
    public func consume<T>(productFrom provider: P) -> T where T: Consumer, T.ProductProvider == P {
        return box.consume(productFrom: provider)
    }
}

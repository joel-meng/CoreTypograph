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
    
    func consume<T>(productFrom provider: ProductProvider) -> T where T: Consumer, T.ProductProvider == ProductProvider
    
    func consume<T>(productsFrom providers: [ProductProvider]) -> T where T: Consumer, T.ProductProvider == ProductProvider
}

extension Consumer {
    
    public func consume<T>(productsFrom providers: [ProductProvider]) -> T where T: Consumer, T.ProductProvider == ProductProvider {
        return providers.reduce(self) { (result, provider) in
            result.consume(productFrom: provider)
        } as! T
    }
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
    
    func consume<T>(productsFrom providers: [P]) -> T where T : Consumer, P == T.ProductProvider {
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
    
    public func consume<T>(productsFrom providers: [P]) -> T where T : Consumer, P == T.ProductProvider {
        return box.consume(productsFrom: providers)
    }
}

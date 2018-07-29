//
//  StyleProviding.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

protocol Provider {
    
    associatedtype Product
    
    var product: Product { get }
}

class _AnyProviderBase<Product>: Provider {
    
    init() {
        guard type(of: self) != _AnyProviderBase.self else {
            fatalError("_AnyProductProviderBase must not be constructed as a prototype")
        }
    }
    
    var product: Product {
        fatalError("Must be overrided.")
    }
}

fileprivate final class _AnyProductBox<Base: Provider>: _AnyProviderBase<Base.Product> {

    private let base: Base
    
    init(base: Base) {
        self.base = base
    }
    
    override var product: Base.Product {
        return base.product
    }
}

final class AnyProvider<Product>: Provider {
    
    private let box: _AnyProviderBase<Product>
    
    init<Base: Provider>(_ base: Base) where Base.Product == Product {
        box = _AnyProductBox(base: base)
    }
    
    var product: Product {
        return box.product
    }
}

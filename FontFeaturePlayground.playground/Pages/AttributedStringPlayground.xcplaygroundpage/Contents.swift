//: [Previous](@previous)

import UIKit
import PlaygroundSupport
import CoreTypography

/*
protocol Stylable {
    
    associatedtype StyleProvider: StyleProviding
    
    func style<S: Stylable>(with style: StyleProvider) -> S where S.StyleProvider == StyleProvider
}

protocol StyleProviding {
    
    associatedtype Style
    
    var style: Style { get }
}

class _AnyStyleBase<Style>: StyleProviding {
    init() {
        guard type(of: self) != _AnyStyleBase.self else {
            fatalError()
        }
    }
    
    var style: Style {
        fatalError()
    }
}

final class _AnyStyleBox<Base: StyleProviding>: _AnyStyleBase<Base.Style> {
    
    let base: Base
    
    init(base: Base) {
        self.base = base
    }
    
    override var style: Base.Style {
        return base.style
    }
}

final class AnyStyleProviding<Style>: StyleProviding {
    
    private let box: _AnyStyleBase<Style>
    
    init<Base: StyleProviding>(base: Base) where Base.Style == Style {
        self.box = _AnyStyleBox(base: base)
    }
    
    var style: Style {
        return box.style
    }
}

enum ColorStyleProvider: StyleProviding {
    case textColor(UIColor)
    case backgroundColor(UIColor)
    
    var style: [NSAttributedStringKey: Any] {
        switch self {
        case .textColor(let color):
            return [NSAttributedStringKey.foregroundColor: color]
        case .backgroundColor(let color):
            return [NSAttributedStringKey.backgroundColor: color]
        }
    }
}

enum NumberStyleProvider: StyleProviding {
    case kern(Float)
    
    var style: [NSAttributedStringKey: Any] {
        switch self {
        case .kern(let point):
            return [NSAttributedStringKey.kern: point]
        }
    }
}


let textColorProviding: AnyStyleProviding = AnyStyleProviding(base: ColorStyleProvider.textColor(UIColor.red))
let backgroundColorProviding: AnyStyleProviding = AnyStyleProviding(base: ColorStyleProvider.backgroundColor(UIColor.lightGray))
let kernProviding: AnyStyleProviding = AnyStyleProviding(base: NumberStyleProvider.kern(3.2))
let group: [AnyStyleProviding<[NSAttributedStringKey: Any]>] = [textColorProviding, backgroundColorProviding, kernProviding]
*/

let providers: [AnyProvider<AttributedStringAttributes>] = [
    AnyProvider(PopularAttributedStringStyleProvider.textColor(.red)),
    AnyProvider(AdjustmentAttributedStringStyleProvider.kern(12)),
]

AnyProvider(PopularAttributedStringStyleProvider.textColor(.red)).product[NSAttributedStringKey.foregroundColor]

let consumer = PopularAttributedStringStyleConsumer()
let result: PopularAttributedStringStyleConsumer = consumer.consume(productFrom: AnyProvider(PopularAttributedStringStyleProvider.textColor(.red)))
result.attributes[NSAttributedStringKey.foregroundColor]



//let consumer = PopularAttributedStringStyleConsumer()



//: [Next](@next)

//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport

let emptyStyle = EmptyStyle()
let textColorStyle = TextColorStyle(color: UIColor.red, base: emptyStyle)
let backgroundColorStyle = BackgroundColorStyle(color: .lightGray, base: textColorStyle)

let array: [StyleDecorator] = [TextColorStyle(color: .red), BackgroundColorStyle(color: .lightGray)]
let reduced = array.reduce(EmptyStyle()) { (result, style) -> StyleType in
    var newStyle = style
    newStyle.base = result
    return newStyle
}

textColorStyle.styles[NSAttributedStringKey.foregroundColor]
textColorStyle.styles[NSAttributedStringKey.backgroundColor]

backgroundColorStyle.styles[NSAttributedStringKey.foregroundColor]
backgroundColorStyle.styles[NSAttributedStringKey.backgroundColor]

reduced.styles[NSAttributedStringKey.foregroundColor]
reduced.styles[NSAttributedStringKey.backgroundColor]

//: [Next](@next)

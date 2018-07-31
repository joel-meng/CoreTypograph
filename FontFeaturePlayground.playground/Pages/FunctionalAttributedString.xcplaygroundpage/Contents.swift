//: [Previous](@previous)

import Foundation
import CoreTypography
import UIKit
import PlaygroundSupport

let styler = Text.color(.red) + Font.kern(3) + Canvas.background(.lightText) + Font.ligature(.essential) + Stroke.width(3) + Stroke.color(.black) + Paragraph.align(.center)


let style: [NSAttributedStringKey: Any] = styler([:])

let styledText = NSAttributedString(string: "ffi fl Attributed String", attributes: style)
let showCaseLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
showCaseLabel.backgroundColor = .white
showCaseLabel.attributedText = styledText
showCaseLabel


//let styler = compose(textStyler1: textColor(.red), textStyler2: backgroundColor(.blue))
//let result = styler([:])
//result[NSAttributedStringKey.backgroundColor]
//result[NSAttributedStringKey.foregroundColor]
//
//let styler2 = textColor(.blue) <> backgroundColor(.red)
//let result2 = styler2([:])
//result2[NSAttributedStringKey.backgroundColor]
//result2[NSAttributedStringKey.foregroundColor]



//: [Next](@next)

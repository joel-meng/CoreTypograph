//: [Previous](@previous)

import Foundation
import CoreTypography
import UIKit
import PlaygroundSupport

let colorStyle = Text.color(.red)
let strokeStyle = Stroke.width(3) + Stroke.color(.black)
let paragraphyStyle = Paragraph.align(.justified) + Paragraph.lineBreakMode(.byWordWrapping) + Paragraph.firstlineIndent(.points(10))
let fontStyle = Font.kern(.natural(3)) + Font.ligature(.all)
let canvasStyle =  Canvas.background(.lightText)

let styler = fontStyle + canvasStyle + colorStyle + paragraphyStyle

let style: [NSAttributedStringKey: Any] = styler([:])

let showcaseText = """
This is first line.This is going to be a paragraphy.
This is 2nd line.
ff fi fl for testing ligature.
"""

let codeText = """
fontStyle + canvasStyle + colorStyle + paragraphyStyle
"""

let styledText = NSAttributedString(string: showcaseText, attributes: style)
let showCaseLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 160))
showCaseLabel.numberOfLines = 0
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

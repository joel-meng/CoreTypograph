//: [Previous](@previous)

import CoreTypography
import Foundation
import PlaygroundSupport
import UIKit

let colorStyle = Text.color(.red)
let strokeStyle = Stroke.width(3) + Stroke.color(.black)
// let paragraphyStyle = Paragraph.first // Paragraph.align(.justified) + Paragraph.lineBreakMode(.byWordWrapping)
let paragraphStyle = Paragraph.firstlineIndent(100.points) + Paragraph.lineBreakMode(.byWordWrapping) + Paragraph.align(.left)
let fontStyle = Font.ligature(.all) + Font.kerning(30.points)
let canvasStyle = Background.color(.lightText)
let strikethrough = Strikethrough.color(.blue) + Strikethrough.style([.single, .patternDashDotDot, .byWord])
let underline = Underline.color(.blue) + Underline.style([.single, .patternDashDotDot, .byWord])
let effect = Text.effect(.letterpressStyle)

let url = NSURL(string: "https://www.google.com")!
let link = Text.link(to: url)

let customFont = FontBuilder { builder in
    builder.lowerCase(LowerCase.smallCaps).name("Baskerville")
}.build()

let baselineOffsetStyler = Text.offset(by: 3.points)

// let styler = fontStyle + canvasStyle + colorStyle + paragraphStyle + strikethrough
let styler = Text.oblique(by: (-0.2).points) + Text.color(.blue) + Text.color(.red) + paragraphStyle + Font.font(customFont)

let style: [NSAttributedString.Key: Any] = styler([:])

let showcaseText = """
This is first line. This is going to be a paragraphy.
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

//: [Next](@next)

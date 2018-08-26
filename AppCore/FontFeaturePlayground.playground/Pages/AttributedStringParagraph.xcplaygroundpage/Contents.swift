//: [Previous](@previous)

import Foundation
import CoreTypography
import UIKit
import PlaygroundSupport

//:Firstline Indent
let firstline = showCaseStyler(Paragraph.firstlineIndent(20.points))

//: Line Break Mode

let wordWrapping = showCaseStyler(Paragraph.lineBreakMode(.byWordWrapping))
let byCharWrapping = showCaseStyler(Paragraph.lineBreakMode(.byCharWrapping))

//: Alignment

let left = showCaseStyler(Paragraph.align(.left))
let right = showCaseStyler(Paragraph.align(.right))
let center = showCaseStyler(Paragraph.align(.center))

//: Line Height
let heightMultiple = showCaseStyler(Paragraph.lineHeightMultiple(2.5.points))
let lineSpacing = showCaseStyler(Paragraph.lineSpacing(10.points))

//: Max Line Height - Set text line max height no matter the text font, and overlapping if too small

let maxLineFont = FontBuilder { builder in
    builder.name("Baskerville")
}.build(15)
let maximumLineHeight = showCaseStyler(Font.font(maxLineFont) + Paragraph.maximumLineHeight(10.points))

//: Min Line Height - Set text line min height no matter the text font

let minLineFont = FontBuilder { builder in
    builder.name("Baskerville")
}.build(10)
let minLineSpacing = showCaseStyler(Font.font(minLineFont) + Paragraph.minimumLineHeight(20.points))


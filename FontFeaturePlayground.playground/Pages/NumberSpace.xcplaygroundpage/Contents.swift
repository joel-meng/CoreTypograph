//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport

let success = registerFont(withName: "InputSans-Regular")

//: #####  Proportional Number Space

let proportionalNumberSpaceText = "123,456,789.00"
let proportionalNumberSpaceFontName = "Helvitica"
let proportionalNumberSpaceTitle = "Proportional Number Space"

let proportionalNumberSpaceOn = FontBuilder { builder in
    builder.name(proportionalNumberSpaceFontName).numberSpacing(NumberSpacing.proportional)
}.build()

let proportionalNumberSpaceOff = FontBuilder { builder in
    builder.name(proportionalNumberSpaceFontName)
}.build()

textComparisonView(text: proportionalNumberSpaceText, font1: proportionalNumberSpaceOn, font2: proportionalNumberSpaceOff, title: proportionalNumberSpaceTitle)

//: [Next](@next)

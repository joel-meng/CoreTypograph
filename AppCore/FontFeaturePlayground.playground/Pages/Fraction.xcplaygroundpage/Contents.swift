//: [Previous](@previous)

import CoreTypography
import PlaygroundSupport
import UIKit

let success = registerFont(withName: "InputSans-Regular")

//: #####  Fraction

let fractionText = "This is a 1/2 apple"
let fractionFontName = "InputSans-Regular"
let fractionTitle = "Normal Text Spacing"

let fractionOn = FontBuilder { builder in
    builder.name(fractionFontName).fraction(Fraction.diagonal)
}.build()

let fractionOff = FontBuilder { builder in
    builder.name(fractionFontName)
}.build()

let fractionView = textComparisonView(text: fractionText, font1: fractionOn, font2: fractionOff, title: fractionTitle)

//: [Next](@next)

//: [Previous](@previous)

import CoreTypography
import PlaygroundSupport
import UIKit

//: #####

let smallCapsTitle = "Small caps"
let smallCapsText = "Text that should be small caps"
let smallCapsFontName = "Baskerville"

let smallCapsOn = FontBuilder { builder in
    builder.lowerCase(LowerCase.smallCaps).name(smallCapsFontName)
}.build()

let smallCapsOff = FontBuilder { builder in
    builder.name(smallCapsFontName)
}.build()

let smallCapsView = textComparisonView(text: smallCapsText, font1: smallCapsOn, font2: smallCapsOff, title: smallCapsTitle)

//: [Next](@next)

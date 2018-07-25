//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport

let success = registerFont(withName: "InputSans-Regular")

//: #####  Normal Text Spacing

let normalTextSpacingText = "st, ct, Muestfurst"
let normalTextSpacingFontName = "InputSans-Regular"
let normalTextSpacingTitle = "Normal Text Spacing"

let normalTextSpacingOn = FontBuilder { builder in
    builder.name(normalTextSpacingFontName).textSpacing(TextSpacing.proportional)
}.build()

let normalTextSpacingOff = FontBuilder { builder in
    builder.name(normalTextSpacingFontName)
}.build()


let normalTextSpacingView = textComparisonView(text: normalTextSpacingText, font1: normalTextSpacingOn, font2: normalTextSpacingOff, title: normalTextSpacingTitle)


//: #####  Mono Text Spacing

let monoTextSpacingText = "Quick Brown Fox Jumps Over The Lazy Dog."
let monoTextSpacingFontName = "InputSans-Regular"
let monoTextSpacingTitle = "Normal Text Spacing"

let monoTextSpacingOn = FontBuilder { builder in
    builder.name(monoTextSpacingFontName).textSpacing(TextSpacing.mono)
}.build()

let monoTextSpacingOff = FontBuilder { builder in
    builder.name(monoTextSpacingFontName)
}.build()


let monoTextSpacingView = textComparisonView(text: monoTextSpacingText, font1: monoTextSpacingOn, font2: monoTextSpacingOff, title: monoTextSpacingTitle)

//: [Next](@next)

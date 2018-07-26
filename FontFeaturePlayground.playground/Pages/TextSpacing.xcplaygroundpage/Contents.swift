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
let monoTextSpacingFontName = "HiraginoSans-W3"
let monoTextSpacingTitle = "Mono Text Spacing"

let monoTextSpacingOn = FontBuilder { builder in
    builder.name(monoTextSpacingFontName).textSpacing(TextSpacing.mono)
}.build()

let monoTextSpacingOff = FontBuilder { builder in
    builder.name(monoTextSpacingFontName)
}.build()


let monoTextSpacingView = textComparisonView(text: monoTextSpacingText, font1: monoTextSpacingOn, font2: monoTextSpacingOff, title: monoTextSpacingTitle)


//: #####  Half Text Spacing

let halfTextSpacingText = """
Quick Brown Fox Jumps Over The Lazy Dog.
123, 456  1/2 33.44 H2O
"""
let halfTextSpacingFontName = "HiraginoSans-W3"
let halfTextSpacingTitle = "Half Text Spacing"

let halfTextSpacingOn = FontBuilder { builder in
    builder.name(halfTextSpacingFontName).textSpacing(TextSpacing.halfWidth)
}.build()

let halfTextSpacingOff = FontBuilder { builder in
    builder.name(halfTextSpacingFontName)
}.build()


let halfTextSpacingView = textComparisonView(text: halfTextSpacingText, font1: halfTextSpacingOn, font2: halfTextSpacingOff, title: halfTextSpacingTitle)


//: #####  Third Text Spacing

let thirdWidthTextSpacingText = """
Quick Brown Fox Jumps Over The Lazy Dog.
123, 456  1/2 33.44 H2O
"""
let thirdWidthTextSpacingFontName = "HiraginoSans-W3"
let thirdWidthTextSpacingTitle = "Third Text Spacing"

let thirdWidthTextSpacingOn = FontBuilder { builder in
    builder.name(thirdWidthTextSpacingFontName).textSpacing(TextSpacing.thirdWidth)
}.build()

let thirdWidthTextSpacingOff = FontBuilder { builder in
    builder.name(thirdWidthTextSpacingFontName)
}.build()


let thirdWidthTextSpacingView = textComparisonView(text: thirdWidthTextSpacingText, font1: thirdWidthTextSpacingOn, font2: thirdWidthTextSpacingOff, title: thirdWidthTextSpacingTitle)


//: #####  Quarter Text Spacing

let quarterWidthTextSpacingText = """
123,456,789.00
"""
let quarterWidthTextSpacingFontName = "HiraginoSans-W3"
let quarterWidthTextSpacingTitle = "Quarter Text Spacing"

let quarterWidthTextSpacingOn = FontBuilder { builder in
    builder.name(quarterWidthTextSpacingFontName).textSpacing(TextSpacing.quarterWidth)
}.build()

let quarterWidthTextSpacingOff = FontBuilder { builder in
    builder.name(quarterWidthTextSpacingFontName)
}.build()


textComparisonView(text: quarterWidthTextSpacingText, font1: quarterWidthTextSpacingOn, font2: quarterWidthTextSpacingOff, title: quarterWidthTextSpacingTitle)


//: #####  Alternate Proportional Width Text Spacing

let alternateProportionalWidthTextSpacingText = """
Ta TA AV
"""
let alternateProportionalWidthTextSpacingFontName = "HiraginoSans-W3"
let alternateProportionalWidthTextSpacingTitle = "Alternate Proportional Width Text Spacing"

let alternateProportionalWidthTextSpacingOn = FontBuilder { builder in
    builder.name(alternateProportionalWidthTextSpacingFontName).textSpacing(TextSpacing.altProportional)
}.build()

let alternateProportionalWidthTextSpacingOff = FontBuilder { builder in
    builder.name(alternateProportionalWidthTextSpacingFontName)
}.build()


textComparisonView(text: alternateProportionalWidthTextSpacingText, font1: alternateProportionalWidthTextSpacingOn, font2: alternateProportionalWidthTextSpacingOff, title: alternateProportionalWidthTextSpacingTitle)


//: #####  Alternate Half Width Text Spacing

let alternateHalfWidthTextSpacingText = """
Ta TA AV
"""
let alternateHalfWidthTextSpacingFontName = "HiraginoSans-W3"
let alternateHalfWidthTextSpacingTitle = "Alternate Half Width Text Spacing"

let alternateHalfWidthTextSpacingOn = FontBuilder { builder in
    builder.name(alternateHalfWidthTextSpacingFontName).textSpacing(TextSpacing.altHalfWidth)
    }.build()

let alternateHalfWidthTextSpacingOff = FontBuilder { builder in
    builder.name(alternateHalfWidthTextSpacingFontName)
    }.build()


textComparisonView(text: alternateHalfWidthTextSpacingText, font1: alternateHalfWidthTextSpacingOn, font2: alternateHalfWidthTextSpacingOff, title: alternateHalfWidthTextSpacingTitle)

//: [Next](@next)

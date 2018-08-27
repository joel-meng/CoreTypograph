//: [Previous](@previous)

import CoreTypography
import PlaygroundSupport
import UIKit

let successfulRegisterInputSans = registerFont(withName: "SourceSansPro-Regular")

//: ##### Lower Case Small Caps

let lowerCaseSmallCapsTitle = "Lower Case Small Caps"
let lowerCaseSmallCapsText = "The spectacle before us was indeed sublime."
let lowerCaseSmallCapsFontName = "SourceSansPro-Regular"

let lowerCaseSmallCapsNormalOn = FontBuilder { builder in
    builder.name(lowerCaseSmallCapsFontName).lowerCase(LowerCase.smallCaps)
}.build()

let lowerCaseSmallCapsNormalOff = FontBuilder { builder in
    builder.name(lowerCaseSmallCapsFontName)
}.build()

let lowerCaseSmallCapsView = textComparisonView(text: lowerCaseSmallCapsText, font1: lowerCaseSmallCapsNormalOn, font2: lowerCaseSmallCapsNormalOff, title: lowerCaseSmallCapsTitle)

//: ##### Upper Case Small Caps

let upperCaseSmallCapsTitle = "Upper Case Small Caps"
let upperCaseSmallCapsText = "The spectacle before us was indeed sublime."
let upperCaseSmallCapsFontName = "SourceSansPro-Regular"

let upperCaseSmallCapsNormalOn = FontBuilder { builder in
    builder.name(upperCaseSmallCapsFontName).upperCase(UpperCase.smallCaps)
}.build()

let upperCaseSmallCapsNormalOff = FontBuilder { builder in
    builder.name(upperCaseSmallCapsFontName)
}.build()

let upperCaseSmallCapsView = textComparisonView(text: upperCaseSmallCapsText, font1: upperCaseSmallCapsNormalOn, font2: upperCaseSmallCapsNormalOff, title: upperCaseSmallCapsTitle)

//: [Next](@next)

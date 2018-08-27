//: [Previous](@previous)

import CoreTypography
import PlaygroundSupport
import UIKit

let success = registerFont(withName: "SourceSansPro-Regular")

//: #####  Lower Number Case

let lowerNumberCaseText = "123,456,789.00"
let lowerNumberCaseFontName = "SourceSansPro-Regular"
let lowerNumberCaseTitle = "Lower Number Case"

let lowerNumberCaseOn = FontBuilder { builder in
    builder.name(lowerNumberCaseFontName).numberCase(.lower)
}.build()

let lowerNumberCaseOff = FontBuilder { builder in
    builder.name(lowerNumberCaseFontName)
}.build()

textComparisonView(text: lowerNumberCaseText, font1: lowerNumberCaseOn, font2: lowerNumberCaseOff, title: lowerNumberCaseTitle)

//: [Next](@next)

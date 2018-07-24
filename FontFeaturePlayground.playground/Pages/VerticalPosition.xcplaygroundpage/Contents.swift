//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport

let successfulRegisterInputSans = registerFont(withName: "InputSans-Regular")
let successfulRegisterSourceCodePro = registerFont(withName: "SourceCodePro-Regular")

//: ##### Normal Vertical Position

let normalVerticalPositionTitle = "Normal Vertical Position"
let normalVerticalPositionText = "Normal vertical position which is default"
let normalVerticalPositionFontName = "InputSans-Regular"

let normalVerticalPositionNormalOn = FontBuilder { builder in
    builder.verticalPosition(VerticalPosition.normal).name(normalVerticalPositionFontName)
}.build()

let normalVerticalPositionNormalOff = FontBuilder { builder in
    builder.name(normalVerticalPositionFontName)
}.build()

let normalVerticalPositionView = textComparisonView(text: normalVerticalPositionText, font1: normalVerticalPositionNormalOn, font2: normalVerticalPositionNormalOff, title: normalVerticalPositionTitle)


//: ##### Superior Vertical Position

let superiorVerticalPositionTitle = "Super Vertical Position"
let superiorVerticalPositionText = """
1st 2nd 3rd 4th 101st
"""
let superiorVerticalPositionFontName = "InputSans-Regular"

let superVerticalPositionOn = FontBuilder { builder in
    builder.verticalPosition(VerticalPosition.superior).name(superiorVerticalPositionFontName)
}.build()

let superVerticalPositionOff = FontBuilder { builder in
    builder.name(superiorVerticalPositionFontName)
}.build()

superVerticalPositionOn.fontName

let superVerticalPositionView = textComparisonView(text: superiorVerticalPositionText, font1: superVerticalPositionOn, font2: superVerticalPositionOff, title: superiorVerticalPositionTitle)


//: ##### Inferious Vertical Position

let inferiousVerticalPositionTitle = "Inferious Vertical Position"
let inferiousVerticalPositionText = """
1/2 4.3 123th/223
1st 2nd 3rd 4th 5th
"""
let inferiousVerticalPositionFontName = "SourceCodePro-Regular"

let inferiousVerticalPositionOn = FontBuilder { builder in
    builder.verticalPosition(VerticalPosition.inferior).name(inferiousVerticalPositionFontName)
}.build()


let inferiousVerticalPositionOff = FontBuilder { builder in
    builder.name(inferiousVerticalPositionFontName)
}.build()

let inferiousVerticalPositionView = textComparisonView(text: inferiousVerticalPositionText, font1: inferiousVerticalPositionOn, font2: inferiousVerticalPositionOff, title: inferiousVerticalPositionTitle)



//: ##### Ordinal Vertical Position

let ordinalVerticalPositionTitle = "Ordinal Vertical Position"
let ordinalVerticalPositionText = """
1st 2nd 3rd 4th 5th
"""

let ordinalVerticalPositionFontName = "SourceCodePro-Regular"

let ordinalVerticalPositionOn = FontBuilder { builder in
    builder.verticalPosition(VerticalPosition.ordinal).name(ordinalVerticalPositionFontName)
}.build()
ordinalVerticalPositionOn.fontName

let ordinalVerticalPositionOff = FontBuilder { builder in
    builder.name(ordinalVerticalPositionFontName)
}.build()

let ordinalVerticalPositionView = textComparisonView(text: ordinalVerticalPositionText, font1: ordinalVerticalPositionOn, font2: ordinalVerticalPositionOff, title: ordinalVerticalPositionTitle)


//: ##### Scentific Vertical Position

let scentificVerticalPositionTitle = "Scentific Vertical Position"
let scentificVerticalPositionText = """
1/2 4.3 123th/223
1st 2nd 3rd 4th 5th
"""
let scentificVerticalPositionFontName = "InputSans-Regular"

let scentificVerticalPositionOn = FontBuilder { builder in
    builder.verticalPosition(VerticalPosition.scientificInferior).name(scentificVerticalPositionFontName)
}.build()
ordinalVerticalPositionOn.fontName

let scentificVerticalPositionOff = FontBuilder { builder in
    builder.name(scentificVerticalPositionFontName)
}.build()

let scentificVerticalPositionView = textComparisonView(text: scentificVerticalPositionText, font1: scentificVerticalPositionOn, font2: scentificVerticalPositionOff, title: scentificVerticalPositionTitle)


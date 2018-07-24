//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport


//let fontName = "Hiragino"


//: ##### Ligature Common

let commonLigatureTitle = "Common Ligature"
let commonLigatureText = "affordable filial"
let commonLigatureFontName = "HiraginoSans-W3"
let ligatureCommonOn = FontBuilder { builder in
    builder.ligatures([Ligature.commonOn]).name(commonLigatureFontName)
}.build()

let ligatureCommonOff = FontBuilder { builder in
    builder.ligatures([Ligature.commonOff]).name(commonLigatureFontName)
}.build()

let commonLigatureView = textComparisonView(text: commonLigatureText, font1: ligatureCommonOn, font2: ligatureCommonOff, title: commonLigatureTitle)


//: ##### Ligature Rare

let rareLigatureText = """
ö á â ä æ ã å ā for Diacritcs
AV Ta for kerning
ffi, ffl for ligature
Quick brown fox jumps over the lazy dog.
123,456,789.49
1/2 and 1st, 2nd, 3rd, 4th, 5th
"""
let rareLigatureFontName = "HiraginoSans-W3"
let rareLigatureTitle = "Rare Ligature"


let ligatureRareOn = FontBuilder { builder in
    builder.ligatures([Ligature.rareOff]).name(rareLigatureFontName)
}.build()

let ligatureRareOff = FontBuilder { builder in
    builder.ligatures([Ligature.rareOn]).name(rareLigatureFontName)
}.build()


let rareLigatureView = textComparisonView(text: rareLigatureText, font1: ligatureRareOn, font2: ligatureRareOff, title: rareLigatureTitle)

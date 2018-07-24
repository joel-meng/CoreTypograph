//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport

let fontURL = Bundle.main.url(forResource: "Taviraj-Regular", withExtension: ".ttf") as! CFURL
CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)

//: ##### Ligature Common

let commonLigatureTitle = "Common Ligature"
let commonLigatureText = "ff, ffi, ffl, fi, fj"
let commonLigatureFontName = "HoeflerText-Regular"

let ligatureCommonOn = FontBuilder { builder in
    builder.ligatures([Ligature.commonOn]).name(commonLigatureFontName)
}.build()

let ligatureCommonOff = FontBuilder { builder in
    builder.ligatures([Ligature.commonOff]).name(commonLigatureFontName)
}.build()

ligatureCommonOff.fontName

let commonLigatureView = textComparisonView(text: commonLigatureText, font1: ligatureCommonOn, font2: ligatureCommonOff, title: commonLigatureTitle)


//: ##### Ligature Rare

let rareLigatureText = """
st, ct
"""
let rareLigatureFontName = "HoeflerText-Regular"
let rareLigatureTitle = "Rare Ligature"

let ligatureRareOn = FontBuilder { builder in
    builder.ligatures([Ligature.commonOff, Ligature.rareOff]).name(rareLigatureFontName)
}.build()

let ligatureRareOff = FontBuilder { builder in
    builder.ligatures([Ligature.commonOff, Ligature.rareOn]).name(rareLigatureFontName)
}.build()


let rareLigatureView = textComparisonView(text: rareLigatureText, font1: ligatureRareOn, font2: ligatureRareOff, title: rareLigatureTitle)

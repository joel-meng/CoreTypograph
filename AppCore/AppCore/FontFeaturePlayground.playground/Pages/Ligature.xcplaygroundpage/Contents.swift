//: [Previous](@previous)

import CoreTypography
import UIKit
import PlaygroundSupport

let commonOn = FontFeatureBuilder { builder in
    builder.ligatures([Ligature.commonOn])
}.build()


let o = demoView(text: "ffi", font: UIFont.systemFont(ofSize: 12), title: "Ligature")

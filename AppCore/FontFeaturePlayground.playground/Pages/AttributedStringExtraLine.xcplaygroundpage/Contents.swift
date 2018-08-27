//: [Previous](@previous)

import CoreTypography
import Foundation
import PlaygroundSupport
import UIKit

let strikethroughStyler = Strikethrough.color(.red)
    + Strikethrough.style([.single, .byWord, .patternDash])

showCaseStyler(strikethroughStyler)

let underlineStyler = Underline.color(.red)
    + Underline.style([.single, .byWord])

showCaseStyler(underlineStyler)

//: [Next](@next)

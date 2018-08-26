//: [Previous](@previous)

import Foundation
import CoreTypography
import UIKit
import PlaygroundSupport

let paragraphStyle = Paragraph.firstlineIndent(0.points) + Paragraph.lineBreakMode(.byWordWrapping) + Paragraph.align(.natural)

let showCase = showCaseStyler(paragraphStyle)

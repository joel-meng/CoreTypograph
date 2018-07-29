//
//  ColorTextStyleTestCase.swift
//  CoreTypographyTests
//
//  Created by MENG, Joel on 28/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import XCTest
@testable import CoreTypography

class ColorTextStyleTestCase: XCTestCase {

    func testColorTextStyle() {
        let textToStyle = "Text to style"
        
        let styles = [
            AttributedStringRenderer.textColor(.orange),
            AttributedStringRenderer.backgroundColor(.lightGray),
        ]
        
        styles.reduce([]) { (result: [[NSAttributedStringKey: Any]], renderer: AttributedStringRenderer) -> [[NSAttributedStringKey: Any]] in
            result + [renderer.rendered]
        }
    }
}

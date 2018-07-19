//
//  Taviraj.swift
//  AppCore
//
//  Created by MENG, Joel on 13/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation
import UIKit
import CoreTypography

struct Taviraj: CustomFontContentSizeCategoryAware {
    
    var familyName: String { return "Taviraj" }
    
    func face(forTextStyle textStyle: UIFontTextStyle) -> FontFace {
        switch textStyle {
        case .headline:
            return .bold
        case .footnote:
            return .light
        default:
            return .regular
        }
    }
    
    func trait(forTextStyle textStyle: UIFontTextStyle) -> FontTrait? {
        switch textStyle {
        case .callout, .headline:
            return .italic
        default:
            return nil
        }
    }
    
    func fontPointSize(forTextStyle textStyle: UIFontTextStyle, contentSizeCategory: UIContentSizeCategory) -> CGFloat {
        return Taviraj.fontMetrics[textStyle]!.fontPointSize(forCategory: contentSizeCategory)
    }
    
    private static var fontMetrics: [UIFontTextStyle: FontMetrics] = [
        .body: FontMetrics(baseSize: 17, minimumPointSize: 14, maximumPointSize: 53, maximumFontScale: 200),
        .callout: FontMetrics(baseSize: 16, minimumPointSize: 13, maximumPointSize: 51, maximumFontScale: 200),
        .headline: FontMetrics(baseSize: 17, minimumPointSize: 14, maximumPointSize: 53, maximumFontScale: 200),
        ]
}

//
//  Taviraj.swift
//  AppCore
//
//  Created by MENG, Joel on 13/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import CoreTypography
import Foundation
import UIKit

struct Taviraj: CustomFontContentSizeCategoryAware {
    
    var familyName: String { return "Taviraj" }

    func face(forTextStyle textStyle: UIFont.TextStyle) -> FontFace {
        switch textStyle {
        case .headline:
            return .bold
        case .footnote:
            return .light
        default:
            return .regular
        }
    }

    func trait(forTextStyle textStyle: UIFont.TextStyle) -> FontTrait? {
        switch textStyle {
        case .callout, .headline:
            return .italic
        default:
            return nil
        }
    }

    func fontPointSize(forTextStyle textStyle: UIFont.TextStyle, contentSizeCategory: UIContentSizeCategory) -> CGFloat {
        return Taviraj.fontMetrics[textStyle]!.fontPointSize(forCategory: contentSizeCategory)
    }

    private static var fontMetrics: [UIFont.TextStyle: FontMetrics] = [
        .title1: FontMetrics(baseSize: 28, minimumPointSize: 25, maximumPointSize: 34, maximumFontScale: 200),
        .title2: FontMetrics(baseSize: 22, minimumPointSize: 19, maximumPointSize: 28, maximumFontScale: 200),
        .title3: FontMetrics(baseSize: 20, minimumPointSize: 17, maximumPointSize: 26, maximumFontScale: 200),
        .headline: FontMetrics(baseSize: 17, minimumPointSize: 14, maximumPointSize: 53, maximumFontScale: 200),
        .body: FontMetrics(baseSize: 17, minimumPointSize: 14, maximumPointSize: 53, maximumFontScale: 200),
        .callout: FontMetrics(baseSize: 16, minimumPointSize: 13, maximumPointSize: 51, maximumFontScale: 200),
        .subheadline : FontMetrics(baseSize: 15, minimumPointSize: 12, maximumPointSize: 21, maximumFontScale: 200),
        .footnote: FontMetrics(baseSize: 13, minimumPointSize: 12, maximumPointSize: 19, maximumFontScale: 200),
        .caption1: FontMetrics(baseSize: 12, minimumPointSize: 11, maximumPointSize: 18, maximumFontScale: 200),
        .caption2: FontMetrics(baseSize: 11, minimumPointSize: 11, maximumPointSize: 17, maximumFontScale: 200),
    ]
}

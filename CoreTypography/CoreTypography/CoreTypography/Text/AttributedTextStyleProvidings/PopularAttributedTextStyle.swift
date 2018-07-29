//
//  PopularAttributedTextStyle.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation
import UIKit

public typealias Font = UIFont
public typealias Color = UIColor

public enum PopularAttributedTextStyle {
    case font(Font)
    case textColor(Color)
    case backgroundColor(Color)
}

extension PopularAttributedTextStyle: AttributedTextStyleProviding {
    
    var style: [NSAttributedStringKey: Any] {
        switch self {
        case .textColor(let color):
            return [NSAttributedStringKey.foregroundColor: color]
        case .backgroundColor(let color):
            return [NSAttributedStringKey.backgroundColor: color]
        case .font(let font):
            return [NSAttributedStringKey.font: font]
        }
    }
}

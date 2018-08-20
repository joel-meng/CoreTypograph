//
//  PopularAttributedTextStyle.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.


import Foundation
import UIKit

public typealias PlatformFont = UIFont
public typealias PlatformColor = UIColor

public enum PopularAttributedStringStyleProvider {
    case font(PlatformFont)
    case textColor(PlatformColor)
    case backgroundColor(PlatformColor)
}

extension PopularAttributedStringStyleProvider: Provider {
    
    public var product: AttributedStringAttributes {
        switch self {
        case .textColor(let color):
            return [NSAttributedString.Key.foregroundColor: color]
        case .backgroundColor(let color):
            return [NSAttributedString.Key.backgroundColor: color]
        case .font(let font):
            return [NSAttributedString.Key.font: font]
        }
    }
}

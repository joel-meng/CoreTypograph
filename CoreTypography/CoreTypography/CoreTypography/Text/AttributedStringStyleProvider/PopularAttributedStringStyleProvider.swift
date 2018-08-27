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
    public var product: Attributes {
        switch self {
        case let .textColor(color):
            return [NSAttributedString.Key.foregroundColor: color]
        case let .backgroundColor(color):
            return [NSAttributedString.Key.backgroundColor: color]
        case let .font(font):
            return [NSAttributedString.Key.font: font]
        }
    }
}

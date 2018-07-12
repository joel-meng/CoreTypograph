//
//  FontFace.swift
//  CoreTypography
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

/// Popular font faces(also known as `weight`).
///
/// - black: Weight `Black`.
/// - extraBold: Weight `ExtraBold`.
/// - bold: Weight `Bold`.
/// - semiBold: Weight `SemiBold`.
/// - regular: Weight `Regular`.
/// - medium: Weight `Medium`.
/// - light: Weight `Light`.
/// - extraLight: Weight `ExtraLight`.
/// - thin: Weight `Thin`.
public enum FontFace: String {
    case black = "Black"
    case extraBold = "ExtraBold"
    case bold = "Bold"
    case semiBold = "SemiBold"
    case regular = "Regular"
    case medium = "Medium"
    case light = "Light"
    case extraLight = "ExtraLight"
    case thin = "Thin"
}

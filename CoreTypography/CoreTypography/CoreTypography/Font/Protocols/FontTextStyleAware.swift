//
//  FontTextStyleAware.swift
//  CoreTypography
//
//  Created by MENG, Joel on 12/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/// A protocol which is used to resolve font face by text style.
public protocol FontTextStyleAware {
    /// Provides font face by provided `UIFontTextStyle`, override this variable to provide font face implementation.
    ///
    /// - Parameter textStyle: Text style of type `UIFontTextStyle`
    /// - Returns: Required font face for text style
    func face(forTextStyle textStyle: UIFont.TextStyle) -> FontFace

    /// Provides font trait by provided `UIFontTextStyle`, override this variable to provide font trait implementation.
    ///
    /// - Parameter textStyle: Text style of type `UIFontTextStyle`
    /// - Returns: Required font trait for text style
    func trait(forTextStyle textStyle: UIFont.TextStyle) -> FontTrait?
}

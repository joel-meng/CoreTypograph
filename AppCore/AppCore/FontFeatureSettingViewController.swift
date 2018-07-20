//
//  FontFeatureSettingViewController.swift
//  AppCore
//
//  Created by MENG, Joel on 19/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit
import CoreTypography

class FontFeatureSettingViewController: UIViewController {

    @IBOutlet var textView: UITextView! {
        didSet {
            textView.text = """
            ö á â ä æ ã å ā for Diacritcs
            AV Ta for kerning
            ffi, ffl for ligature
            Quick brown fox jumps over the lazy dog.
            123,456,789.49 ...
            1/2 and 1st, 2nd, 3rd, 4th, 5th
            """
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.font = generateFontFeature()
        print(textView.font)
        print(textView.font?.fontDescriptor.fontAttributes)
    }
}

// MARK: - Pure functions

fileprivate func generateFontFeature() -> UIFont {
    let featureSetting = FontFeatureBuilder { (builder) in
        builder.ligature(required: .on).numberSpacing(.mono).upperCase(.smallCaps)
    }.build()
    
    print(featureSetting)
    
    let fontAttributes: [UIFontDescriptor.AttributeName : Any] = [
//        UIFontDescriptor.AttributeName.name: "Taviraj",
        UIFontDescriptor.AttributeName.name: "AvenirNext-Regular",
        UIFontDescriptor.AttributeName.featureSettings: featureSetting
    ]
    
    let descriptor = UIFontDescriptor(fontAttributes: fontAttributes)
    
    print(descriptor.fontAttributes)
    
    let font = UIFont(descriptor: descriptor, size: 16)
    return font
}

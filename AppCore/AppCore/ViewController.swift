//
//  ViewController.swift
//  AppCore
//
//  Created by MENG, Joel on 2/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit
import CoreTypography

class ViewController: UIViewController {

    @IBOutlet private var label1: UILabel!
    @IBOutlet private var label3: UILabel!
    @IBOutlet private var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var fontDescriptorAttributes: [UIFontDescriptor.AttributeName: Any] = [
            .name: "Taviraj",
//            .traits: [UIFontDescriptorSymbolicTraits.traitItalic]
        ]
        
//        fontDescriptorAttributes[.face] = "Bold"
        fontDescriptorAttributes[.size] = 7
        
        
        var fontDescriptor = UIFontDescriptor(fontAttributes: fontDescriptorAttributes)
        fontDescriptor = fontDescriptor.withSymbolicTraits(UIFontDescriptorSymbolicTraits.traitItalic)!
        print(fontDescriptor)
        let font = UIFont(descriptor: fontDescriptor, size: 15)
        
        
        label1.font = font
        label1.text = "Hello Taviraj"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol FontDescrbing {
    
    var fontName: String { get }
    
    func fontFace(forTextStyle textStyle: UIFontTextStyle) -> String
    
    func fontTraits(forTextStyle textStyle: UIFontTextStyle) -> UIFontDescriptorSymbolicTraits?
}

protocol ScalableFontDescribing: FontDescrbing {
    
    func fontPointSize(forTextStyle textStyle: UIFontTextStyle, contentSizeCategory: UIContentSizeCategory) -> CGFloat
}

struct Taviraj: ScalableFontDescribing {
    
    var fontName: String { return "Taviraj" }
    
    func fontFace(forTextStyle textStyle: UIFontTextStyle) -> String {
        switch textStyle {
        case .headline:
            return "Bold"
        case .footnote:
            return "Light"
        default:
            return "Regular"
        }
    }
    
    func fontTraits(forTextStyle textStyle: UIFontTextStyle) -> UIFontDescriptorSymbolicTraits? {
        switch textStyle {
        case .callout:
            return .traitItalic
        default:
            return nil
        }
    }
    
    func fontPointSize(forTextStyle textStyle: UIFontTextStyle, contentSizeCategory: UIContentSizeCategory) -> CGFloat {
        return fontSizeFactory(forTextStyle: textStyle)(contentSizeCategory)
    }
}

typealias FontSizeFactory = (UIContentSizeCategory) -> CGFloat

private func fontSizeFactory(forTextStyle textStyle: UIFontTextStyle) -> FontSizeFactory {
    switch textStyle {
    case .body:
        return bodyFontSize
    default:
        return bodyFontSize
    }
}

private func bodyFontSize(forContentSizeCategory contentSizeCategory:UIContentSizeCategory) -> CGFloat {
    return 0
}

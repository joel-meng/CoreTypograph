//
//  ViewController.swift
//  AppCore
//
//  Created by MENG, Joel on 2/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit
import CoreTypography

class ViewController: UIViewController, FontBook {
    

    @IBOutlet private var label1: UILabel!
    @IBOutlet private var label3: UILabel!
    @IBOutlet private var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

//        let font = UIFont(descriptor: fontDescriptor(fromFontDescribing: fontBook, withTextStyle: .body), size: fontBook.)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        DispatchQueue.global(qos: .default).async {
            self.configureLabel()
        }
    }
    
    private func configureLabel() {
        let bodyFont = font(for: Taviraj(), withTextStyle: .body, contentSizeCategory: traitCollection.preferredContentSizeCategory)
        let calloutFont = font(for: Taviraj(), withTextStyle: .callout, contentSizeCategory: traitCollection.preferredContentSizeCategory)
        let headlineFont = font(for: Taviraj(), withTextStyle: .headline, contentSizeCategory: traitCollection.preferredContentSizeCategory)
        DispatchQueue.main.async {
            self.label1.font = bodyFont
            self.label1.text = "\(bodyFont.pointSize) Taviraj.Body"

            self.label2.font = calloutFont
            self.label2.text = "\(calloutFont.pointSize) Taviraj.Callout"
            
            self.label3.font = headlineFont
            self.label3.text = "\(headlineFont.pointSize) Taviraj.Headline"
        }
    }
}

protocol FontDescrbing {
    
    var fontName: String { get }
    
    var fontMetrics: [UIFontTextStyle: FontMetrics] { get }
    
    func fontFace(forTextStyle textStyle: UIFontTextStyle) -> String
    
    func fontTraits(forTextStyle textStyle: UIFontTextStyle) -> UIFontDescriptorSymbolicTraits?
}

public protocol ContentSizeCategoryAware {
    
    var contentSizeCategory: UIContentSizeCategory { get }
}

protocol FontBook {
    
    func font(for fontDescribing: FontDescrbing, withTextStyle textStyle: UIFontTextStyle, contentSizeCategory: UIContentSizeCategory) -> UIFont
}

extension FontBook {
    
    func font(for fontDescribing: FontDescrbing, withTextStyle textStyle: UIFontTextStyle, contentSizeCategory: UIContentSizeCategory) -> UIFont {
        let descriptor = fontDescriptor(forFontDescribing: fontDescribing, textStyle: textStyle)
        let size = fontSize(forFont: fontDescribing, textStyle: textStyle, contentSizeCategory: contentSizeCategory)
        return UIFont(descriptor: descriptor, size: size)
    }
    
    private func fontDescriptor(forFontDescribing fontDescribing: FontDescrbing, textStyle: UIFontTextStyle) -> UIFontDescriptor {
        let fontDescriptorAttributes: [UIFontDescriptor.AttributeName: Any] = [
            .name: fontDescribing.fontName,
            .face: fontDescribing.fontFace(forTextStyle: textStyle),
            ]
        
        if let traits = fontDescribing.fontTraits(forTextStyle: textStyle) {
            if let traitedFontDescriptor = UIFontDescriptor(fontAttributes: fontDescriptorAttributes).withSymbolicTraits(traits) {
                let fontDescriptorAttributes: [UIFontDescriptor.AttributeName: Any] = [
                    .name: traitedFontDescriptor.fontAttributes[.name]!,
                    .face: traitedFontDescriptor.fontAttributes[.face]!,
                    ]

                return UIFontDescriptor(fontAttributes: fontDescriptorAttributes)
            }
            assertionFailure("Error: Unable to create font descriptor with \(fontDescribing.fontName) and trait \(traits)")
        }
        
        return UIFontDescriptor(fontAttributes: fontDescriptorAttributes)
    }
    
    private func fontSize(forFont fontDescribing: FontDescrbing, textStyle: UIFontTextStyle, contentSizeCategory: UIContentSizeCategory) -> CGFloat {
        return fontDescribing.fontMetrics[textStyle]!.fontPointSize(forCategory: contentSizeCategory)
    }
}

struct Taviraj:  FontDescrbing {
    
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

    var fontMetrics: [UIFontTextStyle: FontMetrics] = [
        .body: FontMetrics(baseSize: 17, minimumPointSize: 14, maximumPointSize: 53, maximumFontScale: 200, shouldRoundSizes: true),
        .callout: FontMetrics(baseSize: 16, minimumPointSize: 13, maximumPointSize: 51, maximumFontScale: 200, shouldRoundSizes: true),
        .headline: FontMetrics(baseSize: 17, minimumPointSize: 14, maximumPointSize: 53, maximumFontScale: 200, shouldRoundSizes: true),
    ]
}

public extension UIFontDescriptor {
    
//    public class func preferredFontDescriptor(withTextStyle style: UIFontTextStyle) -> UIFontDescriptor {
//        var fontDescriptorAttributes: [UIFontDescriptor.AttributeName: Any] = [
//
//        ]
//        UIFontDescriptor(fontAttributes: <#T##[UIFontDescriptor.AttributeName : Any]#>)
//    }
}

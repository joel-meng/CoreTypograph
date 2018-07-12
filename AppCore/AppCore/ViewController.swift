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

//        let font = UIFont(descriptor: fontDescriptor(fromFontDescribing: fontBook, withTextStyle: .body), size: fontBook.)
        
//        DispatchQueue.global(qos: .default).async {
//            self.configureLabel()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        DispatchQueue.global(qos: .default).async {
            self.configureLabel()
        }
    }
    
    private func configureLabel() {
        
        let taviraj = Taviraj()
        let bodyFont = taviraj.font(forTextStyle: .body, contentSizeCategory: traitCollection.preferredContentSizeCategory)
        let calloutFont = taviraj.font(forTextStyle: .callout, contentSizeCategory: traitCollection.preferredContentSizeCategory)
        let headlineFont = taviraj.font(forTextStyle: .headline, contentSizeCategory: traitCollection.preferredContentSizeCategory)
        
        DispatchQueue.main.async {
            self.label1.font = bodyFont
            self.label1.text = "AAA Font size: \(bodyFont.pointSize) Taviraj.Body"

            self.label2.font = calloutFont
            self.label2.text = "AAA Font size: \(calloutFont.pointSize) Taviraj.Callout"

            self.label3.font = headlineFont
            self.label3.text = "AAA Font size:\(headlineFont.pointSize) Taviraj.Headline"
        }
    }
}

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

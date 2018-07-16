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
//        DispatchQueue.global(qos: .default).async {
//            self.configureLabel()
//        }
        configureBuildinFont()
    }
    
    func configureBuildinFont() {
        let fontAttributes: [UIFontDescriptor.AttributeName: Any] = [
            UIFontDescriptor.AttributeName.family: "Helvetica Neue",
//            UIFontDescriptor.AttributeName.traits: UIFontDescriptorSymbolicTraits.traitBold,
        ]
        let fontDescriptor = UIFontDescriptor(fontAttributes: fontAttributes)
        let availableFonts = fontDescriptor.matchingFontDescriptors(withMandatoryKeys: nil)

        
        let timeFeaturesSetting = [
            [
                UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                UIFontDescriptor.FeatureKey.typeIdentifier: kProportionalNumbersSelector
            ],
            [
                UIFontDescriptor.FeatureKey.featureIdentifier: kCharacterAlternativesType,
                UIFontDescriptor.FeatureKey.typeIdentifier: 2
            ],
            [
                UIFontDescriptor.FeatureKey.featureIdentifier: kCaseSensitiveLayoutType,
                UIFontDescriptor.FeatureKey.typeIdentifier: kCaseSensitiveLayoutOnSelector
            ],
        ]
        
        print(availableFonts)
        let theFont = UIFont(descriptor: fontDescriptor, size: 16)
        let fontCopyFeatures =
        print("Features \(CTFontCopyFeatures(theFont))")
        print("char set \(CTFontCopyCharacterSet(theFont))")
        print("descriptor \(CTFontCopyFontDescriptor(theFont))")
        print("char set \(CTFontCopySupportedLanguages(theFont))")
        
        label1.font = UIFont(descriptor: fontDescriptor, size: 16)
        label1.text = "Helvetica Neue, 111111111111111111111111111111111234567890"
        
        label2.font = UIFont(descriptor: fontDescriptor.addingAttributes([
            UIFontDescriptor.AttributeName.featureSettings: timeFeaturesSetting
        ]), size: 16)
        label2.text = "Helvetica Neue, 111111111111111111111111111111111234567890"
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


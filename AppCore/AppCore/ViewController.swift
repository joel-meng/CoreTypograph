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

        
        let styler = Text.color(.darkGray) + Text.effect(.letterpressStyle) // + Strikethrough.color(.red) + Strikethrough.style([.double, .byWord])
        let style: [NSAttributedString.Key: Any] = styler([:])
        
        let styledText = NSAttributedString(string: "Attributed String", attributes: style)
        label1.attributedText = styledText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


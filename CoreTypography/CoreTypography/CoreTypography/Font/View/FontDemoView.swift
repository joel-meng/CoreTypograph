//
//  FontDemoView.swift
//  CoreTypography
//
//  Created by MENG, Joel on 24/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

public func textComparisonView(text: String, font1: UIFont, font2: UIFont, title: String) -> UIView {
    let stackView = demoStackView(text: text, font1: font1, font2: font2, title: title)
    let demoView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 1))
    demoView.translatesAutoresizingMaskIntoConstraints = false
    
    demoView.backgroundColor = .white
    demoView.addSubview(stackView)
    let constraints: [NSLayoutConstraint] = [demoView.leftAnchor.constraint(equalTo: stackView.leftAnchor),
                                             demoView.rightAnchor.constraint(equalTo: stackView.rightAnchor),
                                             demoView.topAnchor.constraint(equalTo: stackView.topAnchor),
                                             demoView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)]
    
    NSLayoutConstraint.activate(constraints)
    demoView.layoutIfNeeded()
    
    return demoView
}

private func demoStackView(text: String, font1: UIFont, font2: UIFont, title: String) -> UIStackView {
    
    let padding: CGFloat = 8
    
    let titleLabel = titleLable(withText: title)
    let firstLabel = typographyLable(withText: text, font: font1)
    let secondLabel = typographyLable(withText: text, font: font2)
    
    let demoStackView = UIStackView(arrangedSubviews: [titleLabel, firstLabel, secondLabel])
    demoStackView.translatesAutoresizingMaskIntoConstraints = false
    demoStackView.distribution = .fill
    demoStackView.axis = .vertical
    
    demoStackView.isLayoutMarginsRelativeArrangement = true
    demoStackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    demoStackView.spacing = padding
    return demoStackView
}

private func titleLable(withText text: String) -> UILabel {
    let resultLabel = UILabel()
    resultLabel.backgroundColor = UIColor.lightGray
    resultLabel.text = text
    resultLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    resultLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    resultLabel.sizeToFit()
    
    return resultLabel
}

private func typographyLable(withText text: String, font: UIFont) -> UILabel {
    let resultLabel = UILabel()
    resultLabel.text = text
    resultLabel.font = font
    
    resultLabel.layer.borderColor = UIColor.red.cgColor
    resultLabel.layer.borderWidth = 1
    resultLabel.backgroundColor = .white
    
    resultLabel.preferredMaxLayoutWidth = 400
    resultLabel.numberOfLines = 0
    resultLabel.lineBreakMode = .byWordWrapping
    
    resultLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    resultLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    resultLabel.sizeToFit()
    return resultLabel
}

import Foundation
import UIKit

public func demoView(text: String, font: UIFont, title: String) -> UIView {
    let stackView = demoStackView(text: text, font: font, title: title)
    let demoView = UIView(frame: CGRect(x: 0, y: 0,
                                        width: stackView.frame.width,
                                        height: stackView.frame.height))
    demoView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    demoView.backgroundColor = .white
    demoView.addSubview(stackView)
    
    return demoView
}

private func demoStackView(text: String, font: UIFont, title: String) -> UIStackView {
    let titleLabel = titleLable(withText: title)
    
    let originalLabel = typographyLable(withText: text, font: font)
    let appliedLabel = typographyLable(withText: text, font: font)
    
    let demoStackView = UIStackView(arrangedSubviews: [titleLabel, originalLabel, appliedLabel])
    demoStackView.distribution = .fill
    demoStackView.axis = .vertical
    
    demoStackView.frame = CGRect(x: 0, y: 0, width: 320, height: 80)
    demoStackView.isLayoutMarginsRelativeArrangement = true
    demoStackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    demoStackView.spacing = 2
    return demoStackView
}

private func titleLable(withText text: String) -> UILabel {
    let resultLabel = UILabel()
    resultLabel.backgroundColor = UIColor.lightGray
    resultLabel.text = text
    resultLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    
    return resultLabel
}

private func typographyLable(withText text: String, font: UIFont) -> UILabel {
    let resultLabel = UILabel()
    resultLabel.backgroundColor = .white
    resultLabel.text = text
    resultLabel.font = font
    resultLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    return resultLabel
}

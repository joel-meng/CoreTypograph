import UIKit

// public func demoView(text: String, font1: UIFont, font2: UIFont, title: String) -> UIView {
//    let stackView = demoStackView(text: text, font1: font1, font2: font2, title: title)
//    let demoView = UIView(frame: CGRect(x: 0, y: 0,
//                                        width: stackView.frame.width,
//                                        height: stackView.frame.height))
//    demoView.backgroundColor = .white
//    demoView.addSubview(stackView)
//
//    return demoView
// }
//
// private func demoStackView(text: String, font1: UIFont, font2: UIFont, title: String) -> UIStackView {
//
//    let padding: CGFloat = 8
//
//    let titleLabel = titleLable(withText: title)
//
//    let originalLabel = typographyLable(withText: text, font: font1)
//    let appliedLabel = typographyLable(withText: text, font: font2)
//
//    let demoStackView = UIStackView(arrangedSubviews: [titleLabel, originalLabel, appliedLabel])
//    demoStackView.distribution = .fill
//    demoStackView.axis = .vertical
//
//    let height = (originalLabel.frame.height + appliedLabel.frame.height + titleLabel.frame.height + padding + padding + padding + padding)
//    demoStackView.frame = CGRect(x: 0, y: 0, width: 320, height: height)
//    demoStackView.isLayoutMarginsRelativeArrangement = true
//    demoStackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//
//    demoStackView.spacing = padding
//    return demoStackView
// }
//
// private func titleLable(withText text: String) -> UILabel {
//    let resultLabel = UILabel()
//    resultLabel.backgroundColor = UIColor.lightGray
//    resultLabel.text = text
//    resultLabel.sizeToFit()
//
//    return resultLabel
// }
//
// private func typographyLable(withText text: String, font: UIFont) -> UILabel {
//    let resultLabel = UILabel()
//    resultLabel.backgroundColor = .white
//    resultLabel.text = text
//    resultLabel.font = font
//    resultLabel.numberOfLines = 0
//    resultLabel.lineBreakMode = .byWordWrapping
//
//    resultLabel.sizeToFit()
//    resultLabel.frame.height
//    return resultLabel
// }
//

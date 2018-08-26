import Foundation
import UIKit
import CoreTypography

let showcaseText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""

public func showCaseStyler(_ styler: TextStyler) -> UILabel {
    let style: [NSAttributedString.Key: Any] = styler([:])
    let styledText = NSAttributedString(string: showcaseText, attributes: style)
    return attributedStringLabel(text: styledText)
}

public func attributedStringLabel(text: NSAttributedString, numberOfLines: Int = 0, size: CGSize = CGSize(width: 300, height: 160)) -> UILabel {
    let showCaseLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    showCaseLabel.numberOfLines = 0
    showCaseLabel.backgroundColor = .white
    showCaseLabel.attributedText = text
    showCaseLabel.sizeToFit()
    return showCaseLabel
}

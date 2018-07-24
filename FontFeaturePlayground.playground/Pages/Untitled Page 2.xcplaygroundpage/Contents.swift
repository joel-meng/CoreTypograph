import UIKit
import PlaygroundSupport

let containerView = UIView()
containerView.frame = CGRect.init(x: 0, y: 0, width: 400, height: 800)
containerView.backgroundColor = UIColor.white

var label = UILabel.init()
label.textColor = .black
label.numberOfLines = 0
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "This is an example of sample text that goes on for a long time. This is an example of sample text that goes on for a long time."

var label2 = UILabel.init()
label.textColor = .black
label.numberOfLines = 0
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "This is an example of sample text that goes on for a long time. This is an example of sample text that goes on for a long time."

let stackView = UIStackView.init(arrangedSubviews: [label, label2])
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .vertical
stackView.distribution = .fill
stackView.alignment = .fill
containerView.addSubview(stackView)
stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
stackView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
stackView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true

PlaygroundPage.current.liveView = containerView

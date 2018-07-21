//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreTypography

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        view.addSubview(label1().0)
        view.addSubview(label1().1)
        
        self.view = view
    }
    
    func label1() -> (UILabel, UILabel) {
        
        let systemFont = UIFont.systemFont(ofSize: 15)
        let originalLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 375, height: 20))
        originalLabel.text = "123456789.00"
        originalLabel.font = systemFont
        
        
        let fontFeauter = FontFeatureBuilder { (builder) in
            builder.numberSpacing(.mono)
        }.build()
        
        let newDescriptor = systemFont.fontDescriptor.addingAttributes(
            [UIFontDescriptor.AttributeName.featureSettings: fontFeauter])
        
        
        let label1: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 20))
        label1.text = "123456789.00"
        label1.backgroundColor = .white
        label1.font = UIFont(descriptor: newDescriptor, size: 15)
        return (originalLabel, label1)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

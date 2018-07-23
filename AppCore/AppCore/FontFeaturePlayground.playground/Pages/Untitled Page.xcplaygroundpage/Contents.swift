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
        
        let numberSpacingMono = label1()
        view.addSubview(numberSpacingMono.0)
        view.addSubview(numberSpacingMono.1)
        
        let ligatureComparision = ligatures()
        view.addSubview(ligatureComparision.0)
        view.addSubview(ligatureComparision.1)
        self.view = view
    }
    
    func label1() -> (UILabel, UILabel) {
        
        let systemFont = UIFont.systemFont(ofSize: 15)
        let originalLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 375, height: 20))
        originalLabel.text = "123456789.00 ffi ffl th"
        originalLabel.font = systemFont
        
        
        let fontFeauter = FontFeatureBuilder { (builder) in
            builder.numberSpacing(.mono)
        }.build()
        
        let newDescriptor = systemFont.fontDescriptor.addingAttributes(
            [UIFontDescriptor.AttributeName.featureSettings: fontFeauter])
        
        
        let label1: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 20))
        label1.text = "123456789.00 ffi ffl th"
        label1.backgroundColor = .white
        label1.font = UIFont(descriptor: newDescriptor, size: 15)
        return (originalLabel, label1)
    }
    
    func ligatures() -> (UILabel, UILabel) {
        let ligatureText = "ff fi fl ffi ffl fff fh / st ot et ss es ct"
//        let ligatureText = "st ot et ss es ct"
        
        let fontDescriptor = UIFontDescriptor(fontAttributes:
            [UIFontDescriptor.AttributeName.name: "Baskerville"])
        
        let originalLabel = UILabel()
        originalLabel.frame = CGRect(x: 0, y: 40, width: 370, height: 25)
        originalLabel.text = ligatureText
        originalLabel.font = UIFont(descriptor: fontDescriptor, size: 25)
        let font = UIFont(descriptor: fontDescriptor, size: 15).fontName
        
        let ligatureLabel = UILabel()
        
        let ligature = FontFeatureBuilder { builder in
            builder.ligatures([ Ligature.historicalOn])
        }.build()
        let ligatureFontDescriptor = fontDescriptor
            .addingAttributes([UIFontDescriptor.AttributeName.featureSettings: ligature])
        ligatureLabel.text = ligatureText
        ligatureLabel.font = UIFont(descriptor: ligatureFontDescriptor, size: 25)
        ligatureFontDescriptor.fontAttributes
        let font2 = UIFont(descriptor: ligatureFontDescriptor, size: 15).fontDescriptor.fontAttributes
        
        ligatureLabel.frame = CGRect(x: 0, y: 60, width: 370, height: 25)
        return (originalLabel, ligatureLabel)
    }
}

// Present the view controller in the Live View window
let demoViewController = MyViewController()
demoViewController.view.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
PlaygroundPage.current.liveView = demoViewController

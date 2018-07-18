//
//  FontFeatureTableViewController.swift
//  AppCore
//
//  Created by MENG, Joel on 13/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit
import CoreTypography

class FontFeatureTableViewController: UITableViewController {
    
    typealias FontFeatureSelection = ([FontFeatureOptionSelection]) -> Void
    
    var font: FontTableViewController.FontFace!
    
    private var fontFeatures: [FontFeature] = []
    
    private var fontFeaturesDataSet: [FontFeaturePresentationModel] = []
    
    var fontFeatureSelection: (FontFeatureSelection)?
    
    @IBOutlet var showCaseLabel: UILabel! {
        didSet {
            showCaseLabel.textAlignment = .center
            showCaseLabel.numberOfLines = 0
            showCaseLabel.lineBreakMode = .byWordWrapping
            
            showCaseLabel.text = """
            ffi, ffl for ligature
            Quick brown fox jumps over the lazy dog.
            123,456,789
            1/2 and 1st
            """
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = font.faceName
        let systemFont = UIFont.systemFont(ofSize: 12)
        print(systemFont.fontName + " - " + systemFont.familyName)
        fontFeatures = CoreTypography.availableFontFeatures(forFont: font.faceName) ?? []
        fontFeaturesDataSet = presentationModel(for: fontFeatures)
        
        updateShowCaseLabelWithSelectedOptions()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fontFeaturesDataSet.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontFeaturesDataSet[section].options.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fontFeaturesDataSet[section].name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontFeatureOption", for: indexPath)
        let fontFeature = fontFeaturesDataSet[indexPath.section]
        let fontFeatureOption = fontFeature.options[indexPath.row]
        
        cell.textLabel?.text = fontFeatureOption.name
        cell.detailTextLabel?.text = fontFeatureOption.name
        
        cell.accessoryType = (fontFeatureOption.isSelected) ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var fontFeature = fontFeaturesDataSet[indexPath.section]
        let featureOption = fontFeature.options[indexPath.row]
        if fontFeature.exclusive {
            fontFeature.options = fontFeature.options.map({ (option) -> FontFeatureOptionPresentationModel in
                FontFeatureOptionPresentationModel(name: option.name,
                                                   identifier: option.identifier,
                                                   isSelected: (option.identifier == featureOption.identifier),
                                                   feature: option.feature)
            })
        } else {
            fontFeature.options[indexPath.row] = FontFeatureOptionPresentationModel(name: featureOption.name,
                                                                                    identifier: featureOption.identifier,
                                                                                    isSelected: true,
                                                                                    feature: featureOption.feature)
        }
        fontFeaturesDataSet[indexPath.section] = fontFeature
        
        updateShowCaseLabelWithSelectedOptions()
        
        tableView.reloadData()
    }
    
    // MARK: - Private methods
    
    // MARK: - Creating font from selected font feature
    
    fileprivate func updateShowCaseLabelWithSelectedOptions() {
        let selectedOptions = fontFeaturesDataSet.flatMap { (feature) in
            feature.options.filter {$0.isSelected}
        }
        updateShowCaseLabel(withFontFeature: selectedOptions)
    }
    
    fileprivate func updateShowCaseLabel(withFontFeature fontFeatureOptions: [FontFeatureOptionPresentationModel]) {
        showCaseLabel.font = self.font(for: fontFeatureOptions)
    }
    
    fileprivate func featureSetting(for fontFeatureOptions: [FontFeatureOptionPresentationModel]) -> [[UIFontDescriptor.FeatureKey: Int]] {
        return fontFeatureOptions.map { (featureOption) -> [UIFontDescriptor.FeatureKey: Int] in
            featureSetting(for: featureOption)
        }
    }
    
    fileprivate func featureSetting(for fontFeatureOption: FontFeatureOptionPresentationModel) -> [UIFontDescriptor.FeatureKey: Int] {
        return [
            UIFontDescriptor.FeatureKey.featureIdentifier: fontFeatureOption.feature.identifier,
            UIFontDescriptor.FeatureKey.typeIdentifier: fontFeatureOption.identifier,
        ]
    }
    
    fileprivate func font(for fontFeatureOptions: [FontFeatureOptionPresentationModel]) -> UIFont {
        let featureSettings = featureSetting(for: fontFeatureOptions)
        let font = UIFont(descriptor: fontDescriptor(with: featureSettings), size: 16)
        return font
    }
    
    fileprivate func fontDescriptor(with featureSetting: [[UIFontDescriptor.FeatureKey: Int]]) -> UIFontDescriptor {
        print("expected:  \(featureSetting)")
        
        let fontAttributes: [UIFontDescriptor.AttributeName: Any] = [
            UIFontDescriptor.AttributeName.name: self.font.faceName,
            UIFontDescriptor.AttributeName.featureSettings: featureSetting,
        ]
        let fontDescriptor = UIFontDescriptor(fontAttributes: fontAttributes)
        print("actual:  \(fontDescriptor.fontAttributes)")
        return fontDescriptor
    }
    
    // MARK: - Mapper
    
    fileprivate func presentationModel(for fontFeatures: [FontFeature]) -> [FontFeatureTableViewController.FontFeaturePresentationModel] {
        return fontFeatures.map { (fontFeature) -> FontFeaturePresentationModel in
            
            var feature = FontFeaturePresentationModel(name: fontFeature.featureName,
                                                       exclusive: fontFeature.exclusive,
                                                       identifier: fontFeature.featureIdentifier)
            
            let options = fontFeature.options.map({ (option) -> FontFeatureOptionPresentationModel in
                return FontFeatureOptionPresentationModel(name: option.name,
                                                          identifier: option.identifier,
                                                          isSelected: option.isDefault,
                                                          feature: feature)
            })
            
            feature.options = options
            return feature
        }
    }
    
    // MARK: - Internal View Model
    
    fileprivate struct FontFeaturePresentationModel {
        let name: String
        let exclusive: Bool
        let identifier: Int
        var options: [FontFeatureOptionPresentationModel]!
        
        init(name: String, exclusive: Bool, identifier: Int) {
            self.name = name
            self.exclusive = exclusive
            self.identifier = identifier
        }
    }
    
    fileprivate struct FontFeatureOptionPresentationModel: Equatable {
        let name: String
        let identifier: Int
        let isSelected: Bool
        var feature: FontFeaturePresentationModel
        
        init(name: String, identifier: Int, isSelected: Bool, feature: FontFeaturePresentationModel) {
            self.name = name
            self.identifier = identifier
            self.isSelected = isSelected
            self.feature = feature
        }
        
        static func ==(lhs: FontFeatureOptionPresentationModel, rhs: FontFeatureOptionPresentationModel) -> Bool {
            return lhs.identifier == rhs.identifier
        }
    }
    
    struct FontFeatureOptionSelection {
        let feature: FontFeature
        let selectedOption: FontFeature.Option?
    }
}

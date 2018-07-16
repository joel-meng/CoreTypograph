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
        updateShowCaseLabel(withFontFeature: fontFeaturesDataSet)
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
        let fontFeature: FontFeaturePresentationModel = fontFeaturesDataSet[indexPath.section]
        let fontFeatureOption: FontFeaturePresentationModel.FontFeatureOption = fontFeature.options[indexPath.row]
        cell.textLabel?.text = fontFeatureOption.optionName
        cell.textLabel?.font = fontWithFeatures([fontFeature])
        
        cell.detailTextLabel?.text = fontFeatureOption.optionName
        if let selectedFeatureOption = fontFeature.selectedOptioin {
            cell.accessoryType = (selectedFeatureOption == fontFeatureOption) ? .checkmark : .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var fontFeature = fontFeaturesDataSet[indexPath.section]
        let featureOption = fontFeature.options[indexPath.row]
        fontFeature.selectedOptioin = featureOption
        fontFeaturesDataSet[indexPath.section] = fontFeature
        
        // Do selection
        let fontFeatureSelection = fontFeatureModel(for: fontFeaturesDataSet)
        self.fontFeatureSelection?(fontFeatureSelection)
        
        updateShowCaseLabel(withFontFeature: fontFeaturesDataSet)
        
        tableView.reloadData()
    }
    
    // MARK: - Private methods
    
    // MARK: - Creating font from selected font feature
    
    fileprivate func updateShowCaseLabel(withFontFeature fontFeatures: [FontFeaturePresentationModel]) {
        let font = fontWithFeatures(fontFeatures)
        showCaseLabel.font = font
    }
    
    fileprivate func fontWithFeatures(_ fontFeatures: [FontFeaturePresentationModel]) -> UIFont {
        
        let selectedFeaturesAndOption = fontFeatureModel(for: fontFeatures)
        let fontFeatureSetting = selectedFeaturesAndOption.flatMap { (selection) -> [UIFontDescriptor.FeatureKey: Int]? in
            guard let selectedOption = selection.selectedOption else {
                return nil
            }
            return selection.feature.setting(forOption: selectedOption)
        }
        
        let fontAttributes: [UIFontDescriptor.AttributeName: Any] = [
            UIFontDescriptor.AttributeName.name: self.font.faceName,
            UIFontDescriptor.AttributeName.featureSettings: fontFeatureSetting,
        ]
        
        print(fontAttributes)
        
        let fontDescriptor = UIFontDescriptor(fontAttributes: fontAttributes)
        
        print("in the middle: \(fontDescriptor.fontAttributes)")
        
        let font = UIFont(descriptor: fontDescriptor, size: 16)
        
        print("actual:  \(font.fontDescriptor.fontAttributes)")
        
        return font
    }
    
    // MARK: - Mapper
    
    fileprivate func presentationModel(for fontFeatures: [FontFeature]) -> [FontFeatureTableViewController.FontFeaturePresentationModel] {
        return fontFeatures.map { (fontFeature) -> FontFeaturePresentationModel in
            let options = fontFeature.options.map({ (option) -> FontFeaturePresentationModel.FontFeatureOption in
                return FontFeaturePresentationModel.FontFeatureOption(optionName: option.name, optionIdentifier: option.identifier, isDefault: option.isDefault)
            })
            let defaultFeature = fontFeature.options.filter{ $0.isDefault }.first.map { option in
                return FontFeaturePresentationModel.FontFeatureOption(optionName: option.name, optionIdentifier: option.identifier, isDefault: option.isDefault)
            }
            return FontFeaturePresentationModel(name: fontFeature.featureName,
                                                exclusive: fontFeature.exclusive,
                                                identifier: fontFeature.featureIdentifier,
                                                options: options,
                                                selectedOptioin: defaultFeature)
        }
    }
    
    fileprivate func fontFeatureModel(for fontFeaturePresentationModels: [FontFeaturePresentationModel]) -> [FontFeatureOptionSelection] {
        return fontFeaturePresentationModels.map { (fontFeaturePresentationModel) -> FontFeatureOptionSelection in
            let options = fontFeaturePresentationModel.options.map({ (featureOption) -> FontFeature.Option in
                return FontFeature.Option(key: featureOption.optionName, value: featureOption.optionIdentifier, isDefault: featureOption.isDefault )
            })
            
            let selectedOption = fontFeaturePresentationModel.selectedOptioin.map({ (option) -> FontFeature.Option in
                return FontFeature.Option(key: option.optionName, value: option.optionIdentifier, isDefault: option.isDefault)
            })
            
            let fontFeatures = FontFeature(featureName: fontFeaturePresentationModel.name,
                                          featureIdentifier: fontFeaturePresentationModel.identifier,
                                          exclusive: fontFeaturePresentationModel.exclusive,
                                          options: options)
            return FontFeatureOptionSelection(feature: fontFeatures, selectedOption: selectedOption)
        }
    }
    
    // MARK: - Internal View Model
    
    fileprivate struct FontFeaturePresentationModel {
        let name: String
        let exclusive: Bool
        let identifier: Int
        let options: [FontFeatureOption]
        var selectedOptioin: FontFeatureOption?
        
        struct FontFeatureOption: Equatable {
            let optionName: String
            let optionIdentifier: Int
            let isDefault: Bool
            
            static func ==(lhs: FontFeatureOption, rhs: FontFeatureOption) -> Bool {
                return lhs.optionIdentifier == rhs.optionIdentifier
            }
        }
    }
    
    struct FontFeatureOptionSelection {
        let feature: FontFeature
        let selectedOption: FontFeature.Option?
    }
}

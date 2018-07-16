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
    
    typealias FontFeatureSelection = ([FontFeature]) -> Void
    
    var font: FontTableViewController.FontFace!
    
    private var fontFeatures: [FontFeature] = []
    
    private var fontFeaturesDataSet: [FontFeaturePresentationModel] = []
    
    var fontFeatureSelection: (FontFeatureSelection)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = font.faceName
        
        fontFeatures = CoreTypography.availableFontFeatures(forFont: font.faceName) ?? []
        let fontFeaturesPresetationViewModel = fontFeatures.map { (fontFeature) -> FontFeaturePresentationModel in
            let options = fontFeature.options.map({ (option) -> FontFeaturePresentationModel.FontFeatureOption in
                return FontFeaturePresentationModel.FontFeatureOption(optionKey: option.key, optionValue: option.value, isDefault: option.isDefault)
            })
            let defaultFeature = fontFeature.options.filter{ $0.isDefault }.first.map { option in
                return FontFeaturePresentationModel.FontFeatureOption(optionKey: option.key, optionValue: option.value, isDefault: option.isDefault)
            }
            return FontFeaturePresentationModel(name: fontFeature.featureName,
                                                exclusive: fontFeature.exclusive,
                                                options: options,
                                                selectedOptioin: defaultFeature)
        }
        self.fontFeaturesDataSet = fontFeaturesPresetationViewModel
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
        cell.textLabel?.text = fontFeatureOption.optionKey
        cell.detailTextLabel?.text = "\(fontFeatureOption.optionValue)"
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
        
        let fontFeatureSelection = fontFeaturesDataSet.map { (fontFeaturePresentationModel) -> FontFeature in
            let options = fontFeaturePresentationModel.options.map({ (featureOption) -> FontFeature.Option in
                return FontFeature.Option(key: featureOption.optionKey, value: featureOption.optionValue, isDefault: featureOption.isDefault )
            })
            return FontFeature(featureName: fontFeaturePresentationModel.name,
                               exclusive: fontFeaturePresentationModel.exclusive,
                               options: options)
        }
        self.fontFeatureSelection?(fontFeatureSelection)
        
        tableView.reloadData()
    }
    
    fileprivate struct FontFeaturePresentationModel {
        let name: String
        let exclusive: Bool
        let options: [FontFeatureOption]
        var selectedOptioin: FontFeatureOption?
        
        struct FontFeatureOption: Equatable {
            let optionKey: String
            let optionValue: Int
            let isDefault: Bool
            
            static func ==(lhs: FontFeatureOption, rhs: FontFeatureOption) -> Bool {
                return lhs.optionValue == rhs.optionValue
            }
        }
    }
}

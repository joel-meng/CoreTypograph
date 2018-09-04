//
//  FontFeatureTableViewController.swift
//  AppCore
//
//  Created by MENG, Joel on 13/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import CoreTypography
import UIKit

class FontFeatureViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var textView: UITextView! {
        didSet {
            textView.textAlignment = .center
            textView.isScrollEnabled = false

            textView.text = """
            ö á â ä æ ã å ā for Diacritcs
            AV Ta for kerning
            ffi, ffl for ligature
            Quick brown fox jumps over the lazy dog.
            123,456,789.49 ...
            1/2 and 1st, 2nd, 3rd, 4th, 5th
            """
        }
    }

    @IBOutlet var tableView: UITableView!

    private var fontFeatures: [FontFeature] = []

    private var fontFeaturesDataSet: [FontFeaturePresentationModel] = []

    var font: FontTableViewController.FontFace!

    var fontFeatureSelection: ([FontFeatureAttribute])?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = font.faceName

        tableView.delegate = self
        tableView.dataSource = self

        fontFeatures = CoreTypography.availableFontFeatures(forFont: font.faceName) ?? []
        fontFeaturesDataSet = presentationModel(for: fontFeatures)
        defaultFontFeatures = fontFeaturesWithDefaultOptions(fromFontFeatures: fontFeatures)

        updateShowCaseLabelWithSelectedOptions()
    }

    // MARK: - Table view data source

    func numberOfSections(in _: UITableView) -> Int {
        return fontFeaturesDataSet.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontFeaturesDataSet[section].options.count
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fontFeaturesDataSet[section].name
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontFeatureOption", for: indexPath)
        let fontFeature = fontFeaturesDataSet[indexPath.section]
        let fontFeatureOption = fontFeature.options[indexPath.row]

        cell.textLabel?.text = fontFeatureOption.name
        cell.detailTextLabel?.text = fontFeatureOption.name

        cell.accessoryType = (fontFeatureOption.isSelected) ? .checkmark : .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var fontFeature = fontFeaturesDataSet[indexPath.section]
        let featureOption = fontFeature.options[indexPath.row]
        if fontFeature.exclusive {
            fontFeature.options = fontFeature.options.map({ (option) -> FontFeatureOptionPresentationModel in
                let isSelectedOption = (option.identifier == featureOption.identifier)
                return FontFeatureOptionPresentationModel(name: option.name,
                                                          identifier: option.identifier,
                                                          isSelected: isSelectedOption ? !option.isSelected : false,
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
        let selectedOptions = fontFeaturesDataSet.flatMap { feature in
            feature.options.filter { $0.isSelected }
        }
        updateShowCaseLabel(label: textView, withFontFeature: selectedOptions, fontName: font.faceName)
    }
}

// MARK: - Pure functions

typealias FontFeatureAttribute = [UIFontDescriptor.FeatureKey: Int]

fileprivate var defaultFontFeatures: [(featureIdentifier: Int, optionIdentifier: Int)] = []

fileprivate func fontFeaturesWithDefaultOptions(fromFontFeatures fontFeatures: [FontFeature]) -> [(featureIdentifier: Int, optionIdentifier: Int)] {
    let fontFeatureWithDefaultOptions = fontFeatures.compactMap { (fontFeature) -> (Int, Int) in
        (featureIdentifier: fontFeature.featureIdentifier, optionIdentifier: fontFeature.options.first!.identifier)
    }
    return fontFeatureWithDefaultOptions
}

fileprivate func updateShowCaseLabel(label: UITextView,
                                     withFontFeature fontFeatureOptions: [FontFeatureOptionPresentationModel],
                                     fontName: String) {
    label.font = fontWithFeatureOptions(fontFeatureOptions, withFontName: fontName, filterOutDefaultSetting: true)
}

fileprivate func featureSetting(for fontFeatureOptions: [FontFeatureOptionPresentationModel]) -> [FontFeatureAttribute] {
    return fontFeatureOptions.map { (featureOption) -> FontFeatureAttribute in
        featureSetting(for: featureOption)
    }
}

fileprivate func featureSetting(for fontFeatureOption: FontFeatureOptionPresentationModel) -> FontFeatureAttribute {
    return [
        UIFontDescriptor.FeatureKey.featureIdentifier: fontFeatureOption.feature.identifier,
        UIFontDescriptor.FeatureKey.typeIdentifier: fontFeatureOption.identifier,
    ]
}

fileprivate func fontWithFeatureOptions(_ fontFeatureOptions: [FontFeatureOptionPresentationModel],
                                        withFontName fontName: String,
                                        filterOutDefaultSetting: Bool) -> UIFont {
    var filteredFontFeatureOptions = fontFeatureOptions
    if filterOutDefaultSetting {
        filteredFontFeatureOptions = fontFeatureOptions.filter({ (option) -> Bool in
            defaultFontFeatures.filter {
                $0.featureIdentifier == option.feature.identifier &&
                    $0.optionIdentifier == option.identifier }.isEmpty
        })
    }
    let featureSettings = featureSetting(for: filteredFontFeatureOptions)
    let font = UIFont(descriptor: fontDescriptor(with: featureSettings, name: fontName), size: 16)
    return font
}

fileprivate func fontDescriptor(with featureSetting: [FontFeatureAttribute], name: String) -> UIFontDescriptor {
    print("expected:  \(featureSetting)")
    let fontAttributes: [UIFontDescriptor.AttributeName: Any] = [
        UIFontDescriptor.AttributeName.name: name,
        UIFontDescriptor.AttributeName.featureSettings: featureSetting,
    ]
    let fontDescriptor = UIFontDescriptor(fontAttributes: fontAttributes)
    print("actual:  \(fontDescriptor.fontAttributes)")
    return fontDescriptor
}

// MARK: - Mapper

fileprivate func presentationModel(for fontFeatures: [FontFeature]) -> [FontFeaturePresentationModel] {
    return fontFeatures.map { (fontFeature) -> FontFeaturePresentationModel in

        var feature = FontFeaturePresentationModel(name: fontFeature.featureName,
                                                   exclusive: fontFeature.exclusive,
                                                   identifier: fontFeature.featureIdentifier)

        let options = fontFeature.options.map({ (option) -> FontFeatureOptionPresentationModel in
            FontFeatureOptionPresentationModel(name: option.name,
                                               identifier: option.identifier,
                                               isSelected: option.isDefault,
                                               feature: feature)
        })

        feature.options = options
        return feature
    }
}

// MARK: - Internal View Model

fileprivate struct FontFeaturePresentationModel: Equatable {
    let name: String
    let exclusive: Bool
    let identifier: Int
    var options: [FontFeatureOptionPresentationModel]!

    init(name: String, exclusive: Bool, identifier: Int) {
        self.name = name
        self.exclusive = exclusive
        self.identifier = identifier
    }

    static func == (lhs: FontFeaturePresentationModel, rhs: FontFeaturePresentationModel) -> Bool {
        return lhs.identifier == rhs.identifier
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

    static func == (lhs: FontFeatureOptionPresentationModel, rhs: FontFeatureOptionPresentationModel) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.feature == rhs.feature
    }
}

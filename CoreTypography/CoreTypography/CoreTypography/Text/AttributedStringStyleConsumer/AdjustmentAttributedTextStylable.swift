//
//  AdjustmentAttributedTextStylable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation
//
//struct AdjustmentAttributedTextStylable: Stylable { //}, StyleProviding.Style == AttributedStringAttributes {
//
//    func style(with style: AdjustmentAttributedTextStyle) -> AdjustmentAttributedTextStylable {
//        return self
//    }
//    
//    
//    typealias StyleProvider = AdjustmentAttributedTextStyle
//    
////    func style(with style: AdjustmentAttributedTextStyle) -> AdjustmentAttributedTextStylable<Provider> {
////        return self as! AdjustmentAttributedTextStylable<AdjustmentAttributedTextStylable.Provider>
////    }
//}
//
//struct AdjustmentAttributedTextStylable: Stylable { //}, StyleProviding.Style == AttributedStringAttributes {
//    
//    func style(with style: PopularAttributedTextStyle) -> AdjustmentAttributedTextStylable {
//        return self
//    }
//    
//    
//    typealias StyleProvider = PopularAttributedTextStyle


//struct AdjustmentAttributedTextStylable<Style: StyleProviding>: Stylable where Stylable.StyleProvider.Style == AttributedStringAttributes, StyleProvider == AdjustmentAttributedTextStyle {
//
//    func style(with style: AdjustmentAttributedTextStyle) -> AdjustmentAttributedTextStylable<Style> {
//
//    }
//
//    typealias StyleProvider = AdjustmentAttributedTextStyle
//
//
//    public let attributes: [NSAttributedStringKey: Any]
//
//    public init(attributes: [NSAttributedStringKey: Any] = [:]) {
//        self.attributes = attributes
//    }
//}

//extension  {
//    typealias StyleProvider = AdjustmentAttributedTextStyle
//
//    public func style(with style: Style) -> AdjustmentAttributedTextStylable {
//        return AdjustmentAttributedTextStylable(attributes: attributes.merging(style.style) { $1 })
//    }
//}

//extension AdjustmentAttributedTextStylable: AttributedTextStylable where StyleProvider == PopularAttributedTextStyle {
//    
//    public func style(with style: PopularAttributedTextStyle) -> AdjustmentAttributedTextStylable {
//        return AdjustmentAttributedTextStylable(attributes: attributes.merging(style.style) { $1 })
//    }
//}


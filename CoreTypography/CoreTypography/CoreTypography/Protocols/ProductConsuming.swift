//
//  Stylable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

protocol ProductConsuming {
    
    associatedtype ProductProvider: Provider
    
    func consume<T: ProductConsuming>(product: ProductProvider) -> T
}

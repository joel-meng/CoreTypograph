//
//  StyleProviding.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

protocol StyleProviding {
    
    associatedtype Style
    
    var style: Style { get }
}

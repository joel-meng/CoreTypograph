//
//  AttributedTextStylable.swift
//  CoreTypography
//
//  Created by MENG, Joel on 29/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

protocol AttributedTextStylable: Stylable where StyleProvider.Style == AttributedStringAttributes {}

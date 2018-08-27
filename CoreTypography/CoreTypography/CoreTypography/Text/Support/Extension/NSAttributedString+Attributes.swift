//
//  NSAttributedString+Attributes.swift
//  CoreTypography
//
//  Created by MENG, Joel on 30/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import Foundation

extension Dictionary where Key == NSAttributedString.Key, Value == Any {
    
    func aggressivelyMerging(_ attribute: Attributes) -> Dictionary {
        return merging(attribute) { origin, new in
            return new
        }
    }
    
    func defensivelyMerging(_ attribute: Attributes) -> Dictionary {
        return merging(attribute) { origin, new in
            return origin
        }
    }
}

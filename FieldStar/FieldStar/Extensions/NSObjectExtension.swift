//
//  NSObjectExtension.swift
//  FieldStar
//
//  Created by Mahesh Gahlot on 11/29/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

extension NSObject {
    class var name: String {
        return String(describing: self)
    }
    
    var name: String {
        return String(describing: self)
    }
}

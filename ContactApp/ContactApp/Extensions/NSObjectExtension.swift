//
//  NSObjectExtension.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/7/18.
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
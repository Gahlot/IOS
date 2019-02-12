//
//  NSObjectExtension.swift
//  TransportApp
//
//  Created by Mahesh Gahlot on 1/16/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import Foundation
extension NSObject {
    static var name: String {
        return String(describing: self)
    }
    
    var name: String {
        return String(describing: self)
    }
    
}

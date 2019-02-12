//
//  NSObjectExtension.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/6/19.
//  Copyright © 2019 finoit. All rights reserved.
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

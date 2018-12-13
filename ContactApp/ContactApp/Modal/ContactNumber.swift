//
//  ContactNumber.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
struct ContactNumber {
    var type: ContactNumberType
    var number: String
    var isFavourite = false
}

extension ContactNumber {
    init(type: ContactNumberType, number: String) {
        self.init(type: type,number: number,isFavourite: false)
    }
}


//
//  Contact.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/7/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

struct Contact{
    var firstName: String
    var lastName: String
    var email: String?
    var numbers = [ContactNumber]()
}

extension Contact{
    var firstCharacter:String {
        return "\(firstName.uppercased().first!)"
    }
}

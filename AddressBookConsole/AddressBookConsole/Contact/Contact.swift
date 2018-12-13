//
//  Contact.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/23/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

class Contact {
    var firstName: String
    var lastName:String?
    var age:String?
    var phoneNumber: String
    var email:String?
    init(firstName _firstname:String,phoneNumber _phoneNumber: String, lastName _lastName:String? = nil , age _age:String? = nil, email _email: String? = nil ){
        firstName = _firstname
        lastName = _lastName
        phoneNumber = _phoneNumber
        age = _age
        email = _email
    }
}

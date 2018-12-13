//
//  ContactExtensions.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/23/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

extension Contact{
    var firstCharacter:Character{
        return firstName.lowercased().first!
    }
}

extension Contact{
    static func display(contact:Contact){
        print("Name : \(contact.firstName)", terminator : "")
        if let lastName = contact.lastName {
            print(" \(lastName)", terminator:"")
        }
        print()
        if let age = contact.age {
            print("Age : \(age)")
        }
        if let email = contact.email {
            print("Email : \(email)")
        }
        print("Phone No. : \(contact.phoneNumber)")
    }
    
}


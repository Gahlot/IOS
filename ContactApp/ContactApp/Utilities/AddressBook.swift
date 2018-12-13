//
//  AddressBook.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
class AddressBook {
    static var contacts = [Contact(firstName: "lol", lastName: "lol", email: "lol", numbers: [ContactNumber(type: ContactNumberType(id: 1, type: "iphone"), number: "542332323323", isFavourite: true)]),
                           Contact(firstName: "mac", lastName: "asdlol", email: "lodddsl", numbers: [ContactNumber(type: ContactNumberType(id: 1, type: "iphone"), number: "542332323323", isFavourite: true)]),
                           Contact(firstName: "mac", lastName: "asdlol", email: "lodddsl", numbers: [ContactNumber(type: ContactNumberType(id: 1, type: "iphone"), number: "542332323323")]),
                           Contact(firstName: "mac", lastName: "asdlol", email: "lodddsl", numbers: [ContactNumber(type: ContactNumberType(id: 1, type: "iphone"), number: "542332323323")]),
                           Contact(firstName: "mac", lastName: "asdlol", email: "lodddsl", numbers: [ContactNumber(type: ContactNumberType(id: 1, type: "iphone"), number: "542332323323", isFavourite: true)])
    ]
    var contactDictionary = ContactDictionary()
}

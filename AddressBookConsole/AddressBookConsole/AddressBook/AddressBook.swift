//
//  AddressBook.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/23/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
class AddressBook{
    static var contacts:Array<Contact> = [Contact(firstName: "Mahesh", phoneNumber: "7042464686", lastName: "Gahlot", age: "23", email: "gahlotmahesh8@gmail.com"),
                                          Contact(firstName: "Mohan", phoneNumber: "70244564606", lastName: "Singh", age: "22", email: "mohansingh22@gmail.com"),
                                          Contact(firstName: "Ram", phoneNumber: "9891626883", lastName: "Gahlot", age: "21", email: "ram_gahlot_1997@gmail.com"),
                                          Contact(firstName: "Shubham", phoneNumber: "9994721789", lastName: "Das", age: "19", email: "das_shubham14@gmail.com"),
                                          Contact(firstName: "Sebin Duke", phoneNumber: "9891626883", lastName: "Stephan", age: "23", email: "sebindukestephan@gmail.com"),
                                          Contact(firstName: "Vibhor", phoneNumber: "8880029891", lastName: "Verma", age: "23", email: "vibhorverma1995@gmail.com")]
    
    static let contactDictonary = ContactDictionary()
    
}

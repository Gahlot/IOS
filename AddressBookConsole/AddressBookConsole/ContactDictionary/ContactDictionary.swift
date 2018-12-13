//
//  ContactDictionary.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/23/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
class ContactDictionary{
    var contactDictionary = [Character:[Contact]]()
    init(){
        for contact in AddressBook.contacts{
            if !contactDictionary.keys.contains(contact.firstCharacter){
                contactDictionary[contact.firstCharacter] = []
            }
            contactDictionary[contact.firstCharacter]?.append(contact)
        }
    }
}




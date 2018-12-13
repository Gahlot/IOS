//
//  ContactDictionary.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
class ContactDictionary{
    var contactDictionary = [String:[Contact]]()
    init(){
        var letters = [String]()
        let str = "abcdefghijklmnopqrstuvwxyz".uppercased()
        for char in str {
            letters.append(String(char))
        }
        for contact in AddressBook.contacts{
            if letters.contains(contact.firstCharacter){
                if !contactDictionary.keys.contains(contact.firstCharacter) {
                    contactDictionary[contact.firstCharacter] = []
                }
                contactDictionary[contact.firstCharacter]?.append(contact)
            }
            else {
                if !contactDictionary.keys.contains("#") {
                    contactDictionary["#"] = []
                }
                contactDictionary["#"]?.append(contact)
            }
        }
    }
}


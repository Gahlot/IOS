//
//  SortContactExtensions.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

extension SortContact {
    static func nameSortedContact(contactDictionary : ContactDictionary){
        let keySortedDicitionary = (contactDictionary.contactDictionary.sorted(by: {$0.0 < $1.0} ))
        for dict in keySortedDicitionary{
            print("###################--- \(String(dict.key).uppercased()) ---###################")
            let sortedValues = contactDictionary.contactDictionary[dict.key]!.sorted(by: { $0.firstName < $1.firstName })
            var counter = sortedValues.count
            for contact in sortedValues{
                Contact.display(contact: contact)
                counter = counter - 1
                if counter > 0{
                    print("-------------------------------------------------")
                }
            }
        }
    }
    
    static func ageSortedContact(contactDictionary : ContactDictionary){
        let keySortedDicitionary = (contactDictionary.contactDictionary.sorted(by: {$0.0 < $1.0} ))
        for dict in keySortedDicitionary{
            print("###################--- \(String(dict.key).uppercased()) ---###################")
            let sortedValues = contactDictionary.contactDictionary[dict.key]!.sorted(by: { Int($0.age ?? "0")! < Int($1.age ?? "0")! })
            var counter = sortedValues.count
            for contact in sortedValues{
                Contact.display(contact: contact)
                counter = counter - 1
                if counter > 0{
                    print("-------------------------------------------------")
                }
            }
        }
    }
}

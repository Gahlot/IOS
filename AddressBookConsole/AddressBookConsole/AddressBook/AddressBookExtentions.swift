//
//  AddressBookExtentions.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

extension AddressBook {
    static func start(){
        var input:String = "1"
        repeat{
            print("************** Enter your choice **************** ")
            print("1 -> Print Contacts")
            print("2 -> Print Contacts (Sorted in dictionary format according to name)")
            print("3 -> Print Contacts (Sorted in dictionary format according to age)")
            print("4 -> Search Contacts")
            print("press any other key  for Exit :  ", terminator:"")
            
            if let str = readLine(){
                switch(str){
                case "1":
                    print("###################--CONTACTS--######################")
                    var counter = contacts.count
                    for contact in contacts{
                        Contact.display(contact: contact)
                        counter = counter - 1
                        if counter > 0 {
                            print("--------------------------------------------")
                        }
                        
                        
                    }
                case "2":
                    SortContact.nameSortedContact(contactDictionary: AddressBook.contactDictonary)
                case "3":
                    SortContact.ageSortedContact(contactDictionary: contactDictonary)
                case "4":
                    print("Enter the Search Value:", terminator: "")
                    if let value = readLine(){
                        if let contact = SearchContact.search(value: value.lowercased()){
                            Contact.display(contact: contact)
                        }else {
                            print("Value Not Exist!!!")
                        }
                    }
                    
                default:
                    input = "0"
                }
            }
        }while(input != "0")
        
        
    }
}

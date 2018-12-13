//
//  SearchContactExtension.swift
//  AddressBookConsole
//
//  Created by Mahesh Gahlot on 10/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

extension SearchContact{
    static func search(value:String) -> Contact? {
        var what: SearchContact
        var input: Int
        repeat{
            print("Enter on which parameter basis you want to Search: ")
            print("1 -> First Name")
            print("2 -> Last Name")
            print("3 -> Age")
            print("4 -> Email")
            print("5 -> Phone Number")
            print("Enter Your Choice: ", terminator:"")
            input = 0
            if let str = readLine(){
                switch(str){
                case "1":
                    what = .firstName
                    return SearchContact.mainSearch(value, what: what)
                case "2":
                    what = .lastName
                    return SearchContact.mainSearch(value, what: what)
                case "3":
                    what = .age
                    return SearchContact.mainSearch(value, what: what)
                case "4":
                    what = .email
                    return SearchContact.mainSearch(value, what: what)
                case "5":
                    what = .phoneNumber
                    return SearchContact.mainSearch(value, what: what)
                default:
                    print("WRONG CHOICE!!!!!!!!!!!")
                    input = 1
                }
            }
        }while(input == 0)
        return nil
    }
    
    static func mainSearch(_ value :String, what :SearchContact) -> Contact? {
        
        switch(what){
        case .firstName:
            for contact in AddressBook.contacts {
                
                if contact.firstName.lowercased() == value{
                    return contact
                }
            }
            return nil
        case .lastName:
            for contact in AddressBook.contacts {
                if  let opt = contact.lastName{
                    if opt.lowercased() == value{
                        return contact
                    }
                    
                }
            }
            return nil
        case .age:
            for contact in AddressBook.contacts {
                if let opt = contact.age{
                    if opt.lowercased() == value{
                        return contact
                    }
                    
                }
            }
            return nil
        case .email:
            for contact in AddressBook.contacts {
                if let opt = contact.email{
                    if opt.lowercased() == value{
                        return contact
                    }
                    
                }            }
            return nil
        case .phoneNumber:
            for contact in AddressBook.contacts {
                if contact.phoneNumber == value{
                    return contact
                }
            }
            return nil
        }
        
        
    }
    
}

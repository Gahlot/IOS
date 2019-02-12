//
//  Contact+CoreDataClass.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Contact)
public class Contact: NSManagedObject {
    @objc var title: String? {
        if let charcter = self.firstName?.uppercased().first {
            return String(charcter)
        }
        return nil
    }
}

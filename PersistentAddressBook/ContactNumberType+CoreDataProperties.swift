//
//  ContactNumberType+CoreDataProperties.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//
//

import Foundation
import CoreData


extension ContactNumberType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactNumberType> {
        return NSFetchRequest<ContactNumberType>(entityName: "ContactNumberType")
    }

    @NSManaged public var id: Int16
    @NSManaged public var type: String?

}

//
//  ContactNumber+CoreDataProperties.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//
//

import Foundation
import CoreData


extension ContactNumber {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactNumber> {
        return NSFetchRequest<ContactNumber>(entityName: "ContactNumber")
    }

    @NSManaged public var number: String?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var type: ContactNumberType?
    @NSManaged public var contactDetails: Contact?

}

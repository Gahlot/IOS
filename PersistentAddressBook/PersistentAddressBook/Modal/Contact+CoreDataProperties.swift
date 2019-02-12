//
//  Contact+CoreDataProperties.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var image: NSData?
    @NSManaged public var numbers: NSSet?

}

// MARK: Generated accessors for numbers
extension Contact {

    @objc(addNumbersObject:)
    @NSManaged public func addToNumbers(_ value: ContactNumber)

    @objc(removeNumbersObject:)
    @NSManaged public func removeFromNumbers(_ value: ContactNumber)

    @objc(addNumbers:)
    @NSManaged public func addToNumbers(_ values: NSSet)

    @objc(removeNumbers:)
    @NSManaged public func removeFromNumbers(_ values: NSSet)

}

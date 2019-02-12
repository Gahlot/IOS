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
    @NSManaged public var numbers: NSSet?

}

// MARK: Generated accessors for numbers
extension ContactNumberType {

    @objc(addNumbersObject:)
    @NSManaged public func addToNumbers(_ value: ContactNumber)

    @objc(removeNumbersObject:)
    @NSManaged public func removeFromNumbers(_ value: ContactNumber)

    @objc(addNumbers:)
    @NSManaged public func addToNumbers(_ values: NSSet)

    @objc(removeNumbers:)
    @NSManaged public func removeFromNumbers(_ values: NSSet)

}

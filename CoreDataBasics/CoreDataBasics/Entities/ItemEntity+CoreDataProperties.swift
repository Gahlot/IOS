//
//  ItemEntity+CoreDataProperties.swift
//  CoreDataBasics
//
//  Created by Mahesh Gahlot on 12/20/18.
//  Copyright © 2018 finoit. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var itemNames: String?

}

//
//  UserEntity+CoreDataClass.swift
//  NSFRCCoreData
//
//  Created by Mahesh Gahlot on 12/26/18.
//  Copyright © 2018 finoit. All rights reserved.
//
//

import Foundation
import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {

    @objc var firstCharacter: String {
        return String(self.name!.uppercased().first!)
    }
}

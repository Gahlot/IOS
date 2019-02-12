//
//  CoreDataStack.swift
//  NSFRCCoreData
//
//  Created by Mahesh Gahlot on 12/26/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    private init() {}
    static let shared = CoreDataStack()
    lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "NSFRCCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

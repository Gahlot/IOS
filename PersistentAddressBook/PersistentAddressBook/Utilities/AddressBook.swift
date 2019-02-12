//
//  AddressBook.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
import CoreData
class AddressBook {
    private static  var tempFetchedResultController: NSFetchedResultsController<Contact>?
    
   static  var fetchedResultsController: NSFetchedResultsController<Contact> {
        if let fetchedResultController = tempFetchedResultController {
            return fetchedResultController
        }
        
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        let nameSortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
        fetchRequest.sortDescriptors = [nameSortDescriptor]
        let fetchResultsController = NSFetchedResultsController<Contact>(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: "title", cacheName: nil)
        tempFetchedResultController = fetchResultsController
        return fetchResultsController
    }
}

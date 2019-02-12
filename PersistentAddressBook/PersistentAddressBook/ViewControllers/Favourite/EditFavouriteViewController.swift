//
//  EditFavouriteViewController.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit
import CoreData
class EditFavouriteViewController: UIViewController {
    static  var fetchedResultsController: NSFetchedResultsController<ContactNumber>!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.register(EditFavouriteTableViewCell.nib, forCellReuseIdentifier: EditFavouriteTableViewCell.identifier)
        super.viewDidLoad()
        let fetchRequest: NSFetchRequest<ContactNumber> = ContactNumber.fetchRequest()
        let nameSortDescriptor = NSSortDescriptor(key: "contactDetails.firstName", ascending: true)
        fetchRequest.sortDescriptors = [nameSortDescriptor]
        EditFavouriteViewController.fetchedResultsController = NSFetchedResultsController<ContactNumber>(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: "contactDetails.firstName", cacheName: nil)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        try? EditFavouriteViewController.fetchedResultsController.performFetch()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}

extension EditFavouriteViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = EditFavouriteViewController.fetchedResultsController.sections else{
            return 0
        }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = EditFavouriteViewController.fetchedResultsController.sections else{
            return 0
        }
        
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EditFavouriteTableViewCell.identifier, for: indexPath) as! EditFavouriteTableViewCell
        cell.config(EditFavouriteViewController.fetchedResultsController.object(at: indexPath), indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(EditFavouriteViewController.fetchedResultsController.sections![section].name)"
    }
}

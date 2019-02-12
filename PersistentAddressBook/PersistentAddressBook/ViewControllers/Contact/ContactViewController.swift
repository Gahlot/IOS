//
//  ContactViewController.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit
import CoreData
class ContactViewController: UIViewController {
    
    var filterContacts = [Contact]()
    var searchController: UISearchController?
    var contactHeaderTitles = [String]()
    @IBOutlet weak var tableView: UITableView!
    class var newObject: ContactViewController {
        let storyboard = UIStoryboard(name: "Contact", bundle: nil)
        let contactViewController = storyboard.instantiateViewController(withIdentifier: ContactViewController.name) as! ContactViewController
        return contactViewController
    }
    var letters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addContact))
        navigationItem.rightBarButtonItem = rightBarButton
        searchController = UISearchController(searchResultsController: nil)
        searchController!.obscuresBackgroundDuringPresentation = false
        searchController!.searchResultsUpdater = self
        self.navigationItem.searchController = searchController!
        tableView.dataSource = self
        tableView.delegate = self
        AddressBook.fetchedResultsController.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        try! AddressBook.fetchedResultsController.performFetch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func addContact(barButtonItem: UIBarButtonItem){
        performSegue(withIdentifier: "AddContact", sender: self)
        tableView.reloadData()
    }
}

extension ContactViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        var predicate: NSPredicate?
        if searchText.count > 0 {
            predicate = NSPredicate(format: "(firstName contains[cd] %@)", searchText)
        } else {
            predicate = nil
        }
        AddressBook.fetchedResultsController.fetchRequest.predicate = predicate
        
        do {
            try AddressBook.fetchedResultsController.performFetch()
            tableView.reloadData()
        } catch let err {
            print(err)
        }
    }
    
    //MARK: Utilities Functions
    
    func searchBarIsEmpty() -> Bool {
        return searchController?.searchBar.text?.isEmpty ?? true
    }
    
}

extension ContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSections =  AddressBook.fetchedResultsController.sections?.count else {
            return 0
        }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = AddressBook.fetchedResultsController.sections else {
            return 0
        }
        return sections[section].numberOfObjects
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = AddressBook.fetchedResultsController.object(at: indexPath)
        cell.setBottomBorder()
        cell.textLabel?.text = contact.firstName
        return cell
    }
}

extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ContactDetails", sender: self)
    }
    //Mark: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactDetails" {
            let contactDetailViewController = segue.destination as! ContactDetailViewController
            let indexpath = tableView.indexPathForSelectedRow!
            contactDetailViewController.contact = AddressBook.fetchedResultsController.object(at: indexpath)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = AddressBook.fetchedResultsController.sections else {
            return nil
        }
        return searchBarIsEmpty() ? sections[section].name : nil
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let section = AddressBook.fetchedResultsController.sections?.enumerated().first(where: {$0.element.name == title} ) {
            return section.offset
        }
        else {
            return -1
        }
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let str = "abcdefghijklmnopqrstuvwxyz".uppercased()
        for char in str {
            letters.append(String(char))
        }
        var indexTitles = letters.sorted(by: {$0 < $1 })
        indexTitles.append("#")
        return indexTitles
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

extension ContactViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch(type){
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .move:
            if let deleteIndexPath = indexPath {
                self.tableView.deleteRows(at: [deleteIndexPath], with: UITableViewRowAnimation.fade)
            }
            if let insertIndexPath = newIndexPath {
                self.tableView.insertRows(at: [insertIndexPath], with: UITableViewRowAnimation.fade)
            }
        case .update:
            break
        }
    }
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch(type){
        case .insert:
            let indexSet = NSIndexSet(index: sectionIndex)
            tableView.insertSections(indexSet as IndexSet, with: .fade)
            
        case .delete:
            let indexSet = NSIndexSet(index: sectionIndex)
            tableView.deleteSections(indexSet as IndexSet, with: .fade)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/7/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

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
    var contactDitionary: ContactDictionary!
    var letters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 22)]
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addContact))
        navigationItem.rightBarButtonItem = rightBarButton
        searchController = UISearchController(searchResultsController: nil)
        searchController!.obscuresBackgroundDuringPresentation = false
        searchController!.searchResultsUpdater = self
        self.navigationItem.searchController = searchController!
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contactDitionary = AddressBook().contactDictionary
        contactHeaderTitles = [String](contactDitionary.contactDictionary.keys.sorted(by: {$0 < $1}))
        tableView.reloadData()
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
        filterContentsForSearch(searchController.searchBar.text!)
    }
    
    //MARK: Utilities Functions
    
    func searchBarIsEmpty() -> Bool {
        return searchController?.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentsForSearch(_ searchText: String){
        filterContacts = AddressBook.contacts.filter() { (contact: Contact) -> Bool in
            if contact.firstName.lowercased().contains(searchText.lowercased()) || contact.lastName.lowercased().contains(searchText.lowercased()) || (contact.email?.lowercased().contains(searchText.lowercased()) ?? false) {
                return true
            }
            for number in contact.numbers {
                if number.number.contains(searchText){
                    return true
                }
            }
            return false
        }
        tableView.reloadData()
    }
}

extension ContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchBarIsEmpty() ? contactHeaderTitles.count : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBarIsEmpty() ? (contactDitionary.contactDictionary[contactHeaderTitles[section]]?.count)! : filterContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = contactDitionary.contactDictionary[contactHeaderTitles[indexPath.section]]
        cell.setBottomBorder()
        cell.textLabel?.text = searchBarIsEmpty() ? contact![indexPath.row].firstName : filterContacts[indexPath.row].firstName
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
            contactDetailViewController.contact = contactDitionary.contactDictionary[contactHeaderTitles[indexpath.section]]![indexpath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchBarIsEmpty() ? contactHeaderTitles[section] : nil
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if contactHeaderTitles.contains(title){
            return contactHeaderTitles.index(of: title)!
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

//
//  FavouriteViewController.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//
import UIKit
import CoreData
class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    class var newObject: FavouriteViewController {
        let storyboard = UIStoryboard(name: "Favourite", bundle: nil)
        let favouriteViewController = storyboard.instantiateViewController(withIdentifier: FavouriteViewController.name) as! FavouriteViewController
        return favouriteViewController
    }
    
    
    static  var fetchedResultsController: NSFetchedResultsController<ContactNumber>!
       

    override func viewDidLoad() {
        title = "Favourites"
         super.viewDidLoad()
        tableView.register(FavouriteTableViewCell.nib, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        let fetchRequest: NSFetchRequest<ContactNumber> = ContactNumber.fetchRequest()
        let numberSortDescriptor = NSSortDescriptor(key: "contactDetails.firstName", ascending: true)
        fetchRequest.sortDescriptors = [numberSortDescriptor]
        FavouriteViewController.fetchedResultsController = NSFetchedResultsController<ContactNumber>(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let rightBarButton = UIBarButtonItem(title:"Edit", style: .plain, target: self, action: #selector(editFavouriteContact))
        navigationItem.rightBarButtonItem = rightBarButton
        let fetchRequest: NSFetchRequest<ContactNumber> = ContactNumber.fetchRequest()
        let numberSortDescriptor = NSSortDescriptor(key: "number", ascending: true)
        fetchRequest.predicate = NSPredicate(format: "isFavourite == true")
        fetchRequest.sortDescriptors = [numberSortDescriptor]
        
        FavouriteViewController.fetchedResultsController = NSFetchedResultsController<ContactNumber>(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        try? FavouriteViewController.fetchedResultsController.performFetch()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func editFavouriteContact(barButtonItem: UIBarButtonItem){
        performSegue(withIdentifier: "EditFavourite", sender: self)
        tableView.reloadData()
    }
}

extension FavouriteViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = FavouriteViewController.fetchedResultsController.sections else {
            return 0
        }
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = FavouriteViewController.fetchedResultsController.sections else {
            return 0
        }
        return sections[section].numberOfObjects
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell
        let contactEntity = FavouriteViewController.fetchedResultsController.object(at: indexPath)
        cell.numberTypeLabel.text = contactEntity.type?.type
            
        cell.nameLabel.text = contactEntity.contactDetails?.firstName
        cell.favouriteImageView.image = UIImage(data: (contactEntity.contactDetails?.image as Data?)!)
        cell.selectionStyle = .none
        return cell
    }
}

extension FavouriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Contact", bundle: nil)
        let contactDetailViewController = storyboard.instantiateViewController(withIdentifier: ContactDetailViewController.name) as! ContactDetailViewController
        let contactEntity = FavouriteViewController.fetchedResultsController.object(at: indexPath)
        contactDetailViewController.contact = contactEntity.contactDetails
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
}


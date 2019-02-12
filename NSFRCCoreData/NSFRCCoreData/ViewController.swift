//
//  ViewController.swift
//  NSFRCCoreData
//
//  Created by Mahesh Gahlot on 12/26/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    private var fetchedResultController: NSFetchedResultsController<UserEntity>?
    
    var defaultFetchedResultsController: NSFetchedResultsController<UserEntity> {
        if let fetchedResultController = fetchedResultController {
            return fetchedResultController
        }
        
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        let nameSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let passwordSortDescriptor = NSSortDescriptor(key: "password", ascending: true)
        fetchRequest.sortDescriptors = [nameSortDescriptor,passwordSortDescriptor]
        let fetchResultsController = NSFetchedResultsController<UserEntity>(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: "firstCharacter", cacheName: nil)
        fetchedResultController = fetchResultsController
        return fetchResultsController
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSTemporaryDirectory())
        title = "List"
        tableView.dataSource = self
        tableView.isEditing = true
        tableView.delegate = self
        tableView.allowsSelectionDuringEditing = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultFetchedResultsController.delegate = self
        try! defaultFetchedResultsController.performFetch()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItems(_ sender: UIBarButtonItem) {
        let alert =  UIAlertController(title: "Enter The Item Name", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert .addTextField { (passwordTextField) in
            let placeholder = NSAttributedString(string: "Password", attributes: nil)
            passwordTextField.attributedPlaceholder = placeholder
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Save", style:.default) {  (action) in
            guard let nameTextfield = alert.textFields?.first, let name = nameTextfield.text else {
                return
            }
            guard let passwordTextfield = alert.textFields?[1], let password = passwordTextfield.text else {
                return
            }
            let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: CoreDataStack.shared.context)
            let userEntity = UserEntity(entity: entity!, insertInto: CoreDataStack.shared.context)
            userEntity.name = name
            userEntity.password = password
            
            try? CoreDataStack.shared.context.save()
           
           // self.tableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sectionCount = defaultFetchedResultsController.sections?.count else {
            return 0
        }
        return sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = defaultFetchedResultsController.sections else {
            return 0
        }
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        let userEntity = defaultFetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = userEntity.name
        cell.detailTextLabel?.text = userEntity.password
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sections = defaultFetchedResultsController.sections
        return sections![section].name
    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
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
            if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath){
                let userEntity = fetchedResultController?.object(at: indexPath)
                cell.textLabel?.text = userEntity?.name
                cell.detailTextLabel?.text = userEntity?.password
            }
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let userEntity = self.fetchedResultController!.object(at: indexPath)
            CoreDataStack.shared.context.delete(userEntity)
        }
        
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert =  UIAlertController(title: "Enter The Item Name", message: nil, preferredStyle: .alert)
        let userEntity = fetchedResultController?.object(at: indexPath)
        alert.addTextField(){(nameTextField) in
        let placeholder = NSAttributedString(string: "Name", attributes: nil)
        nameTextField.attributedPlaceholder = placeholder
        nameTextField.text = userEntity?.name
    }
        alert .addTextField { (passwordTextField) in
            let placeholder = NSAttributedString(string: "Password", attributes: nil)
            passwordTextField.attributedPlaceholder = placeholder
            passwordTextField.text = userEntity?.password
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Save", style:.default) { [unowned self] (action) in
            guard let nameTextfield = alert.textFields?.first, let name = nameTextfield.text else {
                return
            }
            guard let passwordTextfield = alert.textFields?[1], let password = passwordTextfield.text else {
                return
            }
           
            userEntity?.name = name
            userEntity?.password = password
            try? CoreDataStack.shared.context.save()
            
            self.tableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    }
}




//
//  ViewController.swift
//  CoreDataBasics
//
//  Created by Mahesh Gahlot on 12/19/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    var itemsName = [ItemEntity]()
    @IBOutlet weak var tableView: UITableView!
    let manageContext = AppDelegate.coreData.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSTemporaryDirectory())
        title = "List"
        tableView.dataSource = self
        let request: NSFetchRequest<ItemEntity> = ItemEntity.fetchRequest()
        itemsName = try! manageContext.fetch(request) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItems(_ sender: UIBarButtonItem) {
        let alert =  UIAlertController(title: "Enter The Item Name", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Save", style:.default) { [unowned self] (action) in
            guard let textfield = alert.textFields?.first, let itemName = textfield.text else {
                return
            }
            let entity = NSEntityDescription.entity(forEntityName: "ItemEntity", in: self.manageContext)
            let itemEntity = ItemEntity(entity: entity!, insertInto: self.manageContext)
            itemEntity.itemNames = itemName
            try? self.manageContext.save()
            self.itemsName.append(itemEntity)
           // self.itemsName.append(itemName)
            self.tableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Items", for: indexPath)
    
        cell.textLabel?.text = itemsName[indexPath.row].itemNames
        return cell
        
    }
}

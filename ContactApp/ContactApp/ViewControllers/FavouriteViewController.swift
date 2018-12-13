//
//  FavouriteViewController.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/7/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {
    var favouriteContacts: Array<Array<String>>? {
        var favouriteContacts: Array<Array<String>> = []
        for contact in AddressBook.contacts {
            for number in contact.numbers {
                if number.isFavourite == true {
                    favouriteContacts.append([contact.firstName,number.type.type])
                }
            }
        }
        return favouriteContacts.isEmpty ? nil : favouriteContacts
    }
    @IBOutlet weak var tableView: UITableView!
    
    class var newObject: FavouriteViewController {
        let storyboard = UIStoryboard(name: "Favourite", bundle: nil)
        let favouriteViewController = storyboard.instantiateViewController(withIdentifier: FavouriteViewController.name) as! FavouriteViewController
        return favouriteViewController
    }


    override func viewDidLoad() {
        title = "Favourites"
        
        tableView.register(FavouriteTableViewCell.nib, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        tableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FavouriteViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteContacts == nil ? 0 : favouriteContacts!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell
        cell.nameLabel.text = favouriteContacts![indexPath.row][0]
        cell.numberTypeLabel.text = favouriteContacts![indexPath.row][1]
        cell.selectionStyle = .none
        return cell
    }
}

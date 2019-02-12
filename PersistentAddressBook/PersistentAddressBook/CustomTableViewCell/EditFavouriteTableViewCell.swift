//
//  EditFavouriteTableViewCell.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class EditFavouriteTableViewCell: UITableViewCell {
    var indexPath: IndexPath!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var isFavouriteSwitch: UISwitch!
    
    class var identifier: String {
        return EditFavouriteTableViewCell.name
    }
    
    class var nib: UINib {
        return UINib(nibName: EditFavouriteTableViewCell.name, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setFavourite(_ sender: UISwitch) {
       let contactNumber = EditFavouriteViewController.fetchedResultsController.object(at: indexPath)
        contactNumber.isFavourite = isFavouriteSwitch.isOn
    }
    
    func config(_ number: ContactNumber, indexPath: IndexPath){
        self.indexPath = indexPath
        isFavouriteSwitch.setOn(number.isFavourite, animated: true)
        numberLabel.text = number.number
    }
    
}

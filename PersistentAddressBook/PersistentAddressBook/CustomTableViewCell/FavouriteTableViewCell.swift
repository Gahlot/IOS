//
//  FavouriteTableViewCell.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//
import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberTypeLabel: UILabel!
   
    class var identifier: String {
        return FavouriteTableViewCell.name
    }
    class var nib: UINib {
        return UINib(nibName: FavouriteTableViewCell.name, bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favouriteImageView.layer.cornerRadius = favouriteImageView.frame.width/2
        favouriteImageView.clipsToBounds = true
        self.setBottomBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.setBottomBorder()
        // Configure the view for the selected state
    }
    
}

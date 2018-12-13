//
//  AddButtonTableViewCell.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/11/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class AddButtonTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return AddButtonTableViewCell.name
    }
    class var nib: UINib {
        return UINib(nibName: AddButtonTableViewCell.name, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        // Initialization code
        self.setBottomBorder()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = UIColor.white
        self.setBottomBorder()
        // Configure the view for the selected state
    }
    
}

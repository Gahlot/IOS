//
//  BasicDetailsTableViewCell.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class BasicDetailsTableViewCell: UITableViewCell {

   
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    class var identifier: String {
        return BasicDetailsTableViewCell.name
    }
    class var nib: UINib {
        return UINib(nibName: BasicDetailsTableViewCell.name, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstNameTextField.setBottomBorder()
        lastNameTextField.setBottomBorder()
        emailTextField.setBottomBorder()
        contactImageView.layer.cornerRadius = contactImageView.frame.width / 2
        contactImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = UIColor.white
        self.contentView.backgroundColor = UIColor.white
        firstNameTextField.setBottomBorder()
        lastNameTextField.setBottomBorder()
        emailTextField.setBottomBorder()

        // Configure the view for the selected state
    }
    
}

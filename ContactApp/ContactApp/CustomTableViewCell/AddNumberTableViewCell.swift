//
//  AddNumberTableViewCell.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class AddNumberTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    class var identifier: String {
        return AddNumberTableViewCell.name
    }
    class var nib: UINib {
        return UINib(nibName: AddNumberTableViewCell.name, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setBottomBorder()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = UIColor.white
        
        self.setBottomBorder()
        //numberTextField.setBottomBorder()
        
        // Configure the view for the selected state
    }
    
    func config(numberType: String, number: String) {
        //numberTypeButton.setTitle(numberType, for: UIControlState.normal)
        // numberTextField.text = number
    }
    
}


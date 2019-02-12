//
//  LabelCollectionViewCell.swift
//  CollectionViewBasic
//
//  Created by Mahesh Gahlot on 12/18/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class var nib: UINib {
        return UINib(nibName: "LabelCollectionViewCell", bundle: nil)
    }
    
    class var identifier: String {
        return "LabelCollectionViewCell"
    }
    func config(_ labelText: String){
        label.text = labelText
        
    }
}

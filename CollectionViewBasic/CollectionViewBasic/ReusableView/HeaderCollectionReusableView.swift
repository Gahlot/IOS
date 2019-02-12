//
//  HeaderCollectionReusableView.swift
//  CollectionViewBasic
//
//  Created by Mahesh Gahlot on 12/19/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class var nib: UINib {
        return UINib(nibName: "HeaderCollectionReusableView", bundle: nil)
    }
    
    class var identifier: String {
        return "HeaderCollectionReusableView"
    }
    func config(_ labelText: String){
        headerLabel.text = labelText
        
    }
}


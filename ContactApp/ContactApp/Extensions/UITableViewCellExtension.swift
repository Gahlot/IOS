//
//  UITableViewCellExtension.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/11/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit
extension UITableViewCell {
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 0.0
    }

}

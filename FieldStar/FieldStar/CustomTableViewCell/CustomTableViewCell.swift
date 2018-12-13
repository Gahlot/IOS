//
//  CustomTableViewCell.swift
//  FieldStar
//
//  Created by Mahesh Gahlot on 11/29/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var workOrderIDLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jobIDLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateStackView: UIStackView!
    
    class var nib: UINib {
        return UINib(nibName: CustomTableViewCell.name, bundle: nil)
    }
    
    class var identifier: String {
        return CustomTableViewCell.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagLabel.layer.borderWidth = 0.7
        tagLabel.layer.borderColor = UIColor(displayP3Red: 2, green: 2, blue: 2, alpha: 0.6).cgColor
        tagLabel.layer.borderColor = UIColor(named: "BackgroundColor")?.cgColor
        tagLabel.layer.cornerRadius = 10
        tagLabel.layer.masksToBounds = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(task: Task) {
        workOrderIDLabel.text = "W.O. ID #\(task.workOrderID)"
        tagLabel.text = "\(task.tag)   "
        titleLabel.text = task.title
        jobIDLabel.text = "#\(task.jobID)"
        priorityLabel.text = task.priority
        startDateLabel.text = task.startDate
        endDateLabel.text = task.endDate
        locationLabel.text = task.location
        dateStackView.isHidden = task.startDate == nil ? true : false
        switch task.tag {
        case "New":
            tagLabel.textColor = UIColor(displayP3Red: 0, green: 245  , blue: 0, alpha: 0.9)
        case "Active":
            tagLabel.textColor = UIColor(displayP3Red: 0, green: 0 , blue: 248, alpha: 0.9)
        default:
            tagLabel.textColor = UIColor.gray
        }
        priorityLabel.textColor = task.priority == "Urgent" ? UIColor.red : UIColor.orange
    }
}

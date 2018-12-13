//
//  ImageTableViewCell.swift
//  TableView_2WayDesign
//
//  Created by Mahesh Gahlot on 11/20/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeConsumedLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var dateAndTimeStackView: UIStackView!
    
    
    class var nib: UINib {
        return UINib(nibName: ImageTableViewCell.name, bundle: nil)
    }
    
    class var identifier: String {
        return ImageTableViewCell.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        let tagColor = tagLabel.backgroundColor
        let contentViewColor = contentView.backgroundColor == nil ? nil : contentView.backgroundColor!
        let backgroundImage = backgroundImageView.image == nil ? nil : backgroundImageView.image!
        super.setSelected(selected, animated: animated)
        if selected{
            tagLabel.backgroundColor = tagColor
            contentView.backgroundColor = contentViewColor
            backgroundImageView.image = backgroundImage
        }
        
        // Configure the view for the selected state
    }
    
    func configure(feed: Feed){
        backgroundImageView.image = feed.backgroundImage == nil ? nil : UIImage(named: feed.backgroundImage!)
        contentView.backgroundColor = feed.backgroundColor == nil ? nil : UIColor(named: feed.backgroundColor!)
        tagLabel.text = " \(feed.tag) "
        headingLabel.text = feed.header
        tagLabel.backgroundColor = UIColor(named: feed.tagColor)
        tagLabel.backgroundColor = tagLabel.backgroundColor
        locationLabel.text = feed.location
        locationImageView.image = feed.tag == "Events" ? UIImage(named: "location") : feed.tag == "Newsletters" ? UIImage(named: "speaker-icon") : UIImage(named: "group")
        
        timeConsumedLabel.text = feed.timeConsumed
        
        if feed.date == nil && feed.time == nil {
            dateAndTimeStackView.isHidden = true
        }
        else{
            dateLabel.text = feed.date
            timeLabel.text = feed.time
        }
    }
}

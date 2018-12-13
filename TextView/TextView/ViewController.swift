//
//  ViewController.swift
//  TextView
//
//  Created by Mahesh Gahlot on 11/14/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        textView.allowsEditingTextAttributes = false
        textView.attributedText = NSMutableAttributedString(string: "https://www.google.co.in", attributes: [NSAttributedStringKey.foregroundColor : UIColor.blue,NSAttributedStringKey.link : NSURL(string: "https://www.google.co.in")!])
        textView.dataDetectorTypes = UIDataDetectorTypes.phoneNumber
        textView.dataDetectorTypes = UIDataDetectorTypes.address
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


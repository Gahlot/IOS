//
//  ViewController.swift
//  DatePicker
//
//  Created by Mahesh Gahlot on 11/12/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var data_picker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dataPicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        sender.timeZone = TimeZone(secondsFromGMT: (5*60+30)*60)
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.medium
        print(dateFormatter.dateFormat)
        dateFormatter.dateFormat = "'date = 'd/MMM/yyyy \n'time = ' HH:mm a \n EEE"
        
        label.text = dateFormatter.string(from: sender.date)
        label.isHidden = false
    }
}



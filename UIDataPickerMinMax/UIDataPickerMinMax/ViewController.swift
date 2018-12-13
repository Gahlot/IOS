//
//  ViewController.swift
//  UIDataPickerMinMax
//
//  Created by Mahesh Gahlot on 11/14/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startDateDatePicker: UIDatePicker!
    @IBOutlet weak var endDateDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDateDatePicker.changeBackgroundColor(color: .green)
        endDateDatePicker.changeBackgroundColor(color: .blue)
       
        startDateDatePicker.minimumDate = Date(timeIntervalSinceNow: -(3600*24*365*50))
        startDateDatePicker.maximumDate = Date(timeIntervalSinceNow: -(60*60*24*90))
        endDateDatePicker.maximumDate = Date(timeIntervalSinceNow: 0)
        endDateDatePicker.minimumDate = Date(timeInterval: 0, since: startDateDatePicker.maximumDate!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        
        endDateDatePicker.minimumDate = startDateDatePicker.date
        endDateDatePicker.date = startDateDatePicker.date
    }
    
    @IBAction func endDateChanged(_ sender: UIDatePicker) {
        startDateDatePicker.maximumDate = endDateDatePicker.date
        
    }
}


//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by Vineet Choudhary on 29/11/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var datePicker = DatePicker.create()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showDatePickerAction(_ sender: UIButton) {
        datePicker.show()
    }
}


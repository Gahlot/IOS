//
//  ViewController.swift
//  UIKitTextFIeld
//
//  Created by Mahesh Gahlot on 11/2/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var principalAmount: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        rate.text = "2"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateAmount(_ sender: UITextField) {
        if principalAmount.text != "" {
            let principal = Int(principalAmount.text!)!
            let interestRate = Int(rate.text!)!
            amount.text = String(principal + principal * interestRate / 100)
            label.isHidden = false
            amount.isHidden = false
            
        }
        else{
            amount.text = "0"
            label.isHidden = false
            amount.isHidden = false
            
        }
    }
    
    @IBAction func rateChanged(_ sender: UITextField) {
        if rate.text != "" {
            let principal = Int(principalAmount.text!)!
            let interestRate = Int(rate.text!)!
            amount.text = String(principal + principal * interestRate / 100)
            label.isHidden = false
            amount.isHidden = false
            
        }
        else{
            amount.text = principalAmount.text
            label.isHidden = false
            amount.isHidden = false
            
        }
    }
}


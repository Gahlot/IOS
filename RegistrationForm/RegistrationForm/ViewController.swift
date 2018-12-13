//
//  ViewController.swift
//  RegistrationForm
//
//  Created by Mahesh Gahlot on 11/6/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UIStepper!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var marriedStatus: UISwitch!
    @IBOutlet weak var salary: UISlider!
    @IBOutlet weak var sexType: UISegmentedControl!
    @IBOutlet weak var ageValue: UILabel!
    @IBOutlet weak var salaryValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ageValue.text = String(Int(age.value))
        self.salaryValue.text = "Rs " + String(salary.value)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SalaryChange(_ sender: Any) {
        self.salaryValue.text = "Rs " + String(self.salary.value)
    }
    
    @IBAction func ageCaluculate(_ sender: Any) {
        self.ageValue.text = String(Int(age.value))
    }
    
    @IBAction func register(_ sender: UIButton) {
        let message = "Name: \(name.text!)\nEmail: \(email.text!)\nAge: \(age.value)\nSalary: \(salary.value)\nSex: \(sexType.titleForSegment(at: sexType.selectedSegmentIndex)!)\nMarried Status: \(marriedStatus.isOn ? "Married": "Not Married")"
        let alert = UIAlertController(title: "Details", message: message , preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil)
        
        let apply = UIAlertAction(title: "Register", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(apply)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        print(message)
        print("Name: \(name.text!)")
        print("Email: \(email.text!)")
        print("Age: \(age.value)")
        print("Salary: \(salary.value)")
        print("Sex: \(sexType.titleForSegment(at: sexType.selectedSegmentIndex)!)")
        print("Married Status: \(marriedStatus.isOn ? "Married": "Not Married" )")
    }
}


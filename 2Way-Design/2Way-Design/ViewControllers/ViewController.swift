//
//  ViewController.swift
//  2Way-Design
//
//  Created by Mahesh Gahlot on 11/15/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var lostDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        loginIdTextField.borderStyle = UITextBorderStyle.roundedRect
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        
        var text = NSMutableAttributedString(string: "Login Id ")
        text.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 8))
        loginIdTextField.attributedPlaceholder = text
        
        text = NSMutableAttributedString(string: "Password ")
        text.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 8))
        passwordTextField.attributedPlaceholder = text
        
        loginButton.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func Authentication(_ sender: Any) {
        if loginIdTextField.text! == "finoit" && passwordTextField.text! == "finoit" {
            let tableViewController = storyboard?.instantiateViewController(withIdentifier: TableViewController.name) as! TableViewController
            navigationController?.pushViewController(tableViewController, animated: true)
        }
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        performSegue(withIdentifier: "forgetPasswordSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgetPasswordSegue" {
            let forgetPasswordViewController = segue.destination as! ForrgetPasswordViewController
            forgetPasswordViewController.textFieldtext = loginIdTextField.text
        }
        
    }
}


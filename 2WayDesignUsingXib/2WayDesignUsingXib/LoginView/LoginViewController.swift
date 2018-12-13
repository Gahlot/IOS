//
//  LoginViewController.swift
//  2WayDesignUsingXib
//
//  Created by Mahesh Gahlot on 11/23/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var lostDetailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Authentication(_ sender: Any) {
        if loginIdTextField.text! == "finoit" && passwordTextField.text! == "finoit" {
            let tableViewController = TableViewController(nibName: TableViewController.name, bundle: nil)
            navigationController?.pushViewController(tableViewController, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
                let lastViewController = self.navigationController?.viewControllers.last
                self.navigationController?.viewControllers = [lastViewController!]
                
            }
            
        }
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
      let forgetPasswordViewController = ForgetPasswordViewController(nibName: ForgetPasswordViewController.name, bundle: nil)
        forgetPasswordViewController.delegate = self
        forgetPasswordViewController.textFieldtext = loginIdTextField.text
        navigationController?.pushViewController(forgetPasswordViewController, animated: true)
    }
    
    @IBAction func lostLoginDetails(_ sender: Any) {
        let lostLoginDetailsViewController = LostLoginDetailsViewController(nibName: LostLoginDetailsViewController.name, bundle: nil)
        navigationController?.pushViewController(lostLoginDetailsViewController, animated: true)
    }
}

extension LoginViewController: ForgetPasswordViewControllerDelegate {
  
    func setTextFieldValue(text: String?) {
        loginIdTextField.text = text
    }
}

//
//  LoginViewController.swift
//  2 way Design NavigationBar
//
//  Created by Mahesh Gahlot on 11/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class LoginViewController: MasterViewController {

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
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Authentication(_ sender: Any) {

        if loginIdTextField.text! == "finoit" && passwordTextField.text! == "finoit" {
            AppDelegate.current?.isUserLoggedIn = true
            
            let feedViewController = storyboard?.instantiateViewController(withIdentifier: FeedViewController.name) as! FeedViewController
            navigationController?.viewControllers = [feedViewController]
            
            
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
                
                
            }
        }
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        performSegue(withIdentifier: "forgetPasswordSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgetPasswordSegue" {
            let forgetPasswordViewController = segue.destination as! ForgetPasswordViewController
            forgetPasswordViewController.delegate = self
            forgetPasswordViewController.textFieldtext = loginIdTextField.text
        }
        
    }
}
extension LoginViewController: ForgetPasswordViewControllerDelegate {
    
    func setTextFieldValue(text: String?) {
        loginIdTextField.text = text
    }
}

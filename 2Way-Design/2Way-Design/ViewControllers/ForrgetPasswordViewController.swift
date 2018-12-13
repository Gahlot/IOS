//
//  ForrgetPasswordViewController.swift
//  2Way-Design
//
//  Created by Mahesh Gahlot on 11/22/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ForrgetPasswordViewController: UIViewController {
    var textFieldtext: String?
    
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = NSMutableAttributedString(string: "Login Id ")
        text.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 8))
        loginIdTextField.attributedPlaceholder = text
        loginIdTextField.borderStyle = UITextBorderStyle.roundedRect
        sendButton.layer.cornerRadius = 5
        loginIdTextField.becomeFirstResponder()
        title = "Forget Password"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        loginIdTextField.text = textFieldtext
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendResetLink(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

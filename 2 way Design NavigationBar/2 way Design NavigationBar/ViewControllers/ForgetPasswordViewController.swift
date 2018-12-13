//
//  ForgetPasswordViewController.swift
//  2 way Design NavigationBar
//
//  Created by Mahesh Gahlot on 11/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

protocol ForgetPasswordViewControllerDelegate: class {
    func setTextFieldValue(text: String?)
}

class ForgetPasswordViewController: MasterViewController {
    var textFieldtext: String?
    public weak var delegate: ForgetPasswordViewControllerDelegate?
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Forget Password"
        let text = NSMutableAttributedString(string: "Login Id ")
        text.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 8))
        loginIdTextField.attributedPlaceholder = text
        loginIdTextField.borderStyle = UITextBorderStyle.roundedRect
        sendButton.layer.cornerRadius = 5
        loginIdTextField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        loginIdTextField.text = textFieldtext
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendResetLink(_ sender: Any) {
        delegate?.setTextFieldValue(text: loginIdTextField.text)
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

//
//  ViewController.swift
//  TextField Delegate
//
//  Created by Mahesh Gahlot on 11/13/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var text: UITextField!
    
    let numberTextFieldDelegate = NumberTextFieldDelegate()
    let emojiTextFieldDelegate = EmojiTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.text.delegate = numberTextFieldDelegate
        self.emojiTextField.delegate = emojiTextFieldDelegate
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


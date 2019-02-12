//
//  DialerViewController.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class DialerViewController: UIViewController {
    
    class var newObject: DialerViewController {
        let storyboard = UIStoryboard(name: "Dialer", bundle: nil)
        let dialerViewController = storyboard.instantiateViewController(withIdentifier: DialerViewController.name) as! DialerViewController
        return dialerViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

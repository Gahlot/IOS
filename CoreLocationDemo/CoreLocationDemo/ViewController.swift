//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Mahesh Gahlot on 1/11/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserLocationManager.shared.startLocating()
    }


}


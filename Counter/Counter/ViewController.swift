//
//  ViewController.swift
//  Counter
//
//  Created by Mahesh Gahlot on 11/5/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var label :UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel()
        label.text = "0"
        label.frame = CGRect(x: 200, y: 200, width: 20, height: 20)
        view.addSubview(label)
        self.label = label
        
        let button = UIButton(frame: CGRect(x: 200, y: 270, width: 100, height: 30))
        button.backgroundColor = UIColor.blue
        button.setTitle("Counter", for: .normal)
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(ViewController.counter), for: UIControlEvents.allTouchEvents)
    }
    
    @objc func counter() {
        count += 1
        self.label.text = "\(count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


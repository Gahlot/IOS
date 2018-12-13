//
//  ViewController.swift
//  Toolbar
//
//  Created by Mahesh Gahlot on 11/27/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var playBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playBarButtonAction(_ sender: Any) {
        var items = toolbar.items
        print(items!.count)
       // print((items!) is Array<Any>)
        if(label.text! != "Playing"){
            label.text = "Playing"
           items![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: #selector(playBarButtonAction))
           // items![2].setValue(UIBarButtonSystemItem.pause, forKey: "barButtonSystemItem")
            toolbar.setItems(items, animated: true)
        } else {
            label.text = "Pause"
            items![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(playBarButtonAction))
            toolbar.setItems(items, animated: true)
        }
        
    }
    
}


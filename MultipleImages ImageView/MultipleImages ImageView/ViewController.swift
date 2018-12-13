//
//  ViewController.swift
//  MultipleImages ImageView
//
//  Created by Mahesh Gahlot on 11/13/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = [#imageLiteral(resourceName: "frame_00_delay-0.1s"),#imageLiteral(resourceName: "frame_01_delay-0.1s"),#imageLiteral(resourceName: "frame_02_delay-0.1s"),#imageLiteral(resourceName: "frame_03_delay-0.1s"),#imageLiteral(resourceName: "frame_04_delay-0.1s"),#imageLiteral(resourceName: "frame_05_delay-0.1s"),#imageLiteral(resourceName: "frame_06_delay-0.1s"),#imageLiteral(resourceName: "frame_07_delay-0.1s"),#imageLiteral(resourceName: "frame_08_delay-0.1s"),#imageLiteral(resourceName: "frame_09_delay-0.1s")]
        imageView.animationImages = images
        imageView.animationDuration = 1.5
        imageView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ImageViewController.swift
//  PageViewController
//
//  Created by Vineet Choudhary on 05/12/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var pageIndex = 0
    var imageName: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = imageName, let image = UIImage(named: imageName) {
            imageView.image = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

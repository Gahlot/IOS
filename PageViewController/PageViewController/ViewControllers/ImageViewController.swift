//
//  ImageViewController.swift
//  PageViewController
//
//  Created by Mahesh Gahlot on 12/6/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String?
    var pageIndex = 0
    
    class var newObject: ImageViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let imageViewController = storyboard.instantiateViewController(withIdentifier: ImageViewController.name) as! ImageViewController
        return imageViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = imageName, let image = UIImage(named: name) {
            imageView.image = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

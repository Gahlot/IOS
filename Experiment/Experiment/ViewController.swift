//
//  ViewController.swift
//  Experiment
//
//  Created by Mahesh Gahlot on 11/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picker: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imagePicker(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func activityPicker(_ sender: UIButton) {
        let image = UIImage()
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}


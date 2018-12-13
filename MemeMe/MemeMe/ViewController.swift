//
//  ViewController.swift
//  MemeMe
//
//  Created by Mahesh Gahlot on 11/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var bottomTextfield: UITextField!
    @IBOutlet weak var topTextfield: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        topTextfield.isHidden = true
        bottomTextfield.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pickAnImage(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image:UIImage = (info[UIImagePickerControllerEditedImage] as? UIImage){
            self.imageView.image = image
            topTextfield.isHidden = false
            bottomTextfield.isHidden = false
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    @IBAction func pickImageFromCamera(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func shareImage(_ sender: UIBarButtonItem) {
        let activityViewController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}


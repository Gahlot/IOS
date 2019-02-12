//
//  BasicInfoViewController.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/6/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit

class BasicInfoViewController: UIViewController {
    var request: InfermedicaAPI!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var ageSlide: UISlider!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func nextButtonAction(_ sender: Any) {
        request = InfermedicaAPI.initial_Diagnosys(sex: (genderSegmentControl.selectedSegmentIndex == 0 ? "male": "female"), age: Int(ageSlide!.value))
        performSegue(withIdentifier: "Symptom", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let symptomViewController = segue.destination as! SymtomViewController
        symptomViewController.request = self.request
    }
    
}

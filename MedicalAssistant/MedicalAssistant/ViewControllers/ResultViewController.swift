//
//  ResultViewController.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/6/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var request: InfermedicaAPI!
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commonNameLabel: UILabel!
    var condition = [DiagnosisCondition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        condition = request.conditions()!
        nameLabel.text = "\(condition[0].name)(\(condition[0].probability * 100) )"
        commonNameLabel.text = condition[0].commonName
        
    }
}

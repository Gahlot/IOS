//
//  ViewController.swift
//  PickerView
//
//  Created by Mahesh Gahlot on 11/15/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let items = ["India":["UP":["Noida","Meerut","Aligarh","Lucknow"],
                          "MP":["JabalPur","Shivpuri","Gwalior","Ujjain"],
                          "Haryana":["Gurgoan","Sonipat","Bahadurgarh","Karnal"],
                          "AP":["Amaravati","Vijayawada","Chittor","Kavali"]],
                 "US":["California":["Los Angeles","Malibu","San Diego","San Francisco"],
                       "New York":["Tarytown","MonTauk","cortland","Newburgh"]],
                 "China":["Hunan":["Yueyang","Xingtan","Loudi"],
                          "Hubei":["Wuhan","Shiyan","Daye"]]
    ]
    
    var selectedCountry = "US"
    var selectedState = "California"
    var selectedCity = "Los Angeles"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        printInLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printInLabel(){
        label.text = "Country = \(selectedCountry) \n State = \(selectedState) \n City = \(selectedCity)"
    }

}

extension ViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return items.count
        case 1:
            return (items[selectedCountry]?.values.count)!
        case 2:
            return (items[selectedCountry]![selectedState]?.count)!
        default:
            return 0
        }

    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return ([String](items.keys))[row]
        case 1:
            return ([String](items[selectedCountry]!.keys))[row]
        case 2:
            return items[selectedCountry]?[selectedState]?[row]
        default:
            return ""
        }
    }
    
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            selectedCountry = self.title(selectedRow, 0)
            selectedState = ([String](items[selectedCountry]!.keys))[0]
            selectedCity = items[selectedCountry]![selectedState]![0]
            pickerView.reloadComponent(1)
            pickerView.reloadComponent(2)
            printInLabel()
        case 1:
            let selectedRow = pickerView.selectedRow(inComponent: 1)
            selectedState = self.title(selectedRow, 1)
            selectedCity = items[selectedCountry]![selectedState]![0]
            pickerView.reloadComponent(2)
            printInLabel()
        case 2:
            let selectedRow = pickerView.selectedRow(inComponent: 2)
            selectedState = self.title(selectedRow, 2)
            printInLabel()
        default:
            print("ERROR!!!!!!!!!!!!")
        }
    }
    
    // MARK: Utility Function
    func title(_ row: Int, _ component: Int) -> String {
        switch component {
        case 0:
            return ([String](items.keys))[row]
        case 1:
            return ([String](items[selectedCountry]!.keys))[row]
        case 2:
            return items[selectedCountry]![selectedState]![row]
        default:
            return ""
        }
    }
    
}

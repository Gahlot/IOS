//
//  DatePickerView.swift
//  FieldStar
//
//  Created by Mahesh Gahlot on 11/30/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit
protocol  DatePickerViewDelegate: class {
    func changedDatePickerValue(text: String?)
}

class DatePickerView: UIView {

    private static var currentWindow: UIWindow?
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    weak var delegate: DatePickerViewDelegate?
    var date: String?
    private var hiddenFrame: CGRect {
        var hiddenFrame = DatePickerView.currentWindow!.bounds
        hiddenFrame.origin.y = hiddenFrame.height
        return hiddenFrame
    }
   private var visibleFrame: CGRect {
    var visibleFrame = DatePickerView.currentWindow!.bounds
        visibleFrame.origin.y = contentView.bounds.origin.y
        return visibleFrame
    }
    
    static func create(view: UIView) -> DatePickerView {
        let datePickerView = Bundle.main.loadNibNamed(DatePickerView.name, owner: nil, options: nil)!.first as! DatePickerView
        datePickerView.backgroundColor = UIColor.clear
        currentWindow = view.window
        datePickerView.frame = currentWindow!.bounds
        return datePickerView
    }
    
    func show() {
        contentView.frame = hiddenFrame
        DatePickerView.currentWindow!.addSubview(self)
        UIView.animate(withDuration: 0.3){
        self.contentView.frame = self.visibleFrame
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame = self.hiddenFrame
        }, completion: { (isCompleted) in
            if isCompleted {
                self.removeFromSuperview()
            }
            })
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "EEE, MMM d YYYY"
        date = dateFormatter.string(from: datepicker.date)
        delegate?.changedDatePickerValue(text: date)
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        hide()
    }
}

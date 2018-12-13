//
//  DatePicker.swift
//  UIViewAnimation
//
//  Created by Vineet Choudhary on 29/11/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

class DatePicker: UIView {

    @IBOutlet weak var actionView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    private var hiddenFrame: CGRect {
        let window = AppDelegate.current!.window!
        var hiddenFrame = window.bounds
        hiddenFrame.origin.y = window.bounds.height
        return hiddenFrame
    }
    
    private var visiableFrame: CGRect {
        let window = AppDelegate.current!.window!
        var visiableFrame = window.bounds
        visiableFrame.origin.y = actionView.frame.origin.y
        return visiableFrame
    }
    
    class func create(date: Date = Date()) -> DatePicker {
        let datePickerView = Bundle.main.loadNibNamed(String(describing: DatePicker.self), owner: nil, options: nil)!.first as! DatePicker
        datePickerView.frame = AppDelegate.current!.window!.bounds
        datePickerView.datePicker.date = date
        
        //Add double tap gesture
        
        //Single tap gesture is disabled from XIB
        let doubleTapGesture = UITapGestureRecognizer(target: datePickerView, action: #selector(tapGestureRecognizer))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.numberOfTouchesRequired = 1
        
        datePickerView.addGestureRecognizer(doubleTapGesture)
        
        return datePickerView
    }
    
    func show() {
        containerView.frame = hiddenFrame
        blurView.alpha = 0
        AppDelegate.current!.window!.addSubview(self)
        
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 0.9
            self.containerView.frame = self.visiableFrame
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.blurView.alpha = 0
            self.containerView.frame = self.hiddenFrame
        }) { (isCompleted) in
            if isCompleted {
                self.removeFromSuperview()
            }
        }
    }

     @objc @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            let tapPosition = sender.location(in: self)
            if tapPosition.y < containerView.frame.origin.y {
                hide()
            }
        default:
            break
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        hide()
    }
}

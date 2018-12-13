//
//  ViewController.swift
//  TextViewDelegate
//
//  Created by Mahesh Gahlot on 11/14/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var urlTextView: UITextView!
    
    let urlTextViewDelegate = UrlTextViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        label.isHidden = true
        urlTextView.delegate = urlTextViewDelegate
        
        let text = NSMutableAttributedString(string: "For More Information Click Here")
 
        text.addAttributes([NSAttributedStringKey.link : "https://google.com" as NSString], range:(text.string as NSString).range(of: "click here", options: NSString.CompareOptions.caseInsensitive))
        //text.addAttributes([NSAttributedStringKey.foregroundColor : UIColor.blue], range: (text.string as NSString).range(of: "click here", options: NSString.CompareOptions.caseInsensitive))
        
        urlTextView.attributedText = text
        urlTextView.dataDetectorTypes = UIDataDetectorTypes.link
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITextViewDelegate {

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        label.isHidden = false
        //print(text)
        label.text = String(textView.text.count + text.count)
        return textView.text.count + text.count < 140
    }
    
    
    
    
}

//
//  UrlTextViewDelegate.swift
//  TextViewDelegate
//
//  Created by Mahesh Gahlot on 11/15/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
import UIKit

class UrlTextViewDelegate: UIViewController, UITextViewDelegate {
 
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
       //interaction = .presentActions
        let url: URL = NSURL(string: "https://yahoo.com")! as URL
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        print("++++++++++++++++")
        print(textView.text)
        print(URL)
        print(characterRange)
        print(interaction.rawValue)
        return true
    }
    
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return false
}
}


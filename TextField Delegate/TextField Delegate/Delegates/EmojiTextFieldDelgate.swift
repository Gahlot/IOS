//
//  EmojiTextFieldDelgate.swift
//  TextField Delegate
//
//  Created by Mahesh Gahlot on 11/13/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate: NSObject, UITextFieldDelegate {
    var emojis = [String : String]()
    
    override init() {
        super.init()
        
        emojis["heart"] = "\u{0001F496}"
        emojis["fish"] = "\u{E522}"
        emojis["bird"] = "\u{E523}"
        emojis["frog"] = "\u{E531}"
        emojis["bear"] = "\u{E527}"
        emojis["dog"] = "\u{E052}"
        emojis["cat"] = "\u{E04F}"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var replaceString = false
        var emojiRange: NSRange
        var newText = textField.text! as NSString
//        print("1 -> \(newText)")
//        print("000 -> \(string)")
//        print("range = \(range.description)")
        newText = newText.replacingCharacters(in: range, with: string) as NSString
//        print("2 -> \(newText)")
        for (emojiString, emoji) in emojis {
            repeat{
                emojiRange = newText.range(of: emojiString, options: .caseInsensitive)
                if emojiRange.location != NSNotFound{
                    newText = newText.replacingCharacters(in: emojiRange, with: emoji) as NSString
                    replaceString = true
                }
            }while(emojiRange.location != NSNotFound)
        }
        if replaceString {
            textField.text = String(newText)
            return false
        }
        return true
    }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
            textField.text = ""
        }
}


//
//  File.swift
//  TextField Delegate
//
//  Created by Mahesh Gahlot on 11/13/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
import UIKit

class NumberTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacter = CharacterSet(charactersIn: "1234567890")
        let typedCharacter = CharacterSet(charactersIn: string)
        return allowedCharacter.isSuperset(of: typedCharacter)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

//
//  AddContactViewController.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/10/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    var numbers =  [ContactNumber]()
    var contact: Contact = Contact(firstName: "", lastName: "", email: "", numbers: [ContactNumber]())
    
    @IBOutlet weak var tableView: UITableView!
    var numberType = ["iphone","home","work","mobile","office"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BasicDetailsTableViewCell.nib, forCellReuseIdentifier: BasicDetailsTableViewCell.identifier)
        tableView.register(AddNumberTableViewCell.nib, forCellReuseIdentifier: AddNumberTableViewCell.identifier)
        tableView.register(AddButtonTableViewCell.nib, forCellReuseIdentifier: AddButtonTableViewCell.identifier)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(saveContactAction))
        navigationItem.rightBarButtonItem = rightBarButton
        tableView.dataSource = self
        tableView.allowsSelectionDuringEditing = true
        tableView.isEditing = true
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "New Contact"
        NotificationCenter.default.addObserver( self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
         NotificationCenter.default.addObserver( self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow( notification :NSNotification ) {
        if let newFrame = (notification.userInfo?[ UIKeyboardFrameEndUserInfoKey ] as? NSValue)?.cgRectValue {
            var insets: UIEdgeInsets
            insets =  UIEdgeInsetsMake( 0, 0, newFrame.height, 0 )
            tableView.contentInset = insets
            tableView.scrollIndicatorInsets = insets
        }
    }
    @objc func keyboardWillHide( notification :NSNotification ) {
        
            var insets: UIEdgeInsets
            insets = UIEdgeInsetsMake( 0, 0, 0, 0 )
            tableView.contentInset = insets
            tableView.scrollIndicatorInsets = insets
        
    }
    
    @objc func saveContactAction(_ sender: UIBarButtonItem){
        contact.numbers = numbers
        AddressBook.contacts.append(contact)
        navigationController?.popViewController(animated: true)
        
        
    }
}
//Mark: - UITableView DataSource
extension AddContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return numbers.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicDetailsTableViewCell.identifier, for: indexPath) as! BasicDetailsTableViewCell
            cell.firstNameTextField.delegate = self
            cell.firstNameTextField.tag = -1
            cell.lastNameTextField.delegate = self
            cell.lastNameTextField.tag = -2
            cell.emailTextField.delegate = self
            cell.emailTextField.tag = -3
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddNumberTableViewCell.identifier, for: indexPath) as! AddNumberTableViewCell
            cell.typeLabel.text = numbers[indexPath.row].type.type
            cell.numberTextField.delegate = self
            cell.numberTextField.tag = indexPath.row
            cell.numberTextField.text = numbers[indexPath.row].number
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddButtonTableViewCell.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
    
}

//Mark: - UITableView Delegate
extension AddContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            numbers.append(ContactNumber(type: ContactNumberType(id: numbers.count % numberType.count, type: numberType[numbers.count % numberType.count]) , number: ""))
            let newRowIndexpath = IndexPath(row: numbers.endIndex-1, section: 1)
            tableView.insertRows(at: [newRowIndexpath], with: .automatic)
            tableView.scrollToNearestSelectedRow(at: UITableViewScrollPosition.bottom, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 2 {
            return .insert
        }
        
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.numbers.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        else if editingStyle == .insert {
            numbers.append(ContactNumber(type: ContactNumberType(id: numbers.count % numberType.count, type: numberType[numbers.count % numberType.count]) , number: ""))
            let newRowIndexpath = IndexPath(row: numbers.endIndex-1, section: 1)
            tableView.insertRows(at: [newRowIndexpath], with: .automatic)
            tableView.scrollToNearestSelectedRow(at: UITableViewScrollPosition.bottom, animated: true)
        }
    }
    
}

////Mark: - UITextField Delegate
extension AddContactViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == -1 {
            contact.firstName = textField.text != nil ? textField.text! : ""
        }
        else if textField.tag == -2 {
            contact.lastName = textField.text != nil ? textField.text! : ""
        }
        else if textField.tag == -3 {
            contact.email = textField.text
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag >= 0 {
            let allowedCharacters = CharacterSet(charactersIn: "1234567890")
            let characterSet = CharacterSet(charactersIn: string)
            if allowedCharacters.isSuperset(of: characterSet) && (textField.text!.count < 10){
                numbers[textField.tag].number = textField.text! + string
                return true
            }
            return false
        }
        return true
    }
}


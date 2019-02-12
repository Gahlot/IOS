//
//  ContactDetailViewController.swift
//  PersistentAddressBook
//
//  Created by Mahesh Gahlot on 12/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    var contact: Contact!
    var numbers = [ContactNumber]()
    var maxTopViewHeight: CGFloat = 350
    var minTopViewHeight: CGFloat = 210
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(data: contact.image! as Data)
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        navigationController?.navigationBar.prefersLargeTitles = false
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        //imageView.image = UIImage(named: "contact")
        tableView.contentInset = UIEdgeInsets(top: topViewHeight.constant-70, left: 0, bottom: 0, right: 0)
        nameLabel.text = "\(contact.firstName!) \(contact.lastName!)"
        numbers = contact.numbers?.allObjects as! [ContactNumber]
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ContactDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        count += (contact.numbers?.count)!
        if let _ = contact.email {
            count = contact.email == "" ? count : count + 1
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactDetails", for: indexPath)
        cell.setBottomBorder()
        if indexPath.row < (numbers.count) {
            cell.textLabel?.text = numbers[indexPath.row].type?.type
            cell.detailTextLabel?.text = numbers[indexPath.row].number
        } else {
            if let email = contact.email {
                cell.textLabel?.text = "Email"
                cell.detailTextLabel?.text = email
            }
        }
        cell.selectionStyle = .none
        cell.detailTextLabel?.textColor = UIColor.blue
        return cell
    }
    
}

extension ContactDetailViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        let yOffset = scrollView.contentOffset.y
        if yOffset < -maxTopViewHeight {
            topViewHeight.constant = maxTopViewHeight
        }
        else if yOffset < -minTopViewHeight {
            topViewHeight.constant = yOffset * -1
        }
        else {
            topViewHeight.constant = minTopViewHeight
        }
    }
}


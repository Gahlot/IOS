//
//  ContactDetailViewController.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/8/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    var contact: Contact!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        navigationController?.navigationBar.prefersLargeTitles = true
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "contact")
        navigationItem.titleView = imageView
        navigationItem.title = "\(contact.firstName) \(contact.lastName)"
        tableView.dataSource = self
        //navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = UIColor(displayP3Red: 249, green: 249, blue: 249, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 249, green: 249, blue: 249, alpha: 1.0)
        
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        // Do any additional setup after loading the view.
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
        count += contact.numbers.count
        if let _ = contact.email {
            count = contact.email == "" ? count : count + 1
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactDetails", for: indexPath)
        cell.setBottomBorder()
        if indexPath.row < contact.numbers.count {
            cell.textLabel?.text = contact.numbers[indexPath.row].type.type
            cell.detailTextLabel?.text = contact.numbers[indexPath.row].number
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


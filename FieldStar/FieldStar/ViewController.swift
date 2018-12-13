//
//  ViewController.swift
//  FieldStar
//
//  Created by Mahesh Gahlot on 11/28/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tasks = [Task(workOrderID: "24586", tag: "New", title: "Washing Machine to repair", jobID: "2345", priority: "Urgent", startDate: "24 Sept 2018", endDate: "6 Feb 2018", location: "Tapovan, A 48, B Block Rd, Sector 64, Noida, Uttar Pradesh 201301"),
                 Task(workOrderID: "24586", tag: "Active", title: "Air Conditoner to repair", jobID: "2347", priority: "Medium", startDate: "24 Sept 2018", endDate: "6 Feb 2018", location: "Tapovan, A 48, B Block Rd, Sector 64, Noida, Uttar Pradesh 201301"),
                 Task(workOrderID: "24586", tag: "Active", title: "Air Conditoner to repair", jobID: "2347", priority: "Medium", startDate: "24 Sept 2018", endDate: "6 Feb 2018", location: "Tapovan, A 48, B Block Rd, Sector 64, Noida, Uttar Pradesh 201301"),
                 Task(workOrderID: "24586", tag: "Active", title: "Air Conditoner to repair", jobID: "2347", priority: "Medium", startDate: "24 Sept 2018", endDate: "6 Feb 2018", location: "Tapovan, A 48, B Block Rd, Sector 64, Noida, Uttar Pradesh 201301")
    ]
    lazy var datePicker = DatePickerView.create(view: self.view)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var nullStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var segmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        self.setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SelectDateAction(_ sender: UITapGestureRecognizer) {
        datePicker.delegate = self
        datePicker.show()
        print("Hello")
    }
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            dateView.isHidden = true
        }
        else {
            dateView.isHidden = false
        }
    }
    
    @IBAction func StackViewTapGestureAction(_ sender: UITapGestureRecognizer) {
        nullStackView.isHidden = true
        tableView.isHidden = false
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.config(task: tasks[indexPath.section])
        // cell.layer.borderWidth = 0.1
        //cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        //cell.layer.shadowColor = UIColor.black.cgColor
        //cell.layer.shadowOpacity = 0.1
        //cell.layer.shadowRadius = 0.5
        //cell.layer.borderWidth = 0.1
        //cell.layer.borderColor = UIColor.brown.cgColor
        //cell.contentView.layer.masksToBounds = false
        cell.layer.masksToBounds = true
        //ell.layer.borderColor = UIColor.black.cgColor
        cell.layer.opacity = 0.3
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "BackgroundColor")
        headerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOpacity = 0.1
        headerView.layer.shadowRadius = 0.5
        headerView.layer.masksToBounds = false
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: DatePickerViewDelegate {
    func changedDatePickerValue(text: String?) {
        dateLabel.text = text
    }
}

//
//  ViewController.swift
//  tableView2
//
//  Created by Mahesh Gahlot on 11/17/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var titleText = Array(0...100)
    let subTitleText = Array(100...200)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    
        tableView.allowsSelectionDuringEditing = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func allowEditing(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        editButton.setTitle(tableView.isEditing ? "Done" : "Edit", for: UIControlState.normal)
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleText.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        
        cell.textLabel?.text = String(titleText[indexPath.row])
        cell.imageView?.image = UIImage(named: "HighPitch")
        cell.detailTextLabel?.text = String(subTitleText[indexPath.row])
        
        if(indexPath.row % 2) == 0 {
            cell.backgroundColor = UIColor.red
        }
        else{
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Basic"
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        
        return true
        
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            titleText.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .bottom)
        } else if editingStyle == .insert {
            
        }
    }
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    
    
    
}




//
//  ViewController.swift
//  TableViewDelegate
//
//  Created by Mahesh Gahlot on 11/19/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var cellTitle = Array(0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
        tableView.dataSource = self
        //tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func toggleEdit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        editButton.setTitle((tableView.isEditing ? "Done" : "Edit" ), for: UIControlState.normal)

    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"title", for: indexPath)
        cell.textLabel?.text = String(cellTitle[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Dammm!!"
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 60 : 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //(tableView.cellForRow(at: indexPath))?.backgroundColor = UIColor.green
//        cellTitle.remove(at: indexPath.row)
//         tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let tableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "😈👻 Dare To Click") { (tableViewRowAction, index) in
//            self.cellTitle.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
//            
//        }
//        print("AAAATTTTTT")
//        return [tableViewRowAction]
//    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: tableView.cellForRow(at: indexPath)?.textLabel?.text, message: "🎃🙏🏻🙏🏻🙏🏻🙏🏻🙏🏻🙏🏻🙏🏻🙏🏻🙏🏻🙏🏻👹", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView,
                   titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Are you Sureeee😈"
        // if tableView( editActionForRowAT : :) not change string then this string is shown
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.init(x: 10, y: 10, width: 100, height: 300))
        let label  = UILabel(frame: CGRect.init(x: 0, y: 0, width: 400, height: 50))
        label.text = "BlabBlab!!!"
        label.backgroundColor = UIColor.lightGray
        headerView.backgroundColor = UIColor.lightGray
        headerView.addSubview(label)
        
        return headerView
    }
    
   
}

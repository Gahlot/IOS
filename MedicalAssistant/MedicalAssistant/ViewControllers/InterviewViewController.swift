//
//  InterviewViewController.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/6/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit
class InterviewViewController: UIViewController {
    var request: InfermedicaAPI!
    var groupChoices = [Item]()
    let singleChoices = ["Yes","NO","Don't know"]
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        tableView.dataSource = self
        tableView.delegate = self
        questionLabel.text = request.question()?.text
        answerChoices()
    }
    
    func answerChoices(){
        if request.question()!.type == "group_multiple"{
            tableView.allowsMultipleSelection = true
        }
        else{
            tableView.allowsMultipleSelection = false
        }
        if request.question()!.type != "single" {
            for item in request.question()!.items {
                groupChoices.append(item)
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if request.shouldStop() == true {
            performSegue(withIdentifier: "Result", sender: self)
        }
        else {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            groupChoices.removeAll()
            request.diagnos {
                
                self.answerChoices()
                self.questionLabel.text = self.request.question()?.text
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

extension InterviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if request.question()!.type == "single" {
            return 3
        }
        return groupChoices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Choice", for: indexPath)
        if request.question()!.type == "single" {
            cell.textLabel?.text = singleChoices[indexPath.row]
        }
        else {
            cell.textLabel?.text = groupChoices[indexPath.row].name
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.request = request
    }
}

extension InterviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if request.question()!.type == "single" {
            var choiceId = "unknown"
            switch singleChoices[indexPath.row] {
            case "Yes":
                choiceId = "present"
            case "No":
                choiceId = "absent"
            default:
                break
            }
            request.add_Symptoms(id: request.question()!.items[0].id, choiceId: choiceId)
        }
        else {
            request.add_Symptoms(id: groupChoices[indexPath.row].id, choiceId: "present")
        }
    }
}

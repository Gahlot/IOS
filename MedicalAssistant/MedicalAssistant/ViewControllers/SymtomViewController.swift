//
//  SymtomViewController.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/6/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit

class SymtomViewController: UIViewController {
    var request: InfermedicaAPI!
    var results = Search()
    var symptoms = Search()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        nextButton.isEnabled = false
    }
    
    @IBAction func startInterview(_ sender: UIButton) {
        for symptom in symptoms {
            request.add_Symptoms(id: symptom.id, choiceId: "present")
           }
            request.diagnos(completion: {[unowned self] ()-> Void in
                self.performSegue(withIdentifier: "Interview", sender: self)
            })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let interviewViewController = segue.destination as! InterviewViewController
            interviewViewController.request = self.request
        }
}

extension SymtomViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            results.removeAll()
             self.tableView.reloadData()
        }
            
        else {
        request.search(searchText) { [unowned self] (searchResults) in
            self.results = searchResults
             self.tableView.reloadData()
         }
        }
    }
}

extension SymtomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "search", for: indexPath)
        let title = results[indexPath.row]
        cell.textLabel?.text = title.label
        return cell
    }
}

extension SymtomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        symptoms.append(results[indexPath.row])
         nextButton.isEnabled = true
        
    }
}

//
//  FeedViewController.swift
//  2 way Design NavigationBar
//
//  Created by Mahesh Gahlot on 11/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class FeedViewController: MasterViewController {

    @IBOutlet weak var tableView: UITableView!
    let feed:[Feed] = [Feed(backgroundImage: "image1", backgroundColor: "feed-color-1", tag: "Events", tagColor: "event", date: "2 AUG 2018", time: "19:02", location: "Delhi", timeConsumed: "2 months ago", header: "Event 07 29"),
                       Feed(backgroundImage: nil, backgroundColor: "feed-color-1", tag: "Events", tagColor: "event", date: nil, time: nil, location: "Haryana", timeConsumed: "2 months ago", header: "Hello Hey Byeeee"),
                       Feed(backgroundImage: nil, backgroundColor: "feed-color-2", tag: "Journals", tagColor: "journal", date: nil, time: nil, location: "Child Group", timeConsumed: "1 months ago", header: "The Viral Fever"),
                       Feed(backgroundImage: "image2", backgroundColor: "feed-color-1", tag: "Newsletters", tagColor: "Newsletter", date: "23 Sept 2015", time: "19:02", location: "Tokyo, JAPAN", timeConsumed: "2 year ago", header: "String Theory"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Activity Feed"
        tableView.register(ImageTableViewCell.nib, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension FeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell
        cell?.configure(feed: feed[indexPath.row])
        return cell!
    }
}




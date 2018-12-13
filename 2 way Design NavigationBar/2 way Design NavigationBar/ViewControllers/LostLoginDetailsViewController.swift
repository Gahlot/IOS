//
//  LostLoginDetailsViewController.swift
//  2 way Design NavigationBar
//
//  Created by Mahesh Gahlot on 11/24/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class LostLoginDetailsViewController: MasterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lost Login Details"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

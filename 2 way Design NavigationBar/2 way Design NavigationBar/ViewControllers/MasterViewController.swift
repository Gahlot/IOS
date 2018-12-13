//
//  MasterViewController.swift
//  2 way Design NavigationBar
//
//  Created by Mahesh Gahlot on 11/24/18.
//  Copyright © 2018 finoit. All rights reserved.#imageLiteral(resourceName: "arrow-pointing-to-left (2).png")
//

import UIKit

class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]

        if (AppDelegate.current?.isUserLoggedIn ?? false) && (navigationController?.viewControllers.count ?? 0) == 1 {
            let barImage = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
            let leftbarItem = UIBarButtonItem(image: barImage, style: UIBarButtonItemStyle.plain, target: self, action: nil)
            navigationItem.leftBarButtonItem = leftbarItem
        }
        else if (navigationController?.viewControllers.count ?? 0) > 1 {
            let backImage = UIImage(named: "arrow")?.withRenderingMode(.alwaysOriginal)
            let leftBarButtonItem = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftBarButtonAction))
            navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func leftBarButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

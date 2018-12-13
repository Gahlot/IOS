//
//  TabBarController.swift
//  ContactApp
//
//  Created by Mahesh Gahlot on 12/7/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    class var newObject: TabBarController {
        let tabBarController = TabBarController()
        return tabBarController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dialerViewContoller = DialerViewController.newObject
        dialerViewContoller.tabBarItem = UITabBarItem(title: "Dialer", image: UIImage(named: "dialer"), tag: 2)
        let contactViewController = ContactViewController.newObject
        contactViewController.tabBarItem = UITabBarItem(title: "Contact", image: UIImage(named: "contact"), tag: 1)
        let favouriteViewController = FavouriteViewController.newObject
        favouriteViewController.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(named: "star"), tag: 0)
        
        self.viewControllers = [
            UINavigationController(rootViewController: favouriteViewController),
            UINavigationController(rootViewController: contactViewController),
            dialerViewContoller
            
        ]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

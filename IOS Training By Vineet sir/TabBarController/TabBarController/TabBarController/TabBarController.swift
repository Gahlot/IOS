//
//  TabBarViewController.swift
//  TabBarController
//
//  Created by Vineet Choudhary on 06/12/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let aViewController = storyboard.instantiateViewController(withIdentifier: String(describing: AViewController.self))
        aViewController.tabBarItem = UITabBarItem(title: "A View", image: UIImage(named: "1"), tag: 0)
        
        let bViewController = storyboard.instantiateViewController(withIdentifier: String(describing: BViewController.self))
        bViewController.tabBarItem = UITabBarItem(title: "B View", image: UIImage(named: "2"), tag: 1)
        
        let cViewController = storyboard.instantiateViewController(withIdentifier: String(describing: CViewController.self))
        cViewController.tabBarItem = UITabBarItem(title: "C View", image: UIImage(named: "3"), tag: 2)
        
        let dViewController = storyboard.instantiateViewController(withIdentifier: String(describing: DViewController.self))
        dViewController.tabBarItem = UITabBarItem(title: "D View", image: UIImage(named: "4"), tag: 3)
        
        let eViewController = storyboard.instantiateViewController(withIdentifier: String(describing: EViewController.self))
        eViewController.tabBarItem = UITabBarItem(title: "E View", image: UIImage(named: "5"), tag: 4)
        
        let fViewController = storyboard.instantiateViewController(withIdentifier: String(describing: AViewController.self))
        fViewController.tabBarItem = UITabBarItem(title: "F View", image: UIImage(named: "6"), tag: 0)
        
        let gViewController = storyboard.instantiateViewController(withIdentifier: String(describing: AViewController.self))
        gViewController.tabBarItem = UITabBarItem(title: "G View", image: UIImage(named: "7"), tag: 0)
        
        self.viewControllers = [
            UINavigationController(rootViewController: aViewController),
            UINavigationController(rootViewController: bViewController),
            UINavigationController(rootViewController: cViewController),
            UINavigationController(rootViewController: dViewController),
            UINavigationController(rootViewController: eViewController),
            UINavigationController(rootViewController: fViewController),
            UINavigationController(rootViewController: gViewController)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

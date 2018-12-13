//
//  ViewController.swift
//  PageViewController
//
//  Created by Vineet Choudhary on 05/12/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var currentPageIndex: Int = 0
    var pageViewController: UIPageViewController?
    var images = ["cat1", "cat2", "cat3", "cat4", "cat5"]

    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.view.frame = view.frame
//        pageViewController!.dataSource = self
//        pageViewController!.delegate = self
//
//        let initialPage = getViewController(for: currentPageIndex)
//        pageViewController!.setViewControllers([initialPage], direction: .forward, animated: false, completion: nil)
        
        view.addSubview(pageViewController!.view)
        addChildViewController(pageViewController!)
        
        pageControl.currentPage = currentPageIndex
        pageControl.numberOfPages = images.count
        
        view.bringSubview(toFront: pageControl)
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            let nextPageViewController = self.getViewController(for: self.currentPageIndex)
            self.pageControl.currentPage = nextPageViewController.pageIndex
            self.pageViewController!.setViewControllers([nextPageViewController], direction: .forward, animated: true, completion: nil)
            if (nextPageViewController.pageIndex + 1) == self.images.count {
                self.currentPageIndex = 0
            } else {
                self.currentPageIndex += 1
            }
        }
        timer?.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getViewController(for index: Int) -> ImageViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ImageViewController.self)) as! ImageViewController
        viewController.pageIndex = index
        viewController.imageName = images[index]
        return viewController
    }


}


//extension ViewController: UIPageViewControllerDataSource {
//    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        let imageViewController = viewController as! ImageViewController
//        if imageViewController.pageIndex == 0 {
//            return nil
//        }
//        return getViewController(for: imageViewController.pageIndex - 1)
//    }
//
//    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        let imageViewController = viewController as! ImageViewController
//        if (imageViewController.pageIndex + 1) == images.count {
//            return nil
//        }
//        return getViewController(for: imageViewController.pageIndex + 1)
//    }
//}

//extension ViewController: UIPageViewControllerDelegate {
//    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//        if let imageViewController = pendingViewControllers.last as? ImageViewController {
//            currentPageIndex = imageViewController.pageIndex
//        }
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if completed {
//            pageControl.currentPage = currentPageIndex
//        }
//    }
//}


//
//  ViewController.swift
//  PageViewController
//
//  Created by Mahesh Gahlot on 12/6/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentPageIndex = 0
    let images = ["image1","image2","image3","image4","image5"]
    var pageViewController: UIPageViewController?
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        pageViewController!.view.frame = view.frame
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        pageViewController?.setViewControllers([getImageViewController(index: currentPageIndex)], direction: .forward, animated: true, completion: nil)
        self.view.addSubview(pageViewController!.view)
        self.addChildViewController(pageViewController!)
        
        pageControl.numberOfPages = images.count
        view.bringSubview(toFront: pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getImageViewController(index: Int) -> ImageViewController {
        let imageViewController = ImageViewController.newObject
        imageViewController.pageIndex = index
        imageViewController.imageName = images[index]
        return imageViewController
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let imageViewController = viewController as? ImageViewController {
            return imageViewController.pageIndex == 0 ? nil : getImageViewController(index: imageViewController.pageIndex - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let imageViewController = viewController as? ImageViewController {
            return (imageViewController.pageIndex + 1) == images.count ? nil : getImageViewController(index: imageViewController.pageIndex + 1)
        }
        return nil
    }
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let imageViewController = pendingViewControllers.last as! ImageViewController
        currentPageIndex = imageViewController.pageIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        pageControl.currentPage = currentPageIndex
    }
}


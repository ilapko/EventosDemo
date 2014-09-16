//
//  ViewController.swift
//  EventosDemo
//
//  Created by Illya Lapko on 8/9/14.
//  Copyright (c) 2014 Awalll. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController : UIPageViewController?
    var pageTitles = ["", "", ""]
    var pageImages = ["Tutorial 1.png", "Tutorial 2.png", "Tutorial 3.png"]
    var currentIndex = 0
    
    @IBAction func startWalkthrough(sender: UIButton) {
        var startingViewController : PageContentViewController = self.viewControllerAtIndex(0)!
        var viewControllers : NSArray = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create page view controller
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.dataSource = self
        
        let startingViewController : PageContentViewController = self.viewControllerAtIndex(0)!
        let viewControllers: NSArray = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)

        // Change the size of page view controller
        self.pageViewController!.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController!.didMoveToParentViewController(self)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            
            var index = (viewController as PageContentViewController).pageIndex
            
            if index == 0 || index == NSNotFound {
                return nil
            }
            
            index!--
            
            println("Decreasing Index: \(index)")
            
            return self.viewControllerAtIndex(index!)
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            
            var index = (viewController as PageContentViewController).pageIndex
            
            if index == NSNotFound {
                return nil
            }
            
            index!++
            
            println("Increasing Index: \(index)")
            
            if index == self.pageTitles.count {
                return nil;
            }
            return self.viewControllerAtIndex(index!);
    }
    
    func viewControllerAtIndex(index : Int) -> PageContentViewController? {
        
        if self.pageTitles.count == 0 || index >= self.pageTitles.count {
            return nil;
        }
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard!.instantiateViewControllerWithIdentifier("PageContentViewController") as PageContentViewController
        pageContentViewController.imageFile = self.pageImages[index]
        pageContentViewController.titleText = self.pageTitles[index]
        pageContentViewController.pageIndex = index
        
        return pageContentViewController;
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}


//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by Makan Fofana on 2/23/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["CREATE YOUR OWN FOOD", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    
    var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    var pageSubHeadings = ["Pin your favorite restaurants and create your own food guide", "Search and locate your favorite restaurant on maps", "Find restaurants shared by your friends and other foodies"]
    
    var currentIndex = 0
    
    //Page View Datasource Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    //Content View Controller Helper Method
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController {
        if (index < 0 || index >= pageHeadings.count) {
            return nil
        }
        
        //Creating a new view controller and passing through data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.index = index
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting datasource to itself
        dataSource = self
        // Do any additional setup after loading the view.
        
        //Creating the fiest walkthrough controller
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

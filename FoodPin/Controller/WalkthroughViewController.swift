//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by Makan Fofana on 2/26/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!
    
    //Skip button for master walktrough view controller
    @IBAction func skipButtonTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //Obtaining reference to the Walkthrough Page view controller 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
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

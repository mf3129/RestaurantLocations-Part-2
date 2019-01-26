//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Makan Fofana on 1/24/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        backgroundImageView.contentMode = .scaleAspectFill
        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
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

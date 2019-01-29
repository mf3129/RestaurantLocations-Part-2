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
    @IBOutlet var rateButtons: [UIButton]!
    
    
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
        
        let movingRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(movingRightTransform)
        
        for rateButton in rateButtons {
            rateButton.alpha = 0
            rateButton.transform = movingRightTransform
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity},
            completion: nil)
        
        UIView.animate(withDuration: 2.5) {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity
            
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
            
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity
            
            self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
            }
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



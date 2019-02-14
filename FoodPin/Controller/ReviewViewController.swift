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
    @IBOutlet weak var closeButton: UIButton!
    
    var restaurant: RestaurantMO!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantImage = restaurant.image {
            backgroundImageView.image = UIImage(data: restaurantImage as Data)
        }
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
        
        
        let movingUpTansfrom = CGAffineTransform(translationX: 0, y: -600)
            closeButton.transform = movingUpTansfrom
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity},
            completion: nil)
        
        for rateButton in rateButtons {
            
        UIView.animate(withDuration: 2.5) {
            self.rateButtons?[rateButton.tag].alpha = 1.0
            self.rateButtons?[rateButton.tag].transform = .identity
            
            self.closeButton.alpha = 1.0
            self.closeButton.transform = .identity
                }
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



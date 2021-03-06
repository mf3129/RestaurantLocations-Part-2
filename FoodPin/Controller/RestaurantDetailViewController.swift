//RestaurantDetailViewController.swift
//FoodPin
//
//Created by Makan Fofana on 1/5/19.
//Copyright © 2019 Makan Fofana. All rights reserved.

import UIKit


class RestaurantDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Datasource Protocols
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            
                cell.iconImageView.image = UIImage(named: "phone")
                cell.shortTextLabel.text = restaurant.phone
                cell.selectionStyle = .none
            
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            
                cell.iconImageView.image = UIImage(named: "map")
                cell.shortTextLabel.text = restaurant.location
                cell.selectionStyle = .none
            
            return cell
        
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            
                cell.descriptionLabel.text = restaurant.summary
                cell.selectionStyle = .none
        
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            
                cell.titleLabel.text = "DIRECTIONS"
                cell.selectionStyle = .none
            
            return cell
        
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            
            if let restaurantLocation = restaurant.location {
                cell.configure(location: restaurantLocation)
            }
            
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError("The table view cell for the detail veiw controller could not be created at this time")
        }
    }
    
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
  
    //Rating Restaurant Button
    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
        dismiss(animated: true) {
            if let rating = segue.identifier {
                self.restaurant.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating)
                
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                    appDelegate.saveContext()
                }
                
                let scaleTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.headerView.ratingImageView.transform = scaleTransform
                self.headerView.ratingImageView.alpha = 0
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
                    self.headerView.ratingImageView.transform = .identity
                    self.headerView.ratingImageView.alpha = 1
                })
            
            }
        }
   
        
        dismiss(animated: true, completion: nil)
        
    }
    
    var restaurant: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let rating = restaurant.rating {
            headerView.ratingImageView.image = UIImage(named: rating)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        if let restaurantImage =  restaurant.image {
            headerView.headerImageView.image = UIImage(data: restaurantImage as Data)}
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    // Segway To Review Or Map View Cotnroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.restaurant = restaurant
        } else if segue.identifier == "restaurantReview" {
            let destinationVC = segue.destination as! ReviewViewController
            destinationVC.restaurant = restaurant
        }
    }
}

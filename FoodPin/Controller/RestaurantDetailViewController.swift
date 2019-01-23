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
            
                cell.descriptionLabel.text = restaurant.description
                cell.selectionStyle = .none
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            
                cell.titleLabel.text = "DIRECTIONS"
                cell.selectionStyle = .none
            
            return cell
        
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            
            cell.configure(location: restaurant.location)
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError("The table view cell for the detail veiw controller could not be created at this time")
        }
    }
    
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.restaurant = restaurant
        }
    }
}

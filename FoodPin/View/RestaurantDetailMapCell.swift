//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Makan Fofana on 1/22/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        
        let geoCoder = CLGeocoder()
        
        
        print(location)
        
        geoCoder.geocodeAddressString(location) { (placemarks, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
                
            }
            
        }
        
    }

}

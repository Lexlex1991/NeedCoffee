//
//  PlacesCell.swift
//  CoffeeOrTea
//
//  Created by Alexander Silkin on 2/22/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class PlacesCell: UITableViewCell {
    
    let locationManager = CLLocationManager()
    // From PlacesAPI guide
    var placesClient: GMSPlacesClient!

    
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var placeNameLbl: UILabel!

    @IBOutlet weak var placeAddressLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Configure cell view
    func configureCell() {
    
    }
}

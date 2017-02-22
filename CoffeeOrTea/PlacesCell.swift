//
//  PlacesCell.swift
//  CoffeeOrTea
//
//  Created by Alexander Silkin on 2/22/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {
    
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var placeNameLbl: UILabel!

    @IBOutlet weak var placeAddressLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Configure cell view
    func configureCell() {
    
    }

}

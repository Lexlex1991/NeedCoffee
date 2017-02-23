//
//  CoffeeVC.swift
//  CoffeeOrTea
//
//  Created by Alexander Silkin on 2/21/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class CoffeeVC: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate,UITableViewDataSource, UITableViewDelegate

{
    
    let locationManager = CLLocationManager()
    // From PlacesAPI guide
    var placesClient: GMSPlacesClient!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBAction func goBackButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        

        placesClient = GMSPlacesClient.shared()
    
    }
    
   
    
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                for likelihood in placeLikelihoodList.likelihoods {
                    let place = likelihood.place
                    print("Current Place name \(place.name) at likelihood \(likelihood.likelihood)")
                    print("Current Rating \(place.rating)")
                    print("Price Level \(place.priceLevel)")
                    print("Open status \(place.openNowStatus)")
                    print("Current Place address \(place.formattedAddress)")
                    print("Place type \(place.types)")
                }
            }
        })
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!

    
    
    // Point of interest delegate
    let infoMarker = GMSMarker()
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        infoMarker.snippet = placeID
        infoMarker.position = location
        infoMarker.title = name
        infoMarker.opacity = 0;
        infoMarker.infoWindowAnchor.y = 1
        infoMarker.map = mapView
        mapView.selectedMarker = infoMarker
    }
    
    
    // If authorized
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            
            
            locationManager.startUpdatingLocation()
            
            
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }

    }
    
    // Configure table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PlacesCell") as! PlacesCell
    }
    
    
    
    // Update location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
        }
    }
    
    
    
    

    
    


}

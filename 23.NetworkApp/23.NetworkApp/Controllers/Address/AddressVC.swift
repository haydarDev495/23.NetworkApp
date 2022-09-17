//
//  AddressVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 15.09.22.
//

import MapKit
import UIKit

class AddressVC: UIViewController {
    
    @IBOutlet var streetLabel: UILabel!
    @IBOutlet var suiteLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var zipCode: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    var address: Address?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        render()
    }
    func render() { // 53.891492, 27.555327
        let coordinate = CLLocationCoordinate2D(latitude: 53.891492, longitude: 27.555327)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let mapItem = MKPointAnnotation()
        mapItem.coordinate = coordinate
        mapView.addAnnotation(mapItem)
    }
    
    private func setupUI() {
        streetLabel.text = "Street: \(address?.street ?? "AddressVC nil address.street")"
        suiteLabel.text = "Suite: \(address?.suite ?? "AddressVC nil address.suite")"
        cityLabel.text = "City: \(address?.city ?? "AddressVC nil address.city")"
        zipCode.text = "Zipcode: \(address?.zipcode ?? "AddressVC nil address.zipcode")"
    }
    
}



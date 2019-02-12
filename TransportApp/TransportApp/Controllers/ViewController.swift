//
//  ViewController.swift
//  TransportApp
//
//  Created by Mahesh Gahlot on 1/16/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController {
    
    @IBOutlet weak var markerImageView: UIImageView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    
    var selectedTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // selectedTextField = sourceTextField
        sourceTextField.becomeFirstResponder()
        sourceTextField.delegate = self
        destinationTextField.delegate = self
        
        let camera = GMSCameraPosition.camera(withTarget: CLLocationCoordinate2DMake(28.6110768,77.3752378), zoom: 15)
        mapView.camera = camera
        mapView.padding = UIEdgeInsets(top: 0, left: 20, bottom: 65, right: 0)
        mapView.bringSubviewToFront(markerImageView)
        mapView.delegate = self
        
        
        
    }
    
    func getAddress(_ coordinate: CLLocationCoordinate2D) {
        let geocode = GMSGeocoder()
        geocode.reverseGeocodeCoordinate(coordinate) { [unowned self] (gMSResponse, error) in
            if let response = gMSResponse {
                let addresses = response.firstResult()

                if let address = (addresses?.lines) {
                print(address)
                self.selectedTextField.text = address[0]
                
                }
                }
        }
    }
}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let coordinate = mapView.projection.coordinate(for: markerImageView.center)
        self.getAddress(coordinate)
        print("\(coordinate.latitude),\(coordinate.longitude)")
    
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
    }
}

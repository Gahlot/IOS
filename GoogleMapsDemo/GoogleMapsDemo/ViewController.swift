//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Mahesh Gahlot on 1/14/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController {
    var manager = CLLocationManager()
    var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestAlwaysAuthorization()
        }
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            manager.startUpdatingLocation()
            manager.delegate = self
        }
        let coordinate = CLLocationCoordinate2DMake(37.3296305, -122.0270552)
        let camera = GMSCameraPosition.camera(withTarget: manager.location?.coordinate ?? coordinate, zoom: 18)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
       
        mapView.mapType = .normal
        self.view = mapView
        mapView.delegate = self
        let marker = GMSMarker(position: CLLocationCoordinate2DMake(37.3296305, -122.0270552))
        marker.isDraggable = true
        marker.title = "Sam H. middle School"
        marker.snippet = "San Francisco"
        marker.map = mapView
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
         //mapView.camera = GMSCameraPosition.camera(withTarget: manager.location!.coordinate, zoom: 18)
    }
}

extension ViewController: GMSMapViewDelegate {
    
}

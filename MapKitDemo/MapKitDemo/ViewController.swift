//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Mahesh Gahlot on 1/11/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {
    var route: MKRoute?
    @IBOutlet weak var mapKit: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .restricted {
            
            manager.requestAlwaysAuthorization()
        } else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            manager.desiredAccuracy = kCLLocationAccuracyBest
            
            manager.startUpdatingLocation()
            manager.delegate = self
        }
        mapKit.showsUserLocation = true
        mapKit.delegate = self
        let annotation  = MKPointAnnotation()
        annotation.title = "Croma Store"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.3299064, longitude: -122.0275667)
        mapKit.addAnnotation(annotation)
        

    }
    
    func getDirections() {
        let directionRequest = MKDirections.Request()
        let destinationPlacemark = MKPlacemark(coordinate: mapKit.annotations[0].coordinate)
        print(mapKit.annotations[0].coordinate)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: mapKit.userLocation.coordinate))
        directionRequest.transportType = .automobile
        let direction = MKDirections(request: directionRequest)
        direction.calculate { [unowned self] (response, error) in
            if error == nil {
                self.route = response!.routes.last
                
                self.mapKit.addOverlay(self.route!.polyline, level: MKOverlayLevel.aboveRoads)
                let rect = self.route!.polyline.boundingMapRect
                self.mapKit.setRegion(MKCoordinateRegion(rect), animated: true)
            }
            print(error.debugDescription)
        }
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("location - \(locations.last?.description ?? "N/A")")
            }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //mapKit.setRegion(MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)), animated: true)
        getDirections()
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.title == "Croma Store"{
            let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "store")
            return pinAnnotation
        }
        return nil
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderOverlay = MKPolylineRenderer(polyline: route!.polyline)
        renderOverlay.strokeColor = UIColor.blue
        renderOverlay.lineWidth = 4
        return renderOverlay
    }
}

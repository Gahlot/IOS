//
//  LocationManager.swift
//  CoreLocationDemo
//
//  Created by Mahesh Gahlot on 1/11/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
class UserLocationManager: NSObject {
    static let shared = UserLocationManager()
    private let locationManager = CLLocationManager()
    
    private override init(){
        super.init()
        locationManager.delegate = self
    }
    
    func startLocating(){
        let status = CLLocationManager.authorizationStatus()
        if status == .restricted || status == .denied {
            
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
           
        } else if status == .notDetermined {
        
        locationManager.requestAlwaysAuthorization()
            startLocating()
        }

        
        locationManager.startUpdatingLocation()

    }
    func updateLocation(){
        locationManager.startUpdatingLocation()
    }
    func endLocating(){
        locationManager.stopUpdatingLocation()
        
    }
    
}
extension UserLocationManager: CLLocationManagerDelegate {
   
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       print(status.rawValue)
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
        let location = locations.first
        
        print(location!.description)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERRRor = \(error)")
        
    }
}

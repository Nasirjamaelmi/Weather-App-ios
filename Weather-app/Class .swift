//
//  Class .swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-24.
//

import Foundation

import Foundation
import CoreLocation
import Observation



@Observable
class LocationManager: NSObject, CLLocationManagerDelegate{
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func requestLocation() {
        if locationManager.authorizationStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        else {
            locationManager.requestLocation()
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        <#code#>
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        <#code#>
    }
}

//
//  LocationManager.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-02-04.
//

import Foundation
import CoreLocation
import Observation
import MapKit




@Observable
class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    var location: CLLocation?
    var adress: CLPlacemark?
    var weatherModel: WeatherModel?
    var cityname = ""
    

    override init() {
        super.init()

        locationManager.delegate = self
    }

    func requestLocation() {
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.requestLocation()
        }
    }

    func reverseGeocodeLocation(_ location: CLLocation){
        Task{
            let placemarks = try? await geocoder.reverseGeocodeLocation(location)
            adress = placemarks?.last
            self.cityname = self.adress?.locality ?? "unknown"        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus != .denied {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
        if let location {
            reverseGeocodeLocation(location)
            Task{
                await weatherModel?.loadFeed(lat: location.coordinate.latitude, long: location.coordinate.longitude)
                print("location manager has new data delivered")
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Do something in case of error
    }
}


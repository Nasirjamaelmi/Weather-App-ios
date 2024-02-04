//
//  WeatherModel.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-02-04.
//


import Foundation
import CoreLocation
import Observation

@Observable
class WeatherModel{
    
    var weatherData: [WeatherData] = []
    var islLoading = false
    
    func loadFeed(lat: Double, long: Double) async {
        guard let url = URL(string:
        "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(long)&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin"
        ) else {
            return
        }
        islLoading = true
        
        
        do{
            let(data,_) = try await URLSession.shared.data(from: url)
            print(data)
            let decodedData  = try JSONDecoder().decode(WeatherData.self, from: data)
            self.weatherData = [decodedData]

        }
        catch{
            print(error)
        }
        islLoading = false
        
    }
}


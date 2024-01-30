//
//  FeedMofrl.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-29.
//

import Foundation
import CoreLocation
import Observation

@Observable
class WeatherModel{
    
    private let basUrl =  "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin"
    
    var islLoading = false
    
    func loadFeed() async throws    {
        guard let url = URL(string:basUrl) else {
            return
        }
        islLoading = true
        
        let(data,_) = try await URLSession.shared.data(from: url)
        do{
            let feed = try JSONDecoder().decode(WeatherData.self, from: <#T##Data#>)
            print(feed)
        }
        catch{
            print(error)
        }
        islLoading = false
        
        
    }
}


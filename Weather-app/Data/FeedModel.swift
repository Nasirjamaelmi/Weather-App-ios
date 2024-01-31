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
    var weatherData: WeatherData?
    var islLoading = false
    
    func loadFeed() async throws    {
        guard let url = URL(string:basUrl) else {
            return
        }
        islLoading = true
        
        let(data,_) = try await URLSession.shared.data(from: url)
        do{
            print(data)
            let feed = try JSONDecoder().decode(WeatherData.self, from: data)
            weatherData = feed
            print(feed)
            islLoading = false
        }
        catch{
            print(error)
        }
        
    }
}
class PostModel{
    let longitude: Double
    let latitude: Double
    let time: String
    let temp: Double
    let weather_code:[Int]
    let temperature_2m_max:[Double]
    let temperature_2m_min:[Double]
    init(post:WeatherData, BaseUrl:String){
        longitude = post.longitude
        latitude = post.latitude
        time = post.current.time
        temp = post.current.temp
        weather_code=post.daily.weather_code
        temperature_2m_max = post.daily.temperature_2m_max
        temperature_2m_min = post.daily.temperature_2m_min
    }
}


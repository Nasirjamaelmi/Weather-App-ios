//
//  WeatherData.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-26.
//

import Foundation
import Observation

struct WeatherData:Decodable{
    let latitude :Double
    let longitude: Double
    
}

struct Current:Decodable{
    let time: String
    let temp: Double
}

struct Daily:Decodable{
    let 
}

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
    let current: Current
    let daily: Daily
}

struct Current:Decodable{
    let time: String
    let temp: Double
}

struct Daily:Decodable{
    let time: [String]
    let weather_code:[Int]
    let temperature_2m_max:[Double]
    let temperature_2m_min:[Double]
}





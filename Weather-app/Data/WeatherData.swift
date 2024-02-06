//
//  WeatherData.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-26.
//

import Foundation
import Observation

struct WeatherData: Codable {
    var latitude: Double
    var longitude: Double
    var timezone: String
    var daily: Daily
    var current: Current
    var formattedTime: String {
           let dateFormatter: DateFormatter = {
               let formatter = DateFormatter()
               formatter.dateStyle = .medium
               formatter.dateFormat = "E-dd MMMM, HH:mm"
               return formatter
           }()
           return dateFormatter.string(from: Date())
       }
    }

struct Units: Codable{
    let time:String
    let interval:String
    let weatherCode: String
}

struct Current: Codable {
    var time: String
    var temperature_2m: Double
   var weather_code: Int
}


struct Daily: Codable {
    var time: [String]
    var weather_code: [Int]
    var temperature_2m_max: [Double]

    func formattedDayOfWeek(forIndex index: Int) -> String {
        let calendar = Calendar.current
        let currentDate = Date()
        if let startDate = calendar.date(byAdding: .day, value: index, to: currentDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E-ddMMMM"
            return dateFormatter.string(from: startDate)
        } else {
            return "Invalid date"
        }
    }
}








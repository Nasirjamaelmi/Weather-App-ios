//
//  ContentView.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-24.
//

import SwiftUI

/*let backgroundGradient = LinearGradient(
 colors: [Color.red, Color.blue],
 startPoint: .top, endPoint: .bottom)
 
 
 */


struct ContentView: View {
    
    
    
    var model = WeatherModel()
    var locationManager = LocationManager()
    
    init(){
        locationManager.weatherModel = model
    }
    var body: some View {
        ZStack{
            
        }
        VStack(alignment: .center, spacing: 10
        ){
            Text("  Current Temp: \(String(format: "%.0f", model.weatherData?.current.temperature_2m ?? 0)) °C")
            
            if locationManager.location != nil{
                Text("  City: \(locationManager.cityname)")
                
            }
            else{
                Text("No location")
            }
            
            let index = 0
            
            
            VStack(alignment: .center, spacing: 20){
                if let weatherData = model.weatherData {
                    ForEach(0..<min(7, weatherData.daily.time.count), id: \.self) { index in
                        if index < weatherData.daily.time.count {
                            let formattedDay = weatherData.daily.formattedDayOfWeek(forIndex: index)
                            let minTemperature = weatherData.daily.temperature_2m_min[index]
                            let maxTemperature = weatherData.daily.temperature_2m_max[index]
                            
                            Text(" \(formattedDay ) :Temperature \(String(format: "%.0f",minTemperature)) - \(String(format:"%.0f",maxTemperature)) °C")
                        }
                        
                    }
                }
            }.padding(.top, 150)
            
            
            
            // .background(backgroundGradient)
                .padding()
                .onAppear(){
                    locationManager.requestLocation()
                }
                .refreshable {
                    locationManager.requestLocation()
                }
        }
    }
    
    
    
    
    #Preview {
        ContentView()
        
    }
}
    

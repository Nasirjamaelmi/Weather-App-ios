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
     
    var model : WeatherModel = WeatherModel()
    var locationManager = LocationManager()
    
    init(){
        locationManager.weatherModel = model
    }
    var body: some View {
        
        NavigationStack{
            VStack {
                List(model.weatherData, id: \.timezone){weatherdata in
                    HStack{
                        Text("Current Temp: \(String(format: "%.1f", weatherdata.current.temperature_2m)) °C")

                       
                    }
                  
                    if locationManager.location != nil{
                        Text("Current: \(locationManager.cityname)")
                        
                    }
                    else{
                        Text("No location")
                    }
                }
                
            }// .background(backgroundGradient)
            .padding()
            .onAppear(){
                locationManager.requestLocation()
            }
            .refreshable {
                locationManager.requestLocation()
            }
        }.navigationTitle("test")
    }
}

#Preview {
    ContentView()

}


//
//  FeedView.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-30.
//

import SwiftUI

struct FeedView:View{
    @State private var model = WeatherModel()
    
    
    var body:some View{
        VStack{
            if let data = model.weatherData {
                Text("\(data.current.temp)")
            }
            /*
            if model.islLoading {
                ProgressView()
            }
            else{
                Text("Finished Loading!")
            } */
            if let modelllll = model.weatherData {
                Text("\(modelllll.latitude)")
                
            }
            Text("HJI")
        }
        .task{
            try? await model.loadFeed()
        }
        
    }
}


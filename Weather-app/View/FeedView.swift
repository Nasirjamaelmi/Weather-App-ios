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
            if model.islLoading {
                ProgressView()
            }
            else{
                Text("Finished Loading!")
            }
        }
        .task{
            try? await model.loadFeed()
        }
        
    }
}


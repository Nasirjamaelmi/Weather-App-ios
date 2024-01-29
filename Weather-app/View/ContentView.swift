//
//  ContentView.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-24.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.red, Color.blue],
    startPoint: .top, endPoint: .bottom)



struct Result:Codable {
    var trackID: Int
    var trackName: String
    var collectionName:String
}
struct ContentView: View {
    

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        } .background(backgroundGradient)
        .padding()
    }
       
}


#Preview {
    ContentView()
}

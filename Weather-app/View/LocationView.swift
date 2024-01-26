//
//  LocationView.swift
//  Weather-app
//
//  Created by Nasir Jama Elmi on 2024-01-25.
//

    import Foundation
    import SwiftUI

        struct LocationView : View{
            
            @State private var locationService = LocationManager()
        
            var body: some View {
                ScrollView {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                if let location = locationService.location {
                          // Display latitude and longitude if location is available
                          Text("Current Location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
                      }

                      if let address = locationService.address {
                          // Display locality if address is available
                          Text("Current Address: \(address.locality ?? "N/A")")
                      } else {
                          // Display "No location" if both location and address are nil
                          Text("No location")
                      }
                }
                .padding()
                .onAppear {
                    locationService.requestLocation()
                }
                .refreshable {
                    locationService.requestLocation()
                }
            }
        }
#Preview{
    
    LocationView()
}
    


//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by Nasir Jama Elmi on 2024-01-26.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), temp: 5.6, location: "Unkown")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), temp: 4.5, location:"Unkown")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        let userDefaults = UserDefaults(suiteName: "group.jana22oj")
        let savedTemperature = userDefaults?.double(forKey: "currentTemp")
        let savedLocation = userDefaults?.string(forKey: "location")
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
                   let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, temp: savedTemperature ?? 0, location:  savedLocation ?? "Unkown")
                   entries.append(entry)
               }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let temp: Double
    let location: String
}

struct MyWidgetEntryView : View {
    
    
    var entry: Provider.Entry
    var body: some View {
        ZStack{
            //ContainerRelativeShape()
            //.background(Image(.background))
            VStack(alignment: .leading){
                HStack{
                    Text(entry.date.formatted(.dateTime.weekday(.wide)))
                        .foregroundColor(.black)
                   
                      Text("Temp: \(String(format: "%0.f", entry.temp)) °C") .foregroundColor(.black)
                    
                }
            } .onAppear {
                print("Widget entry appeared with temperature: \(entry.temp)")
            }
            
            //.padding(2)
        }
        
    }
}


struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MyWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MyWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    WeatherWidget()
} timeline: {
    SimpleEntry(date: .now, temp: 0.5,location: "Unkown")
    SimpleEntry(date: .now, temp: 7.0,location: "Unkown")
}
